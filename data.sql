/* 
The date is in 'YYYY-MM-DD' format
*/

/*--- Insert Data into the animals table ----*/
INSERT INTO animals( name, date_of_birth, escape_attemps, neutered, weight_kg )
VALUES ('Agumon', '2020-02-03', 0, true, 10.23 ),
       ('Gabumon', '2018-11-15', 2, true, 8 ),
       ('Pikachu', '2021-01-07', 1, false, 15.04 ),
       ('Devimon', '2017-05-12', 5, true, 11 ),
       ('Charmander', '2020-02-08', 0, false, -11 ),
       ('Plantmon', '2021-11-15', 2, true, -5.7 ),
       ('Squirtle', '1993-04-02', 3, false, -12.13 ),
       ('Angemon', '2005-06-12', 1, true, -45 ),
       ('Boarmon', '2005-06-07', 7, true, 20.4 ),
       ('Blossom', '1998-10-13', 3, true, 17 ),
       ('Ditto', '2022-05-14', 4, true, 22 );

/*--- Insert Data into the owners table ----*/
INSERT INTO owners(full_name, age)
VALUES('Sam Smith', 34),
      ('Jennifer Orwell', 19),
      ('Bob', 45),
      ('Melody Pond', 77),
      ('Dean Winchester', 14),
      ('Jodie Whittaker', 38);

/*--- Insert Data into the species table ----*/
INSERT INTO species(name)
VALUES('Pokemon'),
      ('Digimon');

/*--- Modify the inserted animals so it includes the 'species_id' value ---*/
BEGIN;
UPDATE
  animals
SET
  species_id = 2
WHERE
  name LIKE '%mon';
COMMIT;

BEGIN;
UPDATE
  animals
SET
  species_id = 1
WHERE
  species_id IS NULL;
COMMIT;

/*---- Modify the inserted animals to include owner information 'owner_id' -----*/
BEGIN;
UPDATE animals SET owner_id = 1 WHERE name IN ('Agumon');
UPDATE animals SET owner_id = 2 WHERE name IN ('Pikachu', 'Gabumon');
UPDATE animals SET owner_id = 3 WHERE name IN ('Devimon', 'Plantmon');
UPDATE animals SET owner_id = 4 WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owner_id = 5 WHERE name IN ('Angemon', 'Boarmon');
COMMIT;
