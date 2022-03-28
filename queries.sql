/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIE '%mon';
SELECT name FROM animals WHERE date_of_birth  BETWEEN '20160101' AND '20190101';
SELECT name  FROM animals WHERE neutered = true  AND escape_attemps < 3;
