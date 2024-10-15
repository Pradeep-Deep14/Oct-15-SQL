Create table If Not Exists Logs (Id int, Num int);

SELECT * FROM LOGS
insert into Logs (Id, Num) values ('1', '1');
insert into Logs (Id, Num) values ('2', '1');
insert into Logs (Id, Num) values ('3', '1');
insert into Logs (Id, Num) values ('4', '2');
insert into Logs (Id, Num) values ('5', '1');
insert into Logs (Id, Num) values ('6', '2');
insert into Logs (Id, Num) values ('7', '2');


-- Write an SQL query to find all numbers that appear at least three times consecutively.

-- Return the result table in any order.

WITH LOGS_TABLE AS
(SELECT ID,
       NUM,
       LAG(NUM,1)OVER(ORDER BY ID)AS PREVIOUS_NUM,
       LAG(NUM,2)OVER(ORDER BY ID)AS SECOND_PREVIOUS_NUM
FROM LOGS)
SELECT NUM FROM LOGS_TABLE
WHERE NUM=PREVIOUS_NUM
AND PREVIOUS_NUM = SECOND_PREVIOUS_NUM
