-- this is for mysql

WITH RECURSIVE pattern AS (
    SELECT 20 AS n
    UNION ALL
    SELECT n - 1 FROM pattern WHERE n > 1
)
SELECT REPEAT('* ', n) FROM pattern;


-- reverse triangle
WITH RECURSIVE Pattern AS
(
    SELECT 1 AS n 
    UNION ALL
    SELECT n + 1 FROM Pattern WHERE n < 20
)
SELECT REPEAT('* ',n) FROM pattern;


-- for SQL SERVER
WITH Pattern AS 
(
    -- Start with n = 1
    SELECT 1 AS n  
    UNION ALL  
    -- Increment n by 1 until it reaches 20
    SELECT n + 1 FROM Pattern WHERE n < 20  
)
SELECT REPLICATE('* ', n) FROM Pattern; -- Repeat '* ' n times
