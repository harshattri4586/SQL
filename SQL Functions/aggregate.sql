-- Find the total numbers of orders

SELECT
COUNT(*) AS total_nr_orders
FROM orders	

-- Find the total sales of all orders

SELECT
SUM(Sales) AS total_sales
FROM orders


-- Find the average sales of all orders

SELECT 
AVG(sales) AS avg_sales
FROM orders

-- Find the highest sales of all orders

SELECT 
MAX(sales) AS highest_sales
FROM orders


-- Find the lowest sales of all orders

SELECT 
MIN(sales) AS lowest_sales
FROM orders