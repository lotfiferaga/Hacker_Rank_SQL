SELECT
    c.company_code,
    c.founder,
    COUNT(DISTINCT lm.lead_manager_code) AS lead_manager_count,
    COUNT(DISTINCT sm.senior_manager_code) AS senior_manager_count,
    COUNT(DISTINCT m.manager_code) AS manager_count,
    COUNT(DISTINCT e.employee_code) AS employee_count
FROM
    Company c
LEFT JOIN Lead_Manager lm
    ON c.company_code = lm.company_code
LEFT JOIN Senior_Manager sm
    ON c.company_code = sm.company_code
    AND sm.lead_manager_code = lm.lead_manager_code
LEFT JOIN Manager m
    ON c.company_code = m.company_code
    AND m.lead_manager_code = lm.lead_manager_code
    AND m.senior_manager_code = sm.senior_manager_code
LEFT JOIN Employee e
    ON c.company_code = e.company_code
    AND e.lead_manager_code = lm.lead_manager_code
    AND e.senior_manager_code = sm.senior_manager_code
    AND e.manager_code = m.manager_code
GROUP BY
    c.company_code,
    c.founder
ORDER BY
    c.company_code;
