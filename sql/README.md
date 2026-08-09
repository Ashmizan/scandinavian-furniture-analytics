# Scandinavian Furniture Analytics

A SQL analytics project using PostgreSQL to explore customer purchasing behavior and furniture sales data.

## Project Overview

This project uses a relational database containing:

- 100 customers
- 50 furniture products
- 500 orders

The analysis focuses on understanding customer behavior, purchasing patterns,
and business relationships between customers, orders, and furniture products.

## Database Structure

The database contains three related tables:

-'customers' - customer information and country
-'furniture' - furniture products, categories, colors, and prices
-'orders' = customer purchases, products, and quantities

## SQL Analysis

The project demonstrates the following SQL concepts:

- CREATE TABLE
- SELECT
- WHERE
- IN
- LIKE / ILIKE
- BETWEEN
- ORDER BY
- INNER JOIN
- Multiple-table JOINs
- Aggregate functions
- GROUP BY
- HAVING

TOOLS
PostgreSQL
pgAdmin4
SQL
GitHub

# Business Questions

The analysis explores questions questions such as:

Which customer-product combinations generate the highest unit demand?

500 order records represent 476 unique customer-product combinations because repeated
customer-product orders are aggregated.

- Which customers have placed orders and what products did they purchase?
- What furniture categories are customers purchasing?
- Which countries are represented among the countries?
- Which products are purchased by customers from different countries?
- What does customer purchasing behavior look like across the dataset?
- Which products and customer segments show stronger demand?
