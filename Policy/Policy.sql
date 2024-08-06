Create Table Insurance ([Policy ID] varchar(50) not null, [Policy Number] varchar(20))

Insert into Insurance values (125, 'S13456')

select *
from Insurance

select *
from Policy$

INSERT INTO Insurance ([Policy ID], [Policy Number])
VALUES (121, 'S123456'),
       (122, 'S123456'),
       (123, 'S123457'),
       (124, 'S19996'),
       (125, 'S13456');


/* Search how many Policy ID are their who have duplicate Policy Number Count*/

WITH T1 AS (
    SELECT [Policy Number], COUNT([Policy Number]) AS Count_
    FROM Insurance
    GROUP BY [Policy Number]
    HAVING COUNT([Policy Number]) >= 2
),

T2 AS (
    SELECT *
    FROM Insurance
)

SELECT T2.[Policy ID], T1.Count_
FROM T1
LEFT JOIN T2
ON T1.[Policy Number] = T2.[Policy Number];





