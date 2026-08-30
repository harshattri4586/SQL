-- Generate a report showing the total sales for each category:
--       High: If the sales higher than 50
--       Medium: If the sales between 20 and 50
--       Low: If the sales equal or lower than 20
-- Sort the result from lowest to hoghest


SELECT
Category,
SUM(Sales) AS TotalSales
FROM(
	SELECT
	OrderID,
	Sales,
	CASE
		WHEN Sales > 50 THEN 'High'
		WHEN Sales > 20 THEN 'Medium'
		ELSE 'Low'
	END Category
	FROM Sales.Orders
)t
GROUP BY Category
ORDER BY TotalSales DESC


-- Retrieve employee details with gender displayed as full text

SELECT
EmployeeID,
FirstName,
LastName,
Gender,
CASE 
	WHEN Gender = 'F' THEN 'Female'
	WHEN Gender = 'M' THEN 'Male'
	ELSE 'Not Available'
END GenderFullText
FROM Sales.Employees


-- Retrieve customers details with abbreviated country code

SELECT
	CustomerID,
	FirstName,
	LastName,
	Country,
CASE 
	WHEN Country = 'Germany' THEN 'DE'
	WHEN Country = 'USA'     THEN  'US'
	ELSE 'n/a'
END CountryAbbr
FROM Sales.Customers 


-- Count how many times each customer has made an order with sales greater than 30

SELECT
	CustomerID,
	SUM(CASE
		WHEN Sales > 30 THEN 1
		ELSE 0
	END) TotalHighSales,
	COUNT(*) TotalOrders
FROM Sales.Orders
GROUP BY CustomerID