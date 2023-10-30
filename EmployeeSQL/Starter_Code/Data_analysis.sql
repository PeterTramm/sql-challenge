-- Data Analysis 

-- 1. List the employee numbers, last name, first name, sex and Salary of each empolyee
SELECT e.emp_no, e.last_name,e.first_name,e.sex,s.Salary
FROM employees AS e
LEFT JOIN salaries AS s
on e.emp_no = s.emp_no;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name,last_name,hire_date
FROM employees
WHERE hire_date::text LIKE '1986%';

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT d.dept_no, d.dept_name, m.emp_no, e.first_name, e.last_name
FROM departments as d
LEFT JOIN dept_manager as m
ON d.dept_no = m.dept_no 
LEFT JOIN employees as e 
ON m.emp_no = e.emp_no;

-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT d.dept_no, d.emp_no, e.last_name,e.first_name, de.dept_name
FROM dept_emp as d
LEFT JOIN employees as e
ON d.emp_no = e.emp_no
LEFT JOIN departments as de
ON d.dept_no = de.dept_no;

-- 5. List the first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.
SELECT emp_no, first_name,last_name 
FROM employees
WHERE emp_no IN
	(SELECT emp_no
	FROM dept_emp
	WHERE dept_no IN
		(SELECT dept_no
		FROM departments
		WHERE dept_name = 'Sales'))

-- 7.List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT emp_no, first_name,last_name, dept_name
FROM employees, departments 
WHERE dept_name = 'Sales'
OR dept_name = 'Development'
ORDER BY emp_no;
	
-- 8.List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) AS Frequency
FROM employees
GROUP BY last_name
ORDER BY Frequency DESC