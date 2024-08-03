select *
from Orders$

/*1. create table employee(EMP_Name varchar(100), Department varchar(50), Salary int)*/
create table Employee (Emp_Name Varchar(100), Department Varchar(50), Salary int)

select *
from Employee

/*2. insert into employee values('Shyam', 'Analytics',5000),('John','Ops',2000),('Max','Sales','6500')*/
insert into Employee values('Shyam', 'Analytics',5000),('John','Ops',2000),('Max','Sales','6500')

/*3. Select All*/
select *
from Employee

/*4. select EMP_Name, salary from employee*/
select Emp_Name, Salary
from Employee

/*5. select Emp_name, department */
select Emp_Name, Department
from Employee

/*6. search Department = 'OPS'*/
select *
from Employee
where Department = 'Ops'

/*7. Search Salary = 2000*/
select *
from Employee
where Salary = 2000

/*8. Search Salary >2000*/
select *
from Employee
where Salary>2000

/*9. Search Salary <= 2000*/
select *
from Employee
where Salary<=2000

/*10. Update Function: Use to update the current data*/
select * 
from Employee

update Employee
set Emp_Name = 'Raam' where Emp_Name = 'Shyam'

update Employee
set Salary = 15000 where Salary = 5000

/**********************************************Assignment ********************************************/
/*
1. All the details from table from California state*/

select *
from Orders$
where State = 'California'

/*
2. All the profit from table for Texas state*/
select Profit
from Orders$
where State = 'Texas'

/*3. All the product from California state*/
select [Product Name]
from Orders$
where state = 'California'

/*4. all the sales from table more than 2000*/
select Sales
from Orders$
where Sales>2000


/*********************************************************************Class 2****************************************************************/
/*Q. Search Order Date, Customer Name and their Sales and profit for those Customer where Sales greater than 2000*/

select [Order Date], [Customer Name], Sales, Profit
from Orders$
where Sales>2000


/*Q. Search Customer, where Sales more than 3000 and profit more than 0,  Product Name, Sales and their profit*/
select [Customer Name], [Product Name], Sales, Profit
from Orders$
where Sales>3000 and Profit>0

/*Q. Search Customer name where name starts with A*/
select [Customer Name]
from Orders$
where [Customer Name] like 'A%'

/*Q.  How to give alias name to Columns*/
select [Customer Name] as CX
from Orders$

/*Q. Search the Customer from Texas state with their sales and need to see Business Instead sales column*/
select [Customer Name], Sales as Business
from Orders$
where state = 'Texas'


/*Q. Search Segment wise Sales for those CX who are from California state and their Sales Should be greater than 2000 and profit also greater 50*/
select Segment, Sales 
from Orders$
where State = 'California' and Sales >2000 and Profit>50

/*
Q. Search Customer and their state and region, product who purchase apple products*/
select [Customer Name], State, Region, [Product Name]
from Orders$
where [Product Name] like '%Apple%'

/*Q. How to find the unique Names.*/
select distinct [Customer Name]
from Orders$

/*Q. Want to see total Order ID and then unique Order ID*/
select Order_ID
from Orders$

select distinct Order_ID
from Orders$

/*Q. How many types of ship mode are?*/
select distinct [Ship Mode]
from Orders$

/*Q. How many types of Sub Categories?*/
select distinct [Sub-Category]
from Orders$

/*Q. Search for the sub categories , which sales Lies between 2000 to 3000*/
select [Sub-Category], Sales
from Orders$
where Sales between 2000 and 3000

/*Q. want to see, category, sub category, and their ship mode wise quantity and sales for those customers where quantity is more than 3*/
select Category, [Sub-Category], [Ship Mode], Quantity, Sales
from Orders$
where Quantity>3


/*Q. Show the Total Sales by Sum function*/
select sum(sales) as Total_Sales
from Orders$

/*
Q. Total Sales, Total Profit, Total Quantity , Total Discount*/
select sum(Sales) as Total_Sale, sum(Profit) as Total_Profit, count(Quantity) as Total_Quantity, sum(Discount) as Total_Discount
from Orders$

/*Q. Total number of Order ID*/
select count(Order_ID) as Total_Number_OrderID
from Orders$


