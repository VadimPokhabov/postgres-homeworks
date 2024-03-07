"""Скрипт для заполнения данными таблиц в БД Postgres."""
import csv
import psycopg2


def read_csv(csv_file):
    """
    Функция открывает файл и записывает в список
    """
    with open(csv_file, encoding='UTF=8', ) as f:
        reader = csv.reader(f)
        next(reader)
        list_row = []
        for row in reader:
            list_row.append(row)
    return list_row


customer_list = []
customer_rows = read_csv("north_data/customers_data.csv")
for r in list(customer_rows):
    customer_rows_tuple = (str(r[0]), str(r[1]), str(r[2]))
    customer_list.append(customer_rows_tuple)

employee_list = []
employee_rows = read_csv("north_data/employees_data.csv")
for r in list(employee_rows):
    employee_rows_tuple = (int(r[0]), str(r[1]), str(r[2]), r[3], str(r[4]), str(r[5]))
    employee_list.append(employee_rows_tuple)

orders_list = []
order_rows = read_csv("north_data/orders_data.csv")
for r in list(order_rows):
    order_rows_tuple = (int(r[0]), str(r[1]), int(r[2]), str(r[3]), str(r[4]))
    orders_list.append(order_rows_tuple)

conn_params = psycopg2.connect(host="localhost",
                               database="north",
                               user="postgres",
                               password="Poxabov123"
                               )

with conn_params:
    with conn_params.cursor() as cur:
        cur.executemany("INSERT INTO customers VALUES (%s, %s, %s)", customer_list)
        cur.executemany("INSERT INTO employees VALUES (%s, %s, %s, %s, %s, %s)", employee_list)
        cur.executemany("INSERT INTO orders VALUES (%s, %s, %s, %s, %s)", orders_list)


