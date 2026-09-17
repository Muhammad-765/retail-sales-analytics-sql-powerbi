-- Monthly Revenue
SELECT OrderYear, OrderMonth, MonthName,
    SUM(Revenue) AS Total_Revenue
FROM sales_staging
GROUP BY OrderYear, OrderMonth, MonthName
ORDER BY OrderYear, OrderMonth;

-- Monthly Orders 
SELECT OrderYear, OrderMonth, MonthName,
    COUNT(DISTINCT InvoiceNo) AS Total_Orders 
FROM sales_staging
GROUP BY OrderYear, OrderMonth, MonthName
ORDER BY OrderYear, OrderMonth;

-- Monthly Customers
SELECT OrderYear, OrderMonth, MonthName,
	COUNT(DISTINCT CustomerID) AS Total_Customers
FROM sales_staging
WHERE CustomerID IS NOT NULL
GROUP BY OrderYear, OrderMonth, MonthName
ORDER BY OrderYear, OrderMonth;

-- Monthly AOV
SELECT OrderYear, OrderMonth, MonthName,
    SUM(Revenue) AS Total_Revenue,
    COUNT(DISTINCT InvoiceNo) AS Total_Orders,
    ROUND(
        SUM(Revenue) / COUNT(DISTINCT InvoiceNo),2
    ) AS Average_Order_Value
FROM sales_staging
GROUP BY OrderYear, OrderMonth, MonthName
ORDER BY OrderYear, OrderMonth;

-- Month-over-Month Growth
WITH monthly_sales AS (
    SELECT OrderYear, OrderMonth, MonthName, SUM(Revenue) AS Total_Revenue
    FROM sales_staging
    GROUP BY OrderYear, OrderMonth, MonthName
)
SELECT OrderYear, OrderMonth, MonthName, Total_Revenue,
    LAG(Total_Revenue) OVER (ORDER BY OrderYear, OrderMonth) AS Previous_Month_Revenue,
    ROUND(
        (Total_Revenue - LAG(Total_Revenue) OVER (ORDER BY OrderYear, OrderMonth)
        ) /
        NULLIF(LAG(Total_Revenue) OVER (ORDER BY OrderYear, OrderMonth),0) * 100,2
    ) AS MoM_Growth_Percent
FROM monthly_sales
ORDER BY OrderYear, OrderMonth;

-- Running revenue
WITH monthly_sales AS (
    SELECT OrderYear,OrderMonth, MonthName,
        SUM(Revenue) AS Total_Revenue
    FROM sales_staging
    GROUP BY OrderYear, OrderMonth, MonthName
)
SELECT OrderYear, OrderMonth, MonthName, Total_Revenue,
    SUM(Total_Revenue) OVER (ORDER BY OrderYear, OrderMonth) AS Cumulative_Revenue
FROM monthly_sales
ORDER BY OrderYear, OrderMonth;

-- Rolling 3-Month Revenue
WITH monthly_sales AS (
    SELECT OrderYear, OrderMonth, MonthName,
        SUM(Revenue) AS Total_Revenue
    FROM sales_staging
    GROUP BY OrderYear, OrderMonth, MonthName
)
SELECT OrderYear, OrderMonth, MonthName, Total_Revenue,
    ROUND(AVG(Total_Revenue) OVER (ORDER BY OrderYear, OrderMonth ROWS BETWEEN 2 PRECEDING AND CURRENT ROW),2
    ) AS Rolling_3_Month_Avg
FROM monthly_sales
ORDER BY OrderYear, OrderMonth;

-- Combined Monthly KPIs
WITH monthly_sales AS (
    SELECT OrderYear, OrderMonth, MonthName,
        SUM(Revenue) AS Total_Revenue,
        COUNT(DISTINCT InvoiceNo) AS Total_Orders,
        COUNT(DISTINCT CustomerID) AS Total_Customers
    FROM sales_staging
    WHERE CustomerID IS NOT NULL
    GROUP BY OrderYear, OrderMonth, MonthName
)
SELECT OrderYear, OrderMonth, MonthName, Total_Revenue, Total_Orders, Total_Customers,
    ROUND(Total_Revenue / Total_Orders, 2) AS Average_Order_Value,
    ROUND(Total_Revenue / Total_Customers, 2) AS Revenue_Per_Customer,
    ROUND(Total_Orders / Total_Customers, 2) AS Orders_Per_Customer
FROM monthly_sales
ORDER BY OrderYear, OrderMonth;

-- November Revenue by Country
SELECT Country,
    SUM(Revenue) AS Total_Revenue,
    COUNT(DISTINCT InvoiceNo) AS Total_Orders,
    COUNT(DISTINCT CustomerID) AS Total_Customers
FROM sales_staging
WHERE OrderYear = 2011
  AND OrderMonth = 11
GROUP BY Country
ORDER BY Total_Revenue DESC
LIMIT 10;

-- November Top Products
SELECT StockCode, Description,
    SUM(Quantity) AS Units_Sold,
    SUM(Revenue) AS Total_Revenue
FROM sales_staging
WHERE OrderYear = 2011
  AND OrderMonth = 11
  AND StockCode NOT IN ('POST', 'DOT')
GROUP BY StockCode, Description
ORDER BY Total_Revenue DESC
LIMIT 10;

-- April Revenue by Country
SELECT Country,
    SUM(Revenue) AS Total_Revenue,
    COUNT(DISTINCT InvoiceNo) AS Total_Orders,
    COUNT(DISTINCT CustomerID) AS Total_Customers
FROM sales_staging
WHERE OrderYear = 2011
  AND OrderMonth = 4
GROUP BY Country
ORDER BY Total_Revenue DESC
LIMIT 10;

