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