/**************************************************************Assignment**************************************/
/*1. want to see the unique Customer Count*/
select count(distinct [Customer ID]) as Number_of_Customer
from Orders$

/*2. Want to see the unique order ID count*/
select count(distinct Order_ID) as Total_Count_OrderID
from Orders$

/*3. want to sale, total customer, total product*/
select sum(Sales) as Total_Sale, count(distinct [Customer ID]) as Customers, count(distinct [Product Name]) as Products
from Orders$


/*4. want to see total sales, total profit and total quantity for California state*/
select sum(Sales) as Total_Sale, sum(Profit) as Total_Profit, sum(Quantity) as Total_Quantity
from Orders$
where state = 'California'


/*5. want to see those category wise sales where sales more than 3000 or profit more than 2000*/
select Category, Sales, Profit
from Orders$
where Sales>3000 or Profit>2000

/*6. want to see total number of cities and total number of unique cities count*/
select count(distinct City) as Total_Unique_Cities, count(City) as Total_City
from Orders$

/*****************************************************************Class 3***********************************************************************/
/*Q. Want to see the Sale and Profit for the Sub Category Supplies, Storage or Phones*/

select [Sub-Category], Sales, Profit
from Orders$
where [Sub-Category] in ('Supplies', 'Storage','Phones')

/*Q. I want to see sub category wise the sales and profit for those customers where subcategory as storage, chairs, however their sales should be greater than 100 and profit should be greater than 9*/
select [Sub-Category], Sales, Profit
from Orders$
where [Sub-Category] in ('Storage','Chairs') and Sales>100 and Profit>9

/*Q. Shipmode wise Total Sales, Total Profit, Total Quantity*/
select [Ship Mode], sum(Sales) as Total_Sales, sum(Profit) as Total_Profit, sum(Quantity) as Total_Quantity
from Orders$
group by [Ship Mode]

/*Q. I want to see the count of customer with city and Region wise for those customer where subcategory are, supplies, phones, chairs*/
select Region, City, count([Customer Name]) as Number_of_Customers
from Orders$
where [Sub-Category] in ('Supplies','Phones','Chairs')
group by Region, City

/*Q. Want to see the Category wise Sales for furniture, office supplies however their sales should be greater 500 and profit >100 and quantity more than 1*/
select Category, Sales, Profit, Quantity
from Orders$
where Category in ('Furniture','office supplies') and Sales>500 and Profit>100 and Quantity>1

/*Q. I want to see the total sales, total profit for city wise where total sales>50000*/
select City, sum(Sales) as Total_Sale, sum(profit) as Total_Profit
from Orders$
group by City
having sum(Sales)>50000

/*
Q. want to see product id of those product where product name more than 1*/
select [Product ID], count([Product Name]) as Products
from Orders$
group by [Product ID]
having count([Product Name])>1


/*************************************Assignment**********************************/
/*1. want to see those cities where they have more 1 than state*/
select City, count(State) as Number_of_States
from Orders$
group by City
having count(state)>1

/*2. want to see the subcategory wise total sale where total sale more than 10000 however subcategory should be chairs, table, supplies, storage, art*/
select [Sub-Category], sum(sales) as Total_Sale
from Orders$
where [Sub-Category] in ('Chairs','Table','Supplies','Storage','art')
group by [Sub-Category]
having sum(Sales)>10000

/*3. want to see the ship mode wise sales and profit where state starts with A AND city name having 'H' on their name*/
select [Ship Mode], Sales, Profit
from Orders$
where state like 'A%' and City like '%h%'

/*4. want to see total sales, total profit, total quantity, total discount for those customer whose sales >2000 and profit less than > 50*/
select [Customer Name],sum(Sales) as Total_Sale, sum(Profit) as Total_Profit, sum(Quantity) as Total_Quantity, sum(discount) as Total_Discount
from Orders$
group by [Customer Name]
having sum(Sales)>2000 and sum(Profit)<50


/*********************************************************************Class 4*****************************************************************************/
/*Q. I want to see the customer name and their sales whose name with A and Name starts with B*/

