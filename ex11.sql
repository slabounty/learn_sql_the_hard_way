INSERT INTO person (id, first_name, last_name, age)
  VALUES (0, 'Frank', 'Smith', 42);

INSERT OR REPLACE INTO person (id, first_name, last_name, age)
  VALUES (0, 'Frank', 'Smith', 42);

INSERT OR REPLACE INTO pet (id, name, breed, age, dead)
  VALUES (0, 'Polly', 'parrot', 5, 1);

SELECT * FROM person;

SELECT * FROM pet;

REPLACE INTO person (id, first_name, last_name, age)
  VALUES (0, 'Scott', 'LaBounty', 59);

REPLACE INTO pet (id, name, breed, age, dead)
  VALUES (0, 'Maddie', 'dog', 5, 1);

SELECT * FROM person;

SELECT * FROM pet;
