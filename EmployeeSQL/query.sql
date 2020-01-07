-- salary by employee
SELECT  emp.emp_no,
        emp.last_name,
        emp.first_name,
        emp.gender,
        sal.salary
FROM employees as emp
    LEFT JOIN salaries as sal
    ON (emp.emp_no=sal.emp_no)
ORDER BY emp.emp_no

-- employees hired in 1986
SELECT  emp_no,
        last_name,
        first_name
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'

-- managers of each department
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        e.last_name,
        e.first_name,
        dm.from_date,
        dm.to_date
FROM dept_manager as dm
    INNER JOIN departments as d
        ON (dm.dept_no=d.dept_no)
    INNER JOIN employees as e
        ON (dm.emp_no=e.emp_no);
		
-- department of each employee
SELECT	dept_emp.emp_no,
		employees.last_name,
		employees.first_name,
		departments.dept_name
FROM dept_emp
	JOIN employees
		ON dept_emp.emp_no = employees.emp_no
	JOIN departments
		ON dept_emp.dept_no = departments.dept_no;
		
-- employeees with first name 'Hurcules' and last name begin with 'B'
SELECT	first_name, last_name
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- employees in Sales Department
SELECT	dept_emp.emp_no,
		employees.last_name,
		employees.first_name,
		departments.dept_name
FROM dept_emp
	JOIN employees
		ON dept_emp.emp_no = employees.emp_no
	JOIN departments
		ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

-- employees in Sales Department and Development Department
SELECT	dept_emp.emp_no,
		employees.last_name,
		employees.first_name,
		departments.dept_name
FROM dept_emp
	JOIN employees
		ON dept_emp.emp_no = employees.emp_no
	JOIN departments
		ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' 
OR departments.dept_name = 'Development';

-- frequency count of employee last names
SELECT	last_name,
COUNT(last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;
