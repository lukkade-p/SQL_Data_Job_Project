/*
Question: What are the most in-demand skills for data scientist?
- Identify the top 5 in-demand skills for a data scientist.
- Focus on all job postings.
- Why? Retrieves the top 5 skills with the highest demand in the job market, providing insights into the most valuable skills for job seekers.
*/

SELECT 
    d.skills,
    COUNT(j.job_id) AS job_count
FROM 
    job_postings_fact AS j
INNER JOIN skills_job_dim AS s ON j.job_id = s.job_id
INNER JOIN skills_dim AS d ON s.skill_id = d.skill_id
-- Filter for Data Scientist roles
WHERE 
    j.job_title_short = 'Data Scientist'
GROUP BY 
    d.skills
-- Sort by highest demand
ORDER BY 
    job_count DESC
-- Top 5 skills
LIMIT 
    5;