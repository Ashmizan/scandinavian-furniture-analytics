_ _ This script defines the structure and relationships between customers, 
  furniture, and orders.

  _ _ Create the customers table to store customer information.
  CREATE TABLE customers (
          customer_id INTEGER PRIMARY KEY,
          customer_name VARCHAR(100),
          country VARCHAR(100)
);

_ _ Create the furniture table to store product information.
CREATE TABLE furniture (
    id INTEGER PRIMARY KEY,
    name VARCHAR (100),
    category VARCHAR (100),
    color VARCHAR (50),
    price INTEGER
);

_ _ Create the orders table to store
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


