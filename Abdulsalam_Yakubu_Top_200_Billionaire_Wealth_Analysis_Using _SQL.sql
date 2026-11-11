--1. What does the entire dataset look like?
SELECT *
from Top200RichestPersonintheWorld;

--2. What are the names, ages and net worths of the billionaires?
select name,
       age,
       networth_billion
from Top200RichestPersonintheWorld;

--3. Who are the first 10 billionaires in the dataset?
select rank,
       name,
       age,
       country,
       networth_billion,
       industry
from Top200RichestPersonintheWorld
limit 10;

--4. Which countries are represented in the dataset?
select DISTINCT country
FROM Top200RichestPersonintheWorld;
       
       
--5. Which industries are represented among the world's richest people
select DISTINCT industry
from Top200RichestPersonintheWorld;

--6 Total number of countries represented
select count (DISTINCT country)
from Top200RichestPersonintheWorld;

--7 Total number of industries represented
select count (distinct industry)
from Top200RichestPersonintheWorld;

--B. Filtering data using WHERE: These questions introduce retrieving records that meet certain
conditions.

--8. Who are the billionaires younger than 40 years?
SELECT rank, name, age, country, networth_billion, industry
from Top200RichestPersonintheWorld
where age < 40;
       
--9. Who are the billionaires with a net worth greater than $100 billion?
SELECT rank, name, age, country, networth_billion, industry
from Top200RichestPersonintheWorld
where networth_billion > 100;
       
--10. Who are the billionaires from Nigeria?
SELECT rank, name, age, country, networth_billion, industry
from Top200RichestPersonintheWorld
where country = 'Nigeria';
       
--11. Who are the billionaires aged between 40 and 60?
SELECT rank, name, age, country, networth_billion, industry
from Top200RichestPersonintheWorld
where age BETWEEN 40 and 60;
       
--12. Who are the billionaires from the United States, China and India?
SELECT rank, name, age, country, networth_billion, industry
from Top200RichestPersonintheWorld
where country in ('United States', 'China', 'India');
       
--13. Who are the billionaires whose names begin with the letter A?
SELECT rank, name, age, country, networth_billion, industry
from Top200RichestPersonintheWorld
where name like 'A%';
       
--14. Who are the billionaires aged above 60 with a net worth greater than $50 billion?
SELECT rank, name, age, country, networth_billion, industry
from Top200RichestPersonintheWorld
where age > 60 and networth_billion > 50;
       
--15. Who are the billionaires from Nigeria or South Africa?
SELECT rank, name, age, country, networth_billion, industry
from Top200RichestPersonintheWorld
where country = 'Nigeria' OR 
      country = 'South Africa';
       
  -- C. Sorting data using ORDER BY: These questions arrange information to identify the highest,
--lowest, oldest and youngest billionaires.

--16. Who is the richest person in the dataset?
select name, age, networth_billion
from Top200RichestPersonintheWorld
order by networth_billion DESC
limit 1;

--17. Who is the youngest billionaire?
select name, age, networth_billion
from Top200RichestPersonintheWorld
order by age ASC
limit 1;

--16. Who are the five oldest billionaires?
select name, age, networth_billion, country
from Top200RichestPersonintheWorld
order by age DESC
limit 5;

--17. Who are the ten wealthiest billionaires?
select name, age, networth_billion, country
from Top200RichestPersonintheWorld
order by networth_billion DESC
limit 10;

--D. Aggregate functions: These questions generate numerical insights by using functions such
--as count, sum, average, maximum & minimum.

--18. How many billionaires are represented in the dataset?
select count (DISTINCT serial_number) as total_billionaires 
from Top200RichestPersonintheWorld;

--19. What is the combined net worth of all 200 billionaires?
select sum(networth_billion)
from Top200RichestPersonintheWorld;

--20. What is the average net worth of the billionaires?
select avg(networth_billion)
from Top200RichestPersonintheWorld;

--21. What is the average age of the billionaires?
select avg(age)
from Top200RichestPersonintheWorld;

--22. What is the highest net worth recorded?
select max(networth_billion)
from Top200RichestPersonintheWorld;

--23. What is the lowest net worth recorded?
select min(networth_billion)
from Top200RichestPersonintheWorld;

--24. What is the age difference between the oldest and youngest billionaires?
select max(age) - min (age)
from Top200RichestPersonintheWorld;

--E. Categorizing data by GROUP BY: These questions allow us to group records into categories
--and perform calculations on each category.

--25. How many billionaires does each country have?
select country,
       COUNT (*) as number_of_billionaires
