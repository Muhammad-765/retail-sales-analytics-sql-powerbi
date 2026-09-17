-- Product overview
SELECT StockCode, Description,
    SUM(Quantity) AS Units_Sold,
    SUM(Revenue) AS Total_Revenue,
    ROUND(SUM(Revenue) / NULLIF(SUM(Quantity), 0), 2) AS Revenue_Per_Unit
FROM sales_staging
GROUP BY StockCode, Description
ORDER BY Total_Revenue DESC;

-- Top 10 products by revenue
SELECT StockCode, Description,
    SUM(Quantity) AS Units_Sold,
    SUM(Revenue) AS Total_Revenue,
    ROUND(SUM(Revenue) / NULLIF(SUM(Quantity), 0), 2) AS Revenue_Per_Unit
FROM sales_staging
WHERE StockCode NOT IN ('POST', 'DOT')
GROUP BY StockCode, Description
ORDER BY Total_Revenue DESC LIMIT 10;

-- Top 10 products by units sold
SELECT StockCode, Description,
    SUM(Quantity) AS Units_Sold,
    SUM(Revenue) AS Total_Revenue,
    ROUND(SUM(Revenue) / NULLIF(SUM(Quantity), 0), 2) AS Revenue_Per_Unit
FROM sales_staging
WHERE StockCode NOT IN ('POST', 'DOT')
GROUP BY StockCode, Description
ORDER BY Units_Sold DESC 
LIMIT 10;

-- Highest revenue per unit
SELECT StockCode, Description,
    SUM(Quantity) AS Units_Sold,
    SUM(Revenue) AS Total_Revenue,
    ROUND(SUM(Revenue) / NULLIF(SUM(Quantity), 0), 2) AS Revenue_Per_Unit
FROM sales_staging
WHERE StockCode NOT IN ('POST', 'DOT')
GROUP BY StockCode, Description
HAVING SUM(Quantity) >= 100
ORDER BY Revenue_Per_Unit DESC
LIMIT 10;

-- Highest-volume products with relatively low revenue
SELECT StockCode, Description,
    SUM(Quantity) AS Units_Sold,
    SUM(Revenue) AS Total_Revenue,
    ROUND(SUM(Revenue) / NULLIF(SUM(Quantity), 0), 2) AS Revenue_Per_Unit
FROM sales_staging
WHERE StockCode NOT IN ('POST', 'DOT')
GROUP BY StockCode, Description
HAVING SUM(Quantity) >= 1000
ORDER BY Revenue_Per_Unit ASC
LIMIT 10;

-- Monthly performance of top products
SELECT OrderYear, OrderMonth, MonthName, StockCode, Description,
    SUM(Quantity) AS Units_Sold,
    SUM(Revenue) AS Total_Revenue
FROM sales_staging
WHERE StockCode NOT IN ('POST', 'DOT')
GROUP BY OrderYear, OrderMonth, MonthName, StockCode, Description
ORDER BY OrderYear, OrderMonth, Total_Revenue DESC;

-- Product revenue ranking
WITH product_sales AS (
    SELECT StockCode, Description,
        SUM(Quantity) AS Units_Sold,
        SUM(Revenue) AS Total_Revenue
    FROM sales_staging
    WHERE StockCode NOT IN ('POST', 'DOT')
    GROUP BY StockCode, Description
)
SELECT StockCode, Description, Units_Sold,Total_Revenue, 
DENSE_RANK() OVER (ORDER BY Total_Revenue DESC) AS Revenue_Rank
FROM product_sales
ORDER BY Revenue_Rank;

