Create table If Not Exists weather (Id int, RecordDate date, Temperature int);

insert into Weather (Id, RecordDate, Temperature) values ('1', '2015-01-01', '10');
insert into Weather (Id, RecordDate, Temperature) values ('2', '2015-01-02', '25');
insert into Weather (Id, RecordDate, Temperature) values ('3', '2015-01-03', '20');
insert into Weather (Id, RecordDate, Temperature) values ('4', '2015-01-04', '30');
insert into Weather (Id, RecordDate, Temperature) values ('5', '2015-01-06', '33');
insert into Weather (Id, RecordDate, Temperature) values ('6', '2015-01-07', '26');
insert into Weather (Id, RecordDate, Temperature) values ('7', '2015-01-09', '31');
insert into Weather (Id, RecordDate, Temperature) values ('9', '2015-01-10', '35');

SELECT * FROM weather


/*
Write an SQL query to find all dates' id with higher temperature compared to its previous dates (yesterday).

*/

WITH WEATHER_CTE AS
(
SELECT *,
       LAG(TEMPERATURE,1)OVER(ORDER BY RECORDDATE) AS PREVIOUS_DATE_TEMPERATURE,
	   LAG(RECORDDATE,1)OVER(ORDER BY RECORDDATE) AS PREVIOUS_DAY
FROM WEATHER
)
SELECT ID
FROM WEATHER_CTE
	WHERE TEMPERATURE > PREVIOUS_DATE_TEMPERATURE
	AND RECORDDATE = PREVIOUS_DAY + INTERVAL '1 DAY'

-- Dynamically prepared SQL script which will work even the new records are added with different dates.

