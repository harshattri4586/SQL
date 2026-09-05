-- Analyze the month-over-month performance by finding
-- the percentage change in sales between the current and previous months

SELECT
*,
CurrentMonthSales - PreviousMonthSales AS MoM_Change,
ROUND(CAST((CurrentMonthSales - PreviousMonthSales) AS FLOAT)/PreviousMonthSales * 100,1) AS MoM_Perc
FROM (
	SELECT
		MONTH(OrderDate) OrderMonth,
		SUM(Sales) CurrentMonthSales,
		LAG(SUM(Sales)) OVER(ORDER BY MONTH(OrderDate)) PreviousMonthSales
	FROM Sales.Orders
	GROUP BY 
		MONTH(OrderDate)
)t


-- In Order to analyze customer loyality,
-- rank customers based on the average days between their orders

SELECT 
	CustomerID,
	AVG(DaysUntilNextOrder) AvgDays,
	RANK() OVER(ORDER BY COALESCE(AVG(DaysUntilNextOrder),999999)) RankAvg
FROM (
	SELECT
		OrderID,
		CustomerID,
		OrderDate CurrentOrder,
		LEAD(OrderDate) OVER(PARTITION BY CustomerID ORDER BY OrderDate) NextOrder,
		DATEDIFF(day, OrderDate, LEAD(OrderDate) OVER(PARTITION BY CustomerID ORDER BY OrderDate)) DaysUntilNextOrder
	FROM Sales.Orders
)t
GROUP BY
	CustomerID

