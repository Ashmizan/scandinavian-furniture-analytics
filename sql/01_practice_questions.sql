/*
===============================================================================
SCANDINAVIAN FURNITURE ANALYTICS
SQL PRACTICE PORTFOLIO
===============================================================================

Database: PostgreSQL
Tool: pgAdmin 4

This file documents practical SQL development from relational database
fundamentals through business-oriented analysis and window functions.

CORE AREAS
- Database and table creation
- SELECT, WHERE, ORDER BY
- Filtering with AND / OR / IN / BETWEEN / LIKE
- Aggregate functions
- GROUP BY / HAVING
- INNER JOIN / LEFT JOIN
- Customer and product analysis
- Revenue analysis
- Data-quality investigation
- ROW_NUMBER / RANK / DENSE_RANK
- PARTITION BY
- AVG() OVER()
- LAG() / LEAD()

PORTFOLIO STRUCTURE
1. Practice SQL      -> learning and technical exercises
2. Business Questions -> business-focused analytical problems
3. Power BI          -> visualization and reporting output

The questions below are intentionally written as analytical tasks rather
than tutorial instructions, so the repository demonstrates both SQL syntax
and the ability to translate business questions into queries.

===============================================================================
*/


1._ _ Create the customers table to store customer information.
  CREATE TABLE customers (
          customer_id INTEGER PRIMARY KEY,
          customer_name VARCHAR(100),
          country VARCHAR(100)
);

2._ _ Create the furniture table to store product information.
CREATE TABLE furniture (
    id INTEGER PRIMARY KEY,
    name VARCHAR (100),
    category VARCHAR (100),
    color VARCHAR (50),
    price INTEGER
);

3._ _ Create the orders table to store
  customer purchases. 
 CREATE TABLE orders (
     order_id INTEGER PRIMARY KEY,
     customer_id INTEGER,
     furniture_id INTEGER,
     quantity INTEGER,

    FOREIGN KEY (customer_id)
        REFERENCES
   customers(customer_id),

    FOREIGN KEY (furniture_id)
         REFERENCES furniture(id)
   );

4_ _ How many customers are in the database?
SELECT COUNT(*)
FROM customers;

5_ _ How many furniture products are in the database?
SELECT COUNT(*)
FROM furniture;

6_ _ How many orders are in the database? 
SELECT COUNT(*)
FROM orders;

7_ _ Display all customer information.
SELECT* FROM customers;
8_ _ Display all furniture informatoon.
SELECT* FROM furniture;

9_ _ Display all order information.
SELECT* FROM orders;

10_ _ Display customer names and their countries.
SELECT customer_name, country
FROM customers;

11_ _ Display furniture names and their prices.
SELECT name, price
FROM furniture;

12_ _ Display furniture names, categories and colors.
SELECT name, category, color
FROM furniture;

13_ _ Display order IDs and quantities.
SELECT order_id, quantity
FROM orders;

/* ============================================================================
BUSINESS QUESTIONS
============================================================================ */
14. Which customers are from Finland?
SELECT*FROM customers
WHERE country = 'Finland';

15. Which customers are not From Finland?
SELECT*FROM customers
WHERE country != 'Finland';

16. Which customers are from Sweden OR Norway?
SELECT*FROM customers
WHERE country = 'Sweden'
OR country = 'Norway';

17. Which customers are from Finland AND have a
customer_id greater than 50?
SELECT*FROM customers
WHERE country = 'Finland'
AND customer_id > 50;

18. Find customers whose customer_id is between 
20 and 40.
SELECT*FROM customers
WHERE customer_id BETWEEN 20 and 40;

19. Find customers whose country is either Finland, Sweden, or Norway.
  SELECT*FROM customers
WHERE country IN ('Finland','Sweden','Norway');

20. Find all customers whose name starts with the letter A.
  SELECT*FROM customers
WHERE customer_name LIKE 'A%';

21. Find all customers whose name contains 'Berg' anywhere in their name.
  SELECT*FROM customers
WHERE customer_name LIKE '%berg%';

22. Find customers who are from Finland or Sweden, but exclude customers
whose customer_id is between 20 and 50.
SELECT*FROM customers
WHERE (country = 'Finland'
OR country = 'Sweden')
AND customer_id NOT BETWEEN 20 AND 50;

