DROP TABLE tickets;
DROP TABLE films;
DROP TABLE customers;

CREATE TABLE customers (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  funds INT4
  );

CREATE TABLE films (
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  price INT4
  );

CREATE TABLE tickets (
  id SERIAL4 PRIMARY KEY,
  customer_id INT4 REFERENCES customers(id) ON DELETE CASCADE,
  film_id INT4 REFERENCES films(id) ON DELETE CASCADE,
  review TEXT
  );


INSERT INTO customers (name, funds) VALUES ('Max', 24);
INSERT INTO customers (name, funds) VALUES ('Sally', 25);
INSERT INTO customers (name, funds) VALUES ('John', 35);

INSERT INTO films (title, price) VALUES ('Napoleon Dynamite', 7);
INSERT INTO films (title, price) VALUES ('Alien III', 15);
INSERT INTO films (title, price) VALUES ('Gladiator', 17);

INSERT INTO films (customer_id, film_id) VALUES (customer1.id, film1.id);
INSERT INTO films (customer_id, film_id) VALUES (customer2.id, film1.id);
INSERT INTO films (customer_id, film_id) VALUES (customer2.id, film2.id);
INSERT INTO films (customer_id, film_id) VALUES (customer3.id, film2.id);
INSERT INTO films (customer_id, film_id) VALUES (customer3.id, film3.id);
INSERT INTO films (customer_id, film_id) VALUES (customer1.id, film2.id);