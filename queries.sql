/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth  BETWEEN '2016/01/01' AND '2019/12/31';
SELECT name  FROM animals WHERE neutered = true  AND escape_attemps < 3;
SELECT date_of_birth FROM animals WHERE name = 'Pikachu' OR name = 'Agumon';
SELECT name FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE NOT name = 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

/* Start the Transaction */
BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT;

/* Start the Transaction */
BEGIN;
DELETE FROM animals;
ROLLBACK;

/* Start the Transaction */
BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022/01/01';
SAVEPOINT SP1;
UPDATE animals SET weight_kg = -1 * weight_kg;
ROLLBACK TO SP1;
UPDATE animals SET weight_kg = -1 * weight_kg WHERE weight_kg < 0;
COMMIT;
