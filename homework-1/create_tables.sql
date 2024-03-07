-- SQL-команды для создания таблиц


CREATE TABLE customers
(
	customer_id text PRIMARY KEY,
	company_name varchar(100) NOT NULL,
	contact_name text
);


CREATE TABLE employees
(
	employee_id int PRIMARY KEY,
	first_name text,
	last_name text,
	title text,
	birth_date DATE,
	notes text
);


CREATE TABLE orders
(
	order_id int PRIMARY KEY,
	customer_id text REFERENCES customers(customer_id) NOT NULL,
	employee_id int REFERENCES employees(employee_id) NOT NULL,
	order_date DATE,
	ship_city text
);


SELECT * FROM customers_data;
SELECT * FROM employees_data;
SELECT * FROM orders_data