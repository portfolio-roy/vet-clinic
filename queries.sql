/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT * FROM animals WHERE neutered = true;
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE name != 'Gabumon';

BEGIN;
update animals set species = 'unspecified';
select * from animals;
rollback;
select * from animals;

UPDATE animals set species = 'digimon' where name like '%mon';
select * from animals;
update animals set species = 'pokemon' where species IS NULL;
select * from animals;

BEGIN;
delete from animals;
ROLLBACK;
select * from animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT S1;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK to S1;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

-- How many animals are there?
SELECT COUNT(*) FROM animals;
-- How many animals have never tried to escape?
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
-- What is the average weight of animals?
SELECT AVG(weight_kg) FROM animals;

-- Who escapes the most, neutered or not neutered animals?
SELECT neutered, AVG(escape_attempts) as avg_escapes
FROM animals
GROUP BY neutered                          
ORDER BY avg_escapes DESC
LIMIT 1;

-- What is the minimum and maximum weight of each type of animal?
SELECT species, MIN(weight_kg), MAX(weight_Kg)
FROM animals
GROUP BY species;

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species, AVG(escape_attempts)
FROM animals
WHERE date_of_birth >= '1990-01-01' AND date_of_birth <= '2000-12-31'
GROUP BY species;

-- Animals belong to Melody Pond
SELECT animals.name 
FROM animals 
JOIN owners ON animals.owner_id = owners.id 
WHERE owners.full_name = 'Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon)
SELECT animals.name 
FROM animals 
JOIN species ON animals.species_id = species.id 
WHERE species.name = 'Pokemon';

-- List all owners and their animals, remember to include those that don't own any animal
SELECT owners.full_name, animals.name 
FROM owners 
LEFT JOIN animals ON owners.id = animals.owner_id 
ORDER BY owners.full_name;

-- Animals count per species
SELECT species.name, COUNT(*) as total 
FROM animals 
JOIN species ON animals.species_id = species.id 
GROUP BY species.name;

-- List all Digimon owned by Jennifer Orwell
SELECT animals.name 
FROM animals 
JOIN species ON animals.species_id = species.id 
JOIN owners ON animals.owner_id = owners.id 
WHERE species.name = 'Digimon' AND owners.full_name = 'Jennifer Orwell';

-- List all animals owned by Dean Winchester that haven't tried to escape
SELECT animals.name 
FROM animals 
JOIN owners ON animals.owner_id = owners.id 
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

-- Who owns the most animals?
SELECT owners.full_name, COUNT(*) as total 
FROM animals 
JOIN owners ON animals.owner_id = owners.id 
GROUP BY owners.full_name 
ORDER BY total DESC 
LIMIT 1;
