Select 
    F1.X,
    F1.Y
From Functions F1 
JOIN Functions F2 
ON (F1.X = F2.Y AND F2.X = F1.Y)
GROUP BY F1.X,F1.Y
HAVING (
    F1.X < F1.Y 
    OR
    (F1.X=F1.Y AND COUNT(*)>1 ))  
ORDER BY F1.X ASC
  
