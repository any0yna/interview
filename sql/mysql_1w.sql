DROP DATABASE IF EXISTS db_1W;
CREATE DATABASE db_1W;
USE db_1W;
CREATE TABLE test1(
`any_date` date,
`any_time` time,
`any_datetime` datetime
);
DROP PROCEDURE IF EXISTS lr_time1;
delimiter $$
CREATE PROCEDURE lr_time1()
BEGIN
    DECLARE n INT DEFAULT 1;
    DECLARE MAX INT DEFAULT 10001;
    WHILE n<MAX DO
        INSERT INTO test1 VALUES (curdate(),curtime(),now());
        set n=n+1;
    END WHILE;
END
$$

delimiter ;
call lr_time1();