select [Customer Name], sum(Sales) as Sales
from Orders$
where [Customer Name] like ('%a%') and [Customer Name] like ('B%')
group by [Customer Name]

/*Q. Want to see category wise sales, excluse office supplies*/
select Category, Sales
from Orders$
where Category not in ('Office Supplies')

/*Q. want to see category and sub category wise total sales and total profit where total sales<20000; AND exclude supplies storage, storage, phones, fasteners*/
select Category, [Sub-Category], sum(Sales) Sale, sum(Profit) Profit
from Orders$ 
where [Sub-Category] not in ('Supplies Storage','Storage','Phones','Fasteners')
group by Category, [Sub-Category]
having Sum(Sales)<20000


/*Q. want go see the state name in asc order however kindly exclude California*/
select distinct State
from Orders$ 
where State not in ('california')
order by State 

/*Q. want to see top 10 highest sales with customer name and product*/
select Top 10 [Customer Name], [Product Name], sum(Sales) Sale
from Orders$
group by [Customer Name], [Product Name]
order by sum(Sales) desc

/*Q. want to see top 3 state in term of total business*/
select Top 3 State, Sum(Sales) Sale
from Orders$
group by State
order by sum(sales) desc


/*Q. Kindly show me the top 5 highest sales state and their total count of product however please exclude furniture category*/
select Top 5 State, sum(Sales) Sale, count([Product Name]) Numbers
from Orders$
where Category not in ('Furniture')
group by State
order by Sum(Sales) desc

/****************************************Assignment*************************************/
/*1. want to see average sales and average profit for those state who's average sales greater than 300*/
select state, avg(sales) as avg_sale, avg(Profit) avg_profit
from Orders$
group by State
having AVG(Sales)>300

/*2. wan to see the regions wise total sales, total profit where sales>3000 and profit >500 and exclude subcategory (Envelopes, Binder, Labels, Furnishings, Accessories)
*/
select Region, [Sub-Category], sum(Sales), sum(Profit)
from Orders$
where [Sub-Category] not in ('Envelopes', 'Binder', 'Labels', 'Furnishings', 'Accessories')
having sum(Sales) >300 and sum(Profit)>500

/*3. Write a query to find out the customer and their all values, whose sales greater than the average sales.*/
select [Customer Name], sum(Sales) Total_Sale, AVG(Sales) avg_sale
from Orders$
group by [Customer Name]
having AVG(Sales)<sum(Sales)

/*4. Kindly show me the total sales of 2015 and 2016*/
select YEAR([Order Date]) as Year, SUM(Sales) as Sale
from Orders$
where YEAR([Order Date]) in ('2015', '2016')
group by [Order Date]

/*5. write a query to find out the customer, subcategory, product who's place their order between April to next year April month*/
select [Customer Name], [Sub-Category], [Product Name], cast([Order Date] as date) as Order_Date
from Orders$
where [Order Date]> '2014-04-01' and [Order Date]< '2015-03-31'


select [Order Date]
from Orders$


/*******************************************************************Class 5**********************************************************************************/
/*1. Cast Function*/
select cast([Order Date] as date)
from Orders$

select CAST([Order Date] as datetime)
from Orders$

/****************2. Year Function**********************/
select distinct YEAR([Order Date]) as Year
from Orders$

/****************3. Getdate function*******************/
select GETDATE()
from Orders$

/*******************4. DatePart function**************/
select DATEPART(MONTH, [Order Date])
from Orders$

select DATEPART(DAY, [Order Date])
from Orders$

/******************5. Datename function*******************/
select DATENAME(WEEKDAY, [Order Date]) as Weekdays
from Orders$

select DATENAME(MONTH, [Order Date]) as Month
from Orders$

select DATENAME(HOUR, [Order Date]) as Hour
from Orders$


/************************6. Datediff function*******************/
SELECT DATEDIFF(DAY,'2015-01-31', '2016-01-01') AS DateDifference
from Orders$


/*******************Q. want to see the day difference between order date and ship date ***************/
select cast([Order Date] as date) as Order_Date, cast([Ship Date] as date) as Ship_Date, DATEDIFF(DAY, [Order Date],[Ship Date]) as Datedifference
from Orders$


