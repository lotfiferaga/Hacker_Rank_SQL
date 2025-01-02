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

select name from Employee order by name asc;

-- 
select name from Employee where salary > 2000 and months < 10 
order by employee_id asc;


--- MySQL
select CEILING(AVG(Salary) - AVG(REPLACE(Salary,'0',''))) from EMPLOYEES where Salary between 1000 and 100000;

--- Oracle
SELECT CEIL(AVG(Salary) - AVG(REPLACE(TO_CHAR(Salary), '0', '')))
FROM EMPLOYEES
WHERE Salary BETWEEN 1000 AND 100000;


--- 




