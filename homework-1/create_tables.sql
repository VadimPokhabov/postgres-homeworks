-- SQL-команды для создания таблиц


CREATE TABLE customers
(
	customer_id text PRIMARY KEY,
	company_name varchar(100) NOT NULL,
	contact_name varchar
);


CREATE TABLE employees
(
	employee_id int PRIMARY KEY,
	first_name varchar,
	last_name varchar,
	title varchar,
	birth_date DATE,
	notes varchar
);


CREATE TABLE orders
(
	order_id int PRIMARY KEY,
	customer_id varchar REFERENCES customers(customer_id) NOT NULL,
	employee_id int REFERENCES employees(employee_id) NOT NULL,
	order_date DATE,
	ship_city varchar(10)
);

--Показать содержимое
-- SELECT * FROM customers;
-- SELECT * FROM employees;
-- SELECT * FROM orders;
--
--Удалить содержимое
-- DELETE FROM customers;
-- DELETE FROM employees;
-- DELETE FROM orders;
--
--Код, чтобы удалить все активные подключения к БД
-- SELECT pg_terminate_backend(pg_stat_activity.pid)
-- FROM pg_stat_activity
-- WHERE pg_stat_activity.datname = 'north' -- ← изменить на свое название БД
--   AND pid <> pg_backend_pid();
--
--Создание БД
-- CREATE DATABASE test;
--
--Удаление БД
-- DROP DATABASE test;