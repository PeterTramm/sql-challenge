-- Create entity tables

-- Creating title table
CREATE TABLE title(
	title_id VARCHAR(5) PRIMARY KEY NOT NULL,
	title VARcHAR(255)
);

SELECT *
FROM title

-- Creating employees table
CREATE TABLE employees(
	emp_no INT PRIMARY KEY NOT NULL,
	emp_title_id VARCHAR(5),
	birth_date DATE,
	first_name VARCHAR(255),
	last_name VARCHAR(255),
	sex VARCHAR(1),
	hire_date DATE,
	FOREIGN KEY (emp_title_id) REFERENCES title(title_id)
);

SELECT *
FROM employees

-- Creating salaries table 
CREATE TABLE salaries(
	emp_no INT PRIMARY KEY NOT NULL,
	salary INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT *
FROM salaries

-- Create departments table
DROP TABLE departments;
CREATE TABLE departments(
	dept_no VARCHAR(4) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(255)
);

SELECT * 
FROM departments

-- Create dept_emp table 
CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR(4) NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

SELECT *
FROM dept_emp;

-- Create dept_manager table
DROP TABLE dept_manager;
CREATE TABLE dept_manager(
	dept_no VARCHAR(4) NOT NULL,
	emp_no INT NOT NULL,
	PRIMARY KEY (dept_no,emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * 
FROM dept_manager