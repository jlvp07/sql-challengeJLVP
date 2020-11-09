-- 1- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
INNER JOIN salaries AS s ON
e.emp_no=s.emp_no;

-- 2- List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE date_part('year', hire_date) = 1986;

-- 3- List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.

SELECT d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM departments as d
  JOIN dept_manager as m 
    ON m.dept_no = d.dept_no
  JOIN employees as e
    ON m.emp_no = e.emp_no;

--4 - List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT  e.emp_no, e.last_name, e.first_name, d.dept_name
FROM departments as d
  JOIN dept_emp as de 
    ON de.dept_no = d.dept_no
  JOIN employees as e
    ON de.emp_no = e.emp_no;

-- 5 - List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' and 
LEFT(last_name, 1) = 'B';

-- 6 - List all employees in the Sales department, including their employee number, last name, first name, and department name

SELECT  e.emp_no, e.last_name, e.first_name, d.dept_name
FROM departments as d
  JOIN dept_emp as de 
    ON de.dept_no = d.dept_no
  JOIN employees as e
    ON de.emp_no = e.emp_no
WHERE d.dept_name = 'Sales';

-- 7 - List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT  e.emp_no, e.last_name, e.first_name, d.dept_name
FROM departments as d
  JOIN dept_emp as de 
    ON de.dept_no = d.dept_no
  JOIN employees as e
    ON de.emp_no = e.emp_no
WHERE d.dept_name = 'Sales' or d.dept_name ='Development';

-- 8 - In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name)
FROM employees 
GROUP BY  last_name
ORDER BY COUNT(last_name) DESC;



