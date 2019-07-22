select * from departments;
select * from dept_emp;
select * from dept_manager;
select * from employees;
select * from salaries;

-- 1.List the following details of each employee: employee number, last name, first name, gender, and salary. 
select e.emp_no as employee_number, e.last_name, e.first_name, e.gender, s.salary 
from employees as e 
INNER JOIN salaries as s ON
e.emp_no = s.emp_no;	

-- 2.List employees who were hired in 1986.
--select extract(year from hire_date) from employees

select * from employees
where extract(year from hire_date) = '1986';

-- 3.List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name, 
--and start and end employment dates.

select m.dept_no as department_number, d.dept_name as department_name, m.emp_no as employee_number, e.last_name, 
e.first_name, m.from_date as start_date, m.to_date as employment_date 
from dept_manager as m 
INNER JOIN departments as d ON m.dept_no = d.dept_no
INNER JOIN employees as e ON 
m.emp_no = e.emp_no;

-- 4.List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

select e.emp_no as employee_number, e.last_name, e.first_name, d.dept_name as department_name 
from employees as e 
INNER JOIN dept_emp as de ON e.emp_no = de.emp_no
INNER JOIN departments as d ON d.dept_no = de.dept_no;


-- 5.List all employees whose first name is "Hercules" and last names begin with "B."
 select * from employees
 where first_name = 'Hercules'
 and last_name like 'B%'
 ;

-- 6.List all employees in the Sales department, including their employee number, last name, first name, 
-- and department name.

select e.emp_no as employee_number, e.last_name, e.first_name, d.dept_name as department_name 
from employees as e 
INNER JOIN dept_emp as de ON e.emp_no = de.emp_no
INNER JOIN departments as d ON d.dept_no = de.dept_no
where dept_name = 'Sales';

-- 7.List all employees in the Sales and Development departments, including their employee number,
--last name, first name, and department name.


select e.emp_no as employee_number, e.last_name, e.first_name, d.dept_name as department_name 
from employees as e 
INNER JOIN dept_emp as de ON e.emp_no = de.emp_no
INNER JOIN departments as d ON d.dept_no = de.dept_no
where dept_name in ('Sales','Development');

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

