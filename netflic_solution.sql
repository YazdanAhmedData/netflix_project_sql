-- Netflix project 
DROP TABLE IF EXISTS netflix;
CREATE TABLE netflix(
  show_id VARCHAR(6),
  type VARCHAR(10),
  title	VARCHAR(150),
  director VARCHAR(208),
  casts	VARCHAR(1000),
  country VARCHAR(150),	
  date_added VARCHAR(50),
  release_year INT,
  rating VARCHAR(10),	
  duration VARCHAR(15),
  listed_in	VARCHAR(100),
  description VARCHAR(250)
);
SELECT * FROM netflix;
SELECT 
     DISTINCT type 
	 FROM netflix;

-- 1.Count the number of Movies vs TV shows
SELECT type , COUNT(show_id)
    FROM netflix
	GROUP BY type

--2. Find the most common rating for movies and TV shows 
SELECT 
   type,
   rating
FROM
(SELECT 
   type,
   rating,
   COUNT(*),
   RANK() OVER(PARTITION BY type ORDER BY COUNT(*) DESC)as ranking
FROM netflix
GROUP BY 1,2
) as t1
WHERE 
     ranking = 1

--3. List all movies released in a specific year (eg - 2020)
SELECT * FROM netflix 
WHERE 
     type = 'Movie'
	 AND 
	 release_year = 2020

--4. Find the top 5 countries with the most content on netflix 
SELECT 
      UNNEST(STRING_TO_ARRAY(country, ',')) as new_country ,
	  COUNT(show_id) as total_content
	  FROM netflix
	  GROUP BY country
	  ORDER BY  COUNT(show_id) DESC
	  LIMIT 5

--5. Identify the longest movie 
SELECT * FROM netflix
WHERE 
     type = 'Movie'
	 AND 
	 duration = (SELECT MAX(duration) FROM netflix)
 
--6. Find the contents added in the last 5 years 

SELECT * FROM netflix 
WHERE 
    TO_DATE(date_added, 'Month DD, YYYY') >= CURRENT_DATE - INTERVAL '5 years'

--7. Find all movies/TV Shows by director 'Rajiv chilaka'
SELECT * FROM netflix 
      WHERE director ILIKE '%Rajiv Chilaka%'

--8 list all TV Shows with more than 5 seasons
SELECT * FROM netflix 
WHERE 
     type = 'TV Show'
	 AND
	 SPLIT_PART(duration, ' ' ,1) :: numeric > 5 

--9. Count the number of content items in each genre
SELECT 
      UNNEST(STRING_TO_ARRAY(listed_in, ',')) as genre,
	  COUNT(show_id) as total_content
from netflix
GROUP BY UNNEST(STRING_TO_ARRAY(listed_in, ',')) 

--10. Find each year and the average number of contents release by india on netflix .
--return top 5 years with highest avg content release 
SELECT
      EXTRACT(YEAR FROM TO_DATE(date_added,'Month DD, YYYY')) as year,
	  COUNT(*),
	  ROUND(
	  COUNT(*) :: numeric/(SELECT COUNT(*) FROM netflix WHERE country = 'India'):: numeric*100
	  ,2)as avg_content_per_year
FROM netflix 
WHERE country = 'India'
GROUP BY 1

--11. List all movies that are documentaries
SELECT * FROM netflix 
WHERE 
     listed_in ILIKE '%documentaries%'

--12. Find all the contents without a director 
SELECT * FROM netflix 
WHERE
     director IS NULL 

--13. Find how many movie actor 'Salman Khan' appeared in last 10 years
SELECT * FROM netflix 
WHERE 
     casts ILIKE '%Salman Khan%'
	 AND 
	 release_year > EXTRACT(YEAR FROM CURRENT_DATE) - 10
        
--14. Find the top 10 actors who have appeared in the highest number of movies produced in India 	  
SELECT 
	  UNNEST(STRING_TO_ARRAY(casts , ',')) as actors,
	  Count(*) as total_content
	  FROM netflix
	  WHERE country ILIKE '%India%'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10

--15. Categorize the contents based on the presence of the keywords 'kill' and 'violence'
-- in the description field . label contents containing these keywords as 'bad' and all 
-- other content as 'Good' . Count how many items fall into each category.

WITH new_table 
AS
(
SELECT 
*,
      CASE 
	  WHEN 
	      description ILIKE '%kill%'OR
		  description ILIKE '%violent%' THEN 'Bad_Content'
		  ELSE 'Good_content'
	  END category
FROM netflix	  
)
SELECT 
      category,
	  COUNT(*) as total_content
FROM new_table
GROUP BY 1
