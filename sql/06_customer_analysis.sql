-- One-time vs repeat customers
WITH customer_orders AS (
    SELECT CustomerID,
        COUNT(DISTINCT InvoiceNo) AS Total_Orders
    FROM sales_staging
    WHERE CustomerID IS NOT NULL
    GROUP BY CustomerID
)
SELECT
    CASE
        WHEN Total_Orders = 1 THEN 'One-Time Customer'
        ELSE 'Repeat Customer'
    END AS Customer_Type,
    COUNT(*) AS Number_of_Customers,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),2
    ) AS Customer_Share_Percent
FROM customer_orders
GROUP BY
    CASE
        WHEN Total_Orders = 1 THEN 'One-Time Customer'
        ELSE 'Repeat Customer'
END;


-- Customer revenue ranking
SELECT CustomerID,
    COUNT(DISTINCT InvoiceNo) AS Total_Orders,
    SUM(Quantity) AS Units_Sold,
    SUM(Revenue) AS Total_Revenue
FROM sales_staging
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY Total_Revenue DESC
LIMIT 20;


-- Customer revenue concentration
WITH customer_sales AS (
    SELECT CustomerID,
        SUM(Revenue) AS Total_Revenue
    FROM sales_staging
    WHERE CustomerID IS NOT NULL
    GROUP BY CustomerID
)
SELECT CustomerID, Total_Revenue,
    ROUND(
    Total_Revenue / SUM(Total_Revenue) OVER () * 100,2
    ) AS Revenue_Share_Percent
FROM customer_sales
ORDER BY Total_Revenue DESC;


-- Customer purchasing frequency
SELECT CustomerID,
    COUNT(DISTINCT InvoiceNo) AS Total_Orders,
    SUM(Quantity) AS Units_Sold,
    SUM(Revenue) AS Total_Revenue,
    ROUND(
        SUM(Revenue) / COUNT(DISTINCT InvoiceNo),2
    ) AS Average_Order_Value
FROM sales_staging
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY Total_Orders DESC
LIMIT 20;


-- Customer first and last purchase
SELECT CustomerID,
    MIN(OrderDate) AS First_Order,
    MAX(OrderDate) AS Last_Order,
    COUNT(DISTINCT InvoiceNo) AS Total_Orders,
    SUM(Revenue) AS Total_Revenue
FROM sales_staging
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY Total_Revenue DESC
LIMIT 20;


-- RFM Customer Base
WITH customer_rfm AS (
    SELECT CustomerID,
        MAX(OrderDate) AS Last_Purchase_Date,
        COUNT(DISTINCT InvoiceNo) AS Frequency,
        SUM(Revenue) AS Monetary_Value
    FROM sales_staging
    WHERE CustomerID IS NOT NULL
      AND TRIM(CustomerID) <> ''
    GROUP BY CustomerID
)
SELECT CustomerID, Last_Purchase_Date,
    DATEDIFF(
        (SELECT MAX(OrderDate) FROM sales_staging),
        Last_Purchase_Date
    ) AS Recency, Frequency, Monetary_Value
FROM customer_rfm
ORDER BY Monetary_Value DESC;


-- RFM Scoring
WITH customer_rfm AS (
    SELECT CustomerID,
        MAX(OrderDate) AS Last_Purchase_Date,
        COUNT(DISTINCT InvoiceNo) AS Frequency,
        SUM(Revenue) AS Monetary_Value
    FROM sales_staging
    WHERE CustomerID IS NOT NULL
      AND TRIM(CustomerID) <> ''
    GROUP BY CustomerID
),
rfm_base AS (
    SELECT CustomerID,
        DATEDIFF(
            (SELECT MAX(OrderDate) FROM sales_staging),
            Last_Purchase_Date
        ) AS Recency, Frequency, Monetary_Value
    FROM customer_rfm
),
rfm_scores AS (
SELECT CustomerID, Recency, Frequency, Monetary_Value,
    NTILE(5) OVER (ORDER BY Recency ASC) AS Recency_Score,
    NTILE(5) OVER (ORDER BY Frequency ASC) AS Frequency_Score,
    NTILE(5) OVER (ORDER BY Monetary_Value ASC) AS Monetary_Score
FROM rfm_base
)
SELECT Recency_Score, Frequency_Score, Monetary_Score,
    COUNT(*) AS Customers
FROM rfm_scores
GROUP BY Recency_Score, Frequency_Score, Monetary_Score
ORDER BY Recency_Score, Frequency_Score, Monetary_Score;

-- Customer Segmentation
WITH customer_rfm AS (
    SELECT CustomerID,
        MAX(OrderDate) AS Last_Purchase_Date,
        COUNT(DISTINCT InvoiceNo) AS Frequency,
        SUM(Revenue) AS Monetary_Value
    FROM sales_staging
    WHERE CustomerID IS NOT NULL
      AND TRIM(CustomerID) <> ''
    GROUP BY CustomerID
),
rfm_base AS (
    SELECT CustomerID,
        DATEDIFF(
            (SELECT MAX(OrderDate) FROM sales_staging),
            Last_Purchase_Date
        ) AS Recency, Frequency, Monetary_Value
    FROM customer_rfm
),
rfm_scores AS (
    SELECT CustomerID, Recency, Frequency, Monetary_Value,
        NTILE(5) OVER (ORDER BY Recency ASC) AS Recency_Score,
		NTILE(5) OVER (ORDER BY Frequency ASC) AS Frequency_Score,
        NTILE(5) OVER (ORDER BY Monetary_Value ASC) AS Monetary_Score
    FROM rfm_base
)
SELECT CustomerID, Recency, Frequency, Monetary_Value, 
	Recency_Score, Frequency_Score, Monetary_Score,
    CASE
        WHEN Recency_Score >= 4
             AND Frequency_Score >= 4
             AND Monetary_Score >= 4
            THEN 'Champions'
        WHEN Recency_Score >= 4
             AND Frequency_Score >= 3
            THEN 'Loyal Customers'
        WHEN Recency_Score >= 4
             AND Frequency_Score <= 2
            THEN 'New Customers'
        WHEN Recency_Score <= 2
             AND Frequency_Score >= 3
             AND Monetary_Score >= 3
            THEN 'At Risk'
        WHEN Recency_Score <= 2
             AND Frequency_Score <= 2
            THEN 'Inactive'
        ELSE 'Potential Loyalists'
    END AS Customer_Segment
