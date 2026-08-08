Here are the JOIN practice queries

1. CUSTOMER PURCHASE BEHAVIOURS
Which customers have placed orders, and which furniture products did they purchase?
SELECT customers.customer_name, furniture.name
FROM orders
JOIN customers
ON orders.customer_id = customers.customer_id
JOIN furniture
ON orders.furniture_id = furniture.id;
2. CUSTOMER PREFERENCES
What furniture category did each customer purchase?
SELECT customers.customer_name, furniture.category
FROM orders
JOIN customers
ON orders.customer_id = customers.customer_id
JOIN furniture
ON orders.furniture_id = furniture.id;
3. CUSTOMER-PRODUCT RELATIONSHIP
Which customers purchased which specific furniture products, including the product name,
category, and price?
SELECT customers.customer_name, furniture.category, furniture.price
FROM orders
JOIN customers
ON orders.customer_id = customers.customer_id
JOIN furniture
ON orders.furniture_id = furniture.id;

4. UNDERSTANDING CUSTOMER ORDERS
For each order, which customer placed it and which furniture product
was included?
SELECT customers.customer_name, furniture.name
FROM orders
JOIN customers
ON orders.customer_id = customers.customer_id
JOIN furniture
ON orders.furniture_id = furniture.id;

5. COUNTRY-LEVEL CUSTOMER BEHAVIOR
Which furniture products are being purchased by customers from each country?
SELECT customers.customer_name, country, furniture.name
FROM orders
JOIN customers
ON orders.customer_id = customers.customer_id
JOIN furniture
ON orders.furniture_id = furniture.id;

6. CUSTOMER PRODUCT CHOICES
  Show each customer's name, country, and the furniture
  product they ordered.
SELECT customers.customer_name, customers.country, furniture.name
FROM orders
JOIN customers
ON orders.customer_id = customers.customer_id
JOIN furniture
ON orders.furniture_id = furniture.id;

7. PRODUCT DEMAND BY CUSTOMER
  For each furniture product ordered, which customers purchased it?
SELECT customers.customer_name, furniture.name
FROM orders
JOIN customers
ON orders.customer_id = customers.customer_id
JOIN furniture
ON orders.furniture_id = furniture.id;

8. CUSTOMER ORDER DETAILS
Show the customer name, country, order ID, furniture product name, and quantity
for every order.
SELECT customers.customer_name, country, furniture.name, quantity, order_id
FROM orders
JOIN customers
ON orders.customer_id = customers.customer_id
JOIN furniture
ON orders.furniture_id = furniture.id;

9. UNDERSTANDING PURCHASING PATTERNS
Show which customers purchased furniture from each category, together with the quantity they ordered.
SELECT customers.customer_name, furniture.category, quantity
FROM orders
JOIN customers
ON orders.customer_id = customers.customer_id
JOIN furniture
ON orders.furniture_id = furniture.id;

10. BUSINESS VIEW OF CUSTOMER PURCHASES
Create a complete customer purchase view showing the customer's name, country, order ID, furniture product,
category, price, and quantity for every order.
SELECT customers.customer_name, country, order_id, furniture.name, furniture.category,
furniture.price, quantity
FROM orders
JOIN customers
ON orders.customer_id = customers.customer_id
JOIN furniture
ON orders.furniture_id = furniture.id;
