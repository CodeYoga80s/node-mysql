DROP DATABASE IF EXISTS bamazon;

CREATE DATABASE bamazon;

USE bamazon;

CREATE TABLE products(
item_id integer not null auto_increment,
primary key (item_id),
product_name varchar(250) not null,
department_name varchar(250) not null,
price decimal(18,4),
quantity INTEGER(10)
);


USE bamazon;
INSERT INTO products(product_name, department_name, price, quantity)
VALUES ("Soap Bar", "Beauty & Personal Care", 1.99, 50);
USE bamazon;
INSERT INTO products(product_name, department_name, price, quantity)
VALUES ("Shampoo", "Beauty & Personal Care", 4.99, 25);
USE bamazon;
INSERT INTO products(product_name, department_name, price, quantity)
VALUES ("Laundry Detergent", "Health & Household", 11.97, 35);
USE bamazon;
INSERT INTO products(product_name, department_name, price, quantity)
VALUES ("Milk", "Bamazon Fresh", 5.99, 50);
USE bamazon;
INSERT INTO products(product_name, department_name, price, quantity)
VALUES ("Trash Liner", "Home & Kitchen", 20.99, 20);
USE bamazon;
INSERT INTO products(product_name, department_name, price, quantity)
VALUES ("Bread", "Home & Kitchen", 4.99, 50);
USE bamazon;
INSERT INTO products(product_name, department_name, price, quantity)
VALUES ("Vitamin D", "Health", 9.99, 10);
USE bamazon;
INSERT INTO products(product_name, department_name, price, quantity)
VALUES ("Golf Shirt", "Sports & Outdoors",34.99, 5);
USE bamazon;
INSERT INTO products(product_name, department_name, price, quantity)
VALUES ("Socks", "Men's Clothing", 7.99, 15);
USE bamazon;
INSERT INTO products(product_name, department_name, price, quantity)
VALUES ("Salt", "Home & Kitchen", 1.99, 30);

Select *
from products;