/*Q want to see the customer name and discount who placed the order in furniture category and availed the discount between 10% to 15%*/
select [Customer Name], Discount
from Orders$
where Category in ('Furniture') and Discount between 0.1 and 0.15


/* how to write query inside query*/

select format(AVG(Sales),'0') as Avg_Sale
from Orders$

select Sales
from Orders$
where Sales>(select FORMAT(AVG(Sales),'0') from Orders$)

/*Q. second highest Sales*/
select Top 1 Sales
from Orders$
where Sales<(select Top 1 Sales
from Orders$
order by Sales desc)
order by Sales desc


/*Another Method*/
select Top 1 Sales
from Orders$
where Sales<(select MAX(Sales)
from Orders$)
order by Sales desc

/*Q. Show me the 5th highest Sales*/
select Top 1 Sales
from (select Top 5 Sales
from Orders$
order by Sales desc) Result
order by Sales


/**********************************Assignment***************************/
/*Q. How to bring Rupees Symbol with Sales*/
SELECT '₹' + CAST(sales AS VARCHAR) AS sale_with_symbol
FROM Orders$


/*Q. want to see those Customer Name, Sales, Profit where their Sales more than avg Sales, however i want to see the avg sales on each of the rows*/
select [Customer Name], Sales, Profit
from Orders$
where Sales >(select Avg(Sales)
from Orders$)


/*
2. if i add 45 days with shipdate then what will be the shipdate*/
select cast([Ship Date] as date) CD, cast(DATEADD(DAY,45, [Ship Date]) as date) as Added_Date
from Orders$

/*3. want to see all the details for those customers, whose sales more than total profit*/
select [Customer Name], sum(Sales)
from Orders$
group by [Customer Name]
having sum(Sales)> (select sum(Profit) from Orders$)



/****************************************************************Class 6**********************************************************/
/*Q. Want to see Customer and Category wise Profit and where  is it loss or Profit*/
select [Customer Name], Category, Profit,
case
when Profit>0 then 'Profit'
else 'Loss' end as Remark
from Orders$

/*Q. I want to see Customer, Category wise Sales, if Category is Furniture and its Subcategory is tables then take 5% of its Sales, else as it is*/
select [Customer Name], Category, [Sub-Category],Sales,
case
when Category = ('Furniture') and [Sub-Category] = ('Tables') then ((0.05*Sales)+Sales) 
else Sales end as New_Sales
from Orders$

/*Q. I want to see state and city wise sales and profit, if cities are Houston and Dallas then take 5% of Sales and 2% of Profit. If City 'El Paso' then 10% of his Sales, else Sales*/*/
select state, City, Sales, Profit,
case
when city in ('Houston','Dallas') then (0.05*Sales)
when City = ('El Paso') then (Sales*0.1)
else Sales  end as New_Sale,
case
when city in ('Houston','Dallas') then (0.02*Profit)
else Profit end as New_Profit
from Orders$

/*Q. I want to see ship mode wise profit and loss, however kindly exclude standard class and second class also change the name first class as superfast and same day as today*/
select [Ship Mode], Profit,
case
when [Ship Mode] = ('Standard Class') then 'Second Class'
when [Ship Mode] = ('First Class') then 'SuperFast'
when [Ship Mode] = ('Same Day') then 'Today'
else [Ship Mode] end as New_Class
from Orders$

/*Q. How to store values in Variable by using 'INTO' ------its a temporary table*/
select State, City into Ekaksh
from Orders$

select *
from Ekaksh



/************************************Assignment************************************/
/*1. Want to the ship mode wise Sales,however if ship mode is Same Day or Second Class then Take their total Count, else not required the count*/
select [Ship Mode], sum(Sales) Total_Sale,
case
when [Ship Mode] in ('Same Day','Second Class') then count([Ship Mode])
else '' end as New_Mode
from Orders$
group by [Ship Mode]

/*2. i want to see the state wise total sales, however if the city Coral Springs, Baltimore, Middletown, Aberdeen, Champaign, Reading , Boynton beach then take their 15% of total Sales*/
select State,city, sum(Sales) Sale,
case
when city in ('Coral Springs', 'Baltimore', 'Middletown', 'Aberdeen', 'Champaign', 'Reading' , 'Boynton beach') then (0.15*sum(Sales))
else '' end as New_Price
from Orders$
group by State , City

