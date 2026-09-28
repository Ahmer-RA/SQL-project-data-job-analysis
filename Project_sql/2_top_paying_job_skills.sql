-- Qestion: What skills are required for top paying Data Analytics jobs?
--     use top-paying Data Analytics jobs from first query.
--     Add specific skills required for these jobs.
--     why? It provides detialed look into which skills are required for hight paying Data Analytics job and 
--     job seekers can develop those skills to target those jobs.


WITH top_paying_jobs AS(
SELECT  
    job_id,
    job_title_short,
    salary_year_avg,
    job_country,
    c.name AS company_name


from job_postings_fact 
LEFT JOIN company_dim AS c ON job_postings_fact.company_id = c.company_id
WHERE 
    job_title_short = 'Data Analyst' 
    AND salary_year_avg IS NOT NULL 
    AND job_location = 'Anywhere'
ORDER BY salary_year_avg DESC 
LIMIT
10
)
SELECT 
    top_paying_jobs.*,
    skills
    
FROM top_paying_jobs
LEFT JOIN skills_job_dim ON top_paying_jobs.job_id =  skills_job_dim.job_id
LEFT JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY 
    salary_year_avg DESC



/* 
Top Demanded Skills
1. The "Big Three" Dominate: SQL is the most highly requested skill, appearing 
in 8 out of the 10 job listings. It is closely followed by Python (7 jobs) and Tableau (6 jobs).

2. Statistical & Data Manipulation Tools: R is explicitly required in 4 of the roles. 
Pandas (a Python library) and Excel are each explicitly mentioned 3 times.

3. Cloud & Data Warehousing: Snowflake (3 jobs) is the most prominent data warehousing platform
among these high-tier roles, beating out cloud platforms like Azure and AWS (2 jobs each), as well as Oracle (2 jobs).

4.Collaboration & Version Control: High-paying roles heavily index on collaborative engineering 
environments, with Bitbucket, Gitlab, Atlassian, and Confluence each appearing twice.


[
  {
    "job_id": 226942,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "650000.0",
    "job_country": "India",
    "company_name": "Mantys",
    "skills": null
  },
  {
    "job_id": 547382,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "336500.0",
    "job_country": "United States",
    "company_name": "Meta",
    "skills": null
  },
  {
    "job_id": 552322,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "job_country": "United States",
    "company_name": "AT&T",
    "skills": "sql"
  },
  {
    "job_id": 552322,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "job_country": "United States",
    "company_name": "AT&T",
    "skills": "python"
  },
  {
    "job_id": 552322,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "job_country": "United States",
    "company_name": "AT&T",
    "skills": "r"
  },
  {
    "job_id": 552322,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "job_country": "United States",
    "company_name": "AT&T",
    "skills": "azure"
  },
  {
    "job_id": 552322,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "job_country": "United States",
    "company_name": "AT&T",
    "skills": "databricks"
  },
  {
    "job_id": 552322,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "job_country": "United States",
    "company_name": "AT&T",
    "skills": "aws"
  },
  {
    "job_id": 552322,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "job_country": "United States",
    "company_name": "AT&T",
    "skills": "pandas"
  },
  {
    "job_id": 552322,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "job_country": "United States",
    "company_name": "AT&T",
    "skills": "pyspark"
  },
  {
    "job_id": 552322,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "job_country": "United States",
    "company_name": "AT&T",
    "skills": "jupyter"
  },
  {
    "job_id": 552322,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "job_country": "United States",
    "company_name": "AT&T",
    "skills": "excel"
  },
  {
    "job_id": 552322,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "job_country": "United States",
    "company_name": "AT&T",
    "skills": "tableau"
  },
  {
    "job_id": 552322,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "job_country": "United States",
    "company_name": "AT&T",
    "skills": "power bi"
  },
  {
    "job_id": 552322,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "job_country": "United States",
    "company_name": "AT&T",
    "skills": "powerpoint"
  },
  {
    "job_id": 99305,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "232423.0",
    "job_country": "United States",
    "company_name": "Pinterest Job Advertisements",
    "skills": "sql"
  },
  {
    "job_id": 99305,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "232423.0",
    "job_country": "United States",
    "company_name": "Pinterest Job Advertisements",
    "skills": "python"
  },
  {
    "job_id": 99305,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "232423.0",
    "job_country": "United States",
    "company_name": "Pinterest Job Advertisements",
    "skills": "r"
  },
  {
    "job_id": 99305,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "232423.0",
    "job_country": "United States",
    "company_name": "Pinterest Job Advertisements",
    "skills": "hadoop"
  },
  {
    "job_id": 99305,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "232423.0",
    "job_country": "United States",
    "company_name": "Pinterest Job Advertisements",
    "skills": "tableau"
  },
  {
    "job_id": 1021647,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "217000.0",
    "job_country": "United States",
    "company_name": "Uclahealthcareers",
    "skills": "sql"
  },
  {
    "job_id": 1021647,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "217000.0",
    "job_country": "United States",
    "company_name": "Uclahealthcareers",
    "skills": "crystal"
  },
  {
    "job_id": 1021647,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "217000.0",
    "job_country": "United States",
    "company_name": "Uclahealthcareers",
    "skills": "oracle"
  },
  {
    "job_id": 1021647,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "217000.0",
    "job_country": "United States",
    "company_name": "Uclahealthcareers",
    "skills": "tableau"
  },
  {
    "job_id": 1021647,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "217000.0",
    "job_country": "United States",
    "company_name": "Uclahealthcareers",
    "skills": "flow"
  },
  {
    "job_id": 168310,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "205000.0",
    "job_country": "United States",
    "company_name": "SmartAsset",
    "skills": "sql"
  },
  {
    "job_id": 168310,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "205000.0",
    "job_country": "United States",
    "company_name": "SmartAsset",
    "skills": "python"
  },
  {
    "job_id": 168310,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "205000.0",
    "job_country": "United States",
    "company_name": "SmartAsset",
    "skills": "go"
  },
  {
    "job_id": 168310,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "205000.0",
    "job_country": "United States",
    "company_name": "SmartAsset",
    "skills": "snowflake"
  },
  {
    "job_id": 168310,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "205000.0",
    "job_country": "United States",
    "company_name": "SmartAsset",
    "skills": "pandas"
  },
  {
    "job_id": 168310,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "205000.0",
    "job_country": "United States",
    "company_name": "SmartAsset",
    "skills": "numpy"
  },
  {
    "job_id": 168310,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "205000.0",
    "job_country": "United States",
    "company_name": "SmartAsset",
    "skills": "excel"
  },
  {
    "job_id": 168310,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "205000.0",
    "job_country": "United States",
    "company_name": "SmartAsset",
    "skills": "tableau"
  },
  {
    "job_id": 168310,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "205000.0",
    "job_country": "United States",
    "company_name": "SmartAsset",
    "skills": "gitlab"
  },
  {
    "job_id": 731368,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189309.0",
    "job_country": "United States",
    "company_name": "Inclusively",
    "skills": "sql"
  },
  {
    "job_id": 731368,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189309.0",
    "job_country": "United States",
    "company_name": "Inclusively",
    "skills": "python"
  },
  {
    "job_id": 731368,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189309.0",
    "job_country": "United States",
    "company_name": "Inclusively",
    "skills": "azure"
  },
  {
    "job_id": 731368,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189309.0",
    "job_country": "United States",
    "company_name": "Inclusively",
    "skills": "aws"
  },
  {
    "job_id": 731368,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189309.0",
    "job_country": "United States",
    "company_name": "Inclusively",
    "skills": "oracle"
  },
  {
    "job_id": 731368,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189309.0",
    "job_country": "United States",
    "company_name": "Inclusively",
    "skills": "snowflake"
  },
  {
    "job_id": 731368,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189309.0",
    "job_country": "United States",
    "company_name": "Inclusively",
    "skills": "tableau"
  },
  {
    "job_id": 731368,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189309.0",
    "job_country": "United States",
    "company_name": "Inclusively",
    "skills": "power bi"
  },
  {
    "job_id": 731368,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189309.0",
    "job_country": "United States",
    "company_name": "Inclusively",
    "skills": "sap"
  },
  {
    "job_id": 731368,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189309.0",
    "job_country": "United States",
    "company_name": "Inclusively",
    "skills": "jenkins"
  },
  {
    "job_id": 731368,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189309.0",
    "job_country": "United States",
    "company_name": "Inclusively",
    "skills": "bitbucket"
  },
  {
    "job_id": 731368,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189309.0",
    "job_country": "United States",
    "company_name": "Inclusively",
    "skills": "atlassian"
  },
  {
    "job_id": 731368,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189309.0",
    "job_country": "United States",
    "company_name": "Inclusively",
    "skills": "jira"
  },
  {
    "job_id": 731368,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189309.0",
    "job_country": "United States",
    "company_name": "Inclusively",
    "skills": "confluence"
  },
  {
    "job_id": 310660,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189000.0",
    "job_country": "United States",
    "company_name": "Motional",
    "skills": "sql"
  },
  {
    "job_id": 310660,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189000.0",
    "job_country": "United States",
    "company_name": "Motional",
    "skills": "python"
  },
  {
    "job_id": 310660,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189000.0",
    "job_country": "United States",
    "company_name": "Motional",
    "skills": "r"
  },
  {
    "job_id": 310660,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189000.0",
    "job_country": "United States",
    "company_name": "Motional",
    "skills": "git"
  },
  {
    "job_id": 310660,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189000.0",
    "job_country": "United States",
    "company_name": "Motional",
    "skills": "bitbucket"
  },
  {
    "job_id": 310660,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189000.0",
    "job_country": "United States",
    "company_name": "Motional",
    "skills": "atlassian"
  },
  {
    "job_id": 310660,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189000.0",
    "job_country": "United States",
    "company_name": "Motional",
    "skills": "jira"
  },
  {
    "job_id": 310660,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189000.0",
    "job_country": "United States",
    "company_name": "Motional",
    "skills": "confluence"
  },
  {
    "job_id": 1749593,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "186000.0",
    "job_country": "United States",
    "company_name": "SmartAsset",
    "skills": "sql"
  },
  {
    "job_id": 1749593,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "186000.0",
    "job_country": "United States",
    "company_name": "SmartAsset",
    "skills": "python"
  },
  {
    "job_id": 1749593,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "186000.0",
    "job_country": "United States",
    "company_name": "SmartAsset",
    "skills": "go"
  },
  {
    "job_id": 1749593,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "186000.0",
    "job_country": "United States",
    "company_name": "SmartAsset",
    "skills": "snowflake"
  },
  {
    "job_id": 1749593,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "186000.0",
    "job_country": "United States",
    "company_name": "SmartAsset",
    "skills": "pandas"
  },
  {
    "job_id": 1749593,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "186000.0",
    "job_country": "United States",
    "company_name": "SmartAsset",
    "skills": "numpy"
  },
  {
    "job_id": 1749593,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "186000.0",
    "job_country": "United States",
    "company_name": "SmartAsset",
    "skills": "excel"
  },
  {
    "job_id": 1749593,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "186000.0",
    "job_country": "United States",
    "company_name": "SmartAsset",
    "skills": "tableau"
  },
  {
    "job_id": 1749593,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "186000.0",
    "job_country": "United States",
    "company_name": "SmartAsset",
    "skills": "gitlab"
  },
  {
    "job_id": 387860,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "184000.0",
    "job_country": "United States",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "sql"
  },
  {
    "job_id": 387860,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "184000.0",
    "job_country": "United States",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "python"
  },
  {
    "job_id": 387860,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "184000.0",
    "job_country": "United States",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "r"
  }
]
*/
