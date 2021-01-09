SELECT first_name,last_name
into retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') and 
(hire_date between '1985-01-01' and '1988-12-31');

-- Current employees who are eligible to retire

select x.*,y.to_date 
into current_emp 
from (select * from retirement_info)x
left join
dept_emp y
on x.emp_no = y.emp_no
where y.to_Date = '9999-01-01'

--Retirement eligible employee count by department

select dept_no,count(*)number_of_employees
into emp_count_by_dept
from
(select q.dept_no,p.emp_no from(select * from current_emp)p
join
dept_emp q
on p.emp_no = q.emp_no)x
group by dept_no

SELECT e.emp_no,
    e.first_name,
e.last_name,
    e.gender,
    s.salary,
    de.to_date
INTO emp_info
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
     AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
    AND (de.to_date = '9999-01-01');


-- List of managers per department
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        ce.last_name,
        ce.first_name,
        dm.from_date,
        dm.to_date
INTO manager_info
FROM dept_manager AS dm
    INNER JOIN departments AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN current_emp AS ce
        ON (dm.emp_no = ce.emp_no);


--Info aof employees working in the Sales and Development departments who are retiring
select a.emp_no,a.first_name,a.last_name,c.dept_name from
(select * from retirement_info)a
join
(select * from dept_emp)b
on a.emp_no = b.emp_no
join
departments c
on b.dept_no = c.dept_no
where c.dept_name in('Sales','Development')