/*
Question: What are the top-paying data scientist jobs?
- Identify the top 10 highest-paying Data Scientist roles that are available remotely.
- Focuses on job postings with specified salaries.
- Why? Aims to highlight the top-paying opportunities for Data Scientist, offering insights into employment options and location flexibility.
*/

-- Select specific columns including job details and company name
SELECT
    job_id,
    job_title,
    salary_year_avg,
    job_country,
    job_location,
    job_schedule_type,
    job_posted_date,
    name AS company_name
-- From the main job postings table, joined with the company dimensions table
FROM
    job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
-- Filter for remote Data Scientist roles with specified yearly salaries
WHERE
    job_title_short = 'Data Scientist' 
    AND job_location = 'Anywhere' 
    AND salary_year_avg IS NOT NULL
-- Sort by highest average yearly salary in descending order
ORDER BY
    salary_year_avg DESC
-- Limit the results to the top 10 highest-paying positions
LIMIT 
    10;

/*
Here is the analysis and conclusion of the top 10 highest-paying remote Data Scientist roles in 2023:
• Top Earning Position: The highest-paying role is Staff Data Scientist / Quant Researcher 
at Selby Jennings, commanding an incredible annual salary of $550,000.
• Salary Range: All top 10 positions offer remote ("Anywhere") annual salaries ranging from $300,000 
to $550,000, with an overall average of $365,850.
• Seniority Breakdown: Executive and senior leadership roles dominate the list—including Staff Data Scientists, 
Heads of Data Science, Directors, and Principal/Distinguished Data Scientists.
• Top Paying Companies: Selby Jennings leads the compensation chart with the top two highest-paying listings 
($550,000 and $525,000), followed by firms like Algo Capital Group ($375,000) and Demandbase 
($351,500 and $324,000).

[
  {
    "job_id": 40145,
    "job_title": "Staff Data Scientist/Quant Researcher",
    "salary_year_avg": "550000.0",
    "job_country": "United States",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-08-16 16:05:16",
    "company_name": "Selby Jennings"
  },
  {
    "job_id": 1714768,
    "job_title": "Staff Data Scientist - Business Analytics",
    "salary_year_avg": "525000.0",
    "job_country": "United States",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-09-01 19:24:02",
    "company_name": "Selby Jennings"
  },
  {
    "job_id": 1131472,
    "job_title": "Data Scientist",
    "salary_year_avg": "375000.0",
    "job_country": "United States",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-07-31 14:05:21",
    "company_name": "Algo Capital Group"
  },
  {
    "job_id": 1742633,
    "job_title": "Head of Data Science",
    "salary_year_avg": "351500.0",
    "job_country": "United States",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-07-12 03:07:31",
    "company_name": "Demandbase"
  },
  {
    "job_id": 551497,
    "job_title": "Head of Data Science",
    "salary_year_avg": "324000.0",
    "job_country": "United States",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-05-26 22:04:44",
    "company_name": "Demandbase"
  },
  {
    "job_id": 126218,
    "job_title": "Director Level - Product Management - Data Science",
    "salary_year_avg": "320000.0",
    "job_country": "Sudan",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-03-26 23:46:39",
    "company_name": "Teramind"
  },
  {
    "job_id": 1161630,
    "job_title": "Director of Data Science & Analytics",
    "salary_year_avg": "313000.0",
    "job_country": "United States",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-08-23 22:03:48",
    "company_name": "Reddit"
  },
  {
    "job_id": 457991,
    "job_title": "Head of Battery Data Science",
    "salary_year_avg": "300000.0",
    "job_country": "Sudan",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-10-02 16:40:07",
    "company_name": "Lawrence Harvey"
  },
  {
    "job_id": 226011,
    "job_title": "Distinguished Data Scientist",
    "salary_year_avg": "300000.0",
    "job_country": "United States",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-08-06 11:00:43",
    "company_name": "Walmart"
  },
  {
    "job_id": 38905,
    "job_title": "Principal Data Scientist",
    "salary_year_avg": "300000.0",
    "job_country": "United States",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-11-24 14:08:44",
    "company_name": "Storm5"
  }
]
*/