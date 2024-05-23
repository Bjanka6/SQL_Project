--What are the top-paying jobs for Data Analysts
/*
Question: what are the top paying data analyst jobs?
- Identify the top 10 highest-paying data analyst roles that are available remotely.
- FOcuses on job postings with specificied salaries (remove nulls).
- Why? highlight the top-[aying opportunities for data analyst, offering insights into employement opportunities. 
*/

SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND 
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10