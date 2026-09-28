/*Question. What are most indemand skills for my role?
- using inner join
- identify top 5 indemad skills
- focus on all job postings
why -- retrive top 5 skill with high demand in job market

*/

--  Method 1
SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact

INNER JOIN  skills_job_dim  ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Scientist' 
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 10;


--  Method 2 for data analyst
WITH remote_job_skills AS(
    SELECT 
    skill_id,
    COUNT(*) AS skill_count
    FROM skills_job_dim
    INNER JOIN job_postings_fact ON skills_job_dim.job_id = job_postings_fact.job_id
    WHERE 
        -- job_work_from_home = TRUE AND
        job_title_short = 'Data Analyst'
    GROUP BY skill_id
)

SELECT  
    skills_dim.skill_id,
    skills_dim.skills AS skills,
    skill_count


FROM remote_job_skills
INNER JOIN skills_dim ON remote_job_skills.skill_id = skills_dim.skill_id
ORDER BY skill_count DESC
LIMIT 5