#! /bin/bash

# get the environment ready - I need the “couchimport” 
#and “couchexport” tools to move data in and out of the cloudant database
npm install -g couchimport

couchimport --version

#mongoimport and mongoexport tools to move data in and out of 
#the mongodb database
wget https://fastdl.mongodb.org/tools/db/mongodb-database-tools-ubuntu1804-x86_64-100.3.1.tgz

tar -xf mongodb-database-tools-ubuntu1804-x86_64-100.3.1.tgz

export PATH=$PATH:/home/project/mongodb-database-tools-ubuntu1804-x86_64-100.3.1/bin

echo "Done part 1"

#print the mongo version
mongoimport --version

#2. Working with the cloudant database
#set the environment variable CLOUDANT URL to your actual cloudant url from your
#service credentials 
export CLOUDANTURL="https://username:password@host"

#Create an index for the “director” key, on the ‘movies’ database using the HTTP API
curl -X POST $CLOUDANTURL/movies/_index \
-H"Content-Type: application/json" \
-d'{"index": {"fields": ["director"]}}'

#Write a query to find all movies directed by “Richard Gage” using the HTTP API
curl -X POST $CLOUDANTURL/movies/_find -H"Content-Type: application/json" -d'{{"selector": {"director": {"$eq": "Richard Gage" }}}}'

#Write a query to list only the “year” and “director” keys for the “Top Dog” movies using the HTTP API
# GETTING AN ERROR curl -X POST $CLOUDANTURL/movies/_find -H"Content-Type: application/json" -d'{{"selector": {"title": {"$eq": "Top Dog"}},"fields": ["year","director"]}}’

#Export the data from the “movies” database into a file named movies.json
couchexport --url $CLOUDANTURL --db movies --type jsonl > movies.json

echo "Done part 2"

#3. Working with a mongodb database
#start the mongo server
start_mongo
#CommandLine: mongo -u root -p MzA3NTItYWRyaWFu --authenticationDatabase admin local

#import movies.json into mongodb server into a database named entertainment and a collection named movies 
mongoimport -u root -p MzA3NTItYWRyWFu --authenticationDatabase admin --db entertainment --collection movies --file movies.json

#Execute the mongo_queries.js file 
mongo -u root -p MzA3NTItYWRyaWFu --authenticationDatabase admin local < mongo_queries.js

#Export the fields _id, "title", "year", "rating" and "director" from the 'movies' collection into a file named partial_data.csv
mongoexport -u root -p MzA3NTItYWRyaWFu --authenticationDatabase admin --db entertainment --collection movies --out partial_data.csv --type=csv --fields _id,title,year,rating,director 

echo "Done part 3"

#4. Working with a Cassandra database 
#Import partial_data.csv into cassandra server into a keyspace named entertainment and a table named movies 

#start the cassandra server
start_cassandra

#CommandLine: cqlsh --username cassandra --password MTUzMjItYWRyaWFu
#Execute the cassandra commands 
cqlsh -f cassandra_commands.cql --username cassandra --password MTUzMjItYWRyaWFu localhost

echo "Done part 4"
