-- first challenge
select distinct CITY from STATION where 
CITY not like '%A' and
CITY not like '%E' and
CITY not like '%O' and
CITY not like '%I' and
CITY not like '%U' and
CITY not like '%a' and
CITY not like '%e' and
CITY not like '%o' and 
CITY not like '%i' and
CITY not like '%u' 


-- second 
select Name from STUDENTS where Marks > 75 
order by RIGHT(Name,3),ID asc 