23. Find customers who satisfy either of these two groups:
Group A:
Finland
AND customer ID greater than 60

OR 

Group B:
Sweden
AND customer ID less than 30.
SELECT*FROM customers
WHERE (country = 'Finland'
AND customer_id > 60)
OR (country = 'Sweden'
AND customer_id < 30);

24. Find customer who:

are from Finland, Sweden, or Norway
AND their name contains the letter sequence ''an''
BUT exclude customers whose ID is between 40 and 70
SELECT*FROM customers
WHERE country IN ('Finland','Sweden','Norway')
AND customer_name LIKE '%an%'
AND customer_id NOT BETWEEN 40 AND 70;

25. Show all customers sorted by customer_id from
smallest to largest.
SELECT*FROM customers
ORDER BY customer_id ASC;
26. Show all customers sorted by customer_id from
largest to smallest.
SELECT*FROM customers
ORDER BY customer_id DESC;
27. Show all customers sorted alphabetically by
customer_name.
SELECT*FROM customers
ORDER BY customer_name ASC;
28. Show all customers sorted by country alphabetically.
SELECT*FROM customers
ORDER BY country ASC;
29. Show all customers from Finland, sorted by customer_id
from highest to lowest.
SELECT*FROM customers
WHERE country = 'Finland'
ORDER BY customer_id DESC;
30. Show customers whose customer_id is greater than 50, sorted from
lowest to highest.
SELECT*FROM customers
WHERE customer_id > 50
ORDER BY customer_id ASC;
31. Show customers from Sweden or Norway, sorted alphabetically by customer_name.
SELECT*FROM customers
WHERE (country = 'Sweden'
OR country = 'Norway')
ORDER BY customer_name ASC;
32. Show customers whose names contain ''an'', sorted by customer_id descending.
SELECT*FROM customers
WHERE customer_name LIKE '%an%'
ORDER BY customer_id DESC;
33. Show customers from Finland, Sweden, or Norway whose names contain ''an'', exclude
customer IDs 40-70, and sort the results first by country alphabetically and then by 
customer_id from highest to lowest within each country.
SELECT*FROM customers
WHERE country IN ('Finland','Sweden','Norway')
AND customer_name ILIKE '%an%'
AND customer_id NOT BETWEEN 40 AND 70
ORDER BY country ASC, customer_id DESC;

34. CUSTOMER PURCHASE BEHAVIOURS
Which customers have placed orders, and which furniture products did they purchase?
SELECT customers.customer_name, furniture.name
FROM orders
JOIN customers
ON orders.customer_id = customers.customer_id
JOIN furniture
ON orders.furniture_id = furniture.id;
35. CUSTOMER PREFERENCES
What furniture category did each customer purchase?
SELECT customers.customer_name, furniture.category
FROM orders
JOIN customers
ON orders.customer_id = customers.customer_id
JOIN furniture
ON orders.furniture_id = furniture.id;
36. CUSTOMER-PRODUCT RELATIONSHIP
Which customers purchased which specific furniture products, including the product name,
category, and price?
SELECT customers.customer_name, furniture.category, furniture.price
FROM orders
JOIN customers
ON orders.customer_id = customers.customer_id
JOIN furniture
ON orders.furniture_id = furniture.id;

37. UNDERSTANDING CUSTOMER ORDERS
For each order, which customer placed it and which furniture product
was included?
SELECT customers.customer_name, furniture.name
FROM orders
JOIN customers
ON orders.customer_id = customers.customer_id
JOIN furniture
ON orders.furniture_id = furniture.id;

38. COUNTRY-LEVEL CUSTOMER BEHAVIOR
Which furniture products are being purchased by customers from each country?
SELECT customers.customer_name, country, furniture.name
FROM orders
JOIN customers
ON orders.customer_id = customers.customer_id
JOIN furniture
ON orders.furniture_id = furniture.id;

39. CUSTOMER PRODUCT CHOICES
  Show each customer's name, country, and the furniture
  product they ordered.
SELECT customers.customer_name, customers.country, furniture.name
FROM orders
JOIN customers
ON orders.customer_id = customers.customer_id
JOIN furniture
ON orders.furniture_id = furniture.id;

39. PRODUCT DEMAND BY CUSTOMER
  For each furniture product ordered, which customers purchased it?
