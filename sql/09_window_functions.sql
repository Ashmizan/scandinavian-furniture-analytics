# SQL Window Functions Practice

## Overview

This project is a practical exploration of SQL Window Functions using PostgreSQL.

The goal is to understand how window functions can be used to rank products, compare rows, calculate category-level statistics, and analyze relationships between consecutive records, 
while keeping the individual rows in the result.

The exercises were completed using a custom furniture dataset.

---

## Database

**Database:** PostgreSQL  
**Table:** `furniture`

The `furniture` table contains product-level information including:

- `category`
- `name`
- `price`

---

## Window Functions Covered

### 1. ROW_NUMBER()

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
