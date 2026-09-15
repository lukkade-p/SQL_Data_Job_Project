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

/*
Here is the breakdown of the most demanded skills of the Data Scientist roles in 2023:
• Python leads significantly with a job count of 114,016.
• SQL follows in second place with a job count of 79,174.
• R is also highly sought after, appearing with a job count of 59,754.
• SAS and Tableau round out the list with comparable demand counts of 29,642 and 29,513, respectively.

[
  {
    "skills": "python",
    "job_count": "114016"
  },
  {
    "skills": "sql",
    "job_count": "79174"
  },
  {
    "skills": "r",
    "job_count": "59754"
  },
  {
    "skills": "sas",
    "job_count": "29642"
  },
  {
    "skills": "tableau",
    "job_count": "29513"
  }
]
*/