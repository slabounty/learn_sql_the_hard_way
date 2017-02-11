/* Add a dead column to person */
ALTER TABLE person ADD COLUMN dead INTEGER;

/* Add phone number to person */
ALTER TABLE person ADD COLUMN phone_number TEXT;

/* Add salary to person */
ALTER TABLE person ADD COLUMN salary FLOAT;

/* Add dob to person */
ALTER TABLE person ADD COLUMN dob DATETIME;

/* Add dob to pet */
ALTER TABLE pet ADD COLUMN dob DATETIME;

/* Add purchased_on to person_pet */
ALTER TABLE person_pet ADD COLUMN purchased_on DATETIME;

/* Add a dead column to pet */
ALTER TABLE pet ADD COLUMN parent INTEGER;

/* Update existing database w/ new column data */
UPDATE person SET dead = 0 WHERE first_name = 'Scott';
UPDATE person SET phone_number = '123.456.7890' WHERE first_name = 'Scott' AND last_name = 'LaBounty';
UPDATE person SET dob = '1985-01-02'  WHERE first_name = 'Scott' AND last_name = 'LaBounty';
UPDATE person SET salary = 45321.45  WHERE first_name = 'Scott' AND last_name = 'LaBounty';

UPDATE pet SET dob = '2004-01-02'  WHERE name = 'Max';
UPDATE pet SET dob = '2002-02-03'  WHERE name = 'Maddie';

UPDATE pet SET parent = 1  WHERE name = 'Maddie';


UPDATE person_pet SET purchased_on = '2000-03-04'  WHERE pet_id IN (
  SELECT pet.id
  FROM pet, person
  WHERE
    person.first_name = 'Scott' AND
    person.last_name = 'LaBounty' AND
    pet.name = 'Maddie'
);

UPDATE person_pet SET purchased_on = '2010-04-05'  WHERE pet_id IN (
  SELECT pet.id
  FROM pet, person
  WHERE
    person.first_name = 'Scott' AND
    person.last_name = 'LaBounty' AND
    pet.name = 'Max'
);

/* Add four more people ... */
INSERT INTO person (first_name, last_name, age, height, weight, dead, phone_number, salary, dob)
  VALUES ('John', 'Smith', 33, 66, 135, 0, '123-456-0987', 44000.00, '1987-02-02');

INSERT INTO person (first_name, last_name, age, height, weight, dead, phone_number, salary, dob)
  VALUES ('Willa', 'Miller', 44, 66, 135, 0, '321-456-0987', 55600.00, '1989-03-03');

INSERT INTO person (first_name, last_name, age, height, weight, dead, phone_number, salary, dob)
  VALUES ('Sarai', 'Jones', 55, 62, 100, 0, '321-654-0987', 42000.00, '1977-03-04');

INSERT INTO person (first_name, last_name, age, height, weight, dead, phone_number, salary, dob)
  VALUES ('Michael', 'Cirona', 22, 68, 145, 0, '231-654-7766', 22000.00, '1997-05-08');

/* and five more pets ... */
INSERT INTO pet (name, breed, age, dead, dob)
  VALUES ('Fido', 'dog', 10, 0, '2010-05-09');

INSERT INTO pet (name, breed, age, dead, dob)
  VALUES ('Rex', 'dog', 8, 0, '2007-09-01');

/* Update the parents for the dogs */
UPDATE pet SET parent = (
  SELECT pet.id FROM pet WHERE pet.name = "Rex")
  WHERE name = 'Fido';

INSERT INTO pet (name, breed, age, dead, dob)
  VALUES ('Storm', 'cat', 12, 1, '1963-02-05');

INSERT INTO pet (name, breed, age, dead, dob)
  VALUES ('Lightning', 'cat', 12, 1, '1967-03-01');

INSERT INTO pet (name, breed, age, dead, dob)
  VALUES ('Thunder', 'cat', 12, 1, '1967-03-01');

/* Update the parent for the cats */
UPDATE pet SET parent = (
  SELECT pet.id FROM pet WHERE pet.name = "Storm")
  WHERE name = 'Thunder' OR name = 'Lightning';


/* Update the person_pet for the new people / pets */
INSERT INTO person_pet (person_id, pet_id, purchased_on)
  VALUES (
  ( SELECT person.id FROM person WHERE person.first_name = 'John' AND person.last_name = 'Smith'),
  ( SELECT pet.id FROM pet WHERE pet.name = 'Rex' ),
  '2008-08-17'
  );

INSERT INTO person_pet (person_id, pet_id, purchased_on)
  VALUES (
  ( SELECT person.id FROM person WHERE person.first_name = 'Willa' AND person.last_name = 'Miller'),
  ( SELECT pet.id FROM pet WHERE pet.name = 'Fido' ),
  '2008-08-17'
  );

INSERT INTO person_pet (person_id, pet_id, purchased_on)
  VALUES (
  ( SELECT person.id FROM person WHERE person.first_name = 'Sarai' AND person.last_name = 'Jones'),
  ( SELECT pet.id FROM pet WHERE pet.name = 'Storm' ),
  '2003-02-27'
  );

INSERT INTO person_pet (person_id, pet_id, purchased_on)
  VALUES (
  ( SELECT person.id FROM person WHERE person.first_name = 'Michael' AND person.last_name = 'Cirona'),
  ( SELECT pet.id FROM pet WHERE pet.name = 'Thunder' ),
  '2010-04-04'
  );

INSERT INTO person_pet (person_id, pet_id, purchased_on)
  VALUES (
  ( SELECT person.id FROM person WHERE person.first_name = 'Michael' AND person.last_name = 'Cirona'),
  ( SELECT pet.id FROM pet WHERE pet.name = 'Lightning' ),
  '2010-04-04'
  );

/* Find names of people and their pets purchased after 2004 */
SELECT person.first_name, person.last_name, pet.name 
FROM
  person, pet, person_pet
WHERE
  person.id = person_pet.person_id AND
  pet.id = person_pet.pet_id AND
  person_pet.purchased_on > '2004-01-01';


/* Find children of a given pet */
SELECT * FROM pet
WHERE parent IN (
  SELECT id FROM pet WHERE name = "Storm"
);
