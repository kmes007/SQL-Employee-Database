

--List the following details of each employee: employee number, 
--last name, first name, gender, and salary.
SELECT e.emp_no, 
	   e.last_name, 
	   e.first_name,
	   e.gender,
 	   s.salary
FROM employees e
LEFT JOIN salaries s
ON e.emp_no =s.emp_no

--List employees who were hired in 1986.
SELECT e.emp_no, 
	   e.last_name, 
	   e.first_name, 
 	   e.hire_date
FROM employees e
WHERE e.hire_date < '1987-01-01' AND 
 	  e.hire_date > '1985-12-31'
	  
-- List the manager of each department with the following 
--information: department number, department name, the 
--manager's employee number, last name, first name, and 
-- start and end employment dates.
SELECT 	d.dept_no,
		d.dept_name,
		dm.dept_no,
	   	dm.from_date,
	   	dm.to_date,
	   	e.emp_no,
	   	e.last_name,
		e.first_name
FROM departments d
LEFT JOIN dept_manager dm
	ON d.dept_no = dm.dept_no
LEFT JOIN employees e
	ON dm.emp_no = e.emp_no
ORDER BY 3,2,6,7,8;

-- List the department of each employee with the following 
-- information: employee number, last name, first name, and 
-- department name
SELECT e.emp_no,
	   e.last_name,
	   e.first_name,
	   d.dept_name
FROM employees e
LEFT JOIN dept_emp de
	ON e.emp_no = de.emp_no
LEFT JOIN departments d
	ON de.dept_no = d.dept_no

-- List all employees whose first name is "Hercules" and 
-- last names begin with "B."
SELECT e.last_name, e.first_name
FROM employees e
WHERE e.first_name = 'Hercules' AND
	  e.last_name LIKE 'B%';

-- List all employees in the Sales department, including their 
-- employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
LEFT JOIN dept_emp dm
	ON e.emp_no = dm.emp_no
LEFT JOIN departments d
	ON dm.dept_no = d.dept_no
WHERE dept_name = 'Sales';


--In descending order, list the frequency count of employee 
--last names, i.e., how many employees share each last name.

SELECT DISTINCT e.last_name, count(*) AS name_count
FROM employees e
GROUP BY 1
ORDER BY 2 DESC
 
 