/*******Another way*************/
SELECT State, 
       SUM(Sales) AS Sale, 
       SUM(CASE
           WHEN city IN ('Coral Springs', 'Baltimore', 'Middletown', 'Aberdeen', 'Champaign', 'Reading', 'Boynton Beach') THEN 0.15 * Sales
           ELSE 0 END) AS New_Price
FROM Orders$
GROUP BY State;


/*
3. i want to see how many customer names are their who have 'A','E','I'.*/
select [Customer Name]
from Orders$
where [Customer Name] like ('%A%') or [Customer Name] like ('%E%') or [Customer Name] like ('%I%')

select
sum(case
when [Customer Name] like ('%a%') or [Customer Name] like ('%e%') or [Customer Name] like ('%i%') then 1
else 0 end ) as Counts
from Orders$
from Orders$


/********************************************Class 7*********************************************/
/*Q. I want to see order date, ship date, day difference between order date and ship date, if my ship date and order date difference<2 then its super fast, if date difference<5 is medium , else slow delivery.*/
select [Order Date], [Ship Date], DATEDIFF(DAY, [Order Date], [Ship Date]),
case
when DATEDIFF(DAY, [Order Date], [Ship Date]) >5 then 'Medium'
when DATEDIFF(DAY, [Order Date], [Ship Date]) >2 then 'Super Fast'
else 'Super Slow' end as Remark

from Orders$


/*Q. want to see Customer wise Profit, if my Profit is less than 0 then Loss, if my profit is less 100 Profit started, if my Profit less than 500 then very good profit, or else super profit.*/
select [Customer Name], Profit,
case
when Profit<500 then 'Very Good'
when Profit<100 then 'Profit'
when Profit <0 then 'Loss'
else 'Super Profit' end as Remark
from Orders$

/****************WITH Function****************************/
/*Q. Nth Highest Sales, that should be 11th*/
with T1 as(select Top 11 Sales
from Orders$
order by Sales desc)
select Top 1 Sales
from T1

/*Q. Find out the Second highest Sales*/
with T1 as (select Top 2 Sales as SALE
from Orders$
order by Sales desc)
select Top 1 SALE
from T1
order by SALE

/*Q. I want to see order Date, Ship date, Day difference between order date and ship date. If my ship date and order date difference <2 then its super fast. if date difference < 5 is medium else Slow delivery, then please show me the total number of slow delivery.*/
with T1 as(select cast([Order Date] as date) Order_Date, cast([Ship Date] as date) Ship_Date, DATEDIFF(DAY, [Order Date], [Ship Date]) as Date_Diff,
case
when DATEDIFF(DAY, [Order Date], [Ship Date])>5 then 'Medium'
when DATEDIFF(DAY, [Order Date], [Ship Date]) > 2 then 'Super Fast'
else 'Slow Delivery' end as Remark

from Orders$)
select 
sum(case
when Remark = ('Slow Delivery') then 1
else 0 end) as Count
from T1




/*********************************************************************Class 8****************************************************************************/
-- Create BookingTable
CREATE TABLE BookingTable (
    BookingID INT PRIMARY KEY,
    BookingDate DATE,
    UserID INT,
    LineOfBusiness VARCHAR(10) CHECK (LineOfBusiness IN ('Flight', 'Hotel'))
);
select * from BookingTable


