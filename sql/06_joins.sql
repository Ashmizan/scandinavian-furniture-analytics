SELECT customers.customer_name,
       furniture.name
FROM orders
JOIN customers
ON orders.customer_id =
customers.customer_id
JOIN furniture
ON orders.furniture_id = furniture.id
ORDER BY furniture.price DESC;

SELECT customers.customer_name,
       furniture.name
FROM orders
JOIN customers
ON orders.customer_id =
customers.customer_id
JOIN furniture
ON orders.furniture_id = furniture.id
ORDER BY customers.customer_name,
furniture.price DESC;

SELECT customers.customer_name,
       furniture.name
FROM orders
JOIN customers
ON orders.customer_id =
customers.customer_id
JOIN furniture
ON orders.furniture_id = furniture.id
WHERE furniture.color = 'Brown' ;

SELECT customers.customer_name,
       furniture.name
FROM orders
JOIN customers
ON orders.customer_id =
customers.customer_id
JOIN furniture
ON orders.furniture_id = furniture.id
WHERE furniture.color != 'Brown' ;

SELECT customers.customer_name,
       furniture.name
FROM orders
JOIN customers
ON orders.customer_id =
customers.customer_id
JOIN furniture
ON orders.furniture_id = furniture.id
WHERE customers.customer_name = 'Ashfiya'
AND furniture.price > 100000;

SELECT customers.customer_name,
       furniture.name
FROM orders
JOIN customers
ON orders.customer_id =
customers.customer_id
JOIN furniture
ON orders.furniture_id = furniture.id
WHERE furniture.name = 'Fireplace'
OR furniture.name = 'King Bed'
OR furniture.name = 'Leather sofa';

SELECT customers.customer_name,
       furniture.name
FROM orders
LEFT JOIN customers
ON orders.customer_id =
customers.customer_id
LEFT JOIN furniture
ON orders.furniture_id = furniture.id;
SELECT customers.customer_name,
       furniture.name
FROM orders
LEFT JOIN customers
ON orders.customer_id =
customers.customer_id
LEFT JOIN furniture
ON orders.furniture_id = furniture.id;

SELECT customers.customer_name,
       furniture.name
FROM orders
RIGHT JOIN furniture
ON orders.furniture_id = furniture.id
LEFT JOIN customers
ON orders.customer_id = customers.customer_id;

SELECT customers.customer_name,
       furniture.name
FROM customers
FULL OUTER JOIN orders
ON customers.customer_id = orders.customer_id
LEFT JOIN furniture
ON orders.furniture_id = furniture.id;

SELECT customers.customer_name,
furniture.name
FROM customers
FULL OUTER JOIN orders
ON customers.customer_id = 
orders.customer_id
FULL OUTER JOIN furniture
ON orders.furniture_id = furniture.id;

SELECT*FROM customers
WHERE customer_name LIKE 'A%';

SELECT*FROM furniture
WHERE name LIKE 'L%'
AND furniture.price > 50000;

SELECT*FROM furniture
WHERE name LIKE 'L%'
AND furniture.price > 50000
ORDER BY price DESC;

SELECT customers.customer_name,
       furniture.name
FROM orders
JOIN customers
ON orders.customer_id =
customers.customer_id
JOIN furniture
ON orders.furniture_id =
furniture.id;

SELECT customers.customer_name,
       furniture.name
FROM orders
INNER JOIN customers
ON orders.customer_id =
customers.customer_id
INNER JOIN furniture
ON orders.furniture_id =
furniture.id;

SELECT customers.customer_name,
       furniture.name
FROM orders
JOIN customers
ON orders.customer_id =
customers.customer_id
JOIN furniture
ON orders.furniture_id =
furniture.id
WHERE country = 'Bangladesh';

SELECT customers.customer_name,
       furniture.name
FROM customers
LEFT JOIN orders
ON customers.customer_id =
orders.customer_id
LEFT JOIN furniture
ON orders.furniture_id =
furniture.id;

SELECT customers.customer_name,
       furniture.name
FROM customers
LEFT JOIN orders
ON customers.customer_id =
orders.customer_id
LEFT JOIN furniture
ON orders.furniture_id =
furniture.id;

SELECT customers.customer_name,
       furniture.name
FROM orders
RIGHT JOIN furniture
ON orders.furniture_id =
furniture.id
LEFT JOIN customers
ON orders.customer_id =
customers.customer_id;

SELECT customers.customer_name,
       furniture.name
FROM orders
JOIN customers
ON customers.customer_id =
orders.customer_id
JOIN furniture
ON orders.furniture_id =
furniture.id
WHERE furniture.price > 80000;

SELECT customers.customer_name,
       furniture.name,
	   furniture.price
FROM orders
JOIN customers
ON customers.customer_id =
orders.customer_id
JOIN furniture
ON orders.furniture_id =
furniture.id
WHERE furniture.price > 80000;
