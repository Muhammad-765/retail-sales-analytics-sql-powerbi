SELECT *
FROM sales_staging;

SELECT COUNT(*) AS total_rows
FROM sales_staging;

SELECT  
	MIN(OrderDate) AS earliest_date,
    MAX(OrderDate) AS latest_date
FROM sales_staging;

SELECT
    SUM(Revenue) AS total_revenue,
    SUM(Quantity) AS total_units
FROM sales_staging;

