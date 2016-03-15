USE codeup_test_db;
SELECT "1. All albums & sales in hundred thousands:" AS "";

UPDATE albums
SET sales_in_millions = sales_in_millions * 10
WHERE id >= 0;

SELECT name AS "", artist AS "", sales_in_millions AS "" FROM albums;

SELECT "2. All albums pre-1880:" AS "";

UPDATE albums
SET release_date = release_date - 100
WHERE release_date < 1980;

SELECT name AS "", artist AS "", release_date AS "" FROM albums WHERE release_date < 1980;

SELECT "3. All Talking Heads albums:" AS "";

UPDATE albums
SET artist = "Talking Heads"
WHERE artist = "The Talking Heads"; 

SELECT name AS "", artist AS "" FROM albums WHERE artist = "Talking Heads";


