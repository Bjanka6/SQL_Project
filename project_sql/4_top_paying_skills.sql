/*
What are the top skills based on salary?
- Look at the average salary associated with each skill for data analyst positions.
- Focuses on roles with specified salaries, regardless of location.
- Why? It reveals how different skills impacy salary levels and helps identtify the most financially rewarding skills.
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) as avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25;


/*

1. **Emerging and Specialized Technologies**:
   - Skills in emerging fields such as blockchain (**Solidity**) and advanced machine learning frameworks (**TensorFlow**, **PyTorch**) command high salaries, indicating a premium on cutting-edge technical expertise.

2. **Cloud and DevOps Integration**:
   - Proficiency in cloud management and DevOps tools (**Terraform**, **VMware**, **Ansible**) is essential, reflecting a trend towards automated, scalable, and efficient infrastructure management in high-paying roles.

3. **Data and Application Management**:
   - Expertise in data management systems and programming languages (**Couchbase**, **Kafka**, **Scala**) remains critical, underscoring the importance of handling large datasets and developing robust applications.
*/