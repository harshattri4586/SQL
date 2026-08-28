-- Show a list of customers's first names together with their country in one column.

SELECT
first_name,
country,
CONCAT(first_name, ' ', country) AS name_country
FROM customers


-- Transform, the customer's first_name to lowercase

SELECT
	first_name,
	country,
LOWER(first_name) AS low_name
FROM customers


-- Transform, the customer's first_name to uppercase

SELECT
	first_name,
	country,
UPPER(first_name) AS up_name
FROM customers


-- Find customers whose first name contains leading or trailing spaces

SELECT
	first_name
FROM customers
WHERE first_name != TRIM(first_name)


-- Remove dashes (-) from a phoe number

SELECT
	'123-456-7890' AS phone,
REPLACE('123-456-7890', '-', '') AS clean_phone