DROP DATABASE IF EXISTS db_base;
CREATE DATABASE db_base;
USE db_base;
CREATE TABLE tb_time(
`any_date` date,
`any_time` time,
`any_datetime` datetime
);
INSERT INTO tb_time VALUES (curdate(),curtime(),now());
CREATE TABLE test1(
`note` VARCHAR(100),
`price` INT
);
DROP PROCEDURE IF EXISTS lr_time; 
DELIMITER $$
CREATE PROCEDURE lr_time()
BEGIN
    DECLARE n INT DEFAULT 1;
    DECLARE MAX INT DEFAULT 1001;
    WHILE n < MAX DO
        INSERT INTO test1(`note`,`price`) VALUES("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50),("this is one test",50);
        SET n = n + 1;
    END WHILE;
END
$$
 
DELIMITER ;
 
call lr_time();
