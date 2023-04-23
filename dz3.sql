
-- -- 1. Создание БД 
CREATE DATABASE IF NOT EXISTS `dz3`;
-- 2. Выбираем БД для работы
USE dz3;

-- 3. Создание таблицы
DROP TABLE IF EXISTS staff; 
CREATE TABLE staff
(
	id INT PRIMARY KEY AUTO_INCREMENT, -- PRIMARY KEY  = NOT NULL UNUQIE
    firstname VARCHAR(45),
	lastname VARCHAR(45),
    post VARCHAR(45),
    seniority INT,
	salary DECIMAL(8, 2), 
    age INT
);
INSERT staff (firstname, lastname, post, seniority, salary, age)
VALUES
	 ('Вася', 'Петров', 'Начальник', 40, 100000, 60),
	 ('Петр', 'Власов', 'Начальник', 8, 70000, 30),
	 ('Катя', 'Катина', 'Инженер', 2, 70000, 25),
	 ('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
	 ('Иван', 'Петров', 'Рабочий', 40, 30000, 59),
	 ('Петр', 'Петров', 'Рабочий', 20, 55000, 60),
	 ('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
	 ('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
	 ('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
	 ('Максим', 'Петров', 'Рабочий', 2, 11000, 19),
	 ('Юрий', 'Петров', 'Рабочий', 3, 12000, 24),
	 ('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);
 
SELECT *
FROM staff;

-- 1.Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастания
SELECT *
FROM staff
ORDER BY (salary) DESC; --  ASC - по в-ю (исходное значение сортировки) , DESC - по убыванию 

SELECT *
FROM staff
ORDER BY (salary); --  ASC - по в-ю (исходное значение сортировки) , DESC - по убыванию 

SELECT *
FROM staff;

-- 2. Выведите 5 максимальных заработных плат (salary)
SELECT *
FROM staff
ORDER BY (salary) DESC
LIMIT 5;

-- 3. Посчитайте суммарную зарплату (salary) по каждой специальности (роst)

SELECT 
	 post AS "Должность",
	COUNT(salary) AS "Количество сотрудников"
FROM staff
GROUP BY (post);

-- 4. Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно

SELECT 
	 COUNT(salary) AS "Количество сотрудников 'Рабочий' от 24 до 49 лет"
FROM staff
WHERE (age>24)&(age<=49)
GROUP BY post
HAVING post = "Рабочий";

-- 5. Найдите количество специальностей
SELECT  COUNT(DISTINCT post)
FROM staff;

-- 6. Выведите специальности, у которых средний возраст сотрудников меньше 30 лет включительно
SELECT 
	 post  AS "Специальности, у которых средний возраст сотрудников меньше 30 лет",
     AVG(age) AS "Средний возраст"
FROM staff
GROUP BY post
HAVING AVG(age) <=30;




