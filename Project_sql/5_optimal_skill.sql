-- Question: What is the most optimal skill to learn
--     option high demand and hig paying

WITH skill_demand  AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM job_postings_fact

    INNER JOIN  skills_job_dim  ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE job_title_short = 'Data Analyst' 
    AND salary_year_avg is NOT NULL
    AND job_work_from_home = TRUE
    GROUP BY skills_dim.skill_id
), 

average_salary  AS (

    SELECT  
        skills_job_dim.skill_id,
        
        ROUND(AVG(salary_year_avg),0) AS avg_salary
    FROM job_postings_fact

    INNER JOIN  skills_job_dim  ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE job_title_short = 'Data Analyst' 
    AND salary_year_avg IS NOT NULL 
    AND job_work_from_home = TRUE
    GROUP BY skills_job_dim.skill_id
  
)

SELECT 
    skill_demand.skill_id,
    skill_demand.skills,
    demand_count,
    avg_salary
    
FROM skill_demand
INNER JOIN average_salary ON skill_demand.skill_id = average_salary.skill_id
WHERE demand_count > 10
ORDER BY
     avg_salary DESC ,
    demand_count DESC
LIMIT 25;

-- more consise query

SELECT 
    skills.skill_id,
    skills.skills,
    COUNT(skills_job.job_id) AS demand_count,
    ROUND(AVG(jobs.salary_year_avg), 0) AS average_salary

FROM job_postings_fact AS jobs

INNER JOIN skills_job_dim as skills_job ON jobs.job_id = skills_job.job_id
INNER JOIN skills_dim as skills ON skills_job.skill_id = skills.skill_id
WHERE 
    job_title_short = 'Data Analyst' 
    AND salary_year_avg is NOT NULL 
    AND job_work_from_home = TRUE

GROUP BY skills.skill_id
HAVING COUNT(skills_job.job_id) > 10
ORDER BY 
        average_salary DESC,
        demand_count DESC
LIMIT 25;