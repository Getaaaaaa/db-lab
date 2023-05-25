CREATE TABLE countries(
COUNTRY_ID varchar(2),
COUNTRY_NAME varchar(40),
REGION_ID decimal(10,0)
);
CREATE TABLE Countries(
);
-- ERROR: ОШИБКА: отношение "countries" уже существует

CREATE TABLE dup_countries(
country_id varchar(2),
country_name varchar(100),
region_id decimal(10,0)
);

CREATE TABLE IF NOT EXISTS dup_countries
AS SELECT * FROM Countries;

CREATE TABLE IF NOT EXISTS Countries(
    );

CREATE TABLE IF NOT EXISTS jobs (
JOB_ID varchar(10) NOT NULL ,
JOB_TITLE varchar(35) NOT NULL,
MIN_SALARY decimal(6,0),
MAX_SALARY decimal(6,0)
CHECK(MAX_SALARY<=25000)
);


CREATE TABLE IF NOT EXISTS countries (
COUNTRY_ID varchar(2),
COUNTRY_NAME varchar(40)
CHECK(COUNTRY_NAME IN('Italy','India','China')) ,
REGION_ID decimal(10,0));

CREATE TABLE IF NOT EXISTS countries(
COUNTRY_ID varchar(2) NOT NULL UNIQUE DEFAULT '',
COUNTRY_NAME varchar(40) DEFAULT NULL,
REGION_ID decimal(10,0) NOT NULL,
PRIMARY KEY (COUNTRY_ID,REGION_ID));

