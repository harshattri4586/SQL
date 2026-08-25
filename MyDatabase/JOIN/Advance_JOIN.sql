-- LEFT ANTI JOIN

/*
Get all customers who haven't place any order
*/

SELECT *
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id
WHERE o.customer_id IS NULL

-- RIGHT ANTI JOIN

/*
Get all orders without matching customers
*/

SELECT *
FROM customers AS c
RIGHT JOIN orders AS o
ON c.id = o.customer_id
WHERE c.id IS NULL 

-- FULL ANTI JOIN

/*
Find customers without orders and orders without customers
*/

SELECT *
FROM customers AS c
FULL JOIN orders AS o
ON c.id = o.customer_id
WHERE 
	c.id IS NULL 
	OR
	o.customer_id IS NULL

-- TASK 
	
/*
Get all customers along with their orders, but only for customers
who have placed an order without using INNER JOIN
*/

SELECT *
FROM customers AS c
LEFT JOIN orders as o
ON c.id = o.customer_id
WHERE o.customer_id IS NOT NULL

-- CROSS JOIN

/*
Generate all possible combinations of customers and orders
*/

SELECT *
FROM customers
CROSS JOIN orders