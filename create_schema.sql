CREATE TABLE globant.jobs (
  id INTEGER,
  job STRING
);

CREATE TABLE globant.departments (
  id INTEGER,
  department STRING
);

CREATE TABLE globant.hired_employees (
  id INTEGER,
  name STRING,
  datetime STRING,
  department_id INTEGER,
  job_id INTEGER
);
