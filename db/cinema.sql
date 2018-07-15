-- Drop all tables for a clean slate
DROP TABLE tickets;
DROP TABLE customers;
DROP TABLE screenings;
DROP TABLE films;

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

CREATE TABLE screenings(
  id SERIAL2 PRIMARY KEY,
  screening TIME,
  screen INT2,
  film_id INT2 REFERENCES films(id) ON DELETE CASCADE
);

CREATE TABLE tickets(
  id SERIAL2 PRIMARY KEY,
  film_id INT2 REFERENCES films(id) ON DELETE CASCADE,
  customer_id INT2 REFERENCES customers(id) ON DELETE CASCADE,
  screening_id INT2 REFERENCES screenings(id) ON DELETE CASCADE
);
