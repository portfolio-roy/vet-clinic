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

