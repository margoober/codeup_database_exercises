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
ORDER BY `DAYS SPENT SLAVING IN THIS HELLSCAPE OF A WORKPLACE` DESC;
;

/*q but no qu names, ordered by firstname/lastname duplicates. TWINSIES!!!!!!*/
SELECT concat(first_name, ' ', last_name) AS `First Name Last Name`,
COUNT(*)
FROM employees
WHERE `last_name` LIKE '%q%'
          AND `last_name` NOT LIKE '%qu%'
GROUP BY `First Name Last Name`
ORDER BY COUNT(*) DESC;

/*FiNd TOP TeN ToTaL tWiNzZz*/
SELECT concat(first_name, ' ', last_name) AS 'Person', count(*)
FROM employees
GROUP BY concat(first_name, ' ', last_name)
ORDER BY count(*) DESC
LIMIT 10 OFFSET 0;

SELECT first_name, count(first_name) AS `first_name_count`
FROM employees
GROUP BY first_name
ORDER BY `first_name_count` DESC;

SELECT concat(`emp_no`, ' - ', `last_name`, ', ', `first_name`) AS full_name, `birth_date` AS `dobbles`
FROM employees
WHERE`emp_no` <= 10010
ORDER BY `dobbles`
LIMIT 10;

SHOW TABLES;
DESCRIBE `title`;

SELECT employees.emp_no, salary
FROM salaries s
INNER JOIN employees ON s.emp_no = employees.emp_no;

/*a join between employees and department manager*/
SELECT *
FROM employees e
INNER JOIN dept_manager m ON e.emp_no = m.emp_no;

/*a join between employees and titles*/
SELECT `last_name`, `title`
FROM `employees` e
INNER JOIN `titles` t ON e.emp_no = t.emp_no;

SELECT concat(e.first_name, ' ', e.last_name) AS full_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS de
ON de.emp_no = e.emp_no AND e.emp_no < 10011
JOIN departments AS d
ON d.dept_no = de.dept_no AND de.to_date = '9999-01-01';

SELECT concat(first_name, " ", last_name), emp_no, hire_date 
FROM `employees`
WHERE last_name LIKE '%blick' AND first_name LIKE 'J%';



/*get the name of every department and its current manager
SELECT *
FROM departments
JOIN WITH dept manager on dept_no
JOIN WITH employees on empl_no
filter who are the CURRENT manager
*/
/*example*/
SELECT CONCAT(e.first_name, ' ', e.`last_name`) AS full_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS de
ON de.emp_no = e.`emp_no`
JOIN departments AS d
ON d.dept_no = de.dept_no
WHERE de.to_date = '9999-01-01' AND e.emp_no = 10001;

SELECT concat(e.first_name, ' ', e.last_name) AS full_name, t.title, d.dept_name, concat ('$', s.salary), dm.`to_date`
FROM departments AS d
JOIN dept_manager AS dm ON dm.dept_no = d.dept_no
JOIN employees AS e ON e.emp_no = dm.emp_no
JOIN salaries AS s ON s.emp_no = e.emp_no
JOIN titles AS t ON t.emp_no = e.emp_no
WHERE dm.to_date > now()
AND s.to_date > now()
AND t.to_date > now();

/*Sub-queries*/
SELECT *
FROM employees
WHERE emp_no IN (
          SELECT `emp_no`
          FROM dept_manager
          WHERE emp_no IN (
                    SELECT emp_no
                    FROM salaries
                    WHERE salary > 60000
                    AND to_date > now()
          )
          AND to_date > now()
);

SELECT *
FROM employees
WHERE EXISTS (
          SELECT emp_no
          FROM titles
          WHERE emp_no IN (
                    SELECT emp_no
                    FROM salaries
                    WHERE salary > 140000
          )
);

/*employees with the same hire date as emp_no 101010*/
SELECT *
FROM `employees`
WHERE `hire_date` IN (
          SELECT `hire_date`
          FROM `employees`
          WHERE `emp_no` = 101010
); /*nice job mar!*/

/*all titles held by Aamods*/
SELECT title
FROM titles
WHERE emp_no IN (
          SELECT emp_no
          FROM employees
          WHERE first_name = "Aamod"
);
/*all CURRENT female department managers*/
SELECT concat (first_name, " ", last_name), emp_no
FROM `employees`
WHERE emp_no IN (
          SELECT emp_no
          FROM dept_manager
          WHERE emp_no IN (
                    SELECT emp_no
                    FROM employees
                    WHERE gender = "F"
          )
          AND to_date > now()
);