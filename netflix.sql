--pick database
USE db;

-- Create table netflix
CREATE TABLE netflix (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    type VARCHAR(50),
    genres VARCHAR(255),
    releaseYear INT,
    imdbId VARCHAR(20),
    imdbRating VARCHAR(100),
    imdbNumVotes INT,
    availableCountries TEXT
);


/*
Cleaning the netflix Dataset in SQL
*/
 Select * from db.netflix ;

 
-- Replace NULL values to avoid missing data in analysis.
UPDATE db.netflix SET title = 'Unknown Title' WHERE title IS NULL;
UPDATE db.netflix SET type = 'Unknown' WHERE type IS NULL;
UPDATE db.netflix SET genres = 'Unknown Genre' WHERE genres IS NULL;
UPDATE db.netflix SET releaseYear = 0 WHERE releaseYear IS NULL;
UPDATE db.netflix SET imdbId = 'No ID' WHERE imdbId IS NULL;
UPDATE db.netflix SET imdbRating = 0 WHERE imdbRating IS NULL;
UPDATE db.netflix SET imdbNumVotes = 0 WHERE imdbNumVotes IS NULL;
UPDATE db.netflix SET availableCountries = 'Unknown' WHERE availableCountries IS NULL;

-- Convert title of genres to lower case for consistency
UPDATE db.netflix
SET genres = LOWER(genres), type = LOWER(type);

-- Convert Titles to Proper Case:
UPDATE db.netflix
SET title = CONCAT(UPPER(LEFT(title, 1)), LOWER(SUBSTRING(title, 2)))
WHERE title IS NOT NULL;

-- 

/*
Exploratory Analysis Queries 
*/

-- 1. Top 5 Genres by Content Volume
SELECT genres, COUNT(*) AS genre_count
FROM db.netflix
GROUP BY genres
ORDER BY genre_count DESC
LIMIT 5;

-- 2. Top 5 Most Rated Movies on Netflix
SELECT title, releaseYear, imdbRating
FROM db.netflix
WHERE type = 'movie' AND imdbRating IS NOT NULL
ORDER BY imdbRating DESC
LIMIT 5;

-- 3. Content Production Trend Over Time (2000 to 2024)
SELECT releaseYear, COUNT(*) AS content_count
FROM db.netflix
where releaseYear > 2000
GROUP BY releaseYear
ORDER BY releaseYear ASC;

-- 3. Top 5 highest rating content
SELECT  title, type, releaseYear, imdbRating
FROM db.netflix
where type = 'movie'
ORDER BY imdbRating DESC
LIMIT 5;

-- 4. Top 5 Genres with the Highest Average IMDb Ratings
SELECT genres, AVG(imdbRating) AS avg_rating
FROM db.netflix
WHERE imdbRating IS NOT NULL
GROUP BY genres
ORDER BY avg_rating DESC
LIMIT 5;

-- 5. Distribution of Content Types (Movies vs. TV Shows)
SELECT type, COUNT(*) AS content_count
FROM db.netflix
GROUP BY type
ORDER BY content_count DESC;

-- 6. Top 5 Genres with the Most Movies
SELECT genres, COUNT(*) AS genre_count
FROM db.netflix
WHERE type = 'movie'
GROUP BY genres
ORDER BY genre_count DESC
LIMIT 5;

-- 7. Top 5 Tv series with the Most Movies
SELECT genres, COUNT(*) AS genre_count
FROM db.netflix
WHERE type = 'tv'
GROUP BY genres
ORDER BY genre_count DESC
LIMIT 5;

-- 8. Number of Content Added Each Year (2000 to 2024)
SELECT releaseYear, COUNT(*) AS content_count
FROM db.netflix
where releaseYear > 2000
GROUP BY releaseYear
ORDER BY releaseYear ASC;

-- 9. Number of Movies and TV Shows Released Each Year (2000 to 2024)
SELECT releaseYear, type, COUNT(*) AS content_count
FROM db.netflix
where releaseYear > 2000
GROUP BY releaseYear, type
ORDER BY releaseYear ASC, content_count DESC;

-- 10. Genres with Lowest Average IMDb Ratings
SELECT genres, AVG(imdbRating) AS avg_rating
FROM db.netflix
where releaseYear > 1990
GROUP BY genres
ORDER BY avg_rating ASC;

-- 11. -- Movies Available in the United States
SELECT title, releaseYear, imdbAverageRating, availableCountries
FROM db.netflix
WHERE availableCountries LIKE '%US%'
ORDER BY releaseYear DESC;
