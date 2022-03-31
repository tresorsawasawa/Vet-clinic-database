/*Queries that provide answers to the questions from all projects.*/

/*---- Queries for 1st milestone---*/

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

/*----- Queries -------*/

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attemps = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT id, name, escape_attemps FROM animals WHERE escape_attemps = (SELECT MAX(escape_attemps) FROM animals) AND (neutered = true OR neutered = false);
SELECT MIN(weight_kg), MAX(weight_kg) FROM animals;
SELECT AVG(escape_attemps) FROM animals WHERE date_of_birth  BETWEEN '1990/01/01' AND '2000/12/31';

/*----- Queries with JOIN  for 2nd milestone -------*/

/*----- QUESTION 1 ----*/
SELECT
  animals.id,
  animals.name
FROM
  animals
JOIN
  owners
ON
  animals.owner_id = owners.id
WHERE
  owners.full_name = 'Melody Pond';

/*----- QUESTION 2 ----*/
SELECT
  animals.id,
  animals.name
FROM
  animals
JOIN
  species
ON
  animals.species_id =species.id
WHERE
  species.name = 'Pokemon';

/*----- QUESTION 3 ----*/
SELECT
  animals.name,
  owners.full_name
FROM
  owners
LEFT JOIN
  animals
ON
  owners.id = animals.owner_id;

/*----- QUESTION 4 ----*/
SELECT
  species.name,
  COUNT(*)
FROM
  animals
JOIN
  species
ON
  species.id = animals.species_id,
GROUP BY species.name;

/*----- QUESTION 5 ----*/
SELECT
  animals.name,
  owners.full_name,
  species.name
FROM
  animals
JOIN
  species
ON
  species.id = animals.species_id
JOIN
  owners
ON
  owners.id = animals.owner_id
WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';

/*----- QUESTION 6 ----*/
SELECT * 
FROM
  animals
JOIN owners
ON
  animals.owner_id = owners.id
WHERE
  animals.escape_attemps = 0 AND owners.full_name = 'Dean Winchester';

/*----- QUESTION 7 ----*/
SELECT
  owners.full_name,
  COUNT(*)
FROM
  animals
JOIN
  owners
ON
  animals.owner_id = owners.id
GROUP BY
  owners.full_name
ORDER BY
  COUNT(*) DESC
LIMIT
  1;

/*--- Queries  for 3rd milestone ----*/

/*----- QUESTION 1 ----*/
SELECT
  vets.name,
  animals.name,
  date_of_visit
FROM
  animals
JOIN
  visits
ON
  visits.animals_id = animals.id
JOIN
  vets
ON
  visits.vets_id = vets.id
WHERE
  vets.name = 'William Tatcher'
ORDER BY
  date_of_visit DESC
LIMIT
  1;

/*----- QUESTION 2 ----*/
SELECT
  COUNT(DISTINCT animals.name)
FROM
  visits
JOIN
  animals
ON
  visits.animals_id = animals.id
JOIN
  vets
ON
  visits.vets_id = vets.id
WHERE
  vets.name = 'Stephanie Mendez';

/*----- QUESTION 3 ----*/
SELECT
  ve.name AS Vet_Name,
  S.name AS Speciality
FROM
  vets ve
LEFT JOIN
  specializations Spe
ON
  ve.id = Spe.vets_id
LEFT JOIN
  species S
ON
  Spe.species_id = S.id;

/*----- QUESTION 4 ----*/
SELECT
  a.name,
  vi.date_of_visit,
  ve.name
FROM
  animals a
JOIN
  visits vi
ON
  vi.animals_id = a.id
JOIN
  vets ve
ON
  vi.vets_id = ve.id
WHERE
  ve.name = 'Stephanie Mendez'
  AND
    vi.date_of_visit
    BETWEEN '2020-04-01' AND '2020-08-30';

/*----- QUESTION 5 ----*/
SELECT
  A.name AS Animals,
  COUNT(A.name) AS Most_Viewed
FROM
  animals A
JOIN
  visits Vi
ON 
  Vi.animals_id = A.id 
JOIN
  vets Ve
ON
  Vi.vets_id = Ve.id
GROUP BY
  A.name
ORDER BY
  Most_Viewed DESC
LIMIT
  1;

/*----- QUESTION 6 ----*/
SELECT
  Ve.name AS Vest,
  A.name AS Animal,
  date_of_visit AS Date
FROM
  visits Vi
  JOIN vets Ve ON Vi.vets_id = Ve.id
  JOIN animals A ON Vi.animals_id = A.id
WHERE
  Ve.name = 'Maisy Smith'
ORDER BY
  Date
LIMIT
  1;

SELECT
  A.name AS Animals,
  A.date_of_birth AS "Date of Birth",
  A.escape_attemps AS Escapes,
  A.neutered AS Neutered,
  A.weight_kg AS Weigth,
  S.name AS species,
  Ve.name AS "Vet name",
  Ve.age AS "Vet age",
  Ve.date_of_graduation AS "Date of vet graduation",
  date_of_visit
FROM
  visits Vi
  JOIN vets Ve ON Vi.vets_id = Ve.id
  JOIN animals A ON Vi.animals_id = A.id
  JOIN species S ON A.species_id = S.id
ORDER BY
  date_of_visit DESC
LIMIT
  1;
