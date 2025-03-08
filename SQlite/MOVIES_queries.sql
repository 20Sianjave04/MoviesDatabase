.www
SELECT title, year, length 
FROM Movie
WHERE studioID = (SELECT studioID FROM Studio WHERE name = 'MGM')
AND year > 1990 
AND length > 90;

.www
SELECT title, length 
FROM Movie
ORDER BY length ASC;

.www
SELECT name 
FROM Actor
WHERE gender = 'Female'
ORDER BY name ASC;

.www
SELECT name 
FROM Studio
WHERE studioID IN (SELECT studioID FROM Movie WHERE title LIKE 'Star Wars%');

.www
SELECT title, year, 
    (SELECT name FROM Studio WHERE Studio.studioID = Movie.studioID) AS Studio, 
    rating 
FROM Movie
WHERE movieID IN (SELECT movieID FROM StarsIn WHERE personID = 
    (SELECT personID FROM Actor WHERE name = 'Leonardo DiCaprio'))
ORDER BY year ASC;

.www
SELECT name, 
    (SELECT SUM(length) FROM Movie WHERE Movie.studioID = Studio.studioID) AS total_length 
FROM Studio;

.www
SELECT name 
FROM Studio
WHERE city = 'Los Angeles';

.www
SELECT name, 
    (SELECT AVG(rating) FROM Movie WHERE movieID IN 
        (SELECT movieID FROM StarsIn WHERE StarsIn.personID = Actor.personID)) AS avg_rating 
FROM Actor;

