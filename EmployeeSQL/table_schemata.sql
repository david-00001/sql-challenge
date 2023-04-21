/* Create Tables */
CREATE TABLE departments(
	dept_no VARCHAR(10) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(50)
);

CREATE TABLE titles(
	title_id VARCHAR(10) PRIMARY KEY NOT NULL,
	title VARCHAR(50)
);

CREATE TABLE employees(
	emp_no INT PRIMARY KEY NOT NULL,
	emp_title_id VARCHAR(10),
	birth_date DATE,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	sex CHAR(1),
	hire_date DATE,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE salaries(
	emp_no INT PRIMARY KEY NOT NULL,
	salary INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR(10) NOT NULL,
	PRIMARY KEY (emp_no,dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager(
	dept_no VARCHAR(10) NOT NULL,
	emp_no INT NOT NULL,
	PRIMARY KEY (dept_no,emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

/* Drop Tables if needed */
DROP TABLE departments;
DROP TABLE titles;
DROP TABLE employees;
DROP TABLE salaries;
DROP TABLE dept_emp;
DROP TABLE dept_manager;