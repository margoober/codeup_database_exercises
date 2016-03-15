SELECT last_name
FROM `employees`
GROUP BY last_name DESC
LIMIT 10;

/*Born on Christmas, hired in the 90s, oldest employees hired the latest -- first five. What a tall order!!!*/
SELECT first_name, last_name, birth_date, hire_date
FROM employees
WHERE birth_date LIKE '%12-25' AND `hire_date` LIKE '199%'
ORDER BY birth_date ASC, hire_date DESC
LIMIT 5;

/*TENTH BATCH: Born on Christmas, hired in the 90s, oldest employees hired the latest -- first five. What a tall order!!!*/
SELECT first_name, last_name, birth_date, hire_date
FROM employees
WHERE birth_date LIKE '%12-25' AND `hire_date` LIKE '199%'
GROUP BY birth_date ASC, hire_date DESC
LIMIT 5 OFFSET 45;