-- Урок 3. SQL – выборка данных, сортировка, агрегатные функции.
CREATE SCHEMA databases_sql_homework3;

USE databases_sql_homework3;

-- Создайте таблицу.
DROP TABLE official_salary; -- удалить таблицу.

CREATE TABLE official_salary
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    worker_name VARCHAR(45) NOT NULL,
    surname VARCHAR(45) NOT NULL,
    specialty VARCHAR(45) NOT NULL,
    seniority INT NOT NULL,
    salary INT DEFAULT 0,
    age INT NOT NULL
);
SELECT * FROM official_salary;

INSERT INTO official_salary
(worker_name, surname, specialty, seniority, salary, age)
VALUES
('Вася', 'Васькин', 'начальник', 40, 100000, 60),
('Петя', 'Петькин', 'начальник', 8, 70000, 30),
('Катя', 'Каткина', 'инженер', 2, 70000, 25),
('Саша', 'Сашкин', 'инженер', 12, 50000, 35),
('Иван', 'Иванов', 'рабочий', 40, 30000, 59),
('Петр', 'Петров', 'рабочий', 20, 25000, 40),
('Сидор', 'Сидоров', 'рабочий', 10, 20000, 35),
('Антон', 'Антонов', 'рабочий', 8, 19000, 28),
('Юра', 'Юркин', 'рабочий', 5, 15000, 25),
('Максим', 'Воронин', 'рабочий', 2, 11000, 22),
('Юра', 'Галкин', 'рабочий', 3, 12000, 24),
('Люся', 'Люськина', 'уборщик', 10, 10000, 49);

SELECT * FROM official_salary;

-- 1. Отсортируйте поле “зарплата” (salary) в порядке убывания и возрастания.
SELECT * FROM official_salary
ORDER BY salary; -- сортировка по возрастанию.

SELECT * FROM official_salary
ORDER BY salary DESC; -- сортировка по убыванию.

-- 2. Выведите 5 максимальных зарплат (salary).
SELECT salary
FROM official_salary
ORDER BY salary DESC LIMIT 5;

-- 3. Подсчитать суммарную зарплату(salary) по каждой специальности (post).
SELECT specialty, SUM(salary) AS sum_salary
FROM official_salary GROUP BY specialty;

-- 4. Найти количество сотрудников по специальности “Рабочий” (post) в возрасте от 24 до 42 лет.
 SELECT specialty, COUNT(*) AS specialty_count
 FROM official_salary
 WHERE specialty = 'рабочий' && age > 24 && age < 42;
 
 -- 5. Найти количество специальностей.
 SELECT COUNT(*) AS specialty_count
 FROM official_salary;
 
 -- 6. Вывести специальности, у которых средний возраст сотрудника меньше 44 лет.
 SELECT specialty, age
 FROM official_salary
 WHERE age < 44;
 
 -- 7. Если не ID, то какое поле можно добавить, чтобы использовать его в качестве первичного ключа.
 /*
 В этой таблице в качестве первичного ключа можно использовать surname или создать новый столбец с номером паспорта рабочего.
 */
 DESC official_salary;
 
