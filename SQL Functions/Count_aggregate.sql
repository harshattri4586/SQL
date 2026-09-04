-- Find the total number of Orders

SELECT
COUNT(*) TotalOrders
FROM Sales.Orders


-- Find the total number of orders additionally provide 
-- details such order id & order date

SELECT
	OrderID,
	OrderDate,
	COUNT(*) OVER() TotalOrders
FROM Sales.Orders

-- Find the total number of orders for each customers

SELECT
	CustomerID,
	OrderID,
	OrderDate,
	COUNT(*) OVER(PARTITION BY CustomerID) OrdersByCustomers
FROM Sales.Orders


-- Find the total number of customers,
-- Find the total number of scores for the customers
-- additionally provide all customer's details

SELECT
*,
COUNT(*) OVER() TotalCustomers,
COUNT(Score) OVER() TotalScores
FROM Sales.Customers


-- Check whether the table 'Orders' contains any duplicate rows

SELECT 
OrderID,
COUNT(*) OVER(PARTITION BY OrderID) checkPk
FROM Sales.Orders;

SELECT 
*
FROM (
	SELECT 
		OrderID,
		COUNT(*) OVER(PARTITION  BY OrderID) CheckPK
	FROM Sales.OrdersArchive
)t WHERE CheckPK > 1