SELECT * FROM person;

SELECT name, age FROM pet;

SELECT name, age FROM pet WHERE dead = 0;

SELECT * FROM person WHERE first_name != 'Scott';

SELECT name, age FROM pet WHERE age > 10;

SELECT * FROM person WHERE age < 60;

SELECT * FROM person WHERE age > 60;

SELECT * FROM person WHERE first_name == 'Scott' AND age < 60;

SELECT first_name, last_name, age FROM person WHERE first_name == 'Scott' AND age < 60 OR (last_name == 'Smith');
