With sum_views as (
    
    select 
        challenge_id,
        sum(total_views) as sum_total_views,
        sum(total_unique_views) as sum_total_unique
    from View_Stats
    group by challenge_id
),
sum_submissions as (
    select 
        challenge_id, 
        sum(total_submissions) as sum_total_submissions,
        sum(total_accepted_submissions) as sumb_total_accepted
    from Submission_Stats
    group by challenge_id
)
Select 
    C.contest_id,
    C.hacker_id,
    C.name,
    SUM(Ss.sum_total_submissions),
    SUM(Ss.sumb_total_accepted),
    SUM(Vs.sum_total_views),
    SUM(Vs.sum_total_unique)
From 
Contests C 
JOIN Colleges Coll on C.contest_id = Coll.contest_id
JOIN Challenges Chal on Chal.college_id = Coll.college_id
LEFT JOIN sum_views Vs on Vs.challenge_id = Chal.challenge_id
LEFT JOIN sum_submissions Ss on Chal.challenge_id = Ss.challenge_id
GROUP BY C.contest_id,
    C.hacker_id,
    C.name
HAVING (
    COALESCE(SUM(Vs.sum_total_views),0) <> 0 OR 
    COALESCE(SUM(Vs.sum_total_unique),0) <> 0 OR 
    COALESCE(SUM(Ss.sum_total_submissions),0)  <> 0 OR 
    COALESCE(SUM(Ss.sumb_total_accepted),0) <> 0   
)
ORDER BY contest_id;
