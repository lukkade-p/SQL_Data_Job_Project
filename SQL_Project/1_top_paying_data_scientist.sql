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