select
job_title_short,
salary_year_avg
from job_postings_fact
where job_location='Anywhere'
and lower(job_title_short) like '%data%analyst%'
and salary_year_avg is not null
order by salary_year_avg desc