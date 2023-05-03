
DROP DATABASE IF EXISTs dz6; 
CREATE DATABASE IF NOT EXISTS dz6; 

USE dz6;

-- 1.Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
--   Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

DROP FUNCTION IF EXISTS get_time;
DELIMITER //
CREATE FUNCTION get_time(sec INT)
RETURNS VARCHAR(45)
DETERMINISTIC
BEGIN
	DECLARE result VARCHAR(50)  DEFAULT "";
    SET result =  concat(result, sec MOD 60, " seconds");
	SET sec = (sec - sec MOD 60)/60;
	SET result =  concat(sec MOD 60, " minutes, ", result);
    SET sec = (sec - sec MOD 60)/60;
	SET result =  concat(sec MOD 24, " hours, ", result);
    SET sec = (sec - sec MOD 24)/24;
    SET result =  concat(sec , " days, ", result); 
    return (result);
END//
DELIMITER ;
SELECT get_time(123456) AS "Количество дней, часов, минут";

-- 2. Выведите только четные числа от 1 до 10.
--    Пример: 2,4,6,8,10
DROP FUNCTION IF EXISTS print_even;
DELIMITER //
CREATE FUNCTION print_even(n INT)
RETURNS VARCHAR(45)
DETERMINISTIC
BEGIN
	DECLARE result VARCHAR(50)  DEFAULT "";
    DECLARE i INT DEFAULT 0;
    WHILE n MOD 2 != 0 DO
		SET n=n-1;
    END WHILE;
	WHILE i< n-2 DO
		SET i = i+2;
		SET result = concat(result,i, ", ");
    END WHILE; 
    WHILE n > 1 DO
		SET result = concat(result,i+2);
        SET n = 0;
    END WHILE;    
    return (result);
END//
DELIMITER ;
SELECT print_even(10) AS "Четные числа";

