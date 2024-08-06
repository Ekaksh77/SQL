CREATE TABLE Booking_Table (
    Booking_ID VARCHAR(255) PRIMARY KEY,
    Booking_Date DATE,
    User_ID VARCHAR(255),
    Line_of_Business VARCHAR(255)
);

INSERT INTO Booking_Table (Booking_ID, Booking_Date, User_ID, Line_of_Business)
VALUES ('b1', '2022-03-23', 'u1', 'Flight'),
       ('b2', '2022-03-24', 'u2', 'Flight'),
       ('b3', '2022-03-25', 'u1', 'Flight'),
       ('b4', '2022-03-26', 'u4', 'Flight'),
       ('b5', '2022-03-27', 'u1', 'Hotel'),
       ('b6', '2022-03-28', 'u2', 'Hotel'),
       ('b7', '2022-03-29', 'u5', 'Flight'),
       ('b8', '2022-03-30', 'u6', 'Flight'),
       ('b9', '2022-03-31', 'u2', 'Flight'),
       ('b10', '2022-04-01', 'u1', 'Hotel'),
       ('b11', '2022-04-02', 'u4', 'Hotel'),
       ('b12', '2022-04-03', 'u1', 'Hotel'),
       ('b13', '2022-04-04', 'u2', 'Flight'),
       ('b14', '2022-04-05', 'u5', 'Hotel'),
       ('b15', '2022-04-06', 'u6', 'Flight'),
       ('b16', '2022-04-07', 'u4', 'Flight'),
       ('b17', '2022-04-08', 'u2', 'Hotel'),
       ('b18', '2022-04-09', 'u1', 'Flight'),
       ('b19', '2022-04-10', 'u4', 'Flight'),
       ('b20', '2022-04-11', 'u1', 'Hotel');






 CREATE TABLE User_Table (
    User_ID VARCHAR(255) PRIMARY KEY,
    Segment VARCHAR(255)
);

INSERT INTO User_Table (User_ID, Segment)
VALUES ('u1', 'S1'),
       ('u2', 'S1'),
       ('u3', 'S1'),
       ('u4', 'S2'),
       ('u5', 'S2'),
       ('u6', 'S3'),
       ('u7', 'S3'),
       ('u8', 'S3'),
       ('u9', 'S3'),
       ('u10', 'S3');



select *
from Booking_Table

select *
from User_Table



/*1. write a query to find out the users whos first booking in Hotel*/
with T1 as(select User_ID, Booking_Date, Line_of_Business,
Rank() over(Partition by User_ID order by Booking_Date) as Rank_
from Booking_Table
where Line_of_Business = 'Hotel')
select *
from T1
where Rank_ = 1


/*2. write a query to find out the difference between users first booking and last booking*/
select User_ID, min(Booking_Date) as Min_Booking_Date, max(Booking_Date)as Max_Booking_Date, DATEDIFF(DAY,min(Booking_Date), max(Booking_Date)) as Differ
from Booking_Table
group by User_ID



/*
3. write a query to count the number of flight and hotel booking in each of the user segment for the month April.*/
select U.User_ID, U.Segment,B.Booking_Date,
sum(case
when Line_of_Business = 'Flight' then 1
else 0 end) as Count_Flights,
sum(case
when Line_of_Business = 'Hotel' then 1
else 0 end) as Count_Hotels

from Booking_Table B join User_Table U
on B.User_ID = U.User_ID
where MONTH(Booking_Date) = '4'
group by U.User_ID, U.Segment, B.Booking_Date