CREATE TABLE IF NOT EXISTS jobs (
JOB_ID varchar(10) NOT NULL UNIQUE,
JOB_TITLE varchar(35) NOT NULL DEFAULT ' ',
MIN_SALARY decimal(6,0) DEFAULT 8000,
MAX_SALARY decimal(6,0) DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS countries (
COUNTRY_ID varchar(2) NOT NULL UNIQUE DEFAULT '',
COUNTRY_NAME varchar(40) DEFAULT NULL,
REGION_ID decimal(10,0) NOT NULL,
PRIMARY KEY (COUNTRY_ID));


CREATE TABLE IF NOT EXISTS countries (
COUNTRY_ID varchar(2) NOT NULL UNIQUE PRIMARY KEY,
COUNTRY_NAME varchar(40) NOT NULL,
REGION_ID decimal(10,0) NOT NULL
);


CREATE TABLE IF NOT EXISTS countries (
COUNTRY_ID varchar(2) NOT NULL UNIQUE DEFAULT '',
COUNTRY_NAME varchar(40) DEFAULT NULL,
REGION_ID decimal(10,0) NOT NULL,
PRIMARY KEY (COUNTRY_ID,REGION_ID));

CREATE TABLE IF NOT EXISTS job_history
(
    EMPLOYEE_ID   decimal(6, 0) NOT NULL,
    START_DATE    date          NOT NULL,
    END_DATE      date          NOT NULL,
    JOB_ID        varchar(10)   NOT NULL,
    DEPARTMENT_ID decimal(4, 0) NOT NULL,
    INDEX         int           not null
    -- FOREIGN KEY int not null
);

create table departments
(
    DEPARTMENT_ID int not null,
    MANAGER_ID    int not null
);
CREATE TABLE IF NOT EXISTS employees (
EMPLOYEE_ID decimal(6,0) NOT NULL PRIMARY KEY,
FIRST_NAME varchar(20) DEFAULT NULL,
LAST_NAME varchar(25) NOT NULL,
EMAIL varchar(25) NOT NULL,
PHONE_NUMBER varchar(20) DEFAULT NULL,
HIRE_DATE date NOT NULL,
JOB_ID varchar(10) NOT NULL,
SALARY decimal(8,2) DEFAULT NULL,
COMMISSION_PCT decimal(2,2) DEFAULT NULL,
MANAGER_ID decimal(6,0) DEFAULT NULL,
DEPARTMENT_ID decimal(4,0) DEFAULT NULL,
FOREIGN KEY(DEPARTMENT_ID,MANAGER_ID)
REFERENCES departments(DEPARTMENT_ID,MANAGER_ID)
);


CREATE TABLE IF NOT EXISTS employees (
EMPLOYEE_ID decimal(6,0) NOT NULL PRIMARY KEY,
FIRST_NAME varchar(20) DEFAULT NULL,
LAST_NAME varchar(25) NOT NULL,
EMAIL varchar(25) NOT NULL,
PHONE_NUMBER varchar(20) DEFAULT NULL,
HIRE_DATE date NOT NULL,
JOB_ID varchar(10) NOT NULL,
SALARY decimal(8,2) DEFAULT NULL,
COMMISSION_PCT decimal(2,2) DEFAULT NULL,
MANAGER_ID decimal(6,0) DEFAULT NULL,
DEPARTMENT_ID decimal(4,0) DEFAULT NULL,
department_name int not null,
FOREIGN KEY(DEPARTMENT_ID)
REFERENCES departments(DEPARTMENT_ID),
FOREIGN KEY(JOB_ID)
REFERENCES jobs(JOB_ID));

CREATE TABLE IF NOT EXISTS employees (
EMPLOYEE_ID decimal(6,0) NOT NULL PRIMARY KEY,
FIRST_NAME varchar(20) DEFAULT NULL,
LAST_NAME varchar(25) NOT NULL,
EMAIL varchar(25) NOT NULL,
PHONE_NUMBER varchar(20) DEFAULT NULL,
HIRE_DATE date NOT NULL,
JOB_ID varchar(10) NOT NULL,
SALARY decimal(8,2) DEFAULT NULL,
COMMISSION_PCT decimal(2,2) DEFAULT NULL,
MANAGER_ID decimal(6,0) DEFAULT NULL,
DEPARTMENT_ID decimal(4,0) DEFAULT NULL,
FOREIGN KEY(DEPARTMENT_ID,MANAGER_ID)
REFERENCES departments(DEPARTMENT_ID,MANAGER_ID)
);

CREATE TABLE IF NOT EXISTS employees (
EMPLOYEE_ID decimal(6,0) NOT NULL PRIMARY KEY,
FIRST_NAME varchar(20) DEFAULT NULL,
LAST_NAME varchar(25) NOT NULL,
EMAIL varchar(25) NOT NULL,
PHONE_NUMBER varchar(20) DEFAULT NULL,
HIRE_DATE date NOT NULL,
JOB_ID varchar(10) NOT NULL,
SALARY decimal(8,2) DEFAULT NULL,
COMMISSION_PCT decimal(2,2) DEFAULT NULL,
MANAGER_ID decimal(6,0) DEFAULT NULL,
DEPARTMENT_ID decimal(4,0) DEFAULT NULL,
FOREIGN KEY(DEPARTMENT_ID)
REFERENCES departments(DEPARTMENT_ID),
FOREIGN KEY(JOB_ID)
REFERENCES jobs(JOB_ID)
);

CREATE TABLE IF NOT EXISTS employees (
EMPLOYEE_ID decimal(6,0) NOT NULL PRIMARY KEY,
FIRST_NAME varchar(20) DEFAULT NULL,
LAST_NAME varchar(25) NOT NULL,
JOB_ID varchar(10) NOT NULL,
SALARY decimal(8,2) DEFAULT NULL,
FOREIGN KEY(JOB_ID)
REFERENCES jobs(JOB_ID));


CREATE TABLE IF NOT EXISTS employees (
EMPLOYEE_ID decimal(6,0) NOT NULL PRIMARY KEY,
FIRST_NAME varchar(20) DEFAULT NULL,
LAST_NAME varchar(25) NOT NULL,
JOB_ID varchar(10) NOT NULL,
SALARY decimal(8,2) DEFAULT NULL,
FOREIGN KEY(JOB_ID)
REFERENCES jobs(JOB_ID));

ALTER TABLE countries RENAME TO country_new;
create table locations

(
    col int not null,
    location_id int not null
);
ALTER TABLE locations
ADD region_id INT;

ALTER TABLE locations
ALTER region_id TYPE text;

ALTER TABLE locations
ADD city INT;

-- Cначала создадим столбец
ALTER TABLE locations
ADD  state_province varchar(25);


ALTER TABLE locations
ADD PRIMARY KEY(location_id);


ALTER TABLE locations
ADD PRIMARY KEY(location_id,region_id);

--

ALTER TABLE job_history
ADD CONSTRAINT fk_job_id
FOREIGN KEY (job_id)
REFERENCES jobs(job_id);


ALTER TABLE job_history
ADD FOREIGN KEY(job_id)
REFERENCES jobs(job_id);

--2

--3

UPDATE employees SET email='not available';


UPDATE employees
SET email='Not Available',
Commission_pct=0.10
WHERE Department_id=110;

UPDATE employees
SET email='not available'
WHERE department_id=80 AND commission_pct<.20;


UPDATE employees
SET email='not available'
WHERE department_id=(
SELECT department_id
FROM departments
WHERE department_name='Accounting');

UPDATE employees SET SALARY = 8000 WHERE employee_id = 105 AND salary < 5000;

UPDATE employees SET JOB_ID= 'SH_CLERK'
WHERE employee_id=118
AND department_id=30
AND NOT JOB_ID LIKE 'SH%';

 UPDATE EMPLOYEES
SET SALARY=SALARY*1.25
WHERE EMPLOYEE_id='40';

 UPDATE EMPLOYEES
SET SALARY=SALARY*1.15
WHERE EMPLOYEE_id='90';

 UPDATE EMPLOYEES
SET SALARY=SALARY*1.1
WHERE EMPLOYEE_id='110';