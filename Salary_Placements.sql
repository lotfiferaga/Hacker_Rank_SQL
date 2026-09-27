With bff_salary AS
(
Select 
    F.ID,
    Friend_ID,
    Salary
From Friends F 
JOIN Packages P on F.Friend_ID = P.ID
),
student_salary AS 
(
select 
S.ID, 
S.Name,
Salary 
From Students S 
Join Packages P on S.ID = P.ID  
)
Select 
    Name
From student_salary ss
Join bff_salary bs on ss.ID = bs.ID
Where ss.Salary < bs.Salary 
Order by bs.Salary ASC 