-- Insert values into BookingTable
INSERT INTO BookingTable (BookingID, BookingDate, UserID, LineOfBusiness) VALUES
(101, '2024-01-01', 1, 'Flight'),
(102, '2024-01-02', 2, 'Hotel'),
(103, '2024-01-03', 3, 'Flight'),
(104, '2024-01-04', 4, 'Hotel'),
(105, '2024-01-05', 5, 'Flight'),
(106, '2024-01-06', 6, 'Hotel'),
(107, '2024-01-07', 7, 'Flight'),
(108, '2024-01-08', 8, 'Hotel'),
(109, '2024-01-09', 9, 'Flight'),
(110, '2024-01-10', 10, 'Hotel'),
(111, '2024-01-11', 10, 'Flight'),
(112, '2024-01-12', 9, 'Hotel'),
(113, '2024-01-13', 8, 'Flight'),
(114, '2024-01-14', 7, 'Hotel'),
(115, '2024-01-15', 6, 'Flight'),
(116, '2024-01-16', 5, 'Hotel'),
(117, '2024-01-17', 4, 'Flight'),
(118, '2024-01-18', 3, 'Hotel'),
(119, '2024-01-19', 2, 'Flight'),
(120, '2024-01-20', 1, 'Hotel');

select * from BookingTable

-- Create UserTable
CREATE TABLE UserTable (
    UserID INT PRIMARY KEY,
    Segment VARCHAR(50)
);

-- Insert values into UserTable
INSERT INTO UserTable (UserID, Segment) VALUES
(1, 'SegmentA'),
(2, 'SegmentA'),
(3, 'SegmentA'),
(4, 'SegmentB'),
(5, 'SegmentB'),
(6, 'SegmentC'),
(7, 'SegmentC'),
(8, 'SegmentC'),
(9, 'SegmentC'),
(10, 'SegmentB');

select * from UserTable
select * from BookingTable

/*1. write a query to calculate the days first booking and last booking of each user*/
select UserID, min(BookingDate) as First_Booking, max(BookingDate) as Last_Booking, DATEDIFF(DAY,min(BookingDate),max(BookingDate))as Date_Diff
from BookingTable
group by UserID


/*2. write a query to count the number of flight booking and hotels booking for each user for year 2024*/
select sum(
case
when LineOfBusiness = ('Flight') then 1
else 0 end ) as Flight_Count, sum(
case 
when LineOfBusiness = ('Hotel') then 1
else 0 end) as Hotel_Count
from BookingTable


/*3. i want to see which shipping option most of the customer preferred to be chosen and what is avg time delivery for all the classes.*/

With T1 as(select sum(
case
when LineOfBusiness = ('Flight') then 1
else 0 end ) as Flight_Count, sum(
case 
when LineOfBusiness = ('Hotel') then 1
else 0 end) as Hotel_Count, 
from BookingTable)

select Flight_Count, Hotel_Count,
case
when Flight_Count>Hotel_Count then 'Number of Flight Shipment is Bigger'
when Flight_Count<Hotel_Count then 'Number of Hotel Shipment is Bigger'
else 'Both are equal' end as Comparision
from T1


/*****************6. JOINS : a. Left Join , b. Inner Join, c. Right Join, d. Full Join*******************/
create table emp(EMP_ID varchar(20), emp_Department varchar(20))
insert into emp values('121','HR'),('122','OPS'),('123','Analytics')



create table empsal (EMP_ID varchar(20), Salary int)
insert into empsal values('121',1000),('122',2000),('123',3000),('123',3000)

select *
from emp

select * from empsal


/*Left Join*/
select emp.*, empsal.Salary
from emp left join empsal 
on emp.EMP_ID = empsal.EMP_ID


/* Inner Join*/
select emp.*, empsal.Salary
from emp join empsal
on emp.EMP_ID = empsal.EMP_ID

/*Right Join*/
select emp.emp_Department, emp.*
from emp right join empsal
on emp.EMP_ID = empsal.EMP_ID

/*Full Join*/

select emp.*, empsal.*
from emp full join empsal
on emp.EMP_ID = empsal.EMP_ID


/*1. want to see the total sales of return item and category wise*/
select R.[Order ID],O.Category, Sales
from Orders$ O Join Returns$ R
on O.Order_ID = R.[Order ID]


/**********************************************Assignment****************************/

/*1. View the total sales of returned items categorized by item category */
select R.[Order ID], O.Category, sum(Sales)
from Orders$ O join Returns$ R
on O.Order_ID = R.[Order ID]
group by R.[Order ID], O.Category


/*
2. want to see count of productid from return table segment wise*/
select O.Segment, count(O.[Product ID]) as Count
from Orders$ O right join Returns$ R
on O.Order_ID = R.[Order ID]
group by O.Segment

