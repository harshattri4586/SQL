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


-- Show the product IDs, product names, prices, and the total number of orders

-- Main Query
SELECT 
	ProductID,
	Product,
	Price,
	-- SubQuery
	(SELECT COUNT(*) TotalOrders FROM Sales.Orders) AS TotalOrders
FROM Sales.Products;

-- Show all customers details and find the total orders of each customer

-- Main Query
SELECT
*
FROM Sales.Customers c
LEFT JOIN (
	SELECT  
	CustomerID,
	COUNT(*) TotalOrders
	FROM Sales.Orders
	GROUP BY CustomerID
) o
ON c.CustomerID = o.CustomerID


-- Find the products that have a price higher than the average price of all products

SELECT
	ProductID,
	Price
FROM Sales.Products
WHERE Price > (SELECT AVG(Price) FROM Sales.Products)


--  Show the details of orders made by customers in Germany

SELECT 
*
FROM Sales.Orders
WHERE CustomerID IN (SELECT
					CustomerID
					FROM Sales.Customers
					WHERE Country = 'Germany')


-- Find female employees whose salaries are greater 
-- than the salaries of any male employees

SELECT
	EmployeeID,
	FirstName,
	Gender, 
	Salary
FROM Sales.Employees
WHERE Gender = 'F'
AND Salary > ANY(SELECT Salary FROM Sales.Employees WHERE Gender = 'M')
