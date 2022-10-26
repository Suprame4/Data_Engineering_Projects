//connect to the entertainment database 
db = db.getSiblingDB('entertainment');
print("######")
//create the following queries on the movies collection
print("Write a mongodb query to find the year in which the most number of movies were released")
db.movies.aggregate([{$group:{_id:"$year",count:{$sum:1}}}])

print("######")
print("Write a mongodb query to find the count of movies released after the year 1999")
db.movies.aggregate([{$match:{year:{$gt:1999}}},{$group:{_id:"$year",count:{$sum:1}}}])

print("######")
print("Write a query to find out the average votes for movies released in 2007")
db.movies.aggregate([{ $match:{year:2007}},{$group:{_id:"$year",avgVotes:{$avg:"$Votes"}}}])
