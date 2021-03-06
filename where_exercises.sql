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

/*Irena, Vidya, Maya*/
SELECT first_name, last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya');

/*E last names*/
SELECT first_name, last_name
FROM employees
WHERE last_name LIKE "E%";

/*born in the 90s*/
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN "1990-01-01" AND "1999-12-31";

/*born on Christmas*/
SELECT first_name, last_name, birth_date
FROM employees
WHERE birth_date LIKE "%12-25";

/*last names contain a Q*/
SELECT first_name, last_name
FROM employees
WHERE last_name LIKE '%q%';

/*women born on my birthday!*/
SELECT first_name, last_name, birth_date, gender
FROM employees
WHERE birth_date LIKE '%10-14'
AND gender = 'F'
ORDER BY birth_date DESC;

SELECT first_name, last_name
FROM employees
ORDER BY length(first_name) DESC, length(last_name) DESC;

SELECT first_name, last_name
FROM employees
WHERE (first_name = 'Vidya' OR
   first_name = 'Maya'
   OR first_name = 'Irena')
AND
(gender = "M");

/*E last names*/
SELECT first_name, last_name
FROM employees
WHERE last_name LIKE 'E%' OR last_name LIKE '%e';

SELECT first_name, last_name
FROM employees
WHERE last_name LIKE 'E%' AND last_name LIKE '%e';

SELECT first_name, last_name, birth_date
FROM employees
WHERE `hire_date` LIKE '199%' AND `birth_date` LIKE '%12-25';

SELECT first_name, last_name
FROM employees
WHERE `last_name` LIKE '%q%' AND `last_name` NOT LIKE '%qu%';


