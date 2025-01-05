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


--- using case for classification 
select 
    case 
        when A + B <= C or B + C <= A or A + C <= B then 'Not A Triangle'
        when A = B and B = C then 'Equilateral'
        when A = B or B = C or A = C then 'Isosceles'
        else 'Scalene'
    end as TriangleType
from TRIANGLES;


---  
select CONCAT(Name,'(',SUBSTRING(Occupation,1,1),')') from OCCUPATIONS order by Name asc;
select CONCAT('There are a total of',' ',COUNT(Occupation),' ',LOWER(Occupation),'s.')from OCCUPATIONS group by Occupation
order by COUNT(Occupation) asc, Occupation asc; 

--- 
WITH SortedData AS (
    SELECT
        Name,
        Occupation,
        ROW_NUMBER() OVER (PARTITION BY Occupation ORDER BY Name) AS RowNum
    FROM OCCUPATIONS
),
PivotedData AS (
    SELECT
        d1.Name AS Doctor,
        d2.Name AS Professor,
        d3.Name AS Singer,
        d4.Name AS Actor
    FROM
        (SELECT Name, RowNum FROM SortedData WHERE Occupation = 'Doctor') d1
        FULL OUTER JOIN (SELECT Name, RowNum FROM SortedData WHERE Occupation = 'Professor') d2
        ON d1.RowNum = d2.RowNum
        FULL OUTER JOIN (SELECT Name, RowNum FROM SortedData WHERE Occupation = 'Singer') d3
        ON COALESCE(d1.RowNum, d2.RowNum) = d3.RowNum
        FULL OUTER JOIN (SELECT Name, RowNum FROM SortedData WHERE Occupation = 'Actor') d4
        ON COALESCE(d1.RowNum, d2.RowNum, d3.RowNum) = d4.RowNum
)
SELECT
    COALESCE(Doctor, 'NULL') AS Doctor,
    COALESCE(Professor, 'NULL') AS Professor,
    COALESCE(Singer, 'NULL') AS Singer,
    COALESCE(Actor, 'NULL') AS Actor
FROM PivotedData;





