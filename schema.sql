/* Database schema to keep the structure of entire database. */
CREATE TABLE animals (
    id INT,
    name varchar(100),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg:DECIMAL,
    species:varchar(100)
);

-- owners table 
CREATE TABLE owners (
    id INT,
    full_name varchar(100),
    age INT,
    PRIMARY KEY(owner_id)
);

-- species table 
CREATE TABLE species (
    id INT,
    name varchar(100),
    PRIMARY KEY(species_id)
);


ALTER TABLE animals DROP COLUMN species;
--Add column species_id which is a foreign key referencing species table
ALTER TABLE animals ADD COLUMN species_id INT,
ADD CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id);
--Add column owner_id which is a foreign key referencing the owners table
ALTER TABLE animals ADD COLUMN owner_id INT,
ADD CONSTRAINT fk_owners FOREIGN KEY(owner_id) REFERENCES owners(id);

