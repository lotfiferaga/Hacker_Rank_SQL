WITH Ordered AS (
    SELECT LAT_N, ROW_NUMBER() OVER (ORDER BY LAT_N) AS rn,
           COUNT(*) OVER () AS total_rows
    FROM STATION
)
SELECT ROUND(AVG(CAST(LAT_N AS DECIMAL(10,4))), 4) AS Median
FROM Ordered
WHERE rn IN ((total_rows + 1) / 2, (total_rows + 2) / 2);