SELECT customers.customer_name, furniture.name
FROM orders
JOIN customers
ON orders.customer_id = customers.customer_id
JOIN furniture
ON orders.furniture_id = furniture.id;

40. CUSTOMER ORDER DETAILS
Show the customer name, country, order ID, furniture product name, and quantity
for every order.
SELECT customers.customer_name, country, furniture.name, quantity, order_id
FROM orders
JOIN customers
ON orders.customer_id = customers.customer_id
JOIN furniture
ON orders.furniture_id = furniture.id;

41. UNDERSTANDING PURCHASING PATTERNS
Show which customers purchased furniture from each category, together with the quantity they ordered.
SELECT customers.customer_name, furniture.category, quantity
FROM orders
JOIN customers
ON orders.customer_id = customers.customer_id
JOIN furniture
ON orders.furniture_id = furniture.id;

42. BUSINESS VIEW OF CUSTOMER PURCHASES
Create a complete customer purchase view showing the customer's name, country, order ID, furniture product,
category, price, and quantity for every order.
SELECT customers.customer_name, country, order_id, furniture.name, furniture.category,
furniture.price, quantity
FROM orders
JOIN customers
ON orders.customer_id = customers.customer_id
JOIN furniture
ON orders.furniture_id = furniture.id;

43. Which customers purchased furniture, and what was the price of each product they purchased? Show the customer name, country,
product name, and price.
SELECT customers.customer_name, customers.country, furniture.name, furniture.price
FROM orders
JOIN customers
ON orders.customer_id = customers.customer_id
JOIN furniture
ON orders.furniture_id = furniture.id;

44. How many customers are in the database?
SELECT COUNT(*) AS total_customers
FROM customers;


45. How many orders have been placed?
SELECT COUNT(*) AS total_orders
FROM orders;


46. What is the total quantity of furniture ordered?
SELECT SUM(quantity) AS total_quantity_ordered
FROM orders;


47. What is the average furniture price?
SELECT AVG(price) AS average_furniture_price
FROM furniture;


48. What are the lowest and highest furniture prices?
SELECT
    MIN(price) AS lowest_price,
    MAX(price) AS highest_price
FROM furniture;


/* ============================================================================
AGGREGATE FUNCTION TESTING
============================================================================ */

--49. How many different furniture products are available?
SELECT COUNT(*) AS total_products
FROM furniture;


50. What is the total quantity ordered across all orders?
SELECT SUM(quantity) AS total_items_ordered
FROM orders;


51. What is the average quantity of furniture purchased per order?
SELECT AVG(quantity) AS average_quantity_per_order
FROM orders;


52. What is the minimum and maximum quantity purchased in a single order?
SELECT
    MIN(quantity) AS minimum_quantity,
    MAX(quantity) AS maximum_quantity
FROM orders;


53. How many customers are from each country?
SELECT
    country,
    COUNT(*) AS customer_count
FROM customers
GROUP BY country
ORDER BY customer_count DESC;


/* ============================================================================
BUSINESS & CUSTOMER BEHAVIOR QUESTIONS
============================================================================ */

54. Which countries have the largest customer base?
SELECT
    country,
    COUNT(*) AS customer_count
FROM customers
GROUP BY country
ORDER BY customer_count DESC;


55. Which furniture categories have the highest number of products?
SELECT
    category,
    COUNT(*) AS product_count
FROM furniture
GROUP BY category
ORDER BY product_count DESC;


56. Which furniture categories have the highest total quantity ordered?
SELECT
    furniture.category,
    SUM(orders.quantity) AS total_quantity_ordered
FROM orders
JOIN furniture
    ON orders.furniture_id = furniture.id
GROUP BY furniture.category
ORDER BY total_quantity_ordered DESC;


57. Which furniture products have generated the highest
-- total quantity of purchases?
SELECT
    furniture.name,
    SUM(orders.quantity) AS total_quantity_ordered
FROM orders
JOIN furniture
    ON orders.furniture_id = furniture.id
GROUP BY furniture.name
ORDER BY total_quantity_ordered DESC;


58. Which countries generate the highest number of orders?
SELECT
    customers.country,
    COUNT(orders.order_id) AS total_orders
FROM orders
JOIN customers
    ON orders.customer_id = customers.customer_id
