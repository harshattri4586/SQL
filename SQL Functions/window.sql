 -- Find the total Sales Across all orders

 SELECT
 SUM(Sales) TotalSales
 FROM  Sales.Orders


-- Find the total Sales Across all orders

 SELECT
 ProductID,
 SUM(Sales) TotalSales
 FROM  Sales.Orders
 GROUP BY ProductID

 /*
 Find the total sales for each product, additionally
 provide details such order id & order date
 */

 SELECT
	OrderID,
	OrderDate,
	ProductID,
	SUM(Sales) OVER(PARTITION BY ProductID) TotalSalesByProducts 
 FROM  Sales.Orders


 /*
 Find the total sales across all orders, additionally
 provide details such order id & order date
 */

 SELECT
	OrderID,
	OrderDate,
	SUM(Sales) OVER() TotalSales
FROM Sales.Orders


 /*
 Find the total sales across all orders and 
 Find the total sales for each product also and
 Find the total sales for each combination of product and order status
 , additionally provide details such order id & order date
 */

 SELECT
	OrderID,
	OrderDate,
	ProductID,
	OrderStatus,
	Sales,
	SUM(Sales) OVER() TotalSales,
	SUM(Sales) OVER(PARTITION BY ProductID) TotalSalesByProducts,
	SUM(Sales) OVER(PARTITION BY ProductID,OrderStatus) SalesByProductsAndStatus
FROM Sales.Orders 


/*
Rank each order based on their sales from highest to lowest,
additionally provide details such order id & order date
*/

SELECT 
	OrderID,
	OrderDate,
	Sales,
	RANK() OVER(ORDER BY Sales DESC) RankSales
FROM Sales.Orders


-- WINDOW FRAME

SELECT
	OrderID,
	OrderDate,
	OrderStatus,
	Sales,
	SUM(Sales) OVER(PARTITION BY OrderStatus ORDER BY OrderDate
	ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING) TotalSales
FROM Sales.Orders


-- Rank Customers based on their sales

SELECT
	CustomerID,
	SUM(Sales) TotalSales,
	RANK() OVER(ORDER BY SUM(Sales) DESC) RankCustomers
FROM Sales.Orders
GROUP BY CustomerID