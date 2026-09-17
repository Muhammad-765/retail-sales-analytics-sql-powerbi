-- Country overview
SELECT Country,
    COUNT(DISTINCT InvoiceNo) AS Total_Orders,
    COUNT(DISTINCT CustomerID) AS Total_Customers,
    SUM(Quantity) AS Units_Sold,
    SUM(Revenue) AS Total_Revenue,
    ROUND(
    SUM(Revenue) / COUNT(DISTINCT InvoiceNo),2
    ) AS Average_Order_Value
FROM sales_staging
GROUP BY Country
ORDER BY Total_Revenue DESC;

-- Revenue share by country
WITH country_sales AS (
    SELECT Country,
        SUM(Revenue) AS Total_Revenue
    FROM sales_staging
    GROUP BY Country
),
country_ranked AS (
    SELECT Country, Total_Revenue,
        SUM(Total_Revenue) OVER (ORDER BY Total_Revenue DESC) AS Cumulative_Revenue,
        SUM(Total_Revenue) OVER () AS Overall_Revenue
    FROM country_sales
)
SELECT Country, Total_Revenue,
    ROUND(
        Total_Revenue / Overall_Revenue * 100,2
    ) AS Revenue_Share_Percent,
    ROUND(
        Cumulative_Revenue / Overall_Revenue * 100,2
    ) AS Cumulative_Revenue_Percent
FROM country_ranked
ORDER BY Total_Revenue DESC;

-- Average order value by country
SELECT Country,
    COUNT(DISTINCT InvoiceNo) AS Total_Orders,
    SUM(Revenue) AS Total_Revenue,
    ROUND(
        SUM(Revenue) / COUNT(DISTINCT InvoiceNo),2
    ) AS Average_Order_Value
FROM sales_staging
GROUP BY Country
HAVING COUNT(DISTINCT InvoiceNo) >= 10
ORDER BY Average_Order_Value DESC;

-- Top countries by revenue
SELECT Country,
    SUM(Revenue) AS Total_Revenue,
    COUNT(DISTINCT InvoiceNo) AS Total_Orders,
    COUNT(DISTINCT CustomerID) AS Total_Customers
FROM sales_staging
GROUP BY Country
ORDER BY Total_Revenue DESC
LIMIT 10;

-- Country revenue ranking
WITH country_sales AS (
    SELECT Country,
        SUM(Revenue) AS Total_Revenue
    FROM sales_staging
    GROUP BY Country
)
SELECT Country, Total_Revenue,
    DENSE_RANK() OVER (ORDER BY Total_Revenue DESC) AS Revenue_Rank
FROM country_sales
ORDER BY Revenue_Rank;

-- Country performance by year
SELECT OrderYear, Country,
    SUM(Revenue) AS Total_Revenue,
    COUNT(DISTINCT InvoiceNo) AS Total_Orders,
    COUNT(DISTINCT CustomerID) AS Total_Customers
FROM sales_staging
GROUP BY OrderYear, Country
ORDER BY OrderYear, Total_Revenue DESC;

-- Country monthly revenue
SELECT OrderYear, OrderMonth, MonthName, Country,
    SUM(Revenue) AS Total_Revenue
FROM sales_staging
GROUP BY OrderYear, OrderMonth, MonthName, Country
ORDER BY OrderYear, OrderMonth, Total_Revenue DESC;