GROUP BY customers.country
ORDER BY total_orders DESC;

59. How many furniture pieces were purchased in total?
SELECT furniture.name,
      SUM(orders.quantity) AS total_quantity_purchased
FROM orders
JOIN furniture
ON orders.furniture_id = furniture.id
GROUP BY furniture.name
ORDER BY total_quantity_purchased DESC;

60. What is the total number of orders? Give the result 
    the name total_orders.
SELECT
COUNT(*) AS total_orders
FROM orders;

61. What is the total quantity of furniture sold?
SELECT 
SUM(orders.quantity) AS total_items_sold
FROM orders;

62.Calculate the average furniture price and call the result average_price.
SELECT 
      AVG(price) AS average_price
FROM furniture;

63. Find the highest furniture price and call the result highest_price.
SELECT 
      MAX(price) AS highest_price
FROM furniture;

64. Find the lowest furniture price and call the result lowest_price.
SELECT 
      MIN(price) AS lowest_price
FROM furniture;

65. Which furniture category has the highest total quantity sold? Show the
category and call the calculated column total_units_sold.
SELECT furniture.category,
   SUM(orders.quantity) AS total_units_sold
FROM orders
JOIN furniture
ON orders.furniture_id = furniture.id
GROUP BY furniture.category
ORDER BY total_units_sold DESC;

66. Which furniture category has the highest average product price? Show the
category and call the calculated column average_price.
SELECT category,
   AVG(price) AS average_price
FROM furniture
GROUP BY category
ORDER BY average_price DESC;

67. Which furniture product has been ordered in the largest total quantity?
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

01 - Customer Furniture Purchase Analysis

Analyzed customer-level furniture purchasing behavior by joining customer, order,
and furniture tables and calculating total units ordered per customer-product combination.

SELECT customers.customer_name, furniture.name,
COUNT(*) AS product_count
FROM orders
JOIN customers
ON orders.customer_id = customers.customer_id
JOIN furniture
ON orders.furniture_id = furniture.id
GROUP BY customers.customer_name, furniture.name 
ORDER BY product_count DESC;

02. Business question

How many units of each furniture product did each customer order?

SELECT customers.customer_name, furniture.name,
SUM(orders.quantity) AS total_quantity_ordered
FROM orders
JOIN customers
ON orders.customer_id = customers.customer_id
JOIN furniture
ON orders.furniture_id = furniture.id
GROUP BY customers.customer_name, furniture.name 
ORDER BY total_quantity_ordered DESC;

Result

The database contains 500 orders, but the query returned 476 rows.

At first, this looked like 24 orders were missing. So I investigated the discrepancy.

Data-quality check
SELECT COUNT(*)
FROM orders
LEFT JOIN customers
    ON orders.customer_id = customers.customer_id
LEFT JOIN furniture
    ON orders.furniture_id = furniture.id
WHERE customers.customer_id IS NULL
   OR furniture.id IS NULL;

Result: 0

This means all 500 orders have valid customer and furniture references.

Why 476 rows?

The query groups by:

GROUP BY customers.customer_name, furniture.name

Therefore, multiple orders involving the same customer and the same product are combined into one row.

For example:

Sofia Berg | Luxury Ottoman | Order 1 → 2 units
Sofia Berg | Luxury Ottoman | Order 2 → 1 unit
Sofia Berg | Luxury Ottoman | Order 3 → 3 units

becomes:

Sofia Berg | Luxury Ottoman | 6 units

Therefore:

500 orders → 476 unique customer-product combinations

No orders are actually missing.

Key analytical insight

This exercise demonstrated the difference between order-level data and aggregated customer-product data.

I used:

JOIN to combine three related tables
SUM() to calculate total units
GROUP BY to create customer-product combinations
ORDER BY to rank results
LEFT JOIN to investigate a potential data-quality issue
IS NULL to check for missing relationships

1.List all furniture items in the Sofa category priced above 60,000, sorted from most to least expensive.
SELECT*FROM furniture
WHERE category = 'Sofa'
AND price > 60000
ORDER BY price DESC;

2.Which customers are from Sweden?
SELECT*FROM customers
WHERE country = 'Sweden';

3.Show all orders where the quantity is more than 2.
SELECT*FROM orders
WHERE quantity > 2;

