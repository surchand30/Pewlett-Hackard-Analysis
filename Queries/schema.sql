-- Creating tables for PH-EmployeeDB
CREATE TABLE departments (
dept_no VARCHAR(4) NOT NULL,
dept_name VARCHAR(40) NOT NULL,
PRIMARY KEY (dept_no),
UNIQUE (dept_name)
);

CREATE TABLE employees (
emp_no INT NOT NULL,
birth_date DATE NOT NULL,
first_name VARCHAR NOT NULL,
last_name VARCHAR NOT NULL,
gender VARCHAR NOT NULL,
hire_date DATE NOT NULL,
PRIMARY KEY (emp_no)
);

create table titles(
emp_no int not null,
title varchar(40) not null,
from_date date not null,
to_date date not null,
foreign key(emp_no) references employees(emp_no),
primary key (emp_no,title,from_date,to_date));

create table dept_emp(
emp_no int not null,
dept_no varchar(4) not null,
from_date date not null,
to_date date not null,
foreign key(emp_no) references employees(emp_no),
foreign key(dept_no) references departments(dept_no),
primary key (emp_no,dept_no));

create table salaries(
emp_no int not null,
salary int not null,
from_date date not null,
to_date date not null,
foreign key(emp_no) references employees(emp_no),
primary key (emp_no));

CREATE TABLE dept_manager (
dept_no VARCHAR(4) NOT NULL,
emp_no INT NOT NULL,
from_date DATE NOT NULL,
to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);



Foreign Key	public.titles.titles_emp_no_fkey	auto
Primary Key	public.titles_pkey	auto
--command " "\\copy public.titles (emp_no, title, from_date, to_date) FROM 'C:/Users/surek/Desktop/bootcamp/Pewlett-Hackard-Analysis/Data/titles.csv' DELIMITER ',' CSV HEADER QUOTE '\"' ESCAPE '''';""