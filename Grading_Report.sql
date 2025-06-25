SELECT
    CASE WHEN g.Grade >= 8 THEN st.Name ELSE 'NULL' END AS Name,
    g.Grade,
    st.Marks
FROM Students st
JOIN Grades g ON st.Marks BETWEEN g.Min_Mark AND g.Max_Mark
ORDER BY
    -- Order students with grade >= 8 first, then < 8
    CASE WHEN g.Grade >= 8 THEN 1 ELSE 2 END,
    
    -- For grade >= 8: order by Grade desc, then Name asc
    CASE WHEN g.Grade >= 8 THEN g.Grade END DESC,
    CASE WHEN g.Grade >= 8 THEN st.Name END ASC,
    
    -- For grade < 8: order by Grade desc, then Mark asc
    CASE WHEN g.Grade < 8 THEN g.Grade END DESC,
    CASE WHEN g.Grade < 8 THEN st.Marks END ASC;
