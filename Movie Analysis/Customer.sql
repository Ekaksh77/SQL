/*Q. Write a query to find out 3 Male consucutive seat Number and Gender*/

WITH T1 AS (
    SELECT [Seat Number], Gender
    FROM Movie$
),
T2 AS (
    SELECT [Seat Number], Gender
    FROM Movie$
),
T3 AS (
    SELECT [Seat Number], Gender
    FROM Movie$
)

SELECT T1.[Seat Number], T1.Gender, T2.[Seat Number], T2.Gender , T3.[Seat Number], T3.Gender
FROM T1 JOIN T2 
ON T1.[Seat Number] = T2.[Seat Number] - 1
AND T1.Gender = T2.Gender
JOIN T3 ON T2.[Seat Number] = T3.[Seat Number]-1
AND T2.Gender = T3.Gender

where T1.Gender = 'M'


/*****************************************************************/
create Table Name_1(Cx_Name varchar(50))
insert into Name_1 values ('karan'),('sagar'),('udit'),('max')

select *
from Name_1

/*Q. Change the first letter of Name into Capital letter*/
select *, upper(left(Cx_Name,1))+ SUBSTRING(Cx_Name,2,len(Cx_Name)) as Customer
from Name_1

select *, UPPER(LEFT(Cx_Name,1)) + SUBSTRING(Cx_Name,2, len(Cx_Name)) as CXName
from Name_1


select *, UPPER(LEFT(Cx_Name,1))+ SUBSTRING(Cx_Name,2,len(Cx_Name)) as Nameeee
from Name_1