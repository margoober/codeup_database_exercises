USE codeup_test_db;

SELECT "1. Albums released after 1991:" AS "";

SELECT name AS "", artist AS "", release_date AS "" FROM albums WHERE release_date >= 1991 ORDER BY release_date;

SELECT "2. Albums with punkish genre:" AS "";

SELECT name AS "", artist AS "", release_date AS "", genre AS "" FROM albums WHERE genre like '%punk%' ORDER BY genre, release_date;

SELECT "3. Albums by Jonathan Richman" AS "";

SELECT name AS "", artist AS "", release_date AS "" FROM albums WHERE artist LIKE "%Richman%" OR artist LIKE "%Modern Lovers%" ORDER BY release_date;
/*DELETE FROM albums WHERE artist like '%Richman%';*/