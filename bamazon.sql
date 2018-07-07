-- Drops the programming_db if it already exists --
DROP DATABASE IF EXISTS bamazonDB;
-- Create a database called programming_db --
CREATE DATABASE bamazonDB;

USE bamazonDB;

CREATE TABLE products(
  -- Creates a numeric column called "id" which will automatically increment its default value as we create new rows. --
  id INTEGER(11) AUTO_INCREMENT NOT NULL,
  product_name VARCHAR(100)NULL,
  department_name VARCHAR(100)NULL,
  price INTEGER (10),
  stock_quantity INTEGER (10),
  PRIMARY KEY (id)
);

-- Creates new rows
INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("ECHO DOT","ECHO & ALEXA", 39.99, 5 );

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("THE INTELLIGENT INVESTOR","BOOKS", 19.40, 8 );

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("UNIVERSAL SKETCH BOOK","ARTS, CRAFTS & SEWING", 16.00, 20 );

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("STAEDTLER PENCIL MARS LUMOGRAPH","ARTS, CRAFTS & SEWING", 19.25, 5 );

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("BIBO 3D PRINTER","INDUSTRIAL & SCIENTIFIC", 1,049.00 , 3 );

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("HICTOP CR-10 3D PRINTER PRUSA","INDUSTRIAL & SCIENTIFIC", 714.70, 7 );

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("LEGO TECHNIC BUCKET WHEEL EXCAVATOR 42055 CONSTRUCTION TOY","TOYS & GAMES", 239.98, 10 );

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("LEGO STYLE COFFE MUGS","HOME & KITCHEN", 16.95, 2 );

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("BLUE PLANET II BLU-RAY","MOVIES & TV", 44.97, 18 );

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("BASKETBALL PLAYER DECAL VINYL STICKER","HOME DECOR", 4.99 , 20 );