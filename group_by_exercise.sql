SELECT DISTINCT `title`
FROM titles
ORDER BY title ASC;

SELECT last_name
FROM employees
WHERE last_name LIKE 'E%' AND last_name LIKE '%e'
GROUP BY last_name ASC;

/*find unique combos of first_name last_name of last_names that start and end with E*/
SELECT first_name, last_name
FROM employees
WHERE last_name LIKE 'E%' AND last_name LIKE '%e'
GROUP BY first_name, last_name;

/*Find unique last names with q  but not qu*/
SELECT last_name
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%'
GROUP BY last_name;