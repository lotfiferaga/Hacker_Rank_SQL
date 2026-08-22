WITH challenge_counts AS (
    SELECT
        hacker_id,
        COUNT(*) AS total_challenges
    FROM Challenges
    GROUP BY hacker_id
),
max_count AS (
    SELECT MAX(total_challenges) AS max_challenges
    FROM challenge_counts
),
duplicated_counts AS (
    SELECT total_challenges
    FROM challenge_counts
    GROUP BY total_challenges
    HAVING COUNT(*) > 1
)
SELECT
    h.hacker_id,
    h.name,
    cc.total_challenges
FROM Hackers h
JOIN challenge_counts cc
    ON h.hacker_id = cc.hacker_id
CROSS JOIN max_count mc
WHERE
    cc.total_challenges = mc.max_challenges
    OR cc.total_challenges NOT IN (
        SELECT total_challenges
        FROM duplicated_counts
    )
ORDER BY
    cc.total_challenges DESC,
    h.hacker_id;
