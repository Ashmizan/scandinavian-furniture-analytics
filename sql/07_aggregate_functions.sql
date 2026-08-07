SELECT COUNT(*)
FROM furniture;

SELECT COUNT(*)
FROM customers;

SELECT COUNT(*)
FROM orders;

SELECT SUM(price)
FROM furniture;

SELECT AVG(price)
FROM furniture;

SELECT MIN(price)
FROM furniture;

SELECT MAX(price)
FROM furniture;

SELECT 
    COUNT(*) AS total_products,
	SUM(price) AS total_value,
	AVG(price) AS average_price,
	MIN(price) AS cheapest,
	MAX(price) AS most_expensive
FROM furniture;

SELECT COUNT(*)
FROM furniture
WHERE price > 80000;

SELECT 
      customer_id,
	  COUNT(*)
FROM orders
GROUP BY customer_id;

SELECT 
      customers.customer_name,
	  COUNT(*) AS total_orders
FROM orders
JOIN customers
ON orders.customer_id =
customers.customer_id
GROUP BY customers.customer_name;

SELECT 
      customers.customer_name,
	  SUM(furniture.price) AS 
	  total_spent
FROM orders
JOIN customers
ON orders.customer_id =
customers.customer_id
JOIN furniture
ON orders.furniture_id = furniture.id
GROUP BY customers.customer_name;

SELECT 
      customers.customer_name,
	  AVG(furniture.price) AS 
	  average_purchase
FROM orders
JOIN customers
ON orders.customer_id =
customers.customer_id
JOIN furniture
ON orders.furniture_id = furniture.id
GROUP BY customers.customer_name;

SELECT 
      customers.customer_name,
	  MAX(furniture.price) AS 
	  highest_purchase
FROM orders
JOIN customers
ON orders.customer_id =
customers.customer_id
JOIN furniture
ON orders.furniture_id = furniture.id
GROUP BY customers.customer_name;

SELECT 
      customers.customer_name,
	  COUNT(*) AS 
	  total_orders
FROM orders
JOIN customers
ON orders.customer_id =
customers.customer_id
JOIN furniture
ON orders.furniture_id = furniture.id
GROUP BY customers.customer_name;

SELECT 
      customers.customer_name,
	  SUM(furniture.price) AS 
	  total_spent
FROM orders
JOIN customers
ON orders.customer_id =
customers.customer_id
JOIN furniture
ON orders.furniture_id = furniture.id
GROUP BY customers.customer_name;

SELECT 
      customers.customer_name,
	  COUNT(*) AS 
	  total_orders
FROM orders
JOIN customers
ON orders.customer_id =
customers.customer_id
JOIN furniture
ON orders.furniture_id = furniture.id
GROUP BY customers.customer_name;

SELECT 
      customers.customer_name,
	  SUM(furniture.price) AS 
	  total_spent
FROM orders
JOIN customers
ON orders.customer_id =
customers.customer_id
JOIN furniture
ON orders.furniture_id = furniture.id
GROUP BY customers.customer_name;

SELECT 
      customers.customer_name,
	  AVG(furniture.price) AS 
	  average_purchase
FROM orders
JOIN customers
ON orders.customer_id =
customers.customer_id
JOIN furniture
ON orders.furniture_id = furniture.id
GROUP BY customers.customer_name;

SELECT 
      customers.customer_name,
	  MIN(furniture.price) AS 
	  cheapest_purchase
FROM orders
JOIN customers
ON orders.customer_id =
customers.customer_id
JOIN furniture
ON orders.furniture_id = furniture.id
GROUP BY customers.customer_name;

SELECT 
      customers.customer_name,
	  MAX(furniture.price) AS 
	  most_expensive_purchase
FROM orders
JOIN customers
ON orders.customer_id =
customers.customer_id
JOIN furniture
ON orders.furniture_id = furniture.id
GROUP BY customers.customer_name;

SELECT 
      furniture.name,
	  	COUNT(*) AS 
	  total_orders
FROM orders
JOIN customers
ON orders.customer_id =
customers.customer_id
JOIN furniture
ON orders.furniture_id = furniture.id
GROUP BY furniture.name;

SELECT 
      furniture.name,
	  	SUM(furniture.price) AS 
	  total_revenue
FROM orders
JOIN customers
ON orders.customer_id =
customers.customer_id
JOIN furniture
ON orders.furniture_id = furniture.id
GROUP BY furniture.name;

SELECT 
      furniture.name,
	  	SUM(furniture.price) AS 
	  total_revenue
FROM orders
JOIN customers
ON orders.customer_id =
customers.customer_id
JOIN furniture
ON orders.furniture_id = furniture.id
GROUP BY furniture.name;

SELECT customers.customer_name,
      COUNT(*) AS total_orders,
	  SUM(price) AS total_spent,
	  AVG(price) AS average_price
FROM orders
JOIN customers
ON orders.customer_id = customers.customer_id
JOIN furniture
ON orders.furniture_id = furniture.id
GROUP BY customers.customer_name;

SELECT customers.customer_name,
      COUNT(*) AS luxury_orders
FROM orders
JOIN customers
ON orders.customer_id = customers.customer_id
JOIN furniture
ON orders.furniture_id = furniture.id
WHERE furniture.price > 80000
GROUP BY customers.customer_name;


