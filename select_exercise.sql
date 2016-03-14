USE codeup_test_db;
SELECT "Broadcast's albums include:" AS "";
SELECT name AS "" FROM albums WHERE artist = "Broadcast";
SELECT "The Modern Lovers' self-title album was released in:" AS "";
SELECT release_date AS "" FROM albums WHERE name = "The Modern Lovers";
SELECT "The genre of Life's A Riot With Spy vs. Spy by Billy Bragg is:" AS "";
SELECT genre AS "" FROM albums WHERE artist = "Billy Bragg";
SELECT "The following albums were released in the 90s:" AS "";
SELECT name AS "" FROM albums WHERE release_date BETWEEN 1990 AND 2000;
SELECT "The following albums sold more than 2 million copies" AS "";
SELECT name AS "" FROM albums WHERE sales_in_millions >= 2;
SELECT "Here are some post-punk albums:" AS "";
SELECT name AS "", artist AS "" FROM albums WHERE genre = "post-punk";