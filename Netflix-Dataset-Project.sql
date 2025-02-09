-- Netflix Project Using SQL

-- Create Table
CREATE TABLE netflix_data(
            show_id  VARCHAR(5),
            type  VARCHAR(10),
            title  VARCHAR(250),
            director  VARCHAR(550),
            casts  VARCHAR(1050),
            country  VARCHAR(550),
            date_added  VARCHAR(55),
            release_year INT,
            rating  VARCHAR(15),
            duration  VARCHAR(15),
            listed_in  VARCHAR(250),
            description  VARCHAR(550)
);

-- Import the data and Check the data
SELECT * FROM Netflix_data;

-- Total Count of data
SELECT COUNT(*) FROM Netflix_data;


-- Data Analysis

-- Q.Show Only Movie Titles
SELECT * FROM Netflix_data
WHERE type = 'Movie';

-- Q.Find Shows Released After 2015
SELECT * FROM Netflix_data
WHERE release_year > 2015;

-- Q.Find All Shows from a Specific Country (e.g., India)
SELECT title, country FROM netflix_data 
WHERE country = 'India';

-- Q.Count Total Movies and TV Shows
SELECT type, COUNT(*) AS total_count 
FROM netflix_data 
GROUP BY type;

-- Q.Find the 5 Latest Added Show
SELECT title, date_added 
FROM netflix_data
WHERE date_added IS NOT NULL
ORDER BY date_added DESC
LIMIT 5;

-- Q.Retrieve Shows with a Specific Rating (e.g., 'PG-13')
SELECT * FROM Netflix_data
WHERE rating = 'PG-13';

-- Q.Get Shows Directed by 'Christopher Nolan'
SELECT * FROM Netflix_data
WHERE director = 'Christopher Nolan';

-- Q.Count the Number of Shows Per Country
SELECT country, COUNT(*) AS total_shows 
FROM Netflix_data 
GROUP BY country 
ORDER BY total_shows DESC;

-- Q.Find Movies Released Between 2015 and 2020
SELECT * FROM Netflix_data 
WHERE release_year BETWEEN 2015 and 2020;

-- Q.Find Shows with Multiple Directors
SELECT title, director FROM netflix_data 
WHERE director LIKE '%,%';

-- Business Problems & Solutions

-- Q1. Which country has the most Netflix content?
SELECT country, COUNT(*) AS total_shows 
FROM netflix_data 
WHERE country IS NOT NULL 
GROUP BY country 
ORDER BY total_shows DESC 
LIMIT 5;


-- Q2. Find the most common rating for movies and TV shows
SELECT type,rating
FROM
    (SELECT type,rating,COUNT(*),
    RANK() OVER (PARTITION BY type ORDER BY COUNT(*) DESC) AS rank
    FROM Netflix_data
    GROUP BY type,rating) AS Ranking
    WHERE RANK = 1;

-- Q3. List all movies released in a specific year (e.g., 2020)
SELECT * FROM Netflix_data
WHERE 
    type = 'Movie'
	AND
	release_year = '2020';

-- Q4. Find the top 5 countries with the most content on Netflix
WITH SplitCountries AS (
    SELECT 
        show_id, 
        UNNEST(STRING_TO_ARRAY(country, ',')) AS New_country      --STRING_TO_ARRAY function convert data into array 
    FROM Netflix_data                                             --UNNEST function used to treat as single value 
)
SELECT 
    New_country,
    COUNT(show_id) AS total_content
FROM SplitCountries
GROUP BY New_country
ORDER BY total_content DESC
LIMIT 5;


-- Q5. Identify the longest movie
SELECT * FROM netflix_data
WHERE type = 'Movie'
ORDER BY SPLIT_PART(duration, ' ', 1)::INT DESC                   --SPLIT_PART(duration, ' ', 1)::INT is used to split and convert in numeric or int


-- Q6. Find content added in the last 5 years
SELECT * FROM netflix_data
WHERE TO_DATE(date_added, 'Month DD, YYYY') >= CURRENT_DATE - INTERVAL '5 years';


-- Q7. Find all the movies/TV shows by director 'Rajiv Chilaka'!
SELECT * FROM Netflix_data
WHERE director LIKE '%Rajiv Chilaka%';


-- Q8. List all TV shows with more than 5 seasons
SELECT * FROM Netflix_data
WHERE type = 'TV Show'
AND SPLIT_PART(duration,' ',1)::INT >= 5

	  
-- Q9. Count the number of content items in each genre
SELECT 
	UNNEST(STRING_TO_ARRAY(listed_in, ',')) as genre,
	COUNT(*) as total_content
FROM netflix_data
GROUP BY 1;


-- Q10.Find each year and the average numbers of content release in India on netflix. return top 5 year with highest avg content release!
SELECT 
    EXTRACT(YEAR FROM TO_DATE(date_added, 'Month DD, YYYY')) AS Years,  
    COUNT(*) AS total_release,  
    ROUND(
        COUNT(*)::numeric / 
        (SELECT COUNT(*) FROM netflix_data WHERE country = 'India')::numeric * 100, 2) AS avg_release  
FROM netflix_data
WHERE country = 'India'
GROUP BY Years
ORDER BY Years;


-- Q11. List all movies that are documentaries
SELECT * FROM Netflix_data
WHERE listed_in ILIKE '%documentaries%';


-- Q12. Find all content without a director
SELECT * FROM Netflix_data
WHERE director IS NULL;


-- Q13. Find how many movies actor 'Shah Rukh Khan' appeared in last 10 years!
SELECT * FROM Netflix_data
WHERE casts ILIKE '%Shah Rukh Khan%'
      AND
      release_year > EXTRACT(YEAR FROM CURRENT_DATE) - 10;

-- Q14. Find the top 10 actors who have appeared in the highest number of movies produced in India.
SELECT 
	UNNEST(STRING_TO_ARRAY(casts, ',')) as actor,
	COUNT(*)
FROM netflix_data
WHERE country = 'India'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;


/* Q15. Categorize the content based on the presence of the keywords 'kill' and 'violence' in the description field. 
Label content containing these keywords as 'Bad' and all other content as 'Good'. Count how many items fall into each category. */
SELECT category,type,
COUNT(*) AS content_count
FROM(
    SELECT *,
       CASE 
         WHEN description ILIKE '%kill%' OR description ILIKE '%violence%' THEN 'Bad'
         ELSE 'Good'
       END AS category
FROM netflix_data) AS categorized_content
GROUP BY category,type
ORDER BY type











