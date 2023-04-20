DROP DATABASE IF EXISTS dz2; -- Удаляем БД с именем dz2, если она существует
CREATE DATABASE dz2;

USE dz2;
-- 1. Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными
DROP TABLE IF EXISTS sales;
CREATE TABLE sales
(
id INT PRIMARY KEY AUTO_INCREMENT,
order_date DATE NOT NULL,
count_product INT
);

INSERT INTO sales (order_date, count_product)
VALUES
	('2022-01-01',156),
    ('2022-01-02',180),
	('2022-01-03',21),
    ('2022-01-04',124),
    ('2022-01-05',341);
SELECT * FROM sales;
-- 2. Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.
SELECT 
id AS "id заказа",
CASE 
	WHEN count_product <100 THEN "Маленький заказ"
    WHEN count_product BETWEEn 100 and 300 THEN "Средний заказ"
    ELSE "<Большой заказ"
END AS "Тип заказа"
FROM sales;

-- 3. Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE
DROP TABLE IF EXISTS orders;

CREATE TABLE orders
(
id INT PRIMARY KEY AUTO_INCREMENT,
employee_id VARCHAR(45) NOT NULL,
amount DECIMAL DEFAULT 0,
order_status VARCHAR(45) NOT NULL
);

INSERT INTO orders (employee_id,amount, order_status)
VALUES
	('e03',15.00,'OPEN'),
    ('e01',15.50,'OPEN'),
	('e05',100.70,'CLOSED'),
    ('e02',22.18,'OPEN'),
    ('e04',9.50,'CANCELLED');
    
SELECT * FROM orders;

SELECT 
id AS "id заказа",
IF (order_status = "OPEN", "Order is in open state",
	IF (order_status = "CLOSED", "Order is closed", 
		IF (order_status = "CANCELLED","Order is cancelled", "Error")))
AS "full order_status"
FROM orders;
 
   
    