4.What is the total revenue if every order's price × quantity is summed?
SELECT
SUM(furniture.price * orders.quantity) AS total_revenue
FROM orders
JOIN furniture
ON orders.furniture_id = furniture.id
ORDER BY total_revenue DESC;

5.What is the average price of furniture, broken down by category?
SELECT category,
AVG(furniture.price) AS average_price
FROM furniture
GROUP BY category
ORDER BY average_price DESC;

6.How many distinct countries are the customers from?
SELECT COUNT(DISTINCT country)
AS distinct_countries
FROM customers;

7.For each country, how many customers are there?
SELECT country,
COUNT(*) AS customer_count
FROM customers
GROUP BY country
ORDER BY customer_count DESC;

8.For each furniture category, how many total units have been ordered?
SELECT category,
SUM(quantity) AS total_units_ordered
FROM orders
JOIN furniture
ON orders.furniture_id = furniture.id
GROUP BY category
ORDER BY total_units_ordered DESC;

9.Which customer has placed the most orders, by number of orders?
SELECT customers.customer_name,
COUNT(*) AS order_count
FROM orders
JOIN customers
ON orders.customer_id = customers.customer_id
GROUP BY customers.customer_name
ORDER BY order_count DESC
LIMIT 1;

10.What is the total amount spent by each customer, ranked highest to lowest?
SELECT customers.customer_name,
SUM(furniture.price*quantity) AS total_amount_spent
FROM orders
JOIN customers
ON orders.customer_id = customers.customer_id
JOIN furniture
ON orders.furniture_id = furniture.id
GROUP BY customers.customer_name
ORDER BY total_amount_spent DESC;

11.Which furniture categories have an average price above 70,000?
SELECT category,
       AVG(price) AS average_price
FROM furniture
GROUP BY category
HAVING AVG(price) > 70000
ORDER BY average_price DESC;

12. Which customers have ordered more than 5 times?
SELECT customers.customer_id,
       customers.customer_name,
	   customers.country,
       COUNT(*) AS order_count
FROM orders
JOIN customers
ON orders.customer_id = customers.customer_id
GROUP BY customers.customer_id,
       customers.customer_name,
	   customers.country
HAVING COUNT(*) > 5
ORDER BY order_count DESC;

13.Which countries have more than 10 customers?
SELECT country,
       COUNT(DISTINCT customer_id) AS customer_count
FROM customers
GROUP BY country
HAVING COUNT(DISTINCT customer_id) > 10
ORDER BY customer_count DESC;

14.Which furniture category generates the most total revenue?
SELECT category,
SUM(furniture.price*orders.quantity) AS total_revenue
FROM orders
JOIN furniture
ON orders.furniture_id = furniture.id
GROUP BY category
ORDER BY total_revenue DESC
LIMIT 1;

15.Show the top 5 customers by total spending, including their country.
SELECT customers.country,customer_name,
SUM(furniture.price*orders.quantity) AS total_spending
FROM orders
JOIN furniture
ON orders.furniture_id = furniture.id
JOIN customers
ON orders.customer_id = customers.customer_id
GROUP BY customers.country,customer_name
ORDER BY total_spending DESC
LIMIT 5;

16.For each country, what is the total revenue generated from customers in that country?
SELECT customers.country,
SUM(furniture.price*orders.quantity) AS total_revenue
FROM orders
JOIN furniture
ON orders.furniture_id = furniture.id
JOIN customers
ON orders.customer_id = customers.customer_id
GROUP BY customers.country
ORDER BY total_revenue DESC;

17.Which furniture items have never been ordered?
SELECT furniture.name
FROM furniture
LEFT JOIN orders
ON orders.furniture_id = furniture.id
WHERE orders.order_id IS NULL;

18.What is the most frequently ordered furniture item by total quantity, not order count?
SELECT furniture.name,
SUM(orders.quantity) AS total_quantity
FROM orders
JOIN furniture
ON orders.furniture_id = furniture.id
GROUP BY furniture.name
ORDER BY total_quantity DESC
LIMIT 1;

