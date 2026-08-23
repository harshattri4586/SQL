-- Manual Entry using INSERT

INSERT INTO customers (id, first_name, country, score)
VALUES 
	(6, 'Anna', 'USA', NULL),
	(7, 'Muskan', 'INDIA', 999)

/* Other Way to do it

INSERT INTO customers
VALUES 
	(6, 'Anna', 'USA', NULL),
	(7, 'Muskan', 'INDIA', 999)

*/

-- INSERT data from 'customers' into 'persons'

INSERT INTO persons (id, person_name, birth_date, phone)
SELECT 
id,
first_name,
NULL,
'Unknown'
FROM customers

SELECT *
FROM persons
