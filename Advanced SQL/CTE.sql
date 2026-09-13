-- Step1 : Find the total sales Per Customer
WITH CTE_Total_Sales AS
(
SELECT 
	CustomerID,
	SUM(Sales) AS TotalSales
FROM Sales.Orders
GROUP BY CustomerID
)
-- Step2 : Find the last order date for each customer
,CTE_Last_Order AS
(
SELECT
	CustomerID,
	MAX(OrderDate) AS LastOrder
FROM Sales.Orders
GROUP BY CustomerID
)
-- Step3 : Rank customers based on Total Sales Per Customer
, CTE_Customer_Rank AS
(
SELECT
	CustomerID,
	TotalSales,
	RANK() OVER(ORDER BY TotalSales DESC) AS CustomerRank
FROM CTE_Total_Sales
)
-- Step4 : Segment customers based on their total Sales
, CTE_Customer_Segment AS 
(
SELECT 
	CustomerID,
	CASE WHEN TotalSales > 100 THEN 'High'
		 WHEN TotalSales > 50  THEN 'Medium'
		 ELSE 'Low'
	END CustomerSegments
FROM CTE_Total_Sales
)
-- Main Query
SELECT
c.CustomerID,
c.FirstName,
c.LastName,
cts.TotalSales,
clo.LastOrder,
ccr.CustomerRank,
ccs.CustomerSegments
FROM Sales.Customers c
LEFT JOIN CTE_Total_Sales cts
ON cts.CustomerID = c.CustomerID 
LEFT JOIN CTE_Last_Order clo 
ON clo.CustomerID = c.CustomerID 
LEFT JOIN CTE_Customer_Rank ccr
ON ccr.CustomerID = c.CustomerID 
LEFT JOIN CTE_Customer_Segment ccs
ON ccs.CustomerID = c.CustomerID 