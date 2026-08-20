-- 1. How many customers are in the database?
SELECT COUNT(*) AS total_customers
FROM customers;


-- 2. How many orders have been placed?
SELECT COUNT(*) AS total_orders
FROM orders;


-- 3. What is the total quantity of furniture ordered?
SELECT SUM(quantity) AS total_quantity_ordered
FROM orders;


-- 4. What is the average furniture price?
SELECT AVG(price) AS average_furniture_price
FROM furniture;


-- 5. What are the lowest and highest furniture prices?
SELECT
    MIN(price) AS lowest_price,
    MAX(price) AS highest_price
FROM furniture;


-- ============================================================
-- AGGREGATE FUNCTION TESTING
-- ============================================================

-- 6. How many different furniture products are available?
SELECT COUNT(*) AS total_products
FROM furniture;


-- 7. What is the total quantity ordered across all orders?
SELECT SUM(quantity) AS total_items_ordered
FROM orders;


-- 8. What is the average quantity of furniture purchased per order?
SELECT AVG(quantity) AS average_quantity_per_order
FROM orders;


-- 9. What is the minimum and maximum quantity purchased in a single order?
SELECT
    MIN(quantity) AS minimum_quantity,
    MAX(quantity) AS maximum_quantity
FROM orders;


-- 10. How many customers are from each country?
SELECT
    country,
    COUNT(*) AS customer_count
FROM customers
GROUP BY country
ORDER BY customer_count DESC;


-- ============================================================
-- BUSINESS & CUSTOMER BEHAVIOR QUESTIONS
-- ============================================================

-- 11. Which countries have the largest customer base?
SELECT
    country,
    COUNT(*) AS customer_count
FROM customers
GROUP BY country
ORDER BY customer_count DESC;


-- 12. Which furniture categories have the highest number of products?
SELECT
    category,
    COUNT(*) AS product_count
FROM furniture
GROUP BY category
ORDER BY product_count DESC;


-- 13. Which furniture categories have the highest total quantity ordered?
SELECT
    furniture.category,
    SUM(orders.quantity) AS total_quantity_ordered
FROM orders
JOIN furniture
    ON orders.furniture_id = furniture.id
GROUP BY furniture.category
ORDER BY total_quantity_ordered DESC;


-- 14. Which furniture products have generated the highest
-- total quantity of purchases?
SELECT
    furniture.name,
    SUM(orders.quantity) AS total_quantity_ordered
FROM orders
JOIN furniture
    ON orders.furniture_id = furniture.id
GROUP BY furniture.name
ORDER BY total_quantity_ordered DESC;


-- 15. Which countries generate the highest number of orders?
SELECT
    customers.country,
    COUNT(orders.order_id) AS total_orders
FROM orders
JOIN customers
    ON orders.customer_id = customers.customer_id
GROUP BY customers.country
ORDER BY total_orders DESC;

16. How many furniture pieces were purchased in total?
SELECT furniture.name,
      SUM(orders.quantity) AS total_quantity_purchased
FROM orders
JOIN furniture
ON orders.furniture_id = furniture.id
GROUP BY furniture.name
ORDER BY total_quantity_purchased DESC;

17. What is the total number of orders? Give the result 
    the name total_orders.
SELECT
COUNT(*) AS total_orders
FROM orders;

18. What is the total quantity of furniture sold?
SELECT 
SUM(orders.quantity) AS total_items_sold
FROM orders;

19.Calculate the average furniture price and call the result average_price.
SELECT 
      AVG(price) AS average_price
FROM furniture;

20. Find the highest furniture price and call the result highest_price.
SELECT 
      MAX(price) AS highest_price
FROM furniture;

21. Find the lowest furniture price and call the result lowest_price.
SELECT 
      MIN(price) AS lowest_price
FROM furniture;

22. Which furniture category has the highest total quantity sold? Show the
category and call the calculated column total_units_sold.
SELECT furniture.category,
   SUM(orders.quantity) AS total_units_sold
FROM orders
JOIN furniture
ON orders.furniture_id = furniture.id
GROUP BY furniture.category
ORDER BY total_units_sold DESC;

23. Which furniture category has the highest average product price? Show the
category and call the calculated column average_price.
SELECT category,
   AVG(price) AS average_price
FROM furniture
GROUP BY category
ORDER BY average_price DESC;

24. Which furniture product has been ordered in the largest total quantity?
Show the product name and call the calculated column total_units_sold.
SELECT furniture.name,
   SUM(orders.quantity) AS total_units_sold
FROM orders
JOIN furniture
ON orders.furniture_id = furniture.id
GROUP BY furniture.name
ORDER BY total_units_sold DESC;

25. Which country has generated the most orders? Show the country and call the calculated
column total_orders.
SELECT customers.country,
    COUNT(*) AS total_orders
FROM orders
JOIN customers
ON orders.customer_id = customers.customer_id
GROUP BY customers.country
ORDER BY total_orders DESC;
26. Which furniture category has the highest total sales value, assuming:
sales value = price x quantity
SELECT furniture.category,
     SUM(furniture.price*
	 orders.quantity) AS total_sales
FROM orders
JOIN furniture
ON orders.furniture_id= furniture.id
GROUP BY furniture.category
ORDER BY total_sales DESC;
