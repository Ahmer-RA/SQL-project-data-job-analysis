-- Question: What are the top skills based on salary?
-- look at the average salary assosiate with that skill for data analyst jobs
-- focus on skill with specific salaries regardless of the location.
-- WHy? It identify how different skills impact salary level in Data Analyst roles so we can improve on those skills and target those jobs.

SELECT 
    skills,
    ROUND(AVG(salary_year_avg),0) AS avg_salary
FROM job_postings_fact

INNER JOIN  skills_job_dim  ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst' 
AND salary_year_avg IS NOT NULL AND job_work_from_home IS TRUE
GROUP BY skills
ORDER BY avg_salary DESC
LIMIT 25;
/*
Insights:
1.Big Data leads pay:** **PySpark** is the highest-paying skill at **$208,172**, 
  highlighting that distributed data processing offers the largest compensation premium.

2. DevOps overlap is lucrative:** Version control and CI/CD tools like **Bitbucket** ($189,155) and **GitLab** ($154,500) 
   reward analysts who work within software engineering environments.

3.Enterprise AI tops open-source ML:** Enterprise platforms like **Watson** ($160,515) and **DataRobot** ($155,486)
  pay significantly more than standard libraries like **Scikit-learn** ($125,781).


4.Python core is the high-earning baseline:** Tools like **Jupyter** ($152,777), **Pandas** ($151,821), 
  and **NumPy** ($143,513) anchor expected remote pay between $140k and $155k.

5. NoSQL beats relational DBs:** Specialized datastores like **Couchbase** ($160,515) and **Elasticsearch** ($145,000)
   out-earn traditional relational systems like **PostgreSQL** ($123,879).*/
   