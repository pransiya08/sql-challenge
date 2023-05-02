DROP TABLE Departments;
CREATE TABLE Departments (
	dept_no VARCHAR(255) NOT NULL,
	dept_name VARCHAR(255) NOT NULL,	
	PRIMARY KEY (dept_no)
);

SELECT * FROM Departments;

DROP TABLE Titles;
CREATE TABLE Titles (
	title_id VARCHAR(255) NOT NULL,
	title VARCHAR(255) NOT NULL,
	PRIMARY KEY (title_id)	
);

SELECT * FROM Titles;

ALTER DATABASE "employee_sql.db" SET DATESTYLE TO "ISO, MDY";
SHOW DATESTYLE;

DROP TABLE Employees;
CREATE TABLE Employees (
	emp_no INTEGER NOT NULL,
	emp_title_id VARCHAR(255) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL,
	sex VARCHAR(255) NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES Titles(title_id)	
);

SELECT * FROM Employees;

DROP TABLE DepartmentEmployees;
CREATE TABLE DepartmentEmployees (
	emp_no INTEGER NOT NULL,
	dept_no VARCHAR(255) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
	PRIMARY KEY (emp_no, dept_no)	
);

SELECT * FROM DepartmentEmployees;

DROP TABLE DepartmentManagers;
CREATE TABLE DepartmentManagers (
	dept_no VARCHAR(255) NOT NULL,
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
	PRIMARY KEY (dept_no, emp_no)	
);

SELECT * FROM DepartmentManagers;

DROP TABLE Salaries;
CREATE TABLE Salaries (
	emp_no INTEGER NOT NULL,
	salary INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

SELECT * FROM Salaries;