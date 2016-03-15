SELECT	DISTINCT first_name
FROM employees
WHERE first_name LIKE '%oo%';

SELECT emp_no, first_name, last_name
FROM employees
WHERE emp_no BETWEEN 10026 AND 10082;

SELECT emp_no, title
FROM titles
WHERE to_date IS NOT NULL;

SELECT first_name, last_name
FROM employees
WHERE last_name = 'Herber'
OR last_name = 'Dredge'
OR last_name = 'Lipner'
OR last_name = 'Baek';

SELECT DISTINCT last_name
FROM employees
WHERE last_name IN ('Herber', 'Dredge', 'Lipner', 'Baek');
