/*
Question: What are the most in-demand skills for data analysts?
- Join job posting to inner join table similar to q2
- Identify the top 5 in-demand skills for a data analyst.
- Focus on all job postings
- Why? Retrieves the top 5 skills with the highest demand, providing
    insight into the most valuable skills for job seekers.
*/


SELECT 
    skills,
    COUNT(skills_job_dim.job_id) as demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5;


/*

Previous code that was less efficient

WITH remote_job_skills AS (
    SELECT
        skill_id,
        count(*) AS skill_count
    FROM 
        skills_job_dim AS sjd
    INNER JOIN job_postings_fact AS jp ON jp.job_id = sjd.job_id
    WHERE
        jp.job_work_from_home = TRUE AND
        JP.job_title_short = 'Data Analyst'
    GROUP BY 
        skill_id
)

SELECT 
    skills.skill_id,
    skills AS skill_name,
    skill_count
FROM remote_job_skills
INNER JOIN skills_dim AS skills ON skills.skill_id =remote_job_skills.skill_id
ORDER BY 
    skill_count DESC
LIMIT 5*/


