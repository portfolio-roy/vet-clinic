/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    date_of_birth DATE,
    escape_attempts INTEGER DEFAULT 0,
    neutered BOOLEAN DEFAULT FALSE,
    weight_kg DECIMAL(5,2) NOT NULL
);


ALTER TABLE animals ADD COLUMN species VARCHAR(255);
-- Remove column species
ALTER TABLE animals DROP COLUMN species;

-- Create a table named owners
CREATE TABLE owners (                                                             
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    age INTEGER NOT NULL
);

-- Create a table named species
CREATE TABLE species(                                                             
    id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

-- Add column species_id which is a foreign key referencing species table
ALTER TABLE animals 
ADD COLUMN species_id INTEGER REFERENCES species(id);

-- Add column owner_id which is a foreign key referencing the owners table
ALTER TABLE animals 
ADD COLUMN owner_id INTEGER REFERENCES owners(id);

-- Create 'vets' table
CREATE table vets(
id SERIAL PRIMARY KEY,
name VARCHAR(255) NOT NULL,
age INT,                                   
date_of_graduation DATE
);
-- Create 'specializations' table
CREATE TABLE specializations (  
  vet_id INT NOT NULL,
  species_id INT NOT NULL,
  FOREIGN KEY (vet_id) REFERENCES vets(id),
  FOREIGN KEY (species_id) REFERENCES species(id)
);
ALTER TABLE specializations ADD CONSTRAINT      unique_specialization
  UNIQUE (vet_id, species_id);

-- Create 'visits' table
CREATE TABLE visits (
  animal_id INT NOT NULL,
  vet_id INT NOT NULL,
  visit_date DATE NOT NULL,
  FOREIGN KEY (animal_id) REFERENCES animals(id),
  FOREIGN KEY (vet_id) REFERENCES vets(id)
);

ALTER TABLE owners ADD COLUMN email VARCHAR(120);