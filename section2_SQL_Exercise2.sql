
-- List of ids, name and number of employees hired of each department that hired more
-- employees than the mean of employees hired in 2021 for all the departments, ordered
-- by the number of employees hired (descending).



SELECT 
        dep.id,
        dep.department,
        count(*) as hired
    FROM `globant-test-418611.globant.hired_employees`hired
    left join `globant-test-418611.globant.departments` dep on hired.department_id = dep.id
    left join `globant-test-418611.globant.jobs` job on hired.job_id = job.id
    GROUP BY 1,2
    having count(*) > (SELECT AVG(CNT) AS AVG_CNT
                              FROM(
                                    SELECT DEPARTMENT_ID,COUNT(ID) AS CNT
                                    FROM `globant-test-418611.globant.hired_employees`hired
                                    where date(substr(hired.datetime, 0,10)) BETWEEN '2021-01-01' AND '2021-12-31'
                                          AND substr(hired.datetime, 0,10)<>""
                                          group by 1
                              ))
    order by 3 desc