/*3. want to see the total sales, avg sales and total profit from return item.*/
select R.[Order ID], sum(Sales) Sale, avg(Sales) Avg_Sale, sum(Profit) Profit
from Orders$ O join Returns$ R
on O.Order_ID = R.[Order ID]
group by R.[Order ID]



select distinct * into #temp
from Orders$

select * from #temp



/****************************************************************************Class 9*************************************************************************/
create Table Policy1 (PolicyID varchar(20) primary key, Policynumber varchar(20))

insert into Policy1 values('121','SD234'),('123','SP442'),('124','SA221'),('125','SA331'),('126','SA331'),('127','PD1111'),('128','PD223'),('129','PD223'),('130','SD234')

select * from Policy1


/*Q. I want to see how many duplicate policy number are there who has different policy ID ,need the count with those policy ID.*/

WITH T1 AS (
    SELECT Policynumber, COUNT(Policynumber) AS Counting
    FROM Policy1
    GROUP BY Policynumber
    HAVING COUNT(Policynumber) > 1
),

T2 AS (
    SELECT PolicyID, Policynumber
    FROM Policy1
)

SELECT T2.PolicyID, T1.Policynumber, T1.Counting
FROM T2
JOIN T1
ON T1.Policynumber = T2.Policynumber;



/*Q. I want to see the year of return order ID and their year wise Loss.*/

select R.[Order ID], year(O.[Order Date]) as Year_, 
case
when O.Profit<0 then Profit
else '' end as Remark
from Returns$ R join Orders$ O
on R.[Order ID] = O.Order_ID


/************another approach************/
with T1 as(select [Order_ID], Profit, year([Order Date]) as Year_
from Orders$
where Profit<0),


T2 as(select [Order ID]
from Returns$)

select T2.[Order ID], T1.Profit, T1.Year_
from T1 inner join T2
on T2.[Order ID] = T1.[Order_ID]


/*Count of Customer who has return the their orders*/

with T1 as (select R.[Order ID], O.[Customer Name] as Customer_Count
from Returns$ R join Orders$ O
on R.[Order ID] = O.Order_ID)

select count(distinct Customer_Count) as Numbers
from T1



/****************************************************Class 10***********************************************************/
 SELECT TOP (1000) [Emp_ID]
      ,[Emp_Name]
      ,[Salary]
      ,[Manager_ID]
  FROM [Revision_Database].[dbo].[Sheet1$]


  select *
  from sheet1$

  
  /* Who is the Manager of Employee**/
  select E.Emp_name as Emp_Name, M.Emp_name as Manager_Name
  from sheet1$ E join sheet1$ M
  on E.Manager_ID = M.Emp_ID


    /*2. I want to see Salary of Emp and Salary of Manager*/

	select E.Emp_Name as Emp_Name, E.Salary, M.Emp_Name as Manager_Name, M.Salary
    from sheet1$ E join sheet1$ M
    on E.Manager_ID = M.Emp_ID




Union /******Call Union***/

  select * from Emp2
  Union
  select * from Emp1


    /*****Call Union all****/
	  
  select * from Emp1

  Union all  

  select * from Emp2

    *******************************************
     insert into Emp2 values('126', '',5000)

	 **************************************
	 select *
	 from emp2

	 	 **************************************

	 select * from Emp1
	 Union
	 select * from Emp2

	  *****************************

	 
	 select * from Emp1
	 Union all
	 select * from Emp2



	 	/*********We try to add one more coloumn in one table and try union with both table and let see the result*********/
	alter table Emp2 add department varchar(10)

	select * from Emp2

	******************
	Select * from Emp1
	union /********This time it will throw error because of unequal coloum*******/
	Select * from Emp2

	

	/******************************************************************STORE PROCEDURE********************************************************************/
	Create Procedure SPStore
	as begin

	select Category, sum(Sales) as Total_Sales from Orders$
	group by Category
	end

	exec SPStore


	/************************************************************************************Class 11 *************************************************/
	/* how to see the Running Order*/

	/***Date Wise***/
	select cast([Order Date] as date) as Date, Sales,
sum(Sales) over(order by [order date]) as Running_Total
from Orders$


