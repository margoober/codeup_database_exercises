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
SELECT COUNT(gender), `gender`
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
group BY `gender`;

/*E last names*/
SELECT concat(first_name, ' ', last_name)
FROM employees
WHERE last_name LIKE "E%" AND first_name LIKE "E%";

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
WHERE last_name LIKE 'E%' OR last_name LIKE '%e'
ORDER BY `emp_no` DESC;

SELECT first_name, last_name
FROM employees
WHERE last_name LIKE 'E%' AND last_name LIKE '%e';

/*hired in the 90s, born on Chrimbus with KHUN BERNINI first!*/
SELECT concat(first_name, ' ', last_name),
          birth_date,
          `hire_date`,
          DATEDIFF(curdate(), hire_date) AS 'total days IN HECK.'
FROM employees
WHERE `hire_date` LIKE '199%' AND `birth_date` LIKE '%12-25'
ORDER BY `hire_date` DESC, `birth_date` DESC;

/*who's worked in this hellscape the longest? who is therefore most despondent?*/
SELECT concat(first_name, ' ', last_name) AS 'unfortunate soul', datediff(curdate(), hire_date) AS 'DAYS SPENT SLAVING IN THIS HELLSCAPE OF A WORKPLACE'
FROM `employees`
ORDER BY datediff(curdate(), hire_date) DESC;
;

/*q but no qu names, ordered by firstname/lastname duplicates. TWINSIES!!!!!!*/
SELECT concat(first_name, ' ', last_name) AS 'First Name Last Name',
COUNT(*)
FROM employees
WHERE `last_name` LIKE '%q%' AND `last_name` NOT LIKE '%qu%'
GROUP BY concat(`first_name`, ' ', `last_name`)
ORDER BY COUNT(*) DESC;

/*FiNd TOP TeN ToTaL tWiNzZz*/
SELECT concat(first_name, ' ', last_name) AS 'Person', count(*)
FROM employees
GROUP BY concat(first_name, ' ', last_name)
ORDER BY count(*) DESC
LIMIT 10 OFFSET 0;

SELECT first_name, count(first_name)
FROM employees
GROUP BY first_name
ORDER BY count(first_name) DESC;