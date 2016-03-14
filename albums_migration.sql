USE codeup_test_db;

DROP TABLE IF EXISTS albums;

CREATE TABLE albums (
 	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
 	artist CHAR(100) NOT NULL,
 	name CHAR (100) NOT NULL,
 	release_date YEAR(4) NOT NULL,
 	sales_in_millions FLOAT(10, 2) NOT NULL,
 	genre CHAR(100) NOT NULL,
 	PRIMARY KEY (id)
);