Here are all the ORDER_BY queries:

1. Show all customers sorted by customer_id from
smallest to largest.
SELECT*FROM customers
ORDER BY customer_id ASC;
2. Show all customers sorted by customer_id from
largest to smallest.
SELECT*FROM customers
ORDER BY customer_id DESC;
3. Show all customers sorted alphabetically by
customer_name.
SELECT*FROM customers
ORDER BY customer_name ASC;
4. Show all customers sorted by country alphabetically.
SELECT*FROM customers
ORDER BY country ASC;
5. Show all customers from Finland, sorted by customer_id
from highest to lowest.
SELECT*FROM customers
WHERE country = 'Finland'
ORDER BY customer_id DESC;
6. Show customers whose customer_id is greater than 50, sorted from
lowest to highest.
SELECT*FROM customers
WHERE customer_id > 50
ORDER BY customer_id ASC;
7. Show customers from Sweden or Norway, sorted alphabetically by customer_name.
SELECT*FROM customers
WHERE (country = 'Sweden'
OR country = 'Norway')
ORDER BY customer_name ASC;
8. Show customers whose names contain ''an'', sorted by customer_id descending.
SELECT*FROM customers
WHERE customer_name LIKE '%an%'
ORDER BY customer_id DESC;
9. Show customers from Finland, Sweden, or Norway whose names contain ''an'', exclude
customer IDs 40-70, and sort the results first by country alphabetically and then by 
customer_id from highest to lowest within each country.
SELECT*FROM customers
WHERE country IN ('Finland','Sweden','Norway')
AND customer_name ILIKE '%an%'
AND customer_id NOT BETWEEN 40 AND 70
ORDER BY country ASC, customer_id DESC;
