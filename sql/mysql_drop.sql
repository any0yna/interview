DROP DATABASE IF EXISTS db_drop;
CREATE DATABASE db_drop;
USE db_drop;
CREATE TABLE test1(
`any_date` date,
`any_time` time,
`any_datetime` datetime
);
CREATE TABLE test2(
`any_date` date,
`any_time` time,
`any_datetime` datetime
);
DROP PROCEDURE IF EXISTS lr_time1;
delimiter $$
CREATE PROCEDURE lr_time1()
BEGIN
    DECLARE n INT DEFAULT 1;
    DECLARE MAX INT DEFAULT 1001;
    WHILE n<MAX DO
        INSERT INTO test1 VALUES (curdate(),curtime(),now());
        set n=n+1;
    END WHILE;
    DROP TABLE test1;
    DROP TABLE test2;
END
$$

delimiter ;
call lr_time1();
