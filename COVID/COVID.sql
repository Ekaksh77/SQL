select CAST([Report Date] as Date) as Date
from ['covid_report $']
order by [Report Date]

select *
from ['covid_report $']


select *
from Population$


/*1. Retrieve the Covid data of 'Delhi' in May 2020*/
with T1 as(select CAST([Report Date] as date) as Date, State, [Confirmed Indian Nation], [Confirmed Foreign National], Cured, Death, Confirmed
from ['covid_report $']
where State = 'Delhi' )

select *
from T1
where (Date>='2020-05-01' and date<='2020-05-31')




/*2. Write a query to calculate following metrics state wise
a. Total confirmed cases
b. Total Cured cases
c. Total Deaths
fort by Total number of confirmed cases in descending order*/

with T1 as(select State, sum(Confirmed) as Total_Confirmed_Cases, sum(Cured) as Total_Cured, sum(Death) as Total_Death
from ['covid_report $']
group by State)

select *
from T1
order by Total_Confirmed_Cases desc



/*3. Identity top 5 states with highest number of deaths.*/
with T1 as(select Top 5 state, sum(Death) as Total_Death
from ['covid_report $']
group by State)

select *
from T1
order by Total_Death desc


/*********Another approach****/
select Top 5 state,sum(Death) as Total_Death, rank() over (order by sum(death) desc) as Highest_Death
from ['covid_report $']
Group by State




/*4. Add a rank column in question number 3*/
with T1 as(select Top 5 state, sum(Death) as Total_Death
from ['covid_report $']
group by State)

select *,
Rank() over(Order by Total_Death desc)as Rank_
from T1
order by Total_Death desc



/*5. Create a Column with 'Previous day Confirmed cases' in Delhi or Chandigarh in the month of March*/
select cast([Report Date] as Date)as Date,State, Confirmed,

lag(Confirmed) over (partition by state order by Confirmed) as Previous_Day_Confirmed_Case
from ['covid_report $']
where  State in ('Delhi','Chandigarh') and MONTH([Report Date]) = 3


/*6. Find out the total number of new cases everyday in Delhi/Chandigarh in the month of March. Keep only state name, Report date, Total confirmed cases and new cases in the final output.*/

select state,confirmed ,
lag(Confirmed,1) over (Partition by state order by [Report Date]) as Confirmed_Cases,
Confirmed-LAG(Confirmed,1) over (Partition by state order by [Report Date]) as New_Cases

from ['covid_report $']
where state = 'Delhi' and MONTH([Report Date]) = 3


/*7. Join Covid Dataset with the Population sheet and fetch Population of each state.*/
select P.[State/Union Territory], P.[ Population], sum(C.Confirmed) as Total_Confrmed_Case, sum(C.Death) as Total_Death
from ['covid_report $'] C join Population$ P
on C.State = P.[State/Union Territory]
group by P.[State/Union Territory], P.[ Population]