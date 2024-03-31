
-- Number of employees hired for each job and department in 2021 divided by quarter. The
-- table must be ordered alphabetically by department and job.

with
source as (
    SELECT hired.id,
        case when substr(hired.datetime, 0,10)<>""
              then EXTRACT(QUARTER FROM date(substr(hired.datetime, 0,10)))
              else null
        end as quarter,
        job.job,
        dep.department
    FROM `globant-test-418611.globant.hired_employees`hired
    left join `globant-test-418611.globant.departments` dep on hired.department_id = dep.id
    left join `globant-test-418611.globant.jobs` job on hired.job_id = job.id
    WHERE date(substr(hired.datetime, 0,10)) BETWEEN '2021-01-01' AND '2021-12-31'
          AND substr(hired.datetime, 0,10)<>""
)

SELECT  DEPARTMENT,
        JOB,
        COUNT(CASE WHEN QUARTER = 1 THEN 1 ELSE NULL END) AS Q1,
        COUNT(CASE WHEN QUARTER = 2 THEN 1 ELSE NULL END) AS Q2,
        COUNT(CASE WHEN QUARTER = 3 THEN 1 ELSE NULL END) AS Q3,
        COUNT(CASE WHEN QUARTER = 4 THEN 1 ELSE NULL END) AS Q4
FROM SOURCE
GROUP BY 1,2
ORDER BY 1,2


