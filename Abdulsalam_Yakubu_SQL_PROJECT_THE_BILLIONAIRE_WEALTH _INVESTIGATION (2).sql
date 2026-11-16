select *
from Top200RichestPersonintheWorld;

-- 1. Retrieve the 20 richest billionaires
select rank,
       name,
       country,
       industry,
       networth_billion
from Top200RichestPersonintheWorld
order by networth_billion DESC
limit 20;

-- 2. Identify the 5 youngest billionaires
select name,
       age,
       country,
       industry,
       networth_billion
from Top200RichestPersonintheWorld
order by age ASC
limit 5;

-- 3. Calculate the average age and average networth
select AVG(age) as avg_age,
       AVG(networth_billion)  as avg_networth
from Top200RichestPersonintheWorld;   

-- 4. Identify the 5 most represented countries 
select country, count (*) as billionaire_count
from Top200RichestPersonintheWorld
group by country
order by billionaire_count DESC
limit 5;

-- 5. Calculate the combined net worth of billionaires from each country.
select country, count (*) as billionaire_count, 
       sum(networth_billion) as total_net_worth_billion
from Top200RichestPersonintheWorld
group by country
order by total_net_worth_billion desc;

-- 6. Identify the five industries with the highest number of billionaires.
select industry, count (*) as billionaire_count
from Top200RichestPersonintheWorld
group by industry
order by billionaire_count DESC
limit 5;

-- 7. Find countries with at least five billionaires.
select country, count (*) as billionaire_count 
from Top200RichestPersonintheWorld
group by country
having count (*) >=5
order by billionaire_count desc;

-- 8. Calculate the total wealth of billionaires younger than 50.
select Sum(networth_billion) as total_wealth_bel_50
from Top200RichestPersonintheWorld
where age < 50;

-- 9. Identify billionaires whose net worth exceeds the overall average net worth.
select name,
       country,
       industry,
       networth_billion
from Top200RichestPersonintheWorld
where networth_billion > (SELECT avg(networth_billion) from Top200RichestPersonintheWorld)
order by networth_billion desc;

-- 10.Identify the industry with the highest average net worth.
select industry, count (*) as billionaire_count, 
       avg(networth_billion) as avg_networth_billion
from Top200RichestPersonintheWorld
group by industry
order by avg_networth_billion DESC
limit 1;
--NOTE; In the above query, it returns Telecom because the industry contains a single billionaire (Carlos Slim Helu)
-- therefore, to avoid a one person result, adding HAVING COUNT (*) >=3 will give a better representation 
select industry, count (*) as billionaire_count, 
       avg(networth_billion) as avg_networth_billion
from Top200RichestPersonintheWorld
group by industry
having count (*) >= 3
order by avg_networth_billion DESC
limit 1;

-- 11. Gap between the richest  and the 200th richest
select max(networth_billion) as highest, min(networth_billion) as lowest,
       max(networth_billion) - min(networth_billion) as gap
from Top200RichestPersonintheWorld;

-- 12. Countries with exactly one billionaire (single representation market)
select country, max(name) as billionaire,
                max(networth_billion) as networth_billion
from Top200RichestPersonintheWorld
group by country
having count (*) = 1
order by networth_billion desc;

-- 13. Billionaires younger than 50 who are in the top 50 by wealth 
select name,
       age,
       country,
       industry,
       networth_billion,
       rank
from Top200RichestPersonintheWorld
where age < 50 and rank <= 50 
order by rank;

-- 14. Which industries have the youngest billionaire
select industry, count (*) as billionaire_count,
       avg(age) as avg_age
from Top200RichestPersonintheWorld
group by industry
having count (*) >= 3 
order by avg_age ASc;

-- 15. 5 oldest billionaires
select name,
       age,
       country,
       industry,
       networth_billion
from Top200RichestPersonintheWorld
order by age DESC
limit 5;

