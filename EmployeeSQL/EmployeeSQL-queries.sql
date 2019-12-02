SELECT *
FROM departments;

-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM employees
inner join salaries on
employees.emp_no = salaries.emp_no;

-- 2. List employees who were hired in 1986.

SELECT employees.emp_no, employees.first_name, employees.last_name, EXTRACT (YEAR FROM hire_date) AS YEAR
FROM employees
WHERE hire_date > '1985-12-31' AND hire_date < '1987-01-01';

-- 3. List the manager of each department with the following information:
--    department number, department name, the manager's employee number
--    last name, first name, and start and end employment dates

SELECT m.dept_no,
		d.dept_name,
		m.emp_no,
		e.last_name,
		e.first_name,
		m.from_date,
		m.to_date
FROM dept_manager as m
join departments as d on
m.dept_no = d.dept_no
join employees as e on
m.emp_no = e.emp_no;

-- 4. List the department of each employee with the following information: 
--    employee number, last name, first name, and department name.

SELECT e.emp_no,
		e.last_name,
		e.first_name,
		d.dept_name
FROM employees as e
join dept_emp as de on
e.emp_no = de.emp_no
join departments as d on
de.dept_no = d.dept_no;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."

SELECT e.emp_no,
		e.first_name,
		e.last_name
FROM employees as e
WHERE first_name = 'Hercules' and last_name like 'B%';

-- 6. List all employees in the Sales department, including their 
--    employee number, last name, first name, and department name.

SELECT e.emp_no,
		e.last_name,
		e.first_name,
		d.dept_name
FROM employees as e
join dept_emp as de on
e.emp_no = de.emp_no
join departments as d on
de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';


-- 7. List all employees in the Sales and Development departments
--    including their employee number, last name, first name, and department name.

SELECT e.emp_no,
		e.last_name,
		e.first_name,
		d.dept_name
FROM employees as e
join dept_emp as de on
e.emp_no = de.emp_no
join departments as d on
de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' or d.dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, 
--    i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name) AS "employee count"
FROM employees
GROUP BY last_name
ORDER BY "employee count" DESC;














