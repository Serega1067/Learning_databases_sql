-- Урок 6. SQL – Транзакции. Временные таблицы, управляющие конструкции, циклы.
-- 1. Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds'.
CREATE SCHEMA databases_sql_homework6;

USE databases_sql_homework6;

DROP TABLE seconds;

CREATE TABLE seconds
(       
	id INT PRIMARY KEY AUTO_INCREMENT, 
	sec INT 
);

INSERT INTO seconds (sec) VALUES
(123456),
(582949),
(87174),
(9),
(184);

SELECT * FROM seconds;

SET @num_sec := 123456;

DROP FUNCTION day_time;

DELIMITER &&
CREATE FUNCTION day_time(v INT)
RETURNS CHAR(45)
DETERMINISTIC
BEGIN
	DECLARE d, h, m, s DECIMAL;
	set d = cast(v div 60 div 60 div 24 AS DECIMAL);
	set h = cast(mod(v div 60 div 60, 24) AS DECIMAL);
	set m = cast(mod(v div 60, 60) AS DECIMAL);
	set s = cast(mod(v, 60) AS DECIMAL);
    RETURN CONCAT(d, ' days ', h, ' hours ', m, ' minutes ', s, ' seconds');
END &&

SELECT day_time(@num_sec) AS 'day and time';

SELECT day_time(sec) AS 'day and time' FROM seconds;

-- 2. Выведите только четные числа от 1 до 10.
-- Пример: 2,4,6,8,10
DROP FUNCTION even_numbers;

DELIMITER //
CREATE FUNCTION even_numbers (n INT)
RETURNS CHAR(128)
DETERMINISTIC
BEGIN
	DECLARE result CHAR(128) DEFAULT '';
    WHILE n > 0 DO
		IF (mod(n, 2) = 0) THEN
			SET result = CONCAT(n, result);
		END IF;
        SET n = n - 1;
        IF (n > 1 and mod(n, 2) != 0) THEN
			SET result = CONCAT(',', result);
		END IF;
	END WHILE;
	RETURN result;
END
//

SELECT even_numbers(10);
