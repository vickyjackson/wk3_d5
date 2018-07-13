-- Drop all tables for a clean slate
DROP TABLE tickets;
DROP TABLE films;
DROP TABLE customers;

-- Create tables with columns/data types
CREATE TABLE films(
  id SERIAL2 PRIMARY KEY,
  title VARCHAR(255),
  price INT2
);

CREATE TABLE customers(
  id SERIAL2 PRIMARY KEY,
  name VARCHAR(255),
  funds INT2
);

CREATE TABLE tickets(
  id SERIAL2 PRIMARY KEY,
  film_id INT2 REFERENCES films(id) ON DELETE CASCADE,
  customer_id INT2 REFERENCES customers(id) ON DELETE CASCADE
);
