Scandinavian Furniture Analytics

A SQL analytics project using PostgreSQL to explore customer purchasing behavior, furniture sales, and relationships between customers, orders, and products.

Project Overview

This project uses a relational database containing:

100 customers
50 furniture products
500 orders

The analysis focuses on understanding customer purchasing behavior, product demand, purchasing patterns, and relationships between customers, orders, and furniture products.

Database Structure

The database contains three related tables:

customers — customer information and country
furniture — furniture products, categories, colors, and prices
orders — customer purchases, products, and quantities
SQL Analysis

The project demonstrates the following SQL concepts:

CREATE TABLE
SELECT
WHERE
IN
LIKE / ILIKE
BETWEEN
ORDER BY
INNER JOIN
Multiple-table JOINs
Aggregate functions
GROUP BY
HAVING
Tools
PostgreSQL
pgAdmin 4
SQL
GitHub
Business Questions

The analysis explores business questions such as:

Which customers have placed orders, and what products did they purchase?
Which customer-product combinations have the highest unit demand?
What furniture categories are customers purchasing?
Which countries are represented among the customers?
Which products are purchased by customers from different countries?
What does customer purchasing behavior look like across the dataset?
Which furniture products have the highest and lowest prices?
What is the average furniture price?
Which furniture categories have the highest average prices?
Which products have been ordered in the largest quantities?
Data Analysis Insight

One analysis asked:

How many units of each furniture product did each customer order?

The database contains 500 order records, but the query returned 476 rows.

Initially, this appeared to suggest that 24 orders were missing. A data-quality check using LEFT JOIN and IS NULL confirmed that all 500 orders have valid customer and furniture references.

The difference occurs because the query groups the data by:

GROUP BY customers.customer_name, furniture.name

Therefore, multiple orders involving the same customer and the same product are combined into a single customer-product record.

For example:

Sofia Berg | Luxury Ottoman | Order 1 → 2 units
Sofia Berg | Luxury Ottoman | Order 2 → 1 unit
Sofia Berg | Luxury Ottoman | Order 3 → 3 units

becomes:

Sofia Berg | Luxury Ottoman | 6 units

Therefore:

500 orders → 476 unique customer-product combinations

No orders were missing.

Key Analytical Skills Demonstrated

This project demonstrates the ability to:

Combine data from multiple relational tables using JOIN
Aggregate transactional data using SUM(), COUNT(), AVG(), MIN(), and MAX()
Group data into meaningful business dimensions using GROUP BY
Sort and rank analytical results using ORDER BY
Investigate apparent discrepancies in query results
Perform basic data-quality validation using LEFT JOIN and IS NULL
Translate business questions into SQL queries
Interpret SQL results from a business perspective
Business Value

The analysis could help a furniture retailer understand:

Which products have the highest demand
Which customers repeatedly purchase specific products
Which categories have higher average prices
Customer purchasing patterns
Product demand across different customer groups and countries
