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

/*
Here is the breakdown of the highest-paying skills of the remote Data Scientist roles in 2023:
• GDPR leads with the highest average salary at $217,737.50.
• Golang follows closely in second place with an average salary of $208,750.00.
• Atlassian and Selenium are also among the top earners, averaging $189,700.00 and $180,000.00, respectively.
• Other specialized tools and languages like OpenCV, Neo4j, MicroStrategy, DynamoDB, PHP, 
and Tidyverse round out the top list with average salaries ranging from $165,512.50 to $172,500.00.

[
  {
    "skills": "gdpr",
    "avg_salary": "217737.50"
  },
  {
    "skills": "golang",
    "avg_salary": "208750.00"
  },
  {
    "skills": "atlassian",
    "avg_salary": "189700.00"
  },
  {
    "skills": "selenium",
    "avg_salary": "180000.00"
  },
  {
    "skills": "opencv",
    "avg_salary": "172500.00"
  },
  {
    "skills": "neo4j",
    "avg_salary": "171655.00"
  },
  {
    "skills": "microstrategy",
    "avg_salary": "171146.58"
  },
  {
    "skills": "dynamodb",
    "avg_salary": "169670.33"
  },
  {
    "skills": "php",
    "avg_salary": "168125.00"
  },
  {
    "skills": "tidyverse",
    "avg_salary": "165512.50"
  }
]
*/