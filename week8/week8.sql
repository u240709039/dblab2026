# 1. Show the Quentin Tarantino films which have more than 500000 votes and produced before 2000.

select movies.title, directors.director_name, movies.votes, movies.year
from movies
join movie_directors on movies.movie_id = movie_directors.movie_id
join directors on directors.director_id = movie_directors.director_id
where directors.director_name = "Quentin Tarantino" and movies.votes > 500000 and movies.year < 2000;

# 2. Show the films that Tom Hanks has act and have won more than 3 Oscars.

select movies.title, stars.star_name, movies.oscars
from movies
join movie_stars on movies.movie_id = movie_stars.movie_id
join stars on stars.star_id = movie_stars.star_id
where stars.star_name = "Tom Hanks" and movies.oscars > 3;

# 3. Show the history films produced in USA and whose duration is between 100-200 minutes.
 
 select movies.title, genres.genre_name, countries.country_name, movies.duration
 from movies
 join producer_countries on producer_countries.movie_id = movies.movie_id
 join countries on countries.country_id = producer_countries.country_id
 join genres on movies.movie_id = genres.movie_id
 where genres.genre_name = "History" and countries.country_name = "USA" and movies.duration between 100 and 200;
 
# 4.Compute the average budget of the films directed by Peter Jackson.

select directors.director_name, avg(budget)
from movies
join movie_directors on movies.movie_id = movie_directors.movie_id
join directors on directors.director_id = movie_directors.director_id
where directors.director_name = "Peter Jackson"
group by directors.director_name;

# 5.Show the Francis Ford Coppola film that has the maximum budget.

select movies.title, budget
from movies
join movie_directors on movies.movie_id = movie_directors.movie_id
join directors on directors.director_id = movie_directors.director_id
where directors.director_name = "Francis Ford Coppola"
and movies.budget = (select max(budget)
from movies
join movie_directors on movies.movie_id = movie_directors.movie_id
join directors on directors.director_id = movie_directors.director_id
where directors.director_name = "Francis Ford Coppola");

# 6.Show the film that has the most vote and has been produced in USA.

select movies.title, movies.votes, countries.country_name
from movies
join producer_countries on producer_countries.movie_id = movies.movie_id
join countries on countries.country_id = producer_countries.country_id
where countries.country_name = "USA"
and movies.votes = (select max(votes)
from movies
join producer_countries on producer_countries.movie_id = movies.movie_id
join countries on countries.country_id = producer_countries.country_id
where countries.country_name = "USA");

# 7. List all stars who have acted in more than 1 films

select stars.star_name, count(title)
from movies
join movie_stars on movies.movie_id = movie_stars.movie_id
join stars on stars.star_id = movie_stars.star_id
group by stars.star_name
having count(title) > 1;
