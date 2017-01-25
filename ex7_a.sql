DROP TABLE person_pet;
DROP TABLE pet;
DROP TABLE person;

/* ex2.sql */
CREATE TABLE person (
  id INTEGER PRIMARY KEY,
  first_name TEXT,
  last_name TEXT,
  age INTEGER
);

CREATE TABLE pet (
  id INTEGER PRIMARY KEY,
  name TEXT,
  breed TEXT,
  age INTEGER,
  dead INTEGER
);

CREATE TABLE person_pet (
  person_id INTEGER,
  pet_id INTEGER
);

/* ex3.sql */
INSERT INTO person (id, first_name, last_name, age)
  VALUES (0, 'Scott', 'LaBounty', 59);

INSERT INTO pet (id, name, breed, age, dead)
  VALUES (0, 'Maddie', 'dog', 5, 1);


/* ex4.sql */
INSERT INTO pet (id, name, breed, age, dead)
  VALUES (1, 'Max', 'dog', 11, 0);
INSERT INTO person_pet (person_id, pet_id)
  VALUES(0, 0);

INSERT INTO person_pet (person_id, pet_id)
  VALUES(0, 1);
SELECT * FROM person;

/* ex5.sql */
SELECT name, age FROM pet;

SELECT name, age FROM pet WHERE dead = 0;

SELECT * FROM person WHERE first_name != 'Scott';

SELECT name, age FROM pet WHERE age > 10;

SELECT * FROM person WHERE age < 60;

SELECT * FROM person WHERE age > 60;

SELECT * FROM person WHERE first_name == 'Scott' AND age < 60;

SELECT first_name, last_name, age FROM person WHERE first_name == 'Scott' AND age < 60 OR (last_name == 'Smith');

/* ex6.sql */
/* Normal join with equality */
SELECT pet.id, pet.name, pet.age, pet.dead
  FROM pet, person_pet, person
  WHERE
    pet.id = person_pet.pet_id AND
    person_pet.person_id = person.id AND
    person.first_name = 'Scott';

/* Using a sub-select */
SELECT pet.id, pet.name, pet.age, pet.dead
  FROM pet
  WHERE pet.id IN
  (
    SELECT pet_id FROM person_pet, person
    WHERE person_pet.person_id = person.id
    AND person.first_name = 'Scott'
  );

/* ex7.sql */
/* Make sure there's some dead pets. */
SELECT name, age FROM pet WHERE dead = 1;

DELETE from pet WHERE dead = 1;

SELECT * FROM pet;

INSERT INTO pet VALUES (0, 'Maddie', 'dog', 1, 1);

SELECT * FROM pet;
