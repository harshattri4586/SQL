-- Scalar SUBQUERY

SELECT
AVG(Sales)
FROM Sales.Orders

-- ROW SUBQUERY

SELECT
CustomerID
FROM Sales.Orders

-- TABLE SUBQUERY

SELECT
	OrderID,
	OrderDate
FROM Sales.Orders


/* Task: Find the products that have a price
		 higher than the average price of all products
*/

-- Main Query
SELECT
	ProductID,
	Price
FROM(
-- Subquery
	SELECT
		ProductID,
		Price,
	AVG(Price) OVER() AvgPrice
	FROM Sales.Products
)t 
WHERE Price > AvgPrice


/* Task: Rank Customers based on their total amount of sales
*/

SELECT
	*,
	RANK() OVER(ORDER BY TotalSales DESC) CustomerRank
FROM(
-- Subquery
	SELECT
		CustomerID,
		SUM(Sales) TotalSales
	FROM Sales.Orders
	GROUP BY CustomerID
)t 
