DROP DATABASE IF EXISTS bamazonDB;
CREATE database bamazonDB;

USE bamazonDB;

CREATE TABLE products (
  item_id INT NOT NULL AUTO_INCREMENT,
  product_name VARCHAR(100) NULL,
  department_name VARCHAR(100) NULL,
  price DECIMAL(10,2) NULL,
  stock_quantity INT NULL,
  PRIMARY KEY (item_id)
);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Beef Jerky (16 oz.)", "Grocery & Gourmet Food", 18.99, 12);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Hazelnuts (16 oz.)", "Grocery & Gourmet Food", 12.99, 10);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Leather Purse", "Women's Handbags", 49.99, 6);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Leather Wallet", "Men's Acessories", 39.99, 4);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Bookshelf", "Home & Kitchen", 129.99, 3);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Leather Purse", "Home & Kitchen", 119.99, 3);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Sterling Silver Ring", "Jewelry", 39.99, 5);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Gold Ring", "Jewelry", 159.99, 2);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Fairy Dust", "Magic", 139.99, 0);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Weak Health Potion", "Potions", 99.99, 0);