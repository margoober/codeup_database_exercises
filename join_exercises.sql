/*INNER JOIN*/
SELECT users.name AS user_name, roles.name AS role_name
FROM users
JOIN roles ON users.role_id = roles.id;

/*LEFT JOIN*/
SELECT users.name AS user_name, roles.name AS role_name
FROM users
LEFT JOIN roles ON users.role_id = roles.id;

/*RIGHT JOIN*/
SELECT users.name AS user_name, roles.name AS role_name
FROM users
RIGHT JOIN roles ON users.role_id = roles.id;


TRUNCATE users;
INSERT INTO users (NAME, email, role_id) VALUES
('bob', 'bob@example.com', 1),
('joe', 'joe@example.com', 2),
('sally', 'sally@example.com', 3),
('adam', 'adam@example.com', 3),
('jane', 'jane@example.com', NULL),
('mike', 'mike@example.com', NULL),
('Margot', 'amcmahon@nes.ru', 2),
('Tanya', 'tanyabrassie@utexas.edu', 2),
('Val', 'valpal@hotmail.val', 2),
('Agnes', 'agnes@agnes.agnes', NULL);

SELECT *
FROM users;

SELECT users.name, users.`email`, roles.name AS role_id
FROM users
JOIN roles ON roles.id = users.role_id;

SELECT users.name, users. email, roles.name AS role_id
FROM users
LEFT JOIN roles ON roles.id = users.role_id;

/*
Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries. Use count and the appropriate join type to get a list of roles along with the number of users that has the role. Hint: You will also need to use group by in the query.
*/