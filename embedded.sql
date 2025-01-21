Select salary*months, count(name) from Employee 
Where salary* months = (Select max(salary*months) from Employee)
group by salary, months

