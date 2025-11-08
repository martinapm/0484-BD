DROP SCHEMA IF EXISTS hr;

CREATE SCHEMA hr COLLATE = utf8_general_ci;

USE hr;


create table COUNTRIES
  (
    country_id    char (2)      not null,
    country_name  varchar (40),
    region_id     int (11)
  );

alter table COUNTRIES
  add constraint country_c_id_pk primary key (country_id);


create table DEPARTMENTS
  (
    department_id   int           not null,
    department_name varchar (30)  not null,
    manager_id      int (11),
    location_id     int (11)
  );

alter table DEPARTMENTS
  add constraint dept_id_pk primary key (department_id);


create table EMPLOYEES
  (
    employee_id         int (6)       not null,
    first_name          varchar (20),
    last_name           varchar (25)  not null,
    email               varchar (25)  not null,
    phone_number        varchar (20),
    hire_date           date          not null,
    job_id              varchar (10)  not null,
    salary              decimal (8,2),
    commission_pct      decimal (2,2),
    manager_id          int (6) ,
    department_id       int (4)
  );

alter table EMPLOYEES
  add constraint emp_emp_id_pk primary key (employee_id);

alter table EMPLOYEES
  add constraint emp_email_uk unique (email);


create table JOBS
  (
    job_id      varchar (10)    not null,
    job_title   varchar (35)    not null,
    min_salary  decimal (8, 0),
    max_salary  decimal (8, 0)
  );

alter table JOBS
  add constraint job_id_pk primary key (job_id);


create table JOB_HISTORY
  (
    employee_id     int (6)       not null,
    start_date      date          not null,
    end_date        date          not null,
    job_id          varchar (10)  not null,
    department_id   int (4)
  );

alter table JOB_HISTORY
  add constraint jhist_emp_id_st_date_pk primary key (employee_id, start_date);


create table LOCATIONS
  (
    location_id     int (4)         not null,
    street_address  varchar (40),
    postal_code     varchar (12),
    city            varchar (30)    not null,
    state_province  varchar (25),
    country_id      char (2)
  );

alter table LOCATIONS
  add constraint loc_id_pk primary key (location_id);


create table REGIONS
  (
    region_id   int           not null,
    region_name varchar (25)
  );

alter table REGIONS
  add constraint reg_id_pk primary key (region_id);


alter table COUNTRIES
  add constraint countr_reg_fk foreign key (region_id) references REGIONS (region_id);

alter table DEPARTMENTS
  add constraint dept_loc_fk foreign key (location_id) references LOCATIONS (location_id);

alter table DEPARTMENTS
  add constraint dept_mgr_fk foreign key (manager_id) references EMPLOYEES (employee_id);

alter table EMPLOYEES
  add constraint emp_dept_fk foreign key (department_id) references DEPARTMENTS (department_id);

alter table EMPLOYEES
  add constraint emp_job_fk foreign key (job_id) references JOBS (job_id);

alter table EMPLOYEES
  add constraint emp_manager_fk foreign key (manager_id) references EMPLOYEES (employee_id);

alter table JOB_HISTORY
  add constraint jhist_dept_fk foreign key (department_id) references DEPARTMENTS (department_id);

alter table JOB_HISTORY
  add constraint jhist_emp_fk foreign key (employee_id) references EMPLOYEES (employee_id);

alter table JOB_HISTORY
  add constraint jhist_job_fk foreign key (job_id) references JOBS (job_id);

alter table LOCATIONS
  add constraint loc_c_id_fk foreign key (country_id) references COUNTRIES (country_id);