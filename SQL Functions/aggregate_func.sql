USE SalesDB

-- Find the total sales across all orders
-- And the total sales for each product
-- Additionally provide details such order ID, order date

SELECT
	OrderID,
	OrderDate,
	Sales,
	ProductID, 
	SUM(Sales) OVER() TotalSales,
	SUM(Sales) OVER(PARTITION BY ProductID) TotalSales
FROM Sales.Orders


-- Find the percentage contribution of each product's sales to the total sales

SELECT
	OrderID,
	ProductID,
	Sales,
	SUM(Sales) OVER() TotalSales,
	ROUND(CAST (Sales AS Float) / SUM(Sales) OVER() * 100, 2) PercentageOfTotal
FROM Sales.Orders


/*
AVG Function
*/

-- Find the average sales across all orders
-- And Find the avergae saes for each product
-- Additionally provide details such orderID, OrderDate

SELECT
	OrderID,
	OrderDate,
	Sales,
	ProductID,
	AVG(COALESCE(Sales, 0)) OVER() AvgSales,
	AVG(COALESCE(Sales,  0)) OVER(PARTITION BY ProductID) AvgSalesByProduct
FROM Sales.Orders


-- Find the average scores of customers
-- Additionally provide deatils  such CustomerID and LastName

SELECT
	CustomerID,
	LastName,
	Score,
	AVG(COALESCE(Score,0)) OVER() AvgScores
FROM Sales.Customers


/*
MIN or MAX Function
*/

-- Find the highest & lowest sales across all orders
-- Find the highest and lowest sales for each product
-- Additionally provide details such order ID, order date

SELECT
	OrderID,
	OrderDate,
	ProductID,
	Sales,
	MAX(COALESCE(Sales, 0)) OVER() HighestSales,
	MIN(COALESCE(Sales, 0)) OVER() LowestSales,
	MAX(COALESCE(Sales, 0)) OVER(PARTITION BY ProductID) HighestSalesByProduct,
	MIN(COALESCE(Sales, 0)) OVER(PARTITION BY ProductID) LowestSalesByProduct
FROM Sales.Orders


