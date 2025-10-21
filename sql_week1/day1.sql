show databases;

use affiliates;

create table employees (
employee_id int,
name varchar(100),
department varchar(100)
);

insert into employees(employee_id,name,department)
values
(001,"Alice","Mathematics"),
(002,"Bob","Physics"),
(003,"Jane","English");

select * from employees;

select name from employees;

alter table employees
Add column age int;

update employees
set age=23
where employee_id = 001;

set SQL_SAFE_UPDATES = 0;

alter table employees
drop column age;

delete from employees;

drop table employees;


create table employees (
emp_id int not null,
name varchar(100) not null,
department varchar(50)
);

insert into employees (emp_id,name,department)
values
(1,"Jane","Math");

select * from employees

