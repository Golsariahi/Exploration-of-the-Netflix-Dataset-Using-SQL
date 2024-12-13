/*

Cleaning the Dataset in SQL

*/
 
-- Convert 'date_added' to a standardized format (MM-DD-YYYY) for consistency.
UPDATE db.netflix
SET date_added = DATE_FORMAT(STR_TO_DATE(date_added, '%d-%b-%y'), '%b-%d-%Y')
WHERE date_added IS NOT NULL;

-- Convert 'duration' to numeric by removing 'min' for easier sorting and analysis.
UPDATE db.netflix
SET duration = CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED)
WHERE duration LIKE '% min';

--  Replace NULL values in key columns with 'Unknown' to avoid missing data in analysis.
UPDATE db.netflix SET director = 'Unknown' WHERE director IS NULL;
UPDATE db.netflix SET date_added = 'Unknown' WHERE date_added IS NULL;
UPDATE db.netflix SET release_year = '0' WHERE release_year IS NULL;
UPDATE db.netflix SET rating = 'Unknown' WHERE rating IS NULL;
UPDATE db.netflix SET duration = 'Unknown' WHERE duration IS NULL;
UPDATE db.netflix SET cast = 'Unknown' WHERE cast IS NULL;
UPDATE db.netflix SET country = 'Unknown' WHERE country IS NULL;
UPDATE db.netflix SET listed_in = 'Unknown' WHERE listed_in IS NULL;
UPDATE db.netflix SET description = 'Unknown' WHERE description IS NULL;

-- remove duplicates
ALTER TABLE db.netflix ADD COLUMN temp_id INT AUTO_INCREMENT PRIMARY KEY;

DELETE t1
FROM db.netflix t1
INNER JOIN db.netflix t2
ON t1.title = t2.title
WHERE t1.temp_id > t2.temp_id;


/*

Exploratory Analysis Queries

*/

-- Retrieve all titles directed by a specific director ('Andy Devonshire').
Select title, Director
from db.netflix
where director = "Andy Devonshire";

-- Query to find Content from USA
SELECT title, country
FROM db.netflix
WHERE country = 'United States';

-- Query to find movies released in 2021 produced in the USA
SELECT title, release_year, country
FROM db.netflix
WHERE country = 'United States' and release_year= 2021;

-- Query to count the total number of entries for each content type (e.g., Movie, TV Show).
Select Type, count(*) as total
from db.netflix
group by type
ORDER BY total DESC;

-- Query to find most common release year 
SELECT release_year, COUNT(*) AS total
FROM db.netflix
GROUP BY release_year
ORDER BY total DESC
LIMIT 1;

-- Query to find the number of movies released each year.
SELECT type, release_year, COUNT(*) AS total
FROM db.netflix
where type = "movie"
GROUP BY release_year
ORDER BY total DESC;

-- Retrieve the movie with the longest duration in the dataset.
SELECT title, duration
FROM db.netflix
WHERE type = 'Movie'
ORDER BY duration DESC
LIMIT 1;

-- Retrieve the movie with the shortest duration in the dataset.
SELECT title, duration
FROM db.netflix
WHERE type = 'Movie'
ORDER BY duration ASC
LIMIT 1; 

-- Identify the most common content type (Movie or TV Show) produced in each country.
SELECT country, type, COUNT(*) AS total
FROM db.netflix
GROUP BY country, type
ORDER BY country, total DESC;


--  Top 10 directors in 2024
SELECT director, COUNT(*) AS total_movies
FROM db.netflix
WHERE type = 'Movie' AND release_year = 2024
GROUP BY director
ORDER BY total_movies DESC
limit 10;

--  Query to find movies listed in the 'Kids' category
SELECT title, release_year, country, listed_in
FROM db.netflix
WHERE listed_in Like '%Kid%'
ORDER BY release_year ASC;

-- Find the top 3 countries with the highest number of Netflix content titles.
SELECT country, COUNT(*) AS total_movies 
FROM db.netflix 
GROUP BY country 
ORDER BY total_movies DESC
limit 4;

-- Get insights into the average movie length for different genres
SELECT listed_in, AVG(duration) AS avg_duration 
FROM db.netflix 
WHERE type = 'Movie' AND duration != 'Unknown' 
GROUP BY listed_in 
ORDER BY avg_duration DESC;

-- Top 3 genres in general
SELECT listed_in , COUNT(*) AS content_count 
FROM db.netflix 
GROUP BY listed_in  
ORDER BY content_count DESC
limit 3;


-- Query to find the top 3 genres in the USA
SELECT listed_in, COUNT(*) AS content_count 
FROM db.netflix 
WHERE country = 'United States' 
GROUP BY listed_in 
ORDER BY content_count DESC
LIMIT 3;
