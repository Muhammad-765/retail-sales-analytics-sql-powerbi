-- Total Revenue
SELECT
    SUM(Revenue) AS Total_Revenue
FROM sales_staging;

-- Total Units Sold
SELECT
    SUM(Quantity) AS Total_Units
FROM sales_staging;

-- Total Orders
SELECT
    COUNT(DISTINCT InvoiceNo) AS Total_Orders
FROM sales_staging;

-- Total Customers
SELECT
    COUNT(DISTINCT CustomerID) AS Total_Customers
FROM sales_staging
WHERE CustomerID IS NOT NULL;

-- Number of Products
SELECT 
	COUNT(DISTINCT stockCode) AS Total_Products
FROM sales_staging;

-- Number of Countries
SELECT 
	COUNT(DISTINCT Country) AS Total_Countries
FROM sales_staging;

-- Average Order Value
SELECT
    SUM(Revenue) / COUNT(DISTINCT InvoiceNo) AS Average_Order_Value
FROM sales_staging;

-- Average Units Per Order
SELECT
    SUM(Quantity) / COUNT(DISTINCT InvoiceNo) AS Avg_Units_Per_Order
FROM sales_staging;

-- Revenue per Customer
SELECT
    SUM(Revenue) / COUNT(DISTINCT CustomerID) AS Revenue_Per_Customer
FROM sales_staging
WHERE CustomerID IS NOT NULL;

-- Put all executive KPIs into one query
SELECT
    SUM(Revenue) AS Total_Revenue,
    SUM(Quantity) AS Total_Units,
    COUNT(DISTINCT InvoiceNo) AS Total_Orders,
    COUNT(DISTINCT CustomerID) AS Total_Customers,
    COUNT(DISTINCT StockCode) AS Total_Products,
    COUNT(DISTINCT Country) AS Total_Countries,
    SUM(Revenue) / COUNT(DISTINCT InvoiceNo) AS Average_Order_Value,
    SUM(Quantity) / COUNT(DISTINCT InvoiceNo) AS Avg_Units_Per_Order
FROM sales_staging;

-- Revenue by Country
SELECT Country,
    SUM(Revenue) AS Total_Revenue
FROM sales_staging
GROUP BY Country
ORDER BY Total_Revenue DESC
LIMIT 10;

-- Orders by Country
SELECT Country,
    COUNT(DISTINCT InvoiceNo) AS Total_Orders,
    SUM(Revenue) AS Total_Revenue
FROM sales_staging
GROUP BY Country
ORDER BY Total_Revenue DESC
LIMIT 10;

-- Average Order Value by Country
SELECT Country,
    COUNT(DISTINCT InvoiceNo) AS Total_Orders,
    SUM(Revenue) AS Total_Revenue,
    SUM(Revenue) / COUNT(DISTINCT InvoiceNo) AS Average_Order_Value
FROM sales_staging
GROUP BY Country
HAVING COUNT(DISTINCT InvoiceNo) >= 10
ORDER BY Average_Order_Value DESC
LIMIT 10;

-- *First Product Analysis* 
-- Top 10 products by revenue
SELECT StockCode, Description,
    SUM(Quantity) AS Units_Sold,
    SUM(Revenue) AS Total_Revenue
FROM sales_staging
GROUP BY StockCode, Description
ORDER BY Total_Revenue DESC
LIMIT 10;

-- Top 10 products by volume
SELECT StockCode, Description,
    SUM(Quantity) AS Units_Sold,
    SUM(Revenue) AS Total_Revenue
FROM sales_staging
GROUP BY StockCode, Description
ORDER BY Units_Sold DESC
LIMIT 10;

SELECT Country,
    COUNT(DISTINCT InvoiceNo) AS Total_Orders,
    COUNT(DISTINCT CustomerID) AS Total_Customers,
    SUM(Quantity) AS Units_Sold,
    SUM(Revenue) AS Total_Revenue,
    SUM(Revenue) / COUNT(DISTINCT InvoiceNo) AS Average_Order_Value
FROM sales_staging
GROUP BY Country
ORDER BY Total_Revenue DESC;


-- Country combined analysis
WITH country_sales AS (
    SELECT Country,
        SUM(Revenue) AS Total_Revenue
    FROM sales_staging
    GROUP BY Country
)
SELECT Country, Total_Revenue,
    ROUND(Total_Revenue /SUM(Total_Revenue) OVER () * 100,2) AS Revenue_Share_Percent
FROM country_sales
ORDER BY Total_Revenue DESC;


-- Revenue-share CTE
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
    ROUND(Cumulative_Revenue / Overall_Revenue * 100,2) AS Cumulative_Revenue_Percent
FROM country_ranked
ORDER BY Total_Revenue DESC;


-- Netherlands customer analysis
SELECT Country, CustomerID,
    COUNT(DISTINCT InvoiceNo) AS Total_Orders,
    SUM(Quantity) AS Units_Sold,
    SUM(Revenue) AS Total_Revenue
FROM sales_staging
WHERE Country = 'Netherlands'
  AND CustomerID IS NOT NULL
GROUP BY Country, CustomerID
ORDER BY Total_Revenue DESC
LIMIT 10;

SELECT CustomerID, Country,
    COUNT(DISTINCT InvoiceNo) AS Total_Orders,
    SUM(Quantity) AS Units_Sold,
    SUM(Revenue) AS Total_Revenue,
    MIN(OrderDate) AS First_Order,
    MAX(OrderDate) AS Last_Order
FROM sales_staging
WHERE CustomerID = '14646'
GROUP BY CustomerID, Country;

SELECT StockCode, Description,
    SUM(Quantity) AS Units_Sold,
    SUM(Revenue) AS Total_Revenue
FROM sales_staging
WHERE CustomerID = '14646'
GROUP BY StockCode, Description
ORDER BY Total_Revenue DESC
LIMIT 20;

SELECT StockCode, Description,
    SUM(Quantity) AS Units_Sold,
    SUM(Revenue) AS Total_Revenue
FROM sales_staging
WHERE StockCode NOT IN ('POST', 'DOT')
GROUP BY StockCode, Description
ORDER BY Total_Revenue DESC
LIMIT 10;

SELECT StockCode, Description,
    SUM(Quantity) AS Units_Sold,
    SUM(Revenue) AS Total_Revenue,
    ROUND(
	SUM(Revenue) / SUM(Quantity),2
    ) AS Revenue_Per_Unit
FROM sales_staging
WHERE StockCode NOT IN ('POST', 'DOT')
GROUP BY StockCode, Description
HAVING SUM(Quantity) > 0
ORDER BY Total_Revenue DESC
LIMIT 10;