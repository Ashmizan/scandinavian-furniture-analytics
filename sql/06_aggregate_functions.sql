-- Aggregate Functions
-- This file uses aggregate functions to analyze customers,
-- furniture products, and order activity.


-- ============================================================
-- BASIC AGGREGATE FUNCTIONS
-- ============================================================

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
