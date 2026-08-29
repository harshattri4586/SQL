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


-- Calculate the length of each customer's first name.

SELECT
	first_name,
	LEN(first_name) AS len_name
FROM customers


-- Retrieve the first two characters of each first name

SELECT
	first_name,
	LEFT(first_name, 2) AS first_2_char
FROM customers


-- Retrieve the last two characters of each first name

SELECT
	first_name,
	RIGHT(first_name, 2) AS last_2_char 
FROM customers


-- Retrieve the list of customer's first names removing the first character

SELECT
	first_name,
	SUBSTRING(first_name, 2, LEN(first_name)) AS sub_name 
FROM customers