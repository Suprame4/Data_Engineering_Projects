-- create the keyspace
CREATE KEYSPACE entertainment WITH replication={'class':'SimpleStrategy','replication_factor':3};

-- use the entertainment keyspace
use entertainment;

-- create the movies table for the data to imported into 
CREATE TABLE movies (
		id text PRIMARY KEY,
		title text,
		year text,
		rating text,
		director text
);

-- import the data 
COPY entertainment.movies(id,title,year,rating,director) FROM 'partial_data.csv' WITH DELIMITER=',' AND HEADER=TRUE;

-- execute a query on the data 
SELECT COUNT(*) FROM movies;

-- exit the database
exit; 