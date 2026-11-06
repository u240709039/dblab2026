use movie_db;

# 1. Show the films with a budget greater than $10 million and a ranking lower than 6.

select title, budget, ranking from movies
where budget > 10000000 and ranking < 6;


# 2. Show the action films with a rating higher than 8.8, produced after 2009.

select title, genre_name, rating, year
from movies inner join genres
on movies.movie_id = genres.movie_id
where genres.genre_name = "Action" and movies.rating > 8.8 and movies.year > 2009;

# 3. Show the drama films with a duration of more than 150 minutes and more than 2 Oscars.

select title, duration, oscars
from movies join genres
on movies.movie_id = genres.movie_id
where genres.genre_name = "Drama" and movies.duration > 150 and movies.oscars > 2;

select title, duration, oscars
from movies
where movies.duration > 150 and movies.oscars > 2
and movie_id in(select movie_id from genres where genre_name = "Drama");

 
# 4. Show the thriller films whose budget is greater than 25 million$.

select title, genre_name, budget
from movies inner join genres
on movies.movie_id = genres.movie_id
where genres.genre_name = "Thriller" and movies.budget > 25000000;

# 5. Show the drama films whose language is Italian and produced between 1990-2000.		 

select title, genre_name, language_name, year
from movies 
join genres on movies.movie_id = genres.movie_id
join languages on movies.movie_id = languages.movie_id
where genres.genre_name = "Drama" and languages.language_name = "Italian" and movies.year between 1990 and 2000;

# 6. Show the Quentin Tarantino films which have more than 500000 votes and produced before 2000.	 

select title,directors.director_name, votes, year
from movies 
join movie_directors on movies.movie_id = movie_directors.movie_id
join directors on movie_directors.director_id = directors.director_id
where movies.year < 2000 and movies.votes > 500000 and directors.director_name = "Quentin Tarantino";