/***Sale wise***/
select cast([Order Date] as date) as Date, Sales,
sum(Sales) over(Order by Sales) as Running_Total
from Orders$


/*****Other way***********/

with T1 as(select cast([Order Date] as date) as Date, sum(Sales) as Sale
from Orders$
group by [Order Date])

select *, sum(Sale) over(order by [Date]) as Running_Total
from T1


/* Partition year wise : It will show the Total Sale from the begining of new year*/
/* Partion Date wise and Add Sales wise*/
select CAST([Order Date] as date) as Date,  Sales, 
sum(Sales) over(Partition by [Order Date] order by Sales) as Running_Total
from Orders$

/* Partition Date wise and Order Date wise*/
select cast([Order Date] as date) as Date,  Sales,
sum(Sales) over(Partition by [Order Date] order by [Order Date]) as Running_Total
from Orders$



/* Partition by Customer ID*/
with T1 as(select [Customer ID], Sales
from Orders$
)

select *, sum(Sales) over (Partition by [Customer ID]  order by Sales) as Running_Total
from T1



/* Parition by Customer Name*/
select [Customer Name], Sales, 
sum(Sales) over (Partition by [Customer Name] order by Sales) as Running_Total
from Orders$



/***********Unbounded Preceding***************/
with T1 as(select cast([Order Date] as date) as Date, sum(Sales) as Sale
from Orders$
group by [Order Date])

select *, sum(sale) over (order by Date rows between unbounded preceding and current row) as Running_Total
from T1


/************ 1 Preceding************/
with T1 as (select cast([Order Date] as date) as Date, sum(Sales) as Sale
from Orders$
group by [Order Date])

select *, sum(Sale) over (order by Date rows between 1 preceding and current row) as Running_Total
from T1




/******Customer wise Running average*******/
with T1 as(select [Customer Name],cast([Order Date] as Date)as Date, Sales
from Orders$)

select *, AVG(Sales) over (Partition by [Customer Name] order by Sales)  as Running_Total
from T1


/********I want see the last day sale simantaniusly on another row*/
select CAST([Order Date] as Date) as Date, Sales, lag(Sales) over (order by Sales) as Yesterday
from Orders$


/********I want see the Next day sale simantaniusly on another row*/
select cast([Order Date] as date) as Date, Sales,
lead(Sales) over (order by sales) as Next_Day
from Orders$




/********************************************************************************Class 12************************************************************************/

/* Create the Row Number, Rank number and Dense Rank*/

select [Customer Name], Sales, 
ROW_NUMBER() over(order by Sales desc) row_No,
Rank() over(order by Sales desc) Rank_,
DENSE_RANK() over(Order by Sales Desc) DenseRank
from Orders$

/* Find the 21st Rank */
with T1 as(select [Customer Name], Sales,
DENSE_RANK() over (order by Sales desc) as Rank
from Orders$)

select *
from T1
where Rank = 21


/*write a query to find out user first booking is Hotel*/

select *
from BookingTable

with T1 as(select UserID,LineOfBusiness,BookingDate,
RANK() over(Partition by UserID order by BookingDate) as First
from BookingTable)

select *
from T1
where First = 1 and LineofBusiness = 'Hotel'

/**********************************************************/
select Category,Cast([Order Date]as date) as Date,Sales,
sum(sales) over (Partition by category order by [Order Date]) as Running_Total
from Orders$

/********************************************************/
select Category, cast([Order Date] as Date) as Date, Sales, 
sum(Sales) over (Partition by Category order by [Order Date]) as Running_Total,
ROW_NUMBER() over(Partition by category order by [Order Date]) as Rank_

from Orders$



/*************************************************************/

with T1 as(select Category, [Order Date], Sales,
sum(Sales) over (Partition by category order by [Order Date]) as Running_Total,
Row_Number() over(Partition by Category order by [Order Date]) as Rank_
from Orders$)

select *
from T1
where Rank_ = 1

/*************************************************************/
select Segment, furniture, [Office Supplies], Technology from (select Segment, Category,Profit from Orders$) A
pivot( sum(Profit) for Category in (Furniture, [Office Supplies], Technology)) B