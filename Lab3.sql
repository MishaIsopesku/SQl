CREATE DATABASE IF NOT EXISTS BakingShop;

CREATE TABLE BakingShop.product (
ID INT UNSIGNED NOT NULL AUTO_INCREMENT references bakingshop.order (customer_ID) ON DELETE NO ACTION ON update NO ACTION, 
name VARCHAR(255) NOT NULL,
description TEXT NOT NULL,
stock_keeping_unit VARCHAR(255) NOT NULL,
price DECIMAL(32) NOT NULL,
tags_id SMALLINT UNSIGNED,
inventory_id SMALLINT UNSIGNED,
discount_id SMALLINT UNSIGNED,
created_at TIMESTAMP,
modified_at TIMESTAMP,
deleted_at TIMESTAMP,
PRIMARY KEY (ID)
);

CREATE TABLE BakingShop.product_tags (
ID INT UNSIGNED NOT NULL AUTO_INCREMENT unique references bakingshop.product (tags_ID) ON DELETE NO ACTION ON update NO ACTION, 
name VARCHAR(255) NOT NULL,
created_at TIMESTAMP,
modified_at TIMESTAMP,
deleted_at TIMESTAMP,
PRIMARY KEY (ID)
);

CREATE TABLE BakingShop.product_inventory (
ID INT UNSIGNED NOT NULL AUTO_INCREMENT references bakingshop.product (inventory_ID) ON DELETE NO ACTION ON update NO ACTION, 
quantity SMALLINT UNSIGNED,
PRIMARY KEY (ID)
);

CREATE TABLE BakingShop.product_discount (
ID INT UNSIGNED NOT NULL AUTO_INCREMENT REFERENCES BakingShop.product (discount_ID) ON DELETE NO ACTION ON update NO ACTION, 
name VARCHAR(255) NOT NULL,
description TEXT NOT NULL,
discount_percent DECIMAL,
active BOOLEAN,
created_at TIMESTAMP,
modified_at TIMESTAMP,
deleted_at TIMESTAMP,
PRIMARY KEY (ID)
);

CREATE TABLE BakingShop.USER (
ID INT UNSIGNED NOT NULL AUTO_INCREMENT REFERENCES BakingShop.Order (customer_ID) ON DELETE NO ACTION ON update NO ACTION, 
firstname VARCHAR(255) NOT NULL,
lastname VARCHAR(255) NOT NULL,
password TEXT NOT NULL,
email_adress TEXT NOT NULL,
phone_number TINYINT(24),
created_at TIMESTAMP,
PRIMARY KEY (ID) 
);

CREATE TABLE BakingShop.order (
customer_ID INT UNSIGNED NOT NULL , 
product_ID INT UNSIGNED NOT NULL , 
order_ID INT UNSIGNED NOT NULL AUTO_INCREMENT REFERENCES BakingShop.USER (ID) ON DELETE NO ACTION ON update NO ACTION,
PRIMARY KEY (order_ID) 
);
SHOW INDEX FROM bakingshop.order;
ALTER TABLE BakingShop.order
add CONSTRAINT product_connect FOREIGN KEY (product_ID)
REFERENCES bakingshop.product (ID) ON DELETE NO ACTION ON
UPDATE NO ACTION;

alter TABLE BakingShop.order
DROP FOREIGN KEY product_connect,
DROP INDEX product_connect;
SHOW INDEX FROM bakingshop.order;

ALTER TABLE bakingshop.order
add test2 int;
SHOW CREATE TABLE bakingshop.ORDER;

ALTER TABLE bakingshop.order
drop column test,
MODIFY COLUMN test2 int(22) NULL;
SHOW CREATE TABLE bakingshop.ORDER;

SHOW CREATE TABLE bakingshop.USER;
ALTER TABLE bakingshop.user
MODIFY COLUMN FIRSTNAME CHAR(60) NULL;
SHOW CREATE TABLE bakingshop.USER;

SHOW CREATE TABLE bakingshop.product_inventory;
ALTER TABLE bakingshop.PRODUCT_inventory
MODIFY quantity INT(32) UNSIGNED NOT NULL,
ADD COLUMN versionID TINYINT(8) UNSIGNED NOT NULL
AFTER
quantity,
ADD CONSTRAINT UNIQUE UQ_Message_version
(quantity, versionID);
DESCRIBE bakingshop.product_inventory;

SHOW INDEX FROM bakingshop.order;
ALTER TABLE BakingShop.order
add CONSTRAINT product_connect FOREIGN KEY (product_ID)
REFERENCES bakingshop.product_inventory (quantity) ON DELETE CASCADE;
SHOW INDEX FROM bakingshop.order;