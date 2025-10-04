-- 1. Give the name, release year, and worldwide gross of the lowest grossing movie.
--specs.film_title , specs.release_year , revenue.worldwide_gross

SELECT
	specs.film_title,
	specs.release_year,
	
	revenue.worldwide_gross
FROM specs
	LEFT JOIN revenue
	ON specs.movie_id = revenue.movie_id
ORDER BY revenue.worldwide_gross ASC

--Answer: Semi-Tough, 1977, 37187139

-- 2. What year has the highest average imdb rating?
SELECT
specs.release_year,
rating.imdb_rating
FROM specs
LEFT JOIN rating
ON specs.movie_id = rating.movie_id
ORDER BY rating.imdb_rating DESC

--Answer: 2008

-- 3. What is the highest grossing G-rated movie? Which company distributed it?
SELECT
specs.film_title,
specs.mpaa_rating,
revenue.worldwide_gross,
distributors.company_name
FROM specs
LEFT JOIN distributors
ON specs.domestic_distributor_id = distributors.distributor_id
LEFT JOIN revenue ON specs.movie_id = revenue.movie_id
WHERE mpaa_rating = 'G'
ORDER BY worldwide_gross DESC

--ANSWER: Toy Story 4; Walt Disney


-- 4. Write a query that returns, for each distributor in the distributors table, the distributor name and the number of movies associated with that distributor in the movies table. Your result set should include all of the distributors, whether or not they have any movies in the movies table.
SELECT
distributors.company_name,
COUNT(movie_id) AS total_movies
FROM distributors
LEFT JOIN specs
ON specs.domestic_distributor_id = distributors.distributor_id
GROUP BY distributors.company_name
ORDER BY total_movies DESC

-- 5. Write a query that returns the five distributors with the highest average movie budget.
SELECT
distributors.company_name,
AVG(revenue.film_budget) AS avg_budget
FROM distributors
INNER JOIN specs ON specs.domestic_distributor_id = distributors.distributor_id
INNER JOIN revenue ON revenue.movie_id = specs.movie_id
GROUP BY distributors.company_name
ORDER BY avg_budget DESC
LIMIT 5

-- 6. How many movies in the dataset are distributed by a company which is not headquartered in California? Which of these movies has the highest imdb rating?
SELECT
COUNT(specs.movie_id),
distributors.headquarters,
rating.imdb_rating
FROM specs
LEFT JOIN distributors ON distributors.distributor_id = specs.domestic_distributor_id
LEFT JOIN rating ON rating.movie_id = specs.movie_id
GROUP BY distributors.headquarters





-- 7. Which have a higher average rating, movies which are over two hours long or movies which are under two hours?