from Top200RichestPersonintheWorld
group by country 
order by number_of_billionaires desc;
--26. Which industry has the highest number of billionaires?
select industry,
       count (*) as highest_number_of_billionaires
from Top200RichestPersonintheWorld
group by 1
order by 2 desc;

--27. What is the average net worth of billionaires in each country?
select country,
       avg(networth_billion) as average_networth
from Top200RichestPersonintheWorld
group by 1 
order by 2 desc;

--28. What is the total net worth of billionaires in each industry?
select industry,
       sum (networth_billion) as total_networth_by_industry
from Top200RichestPersonintheWorld       
group by 1
order by country asc;
       
--29. Which country has the oldest average billionaire population?
select country,
       avg(age) as avaerage_billionaire_age
from Top200RichestPersonintheWorld
group by 1
order by 2 desc;

--30. Which industry has the highest average billionaire age?
select industry,
       avg(age) as average_industry_age
from Top200RichestPersonintheWorld
group by 1 
order by 2 desc;

--31. Which countries have at least five billionaires in the dataset?
select country,
       count (*) as number_of_billionaires
from Top200RichestPersonintheWorld
group by 1 
having count (*) >= 5
order by 2 desc;

-- F. More exciting analytical questions: These are questions that will challenge you to think like
-- real data analysts.
-- 32. Which industry has the wealthiest billionaire?
select name,
       industry,
       networth_billion
from Top200RichestPersonintheWorld
order by networth_billion DESC
limit 1;

-- 33. Which country has the highest combined billionaire wealth?
select country,
       SUM(networth_billion) AS Total_Wealth
from Top200RichestPersonintheWorld
group by country
order by Total_wealth
limit 1;
       
-- 34. Which country has the highest average billionaire net worth?
select country, 
       avg(networth_billion) as Average_Net_Worth
from Top200RichestPersonintheWorld
group by country
order by Average_Net_Worth desc 
limit 1;

-- 35. Which industries have at least 10 billionaires?
select industry,
       count (*) as Total_Billionaires
from Top200RichestPersonintheWorld
group by industry
having count (*) >= 10
order by Total_Billionaires desc;

-- 36. How many billionaires have a net worth above $50 billion?
select count (*) as Total_Billionaires
from Top200RichestPersonintheWorld
where networth_billion > 50;

-- 37. What percentage of the dataset is made up of billionaires younger than 50?
select 
     (count (case when age < 50 then 1 end) * 100 /
      count (*)) as Percentage_Under_50
from Top200RichestPersonintheWorld;      
      
-- 38. Who has a net worth between $50 billion and $100 billion?
select networth_billion,
       name
from Top200RichestPersonintheWorld
where networth_billion between 50 and 100
order by networth_billion desc;


-- 39. What is the total wealth of billionaires aged below 50?
select sum(networth_billion) as Total_wealth_below_50
from Top200RichestPersonintheWorld
where age < 50;

-- 40. Which country has the highest number of billionaires below age 40?
select country, 
       count (*) As Highest_number_of_billionaires_bel_40
 from Top200RichestPersonintheWorld  
 where age < 40
 group by country      
 order by Highest_number_of_billionaires_bel_40 desc
 limit 1;
 
-- 41. Which industry contributes the most to the combined wealth of the top 200?
select industry, sum(networth_billion) As Total_Industry_Wealth
from Top200RichestPersonintheWorld
group by industry
order by Total_Industry_Wealth DESC
limit 1;

-- 42. What is the difference between the richest and poorest billionaire in the dataset?
select 
     max(networth_billion) - min (networth_billion)
from Top200RichestPersonintheWorld;

-- 43. What is the average net worth of billionaires aged above 70?
select 
     Avg(networth_billion)
from Top200RichestPersonintheWorld
where age > 70;

-- 44. Which billionaires belong to industries with more than 10 representatives?
select Name, 
       Industry,
       networth_billion
from Top200RichestPersonintheWorld
where industry in ( select industry
                   from Top200RichestPersonintheWorld
                   group by industry
                   having count (*) > 10)
order by industry, networth_billion desc;

-- 45. Classify billionaires by age 
select rank,
       name,
       age,
       networth_billion,
       case when age < 40 then 'Young Billionaires'
            when age between 40 and 59 then 'Middle-aged Billionaires'
            when age between 60 and 79 then 'Senior Billionaires'
            else 'Elderly Billionaires'
            end as billionaire_age_category
from Top200RichestPersonintheWorld;

