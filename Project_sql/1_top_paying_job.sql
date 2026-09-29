-- -- Qestion: What are the top-paying Data Analytics jobs?
-- _ Identify top 10 data analytics job paying remotely
-- _ Focus on jobs paying specific salary(remove nulls)
-- _ why? highlight the top paying opportunities for Data Analystics, offering insights to emplyment contract


SELECT  
    job_id,
    job_title_short,
    c.name AS company_name,
    salary_year_avg,
    job_schedule_type,
    job_location,
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