FROM rfm_scores;


--  Customers by RFM Segment
WITH customer_rfm AS (
    SELECT CustomerID,
        MAX(OrderDate) AS Last_Purchase_Date,
        COUNT(DISTINCT InvoiceNo) AS Frequency,
        SUM(Revenue) AS Monetary_Value
    FROM sales_staging
    WHERE CustomerID IS NOT NULL
      AND TRIM(CustomerID) <> ''
    GROUP BY CustomerID
),
rfm_base AS (
    SELECT CustomerID,
        DATEDIFF(
            (SELECT MAX(OrderDate) FROM sales_staging),
            Last_Purchase_Date
        ) AS Recency, Frequency, Monetary_Value
    FROM customer_rfm
),
rfm_scores AS (
    SELECT CustomerID, Recency, Frequency, Monetary_Value,
        NTILE(5) OVER (ORDER BY Recency ASC) AS Recency_Score,
        NTILE(5) OVER (ORDER BY Frequency ASC) AS Frequency_Score,
        NTILE(5) OVER (ORDER BY Monetary_Value ASC) AS Monetary_Score
    FROM rfm_base
),
segmented_customers AS (
    SELECT*,
        CASE
            WHEN Recency_Score >= 4
                 AND Frequency_Score >= 4
                 AND Monetary_Score >= 4
                THEN 'Champions'
            WHEN Recency_Score >= 4
                 AND Frequency_Score >= 3
                THEN 'Loyal Customers'
            WHEN Recency_Score >= 4
                 AND Frequency_Score <= 2
                THEN 'New Customers'
            WHEN Recency_Score <= 2
                 AND Frequency_Score >= 3
                 AND Monetary_Score >= 3
                THEN 'At Risk'
            WHEN Recency_Score <= 2
                 AND Frequency_Score <= 2
                THEN 'Inactive'
            ELSE 'Potential Loyalists'
        END AS Customer_Segment
    FROM rfm_scores
)
SELECT Customer_Segment,
    COUNT(*) AS Number_of_Customers,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),2
    ) AS Customer_Share_Percent,
    ROUND(
        SUM(Monetary_Value),2
        ) AS Segment_Revenue,
	ROUND(
        SUM(Monetary_Value) * 100.0 /
        SUM(SUM(Monetary_Value)) OVER (),2
    ) AS Revenue_Share_Percent
FROM segmented_customers
GROUP BY Customer_Segment
ORDER BY Segment_Revenue DESC;

-- Top 50 customer revenue concentration
WITH customer_sales AS (
    SELECT CustomerID,
        SUM(Revenue) AS Total_Revenue
    FROM sales_staging
    WHERE CustomerID IS NOT NULL
      AND TRIM(CustomerID) <> ''
    GROUP BY CustomerID
),
ranked_customers AS (
    SELECT CustomerID, Total_Revenue,
        ROW_NUMBER() OVER (ORDER BY Total_Revenue DESC) AS Revenue_Rank,
        SUM(Total_Revenue) OVER () AS Overall_Revenue
    FROM customer_sales
),
customer_concentration AS (
SELECT CustomerID, Revenue_Rank, Total_Revenue,
    ROUND(
        Total_Revenue / Overall_Revenue * 100,2
    ) AS Revenue_Share_Percent,
    ROUND(
        SUM(Total_Revenue) OVER (ORDER BY Revenue_Rank) / Overall_Revenue * 100,2
    ) AS Cumulative_Revenue_Percent
FROM ranked_customers
)
SELECT *
FROM customer_concentration
ORDER BY Revenue_Rank
LIMIT 50;

-- Top 10 Revenue
SELECT CustomerID,
    COUNT(DISTINCT InvoiceNo) AS Total_Orders,
    SUM(Quantity) AS Units_Sold,
    ROUND(SUM(Revenue), 2) AS Total_Revenue,
    ROUND(
        SUM(Revenue) / COUNT(DISTINCT InvoiceNo),2
    ) AS Average_Order_Value,
    MIN(OrderDate) AS First_Order,
    MAX(OrderDate) AS Last_Order
FROM sales_staging
WHERE CustomerID IS NOT NULL
  AND TRIM(CustomerID) <> ''
GROUP BY CustomerID
HAVING COUNT(DISTINCT InvoiceNo) >= 5
ORDER BY Total_Revenue DESC
LIMIT 20;

SELECT
    COUNT(*) AS Blank_Customer_Rows
FROM sales_staging
WHERE CustomerID IS NULL
   OR TRIM(CustomerID) = '';

SELECT
	SUM(Revenue) AS Blank_Customer_Revenue,
    COUNT(DISTINCT InvoiceNo) AS Blank_Customer_Orders
FROM sales_staging
WHERE TRIM(CustomerID) = '';

SELECT
    COUNT(DISTINCT NULLIF(TRIM(CustomerID), '')) AS Actual_Customers
FROM sales_staging;