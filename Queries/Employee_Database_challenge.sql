--Retirement titles table
 select e.emp_no,e.first_name,e.last_name,t.title,t.from_date,t.to_date
 into retirement_titles from
(select * from employees)e
join
(select emp_no,title,from_date,to_date from titles)t
on e.emp_no = t.emp_no
where e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
order by e.emp_no

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no)emp_no, 
first_name,
last_name,
title
into unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

--Number of employees retiring by title

select count(*),title into retiring_titles from unique_titles group by title

--Creation of mentorship_eligibility

select distinct on (emp_no)e.emp_no,first_name,last_name,e.birth_date,de.from_date,de.to_Date,t.title
into mentorship_eligibility
from 
(select emp_no,birth_date,first_name,last_name from employees where birth_date between '1965-01-01'and '1965-12-31')e
join
(select * from dept_emp where to_date = '9999-01-01')de
on e.emp_no = de.emp_no
join
(select * from titles) t
on de.emp_no = t.emp_no 
order by e.emp_no,de.to_date desc
