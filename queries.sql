/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIE '%mon';
SELECT name FROM animals WHERE date_of_birth  BETWEEN '20160101' AND '20190101';
SELECT name  FROM animals WHERE neutered = true  AND escape_attemps < 3;
SELECT date_of_birth FROM animals WHERE name = 'Pikachu' OR name = 'Agumon';
SELECT name FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE NOT name = 'Gabumon';
