http://www.dofactory.com/sql/group-by

Find all movies made in the year you were born.
SELECT name
FROM movies
WHERE year = 1989;

How many movies does our dataset have for the year 1982?
SELECT COUNT(name)
FROM movies
WHERE year = 1982;

Find actors who have "stack" in their last name.
SELECT *
FROM actors
WHERE last_name LIKE '%stack%';

//

What are the 10 most popular first names and last names in the business? And how many actors have each given first or last name? This can be multiple queries.

SELECT COUNT(last_name), last_name
FROM actors
GROUP BY last_name
ORDER BY COUNT(last_name) DESC
LIMIT 10;

SELECT COUNT(first_name), first_name
FROM actors
GROUP BY first_name
ORDER BY COUNT(first_name) DESC
LIMIT 10;

SELECT first_name, last_name, COUNT(first_name AND last_name)
FROM actors
GROUP BY first_name, last_name
ORDER BY COUNT(first_name AND last_name) DESC
LIMIT 10;

//

List the top 100 most active actors and the number of roles they have starred in.

SELECT first_name, last_name, COUNT(movies.id)
FROM actors JOIN movies JOIN roles
ON actors.id = roles.actor_id AND movies.id = roles.movie_id
GROUP BY first_name, last_name
ORDER BY COUNT(movies.id) DESC
LIMIT 100;

//

How many movies does IMDB have of each genre, ordered by least popular genre?

SELECT genre, COUNT(movies.id)
FROM movies JOIN movies_genres
ON movies.id = movies_genres.movie_id
GROUP BY genre
ORDER BY COUNT(movies.id);

//

List the first and last names of all the actors who played in the 1995 movie 'Braveheart', arranged alphabetically by last name.

SELECT first_name, last_name
FROM actors JOIN movies JOIN roles
ON actors.id = roles.actor_id AND movies.id = roles.movie_id
WHERE movies.name = 'Braveheart' AND movies.year = 1995
ORDER BY last_name;

//

List all the directors who directed a 'Film-Noir'-genre movie in a leap year (for the sake of this challenge, pretend that all years divisible by 4 are leap years — which is not true in real life). Your query; should return director name, the movie name, and the year, sorted by movie name.

SELECT first_name, last_name, name, year
FROM directors JOIN movies_directors ON directors.id = movies_directors.director_id JOIN movies ON movies.id = movies_directors.movie_id JOIN movies_genres ON movies.id = movies_genres.movie_id
WHERE movies_genres.genre = 'Film-Noir' AND year % 4 = 0
GROUP BY name
ORDER BY name;

//

List all the actors that have worked with Kevin Bacon in Drama movies (include the movie name). Please exclude Mr. Bacon himself from the results.

SELECT name, first_name, last_name
FROM actors JOIN roles ON actors.id = roles.actor_id JOIN movies ON movies.id = roles.movie_id JOIN movies_genres ON movies.id = movies_genres.movie_id
WHERE movies_genres.genre = 'Drama' AND actors.id = 22591
ORDER BY name;



SELECT id, first_name, last_name
FROM actors
WHERE actors.first_name = 'Kevin' AND actors.last_name = 'Bacon';

->
id          first_name  last_name
----------  ----------  ----------
22591       Kevin       Bacon


SELECT name, first_name, last_name
FROM actors JOIN roles ON actors.id = roles.actor_id JOIN movies ON movies.id = roles.movie_id
WHERE movies.name = 'Apollo 13'
ORDER BY last_name;
