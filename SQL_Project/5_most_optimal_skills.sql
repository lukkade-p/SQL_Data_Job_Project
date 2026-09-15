/*
Answer: What are the most optimal skills to learn (aka it’s in high demand and a high-paying skill) 
for a data scientist?
- Identify skills in high demand and associated with high average salaries for Data Scientist roles
- Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries), 
offering strategic insights for career development in data analysis
*/

WITH top_demand_skills AS (
    SELECT 
        d.skill_id,
        d.skills,
        COUNT(j.job_id) AS demand_count
    FROM 
        job_postings_fact AS j
    INNER JOIN skills_job_dim AS s ON j.job_id = s.job_id
    INNER JOIN skills_dim AS d ON s.skill_id = d.skill_id
    WHERE 
        j.job_title_short = 'Data Scientist'
        AND j.salary_year_avg IS NOT NULL
        AND j.job_work_from_home = TRUE
    GROUP BY 
        d.skill_id
),

top_skills_on_salary AS (
    SELECT 
        d.skill_id,
        d.skills,
        ROUND(AVG(salary_year_avg), 2) AS avg_salary
    FROM 
        job_postings_fact AS j
    INNER JOIN skills_job_dim AS s ON j.job_id = s.job_id
    INNER JOIN skills_dim AS d ON s.skill_id = d.skill_id
    WHERE 
        j.job_title_short = 'Data Scientist'
        AND j.salary_year_avg IS NOT NULL
        AND j.job_work_from_home = TRUE
    GROUP BY 
        d.skill_id
)

SELECT
    top_demand_skills.skills,
    demand_count,
    avg_salary
FROM
    top_demand_skills
INNER JOIN top_skills_on_salary 
    ON top_demand_skills.skill_id = top_skills_on_salary.skill_id
ORDER BY
    demand_count DESC,
    avg_salary DESC 
LIMIT 10;

/*
Here’s the breakdown of the most demanded skills and average salaries for remote Data Scientists:
• Python leads with the highest demand at a count of 763 and an average salary of $143,827.93.
• SQL follows closely with a demand count of 591 and an average salary of $142,832.59.
• R is also prominent with a demand count of 394 and an average salary of $137,885.37.
• Tableau and AWS are heavily sought after with demand counts of 219 and 217, 
commanding higher average salaries of $146,970.05 and $149,629.96 respectively.
• Advanced machine learning and big data frameworks like PyTorch, TensorFlow, and Spark offer 
the highest average salaries—ranging from $150,188.49 to $152,602.70—with demand counts between 115 and 149.
• Azure and Pandas round out the list with demand counts of 122 and 113, and average salaries 
of $142,305.83 and $144,815.95.

[
  {
    "skills": "python",
    "demand_count": "763",
    "avg_salary": "143827.93"
  },
  {
    "skills": "sql",
    "demand_count": "591",
    "avg_salary": "142832.59"
  },
  {
    "skills": "r",
    "demand_count": "394",
    "avg_salary": "137885.37"
  },
  {
    "skills": "tableau",
    "demand_count": "219",
    "avg_salary": "146970.05"
  },
  {
    "skills": "aws",
    "demand_count": "217",
    "avg_salary": "149629.96"
  },
  {
    "skills": "spark",
    "demand_count": "149",
    "avg_salary": "150188.49"
  },
  {
    "skills": "tensorflow",
    "demand_count": "126",
    "avg_salary": "151536.49"
  },
  {
    "skills": "azure",
    "demand_count": "122",
    "avg_salary": "142305.83"
  },
  {
    "skills": "pytorch",
    "demand_count": "115",
    "avg_salary": "152602.70"
  },
  {
    "skills": "pandas",
    "demand_count": "113",
    "avg_salary": "144815.95"
  }
]
*/