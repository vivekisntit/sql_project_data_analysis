select
skills_dim.skills,
-- skills_dim.skill_id,
count(skills_job_dim.skill_id) as freq,
round(avg(job_postings_fact.salary_year_avg),0) as avg_salary
from skills_job_dim
inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
inner join job_postings_fact on skills_job_dim.job_id = job_postings_fact.job_id
where lower(job_title_short) like '%data%analyst%' 
and salary_year_avg is not null
and job_location='Anywhere'
group by skills_dim.skill_id order by freq desc
