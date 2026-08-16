with top_jobs as
(
    select
    job_id,
    job_title,
    salary_year_avg
    from job_postings_fact
    where job_location='Anywhere'
    and lower(job_title_short) like '%data%analyst%'
    and salary_year_avg is not null
    order by salary_year_avg desc
    limit 10
)
select top_jobs.*,
skills_dim.skills as skills_for_job
from top_jobs
inner join skills_job_dim on top_jobs.job_id = skills_job_dim.job_id
inner join skills_dim on skills_job_dim.skill_id=skills_dim.skill_id
limit 10

select
job_id,
count(job_id) as unique_skills_for_job
from skills_job_dim
group by job_id order by unique_skills_for_job desc


