
{{ config(materialized='table') }}

-- Genre table contains the number of films in stock for each genre.

with genre as (

    SELECT g.genre_name,count(m.title) 
    FROM genres g
    INNER JOIN movies_genres mg
    ON g.genre_id = mg.movie_id
    INNER JOIN movies m
    ON g.genre_id=m.movie_id
    GROUP BY m.title,g.genre_name

)

select * from genre
