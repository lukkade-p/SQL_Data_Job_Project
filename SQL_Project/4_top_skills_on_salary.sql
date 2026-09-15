/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Scientist positions.
- Focuses on roles with specified salaries, regardless of location.
- Why? It reveals how different skills impact salary levels for Data Scientist 
and helps identify the most financially rewarding skills to acquire or improve.
*/

SELECT 
    d.skills,
    ROUND(AVG(salary_year_avg), 2) AS avg_salary    -- Calculate average salary rounded to 2 decimal places
FROM 
    job_postings_fact AS j
INNER JOIN skills_job_dim AS s ON j.job_id = s.job_id
INNER JOIN skills_dim AS d ON s.skill_id = d.skill_id
WHERE 
    j.job_title_short = 'Data Scientist'            -- Filter for Data Scientist roles
    AND j.salary_year_avg IS NOT NULL               -- Exclude postings without salary data
    AND j.job_work_from_home = TRUE                 -- Focus on remote jobs
GROUP BY 
    d.skills
ORDER BY 
    avg_salary DESC                                 -- Sort by highest average salary
LIMIT 
    10;                                             -- Top 10 highest-paying skills