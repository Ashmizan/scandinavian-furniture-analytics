Here are all the WHERE queries

_ _ Business questions
1. Which customers are from Finland?
SELECT*FROM customers
WHERE country = 'Finland';

2. Which customers are not From Finland?
SELECT*FROM customers
WHERE country != 'Finland';

3. Which customers are from Sweden OR Norway?
SELECT*FROM customers
WHERE country = 'Sweden'
OR country = 'Norway';

4. Which customers are from Finland AND have a
customer_id greater than 50?
SELECT*FROM customers
WHERE country = 'Finland'
AND customer_id > 50;

5. Find customers whose customer_id is between 
20 and 40.
SELECT*FROM customers
WHERE customer_id BETWEEN 20 and 40;

6. Find customers whose country is either Finland, Sweden, or Norway.
  SELECT*FROM customers
WHERE country IN ('Finland','Sweden','Norway');

7. Find all customers whose name starts with the letter A.
  SELECT*FROM customers
WHERE customer_name LIKE 'A%';

8. Find all customers whose name contains 'Berg' anywhere in their name.
  SELECT*FROM customers
WHERE customer_name LIKE '%berg%';

9. Find customers who are from Finland or Sweden, but exclude customers
whose customer_id is between 20 and 50.
SELECT*FROM customers
WHERE (country = 'Finland'
OR country = 'Sweden')
AND customer_id NOT BETWEEN 20 AND 50;

10. Find customers who satisfy either of these two groups:
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

11. Find customer who:

are from Finland, Sweden, or Norway
AND their name contains the letter sequence ''an''
BUT exclude customers whose ID is between 40 and 70
SELECT*FROM customers
WHERE country IN ('Finland','Sweden','Norway')
AND customer_name LIKE '%an%'
AND customer_id NOT BETWEEN 40 AND 70;


