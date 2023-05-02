-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT Employees.emp_no,
	Employees.last_name,
	Employees.first_name,
	Employees.sex,
	Salaries.salary
FROM Employees
INNER JOIN Salaries
ON Employees.emp_no = Salaries.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name,
	last_name,
	hire_date
FROM Employees
WHERE DATE_PART('year', hire_date) = 1986;

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT DepartmentManagers.dept_no,
	Departments.dept_name,
	DepartmentManagers.emp_no,
	Employees.last_name,
	Employees.first_name
FROM DepartmentManagers
LEFT JOIN Departments
ON DepartmentManagers.dept_no = Departments.dept_no
LEFT JOIN Employees
ON DepartmentManagers.emp_no = Employees.emp_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT Employees.emp_no,
	Employees.last_name,
	Employees.first_name,
	Departments.dept_name
FROM Employees
INNER JOIN DepartmentEmployees AS Emp_Dept
ON Employees.emp_no = Emp_Dept.emp_no
LEFT JOIN Departments
ON Emp_Dept.dept_no = Departments.dept_no;

-- List the first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name,
	last_name,
	sex
FROM Employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'; 

-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT emp_no,
	last_name,
	first_name
FROM Employees
WHERE emp_no IN
	(
	SELECT emp_no
	FROM DepartmentEmployees
	WHERE dept_no IN
		(
		SELECT dept_no
		FROM Departments
		WHERE dept_name = 'Sales'
		)
	);

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT Employees.emp_no,
	Employees.last_name,
	Employees.first_name,
	Departments.dept_name
FROM Employees
INNER JOIN DepartmentEmployees AS Emp_Dept
ON Employees.emp_no = Emp_Dept.emp_no
LEFT JOIN Departments
ON Emp_Dept.dept_no = Departments.dept_no
WHERE Departments.dept_name = 'Sales' OR Departments.dept_name = 'Development';

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name,
	COUNT(last_name) as "Count"
FROM Employees
GROUP BY last_name
ORDER BY "Count" DESC;