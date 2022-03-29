/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
  id INT GENERATED BY DEFAULT AS IDENTITY,
  name varchar(40),
  date_of_birth date,
  escape_attemps INT NOT NULL,
  neutered boolean,
  weight_kg decimal(5, 2),
  species varchar(50)
);
