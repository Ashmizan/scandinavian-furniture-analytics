# Scandinavian Furniture Analytics

A SQL analytics project using PostgreSQL to explore customer purchasing behavior, furniture sales, product demand, and relationships between customers, orders, and furniture products.

## Project Overview

This project uses a relational database containing:

- 100 customers
- 50 furniture products
- 500 orders

The analysis focuses on understanding customer purchasing behavior, product demand, purchasing patterns, and relationships between customers, orders, and furniture products.

---

## Database Structure

The database contains three related tables:

### `customers`
Customer information including customer name and country.

### `furniture`
Furniture products, categories, colors, and prices.

### `orders`
Customer purchases, products, and quantities.

---

## SQL Analysis

The project demonstrates the following SQL concepts:

- `CREATE TABLE`
- `SELECT`
- `WHERE`
- `IN`
- `LIKE` / `ILIKE`
- `BETWEEN`
- `ORDER BY`
- `INNER JOIN`
- Multiple-table `JOIN`
- Aggregate functions
- `GROUP BY`
- `HAVING`
- Window functions

---

## Business Questions

The analysis explores business questions such as:

- Which customers have placed orders, and what products did they purchase?
- Which customer-product combinations have the highest unit demand?
- What furniture categories are customers purchasing?
- Which countries are represented among the customers?
- Which products are purchased by customers from different countries?
- What does customer purchasing behavior look like across the dataset?
- Which furniture products have the highest and lowest prices?
- What is the average furniture price?
- Which furniture categories have the highest average prices?
- Which products have been ordered in the largest quantities?

---

# Data Analysis Insight

One analysis asked:

> How many units of each furniture product did each customer order?

The database contains **500 order records**, but the query returned **476 rows**.

Initially, this appeared to suggest that 24 orders were missing.

A data-quality check using `LEFT JOIN` and `IS NULL` confirmed that all 500 orders have valid customer and furniture references.
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

This analysis demonstrated the importance of investigating unexpected query results rather than assuming that records were missing.

SQL Window Functions

This project also includes a practical exploration of SQL Window Functions using PostgreSQL.

The goal is to understand how window functions can be used to rank products, compare rows, calculate category-level statistics, and analyze relationships between consecutive records while keeping the individual rows in the result.

Window Functions Covered
1. ROW_NUMBER()

Assigns a unique sequential number to every product within each category.

ROW_NUMBER() OVER (
    PARTITION BY category
    ORDER BY price DESC
)

Use case: Identifying the most expensive, second-most expensive, third-most expensive, etc. product within each category.

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

PARTITION BY divides the dataset into groups while keeping the individual rows.

For example:

PARTITION BY category

means that the window calculation restarts separately for each furniture category.

ORDER BY inside OVER()

The ORDER BY inside the window determines the order in which the window function evaluates the rows.

For example:

ORDER BY price DESC

means products are considered from the highest price to the lowest price.

Practical Window Function Exercises

The project includes exercises covering:

Ranking products within categories
Comparing ROW_NUMBER(), RANK(), and DENSE_RANK()
Calculating category-level average prices
Comparing individual prices with category averages
Finding previous product prices using LAG()
Finding following product prices using LEAD()
Calculating price differences between consecutive products
Combining multiple window functions in a single query
Window Function Reference
Function	Purpose
ROW_NUMBER()	Gives every row a unique number
RANK()	Gives tied rows the same rank, with gaps
DENSE_RANK()	Gives tied rows the same rank, without gaps
AVG() OVER()	Calculates an aggregate while keeping individual rows
LAG()	Looks at a previous row
LEAD()	Looks at a following row
Key Analytical Skills Demonstrated

This project demonstrates the ability to:

Combine data from multiple relational tables using JOIN
Aggregate transactional data using SUM(), COUNT(), AVG(), MIN(), and MAX()
Group data into meaningful business dimensions using GROUP BY
Sort analytical results using ORDER BY
Rank products using SQL window functions
Compare individual rows with previous and following rows
Calculate category-level statistics while preserving individual records
Investigate apparent discrepancies in query results
Perform basic data-quality validation using LEFT JOIN and IS NULL
Translate business questions into SQL queries
Interpret SQL results from a business perspective
Business Value

The analysis could help a furniture retailer understand:

Which products have the highest demand?
Which customers repeatedly purchase specific products?
Which categories have higher average prices?
What customer purchasing patterns exist?
How does product demand vary across different customer groups and countries?
Which products are positioned at the top or bottom of their category by price?

Tools:
PostgreSQL
pgAdmin 4
SQL
GitHub
