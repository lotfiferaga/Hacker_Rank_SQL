With recursive dataset AS(
    Select 1 as number 
    
    Union all 
    
    Select number + 1 
    From dataset 
    where number <1000    
),
all_numbers AS (
Select 
    D1.number
From dataset D1
CROSS JOIN dataset D2
GROUP BY D1.number
HAVING 
(
    SUM(D1.number%D2.number=0) = 2 
)
ORDER BY D1.number ASC
)
Select 
    GROUP_CONCAT(number SEPARATOR '&')
FROM all_numbers A 
