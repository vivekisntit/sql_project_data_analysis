select
skills_dim.skills,
skills_dim.skill_id,
count(skills_job_dim.skill_id) as no_of_jobs_for_skill
from skills_job_dim
inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
inner join job_postings_fact on skills_job_dim.job_id = job_postings_fact.job_id
where lower(job_title_short) like '%data%analyst%'
and job_location='Anywhere'
group by skills_dim.skill_id order by no_of_jobs_for_skill desc