19.Compare total revenue from Sofa vs every other category combined.
SELECT
    SUM(CASE
	    WHEN furniture.category ='Sofa'
		THEN furniture.price*
		orders.quantity
		ELSE 0
		END) AS sofa_revenue,
	SUM(CASE 
	    WHEN furniture.category !=
		'Sofa'
		   THEN furniture.price*
		   orders.quantity
		   ELSE 0
		   END) AS other_categories_revenue
FROM orders
JOIN furniture
ON orders.furniture_id = furniture.id;

"sofa_revenue"	"other_categories_revenue"
 4190000	         102735000

20.Which customer has the highest single order value (price × quantity for one order line)?
SELECT customers.customer_name,
       customers.country,
	   furniture.name,
	   furniture.price,
	   orders.quantity,
    furniture.price*orders.quantity AS order_value
	FROM orders
	JOIN customers
	ON orders.customer_id = customers.customer_id
	JOIN furniture
	ON orders.furniture_id = furniture.id
	ORDER BY order_value DESC
	LIMIT 1;

1. ROW_NUMBER()

Assigns a unique sequential number to every product within each category.

```sql
ROW_NUMBER() OVER (
    PARTITION BY category
    ORDER BY price DESC
)
2. RANK()

Ranks products within each category based on price.

Products with the same price receive the same rank, and gaps appear after ties.

RANK() OVER (
    PARTITION BY category
    ORDER BY price DESC
)

Example:

Price       Rank
200000       1
200000       1
180000       3
65000        4
3. DENSE_RANK()

Similar to RANK(), but does not leave gaps after tied values.

DENSE_RANK() OVER (
    PARTITION BY category
    ORDER BY price DESC
)

Example:

Price       Dense Rank
200000          1
200000          1
180000          2
65000           3
4. AVG() OVER()

Calculates an average while keeping every individual product row.

AVG(price) OVER (
    PARTITION BY category
)

This makes it possible to compare an individual product's price with the average price of its category.

5. LAG()

Returns a value from a previous row according to the specified ordering.

LAG(price) OVER (
    PARTITION BY category
    ORDER BY price DESC
)

Use case: Comparing a product's price with the price of the previous product in the same category.

6. LEAD()

Returns a value from the following row according to the specified ordering.

LEAD(price) OVER (
    PARTITION BY category
    ORDER BY price DESC
)

Use case: Looking at the next product's price within the same category.

Key Concepts Practiced
PARTITION BY

PARTITION BY divides the dataset into groups while keeping the original rows.

For example:

PARTITION BY category

means that ranking or calculations restart separately for each furniture category.

ORDER BY inside OVER()

The ORDER BY inside the window determines the order in which the window function evaluates the rows.

For example:

ORDER BY price DESC

means products are considered from the highest price to the lowest price.

Practical Exercises

The project includes exercises covering:

Ranking products within categories
Comparing ROW_NUMBER(), RANK(), and DENSE_RANK()
Calculating category-level average prices
Comparing individual prices with category averages
Finding previous product prices using LAG()
Finding following product prices using LEAD()
Calculating price differences between consecutive products
Combining multiple window functions in a single query

The main distinction I learned is:

Function	Purpose
ROW_NUMBER()	Gives every row a unique number
RANK()	Gives tied rows the same rank, with gaps
DENSE_RANK()	Gives tied rows the same rank, without gaps
AVG() OVER()	Calculates an aggregate while keeping individual rows
LAG()	Looks at a previous row
LEAD()	Looks at a following row

I also practiced combining window functions with PARTITION BY, ORDER BY, and arithmetic calculations to solve business-style analytical questions.

Tools
PostgreSQL
pgAdmin 4
SQL


01. Using furniture, assign a unique row number to every product within each category, with the most expensive product receiving row_number = 1.
SELECT 
     category,
	 name,
	 price,
ROW_NUMBER() OVER(PARTITION BY category
             ORDER BY price DESC)
FROM furniture
ORDER BY price DESC;

02. Using the furniture table, rank every product within its category by price, from highest to lowest.

SELECT 
     category,
	 name,
	 price,
RANK() OVER(PARTITION BY category
             ORDER BY price DESC)
			 AS price_rank
FROM furniture
ORDER BY price DESC;

03. Rank every product within its category by price from highest to lowest, but use dense ranking.

SELECT 
     category,
	 name,
	 price,
DENSE_RANK() OVER(PARTITION BY category
             ORDER BY price DESC)
			 AS price_rank
FROM furniture;

04. Using furniture, return
category
name
price
row_number
price_rank
dense_price_rank

Calculate all three within each category, ordering by price from highest to lowest.

SELECT 
     category,
	 name,
	 price,
ROW_NUMBER() OVER(PARTITION BY category
             ORDER BY price DESC)
			 AS row_number,
			 RANK() OVER(PARTITION BY category
             ORDER BY price DESC)
			 AS price_rank,
DENSE_RANK() OVER(PARTITION BY category
             ORDER BY price DESC)
			 AS dense_price_rank
FROM furniture;

05. For every furniture product, show the average price of its category next to the product's own price.
  SELECT 
      category,
	  name,
	  price,
AVG(price) OVER(PARTITION BY category
) AS category_avg_price
FROM furniture;

06. For every furniture product, show its price and the price of the previous product within the same category,
  when the products are ordered from highest price to lowest price.
  SELECT 
      category,
	  name,
	  price,
LAG(price) OVER(PARTITION BY category
ORDER BY price DESC
) AS previous_price
FROM furniture;

07. For every product, show the price of the next cheaper product within the same category.

SELECT 
      category,
	  name,
	  price,
LEAD(price) OVER(PARTITION BY category
ORDER BY price DESC
) AS next_price
FROM furniture;

08 For every product, show its price and the difference between its price and the previous product's price
within the same category.
  
SELECT 
      category,
	  name,
	  price,
LAG(price) OVER(PARTITION BY category
ORDER BY price DESC
) AS previous_price,

price - LAG(price) OVER (
PARTITION BY category
ORDER BY price DESC
) AS price_difference
FROM furniture;

09. For every product, show the next product's price within the same category and calculate how much cheaper the next product is compared
with the current product.

SELECT 
      category,
	  name,
	  price,
LEAD(price) OVER(PARTITION BY category
ORDER BY price DESC
) AS next_price,

price - LEAD(price) OVER (
PARTITION BY category
ORDER BY price DESC
) AS price_difference
FROM furniture;

10. For every product, show its price, the average price of its category, and how far its price is above or below the category average.

SELECT 
      category,
	  name,
	  price,
AVG(price) OVER(PARTITION BY category
) AS category_avg_price,

price - AVG(price) OVER (
PARTITION BY category
) AS difference_from_average
FROM furniture;

11. For every furniture product, show its rank within its category by price, and the price of the previous product within that category.

SELECT 
      category,
	  name,
	  price,
RANK() OVER(PARTITION BY category
ORDER BY price DESC) AS price_rank,
LAG(price) OVER(PARTITION BY category
ORDER BY price DESC) AS previous_price
FROM furniture;

12. For every furniture product, show its category, product name, price, its rank within the category, and how much more expensive it is
than the previous product in that category.

SELECT 
      category,
	  name,
	  price,
RANK() OVER(PARTITION BY category
ORDER BY price DESC) AS price_rank,
LAG(price) OVER(PARTITION BY category
ORDER BY price DESC) AS previous_price,

price-LAG(price) OVER(PARTITION BY category
ORDER BY price DESC) AS price_difference
FROM furniture;

13. For every furniture product, show its category, name, price, and the price of the next product within the same category when products are ordered from highest price to lowest price.

SELECT 
      category,
	  name,
	  price,
LEAD(price) OVER(PARTITION BY category
ORDER BY price DESC) AS next_price
FROM furniture;

14. Using furniture, show for every product:

category
name
price
category_avg_price
price_rank

SELECT
     category,
	 name,
	 price,
AVG(price) OVER(PARTITION BY category)
AS category_avg_price,
DENSE_RANK() OVER(PARTITION BY category
ORDER BY price DESC)
AS price_rank
FROM furniture;

15. Using the furniture table, for every product show:

category
name
price
price_rank
category_avg_price
previous_price
next_price

SELECT
     category,
	 name,
	 price,
DENSE_RANK() OVER(PARTITION BY category
ORDER BY price DESC) AS price_rank,
AVG(price) OVER(PARTITION BY category)
AS category_avg_price,
LAG(price) OVER(PARTITION BY category
ORDER BY price DESC)
AS previous_price,
LEAD(price) OVER(PARTITION BY category
ORDER BY price DESC)
AS next_price
FROM furniture;
