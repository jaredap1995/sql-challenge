DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
    dept_no VARCHAR(128) PRIMARY KEY,
    dept_name VARCHAR(255) NOT NULL
);

CREATE TABLE titles (
    title_id VARCHAR(10) UNIQUE NOT NULL,
    title VARCHAR(50),
    PRIMARY KEY (title_id)
);

CREATE TABLE employees (
    emp_no INTEGER PRIMARY KEY,
    emp_title_id VARCHAR(10) REFERENCES titles(title_id) ON DELETE CASCADE,
    birth_date DATE,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    sex VARCHAR(1),
    hire_date DATE
);

CREATE TABLE salaries (
    emp_no INTEGER REFERENCES employees(emp_no) ON DELETE CASCADE,
    salary INTEGER,
    PRIMARY KEY (emp_no)
);

CREATE TABLE dept_emp (
    emp_no INTEGER REFERENCES employees(emp_no) ON DELETE CASCADE,
    dept_no VARCHAR(128) REFERENCES departments(dept_no) ON DELETE CASCADE,
    PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE dept_manager (
    dept_no VARCHAR(128) REFERENCES departments(dept_no) ON DELETE CASCADE,
    emp_no INTEGER REFERENCES employees(emp_no) ON DELETE CASCADE,
    PRIMARY KEY (dept_no, emp_no)
);
