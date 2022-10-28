-- Need to work on formatting properlly



-- Query to list the titles of all movies released in 2008.
SELECT title FROM movies WHERE year = "2008";

-- Determine the birth year of Emma Stone.
SELECT birth FROM people WHERE name = "Emma Stone";

-- Query to list the titles of all movies with a release date on or after 2018, in alphabetical order.
SELECT title from movies WHERE year >= 2018 ORDER BY title ASC;

-- Query to determine the number of movies with an IMDb rating of 10.0.
SELECT COUNT(id) FROM movies JOIN ratings ON id = ratings.movie_id and ratings.rating = 10;

-- Query to list the titles and release years of all Harry Potter movies, in chronological order.
SELECt title, year FROM movies WHERE title LIKE "Harry Potter%" ORDER BY year;

-- Query to determine the average rating of all movies released in 2012.
SELECT AVG(rating) FROM ratings JOIN movies ON movies.id=ratings.movie_id WHERE movies.year = 2012;

-- Query to list all movies released in 2010 and their ratings, in descending order by rating. For movies with the same rating, order them alphabetically by title.
SELECT ratings.rating, movies.title FROM movies JOIN ratings ON movies.id=ratings.movie_id WHERE movies.year = 2010 ORDER BY ratings.rating desc, movies.title asc;

-- Query to list the names of all people who starred in Toy Story.
SELECT name FROM people JOIN stars ON stars.person_id=people.id JOIN movies ON stars.movie_id=movies.id WHERE movies.title="Toy Story";

-- Query to list the names of all people who starred in a movie released in 2004, ordered by birth year.
SELECT DISTINCT name FROM people JOIN stars ON stars.person_id=people.id JOIN movies ON stars.movie_id=movies.id JOIN ratings ON ratings.movie_id=movies.id WHERE movies.year=2004 ORDER BY people.birth;

-- Query to list the names of all people who have directed a movie that received a rating of at least 9.0.
SELECT name FROM people JOIN directors ON directors.person_id=people.id JOIN movies ON diretors.movie_id=movies.id JOIN ratings ON ratings.movie_id=movies.id WHERE ratings.rating>= 9;

-- Query to list the titles of the five highest rated movies (in order) that Chadwick Boseman starred in, starting with the highest rated.
SELECT title FROM movies JOIN stars ON stars.movie_id=movies.id JOIN people ON stars.person_id=people.id JOIN ratings ON ratings.movie_id=movies.id WHERE people.name = "Chadwick Boseman" ORDER BY ratings.rating desc LIMIT 5;
