
WITH least_subs AS (
    SELECT
        S1.hacker_id,
        S1.submission_date,
        COUNT(DISTINCT S2.submission_date) AS lsubs
    FROM Submissions S1
    JOIN Submissions S2
        ON S1.hacker_id = S2.hacker_id
        AND S2.submission_date <= S1.submission_date
    GROUP BY
        S1.hacker_id,
        S1.submission_date
    HAVING COUNT(DISTINCT S2.submission_date) =
        DATEDIFF(S1.submission_date, '2016-03-01') + 1
),
daily_hackers AS (
    SELECT
        submission_date,
        COUNT(DISTINCT hacker_id) AS hacker_count
    FROM least_subs
    GROUP BY submission_date
),
count_subs_per_date AS (
    SELECT
        hacker_id,
        submission_date,
        COUNT(*) AS cpt
    FROM Submissions
    GROUP BY hacker_id, submission_date
),
max_subs_per_date AS (
    SELECT
        submission_date,
        MAX(cpt) AS max_subs
    FROM count_subs_per_date
    GROUP BY submission_date
),
daily_winners AS (
    SELECT
        C.submission_date,
        MIN(C.hacker_id) AS hacker_id
    FROM count_subs_per_date C
    JOIN max_subs_per_date M
        ON C.submission_date = M.submission_date
        AND C.cpt = M.max_subs
    GROUP BY C.submission_date
)
SELECT
    D.submission_date,
    D.hacker_count,
    W.hacker_id,
    H.name
FROM daily_hackers D
JOIN daily_winners W
    ON D.submission_date = W.submission_date
JOIN Hackers H
    ON W.hacker_id = H.hacker_id
ORDER BY D.submission_date;
