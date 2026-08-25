/*
Retrieve all data from customers and orders in two different results
*/

-- NO JOIN

SELECT *
FROM customers;

SELECT *
FROM orders;

-- INNER JOIN

/*
Get all customers along with their orders, but only for
customers who have placed an order
*/

SELECT 
	c.id, 
	c.first_name,
	o.order_id,
	o.sales 
FROM customers AS c
INNER JOIN orders AS o
ON c.id = o.customer_id

-- LEFT JOIN

/*
Get all customers along with their orders, including those 
without orders
*/

SELECT 
	c.id,
	o.order_id, 
	c.first_name,
	c.country,
	c.score,
	o.sales
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id

-- RIGHT JOIN

/*
Get all customers along with their orders, including orders
without matching customers
*/

SELECT 
	c.id,
	o.order_id, 
	c.first_name,
	o.sales
FROM customers AS c
RIGHT JOIN orders AS o
ON c.id = o.customer_id

-- FULL JOIN

/*
Get all customers and all orders, even if there's no match
*/

SELECT 
	c.id,
	o.order_id, 
	c.first_name,
	o.sales
FROM customers AS c
FULL JOIN orders AS o
ON c.id = o.customer_id