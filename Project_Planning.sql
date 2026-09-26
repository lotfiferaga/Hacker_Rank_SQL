With prev_end AS(
Select 
Task_ID,
End_Date,
Start_Date,   
LAG(end_date) OVER (ORDER BY start_date) AS previous_end_date
From Projects
),
consec AS (
    SELECT
        Start_Date,
        End_Date,
        previous_end_date
    FROM prev_end
),
new_project AS
(
    select 
    Start_Date,
    End_Date,
CASE
    WHEN DATEDIFF(End_Date, previous_end_date) = 1 THEN 0
    ELSE 1
END AS ne
    from consec
),
ident_projects AS
(
    Select 
    Start_Date,
    End_Date,
    SUM(ne) OVER (ORDER BY Start_Date) AS project_id
    from new_project
)
select 
 MIN(Start_Date) AS project_start,
    MAX(End_Date) AS project_end
from ident_projects
group by project_id
ORDER by DATEDIFF(MAX(End_Date), MIN(Start_Date)), project_start




