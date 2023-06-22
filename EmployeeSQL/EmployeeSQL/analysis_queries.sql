/* 1.List the following details of each employee: employee number, last name, 
first name, sex, and salary.*/

SELECT
	e.emp_no, e.last_name, e.first_name, e.sex
	,(SELECT s.salary FROM salaries AS s 
	  WHERE e.emp_no = s.emp_no) AS salary
	FROM employees AS e;

/*2.List first name, last name, and hire date for employees who were hired 
in 1986.*/

SELECT
	e.last_name, e.first_name, e.hire_date
	FROM employees AS e
	WHERE DATE_PART('year', e.hire_date) = 1986;
		
		

/*3.List the manager of each department with the following information: 
department number, department name, the manager's employee number, last name, 
first name.*/

SELECT
	d.dept_no, d.dept_name, e.emp_title_id, e.last_name, e.first_name
	FROM dept_emp as de	LEFT JOIN employees as e
	ON e.emp_no = de.emp_no

	LEFT JOIN departments as d
	ON d.dept_no = de.dept_no

	WHERE e.emp_title_id LIKE 'm%';

/*4.List the department of each employee with the following information: 
employee number, last name, first name, and department name.*/

	SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
	FROM dept_emp as de
	LEFT JOIN employees as e
	ON e.emp_no = de.emp_no
	LEFT JOIN departments as d
	ON d.dept_no = de.dept_no;
		
	
/*5.List first name, last name, and sex for employees whose first name is 
"Hercules" and last names begin with "B."*/

SELECT
	e.first_name, e.last_name, e.sex
	FROM	employees AS e
	WHERE	e.first_name = 'Hercules'
	
	AND e.last_name LIKE 'B%';
		

/*6.List all employees in the Sales department, including their employee number, 
last name, first name, and department name.*/

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
	FROM dept_emp as de
	LEFT JOIN employees as e
	ON e.emp_no = de.emp_no
	LEFT JOIN departments as d
	ON d.dept_no = de.dept_no
	
	WHERE d.dept_name = 'Sales';
	

/*7.List all employees in the Sales and Development departments, including 
their employee number, last name, first name, and department name.*/

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
	FROM dept_emp as de
	LEFT JOIN employees as e
	ON e.emp_no = de.emp_no
	LEFT JOIN departments as d
	ON d.dept_no = de.dept_no
	
	WHERE d.dept_name IN ('Sales', 'Development');

/*8.In descending order, list the frequency count of employee last names, 
i.e., how many employees share each last name.*/

SELECT
	e.last_name, COUNT(e.last_name) AS frequency
	FROM	employees AS e
	GROUP BY e.last_name
	ORDER BY frequency DESC;