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
