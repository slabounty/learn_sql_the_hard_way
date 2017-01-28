UPDATE person SET first_name = 'Hilarious Guy'
  WHERE first_name = 'Scott';

UPDATE pet SET name = 'Mad Max'
  WHERE name = 'Max';

SELECT * from person;
SELECT * from pet;


/* Reset name from above */
UPDATE person SET first_name = 'Scott'
  WHERE id = 0;

/* Set name to deceased if pet is dead. */
UPDATE pet SET name = 'Deceased'
  WHERE dead = 1;
