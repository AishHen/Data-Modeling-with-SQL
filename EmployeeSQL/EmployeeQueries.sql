
-------- ALL QUERIES --------

-- General Query of Tables
SELECT * FROM dept_manager;
SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM titles;
SELECT * FROM salaries;
SELECT * FROM dept_emp;


-- Data Analysis Query 1
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
JOIN salaries s
ON (e.emp_no = s.emp_no);


-- Data Analysis Query 2
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01'  
AND '1986-12-31'
ORDER BY hire_date;


-- Data Analysis Query 3
SELECT dm.manager, d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM employees e
JOIN titles t ON (e.emp_title_id = t.title_id),
JOIN dept_manager dm ON (e.emp_no = dm.emp_no),
JOIN departments d ON (d.dept_no = dm.dept_no),
WHERE t.title = 'Manager';

-- Data Analysis Query 4


-- Data Analysis Query 5
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';


-- Data Analysis Query 6
	-- Determine dept_no for Sales
SELECT * FROM departments
WHERE dept_name = 'Sales';

	-- Main Query for all employees working in Sales
SELECT emp_no, last_name, first_name
FROM employees
WHERE emp_no IN
(
	SELECT emp_no
	FROM dept_emp
	WHERE dept_no = 'd007');

-- Data Analysis Query 7
	-- Determine dept_no for Development
SELECT * FROM departments
WHERE dept_name = 'Development';

	-- Main Query for all employees working in Sales or Development
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de ON (e.emp_no = de.emp_no)
JOIN departments d ON (de.dept_no = d.dept_no)

WHERE de.dept_no IN
(
	SELECT dept_no
	FROM departments
	WHERE dept_no = 'd005' OR dept_no = 'd007'
);


-- Data Analysis Query 8
SELECT COUNT(last_name), last_name 
FROM employees
GROUP BY last_name
ORDER BY last_name DESC;
