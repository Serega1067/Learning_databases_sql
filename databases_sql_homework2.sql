-- Урок 2. SQL – создание объектов, простые запросы выборки
CREATE DATABASE `databases_sql_homework2`;
USE databases_sql_homework2;

-- 1. Используя операторы языка SQL, 
-- создайте таблички "goods" и “sales”. 
-- Заполните их данными
DROP TABLE goods;

CREATE TABLE goods
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name_goods VARCHAR(45) NOT NULL,
    cost_goods INT NOT NULL DEFAULT 0,
    amount_goods INT NOT NULL DEFAULT 0,
    tag VARCHAR(128)
);
SELECT * FROM goods;

TRUNCATE TABLE orders;

INSERT INTO goods
(name_goods, cost_goods, amount_goods)
VALUES
('bricks', 48, 30000),
('pots', 100, 198),
('paint', 359, 30),
('hammer', 250, 23),
('pliers', 290, 35);

SELECT * FROM goods;

DROP TABLE sales;

CREATE TABLE sales
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    goods_id INT,
    goods_sold INT DEFAULT 0,
    tag VARCHAR(128),
    FOREIGN KEY (goods_id) REFERENCES goods (id)
);

SELECT * FROM sales;

TRUNCATE TABLE orders;

INSERT INTO sales
(goods_id, goods_sold)
VALUES
(1, 1000),
(2, 30),
(3, 19),
(4, 15),
(5, 16);

SELECT * FROM sales;

-- 2. Сгруппируйте значений количества в 3 сегмента — меньше 100, 
-- 100-300 и больше 300. - CASE
SELECT name_goods, amount_goods,
CASE
	WHEN amount_goods < 100
		THEN 'Меньше 100'
	WHEN amount_goods > 100 and amount_goods < 300
		THEN 'От 100 до 300'
	ELSE 'Больше 300'
END AS count_goods
FROM goods;

-- 3. Создайте таблицу “orders”, заполните ее значениями. 
-- Покажите “полный” статус заказа, используя оператор CASE
DROP TABLE orders;

CREATE TABLE orders
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    goods_id INT,
    date_order DATE,
    tag VARCHAR(128),
    FOREIGN KEY (goods_id) REFERENCES sales(id)
);

SELECT * FROM orders;

INSERT INTO orders
(date_order)
VALUES
('2022-06-16'),
('2022-06-17'),
('2022-06-18'),
('2022-06-18'),
('2022-06-18');

-- TRUNCATE TABLE orders;

SELECT id, goods_id, date_order, tag,
CASE
	WHEN date_order < '2022-06-18'
		THEN 'выполнен'
	ELSE 'невыполнен'
END AS status_order
FROM orders;

-- 4. Чем NULL отличается от 0?
-- NULL пустая строка, которая не сдержит ни какие данные, а 0 это число.
