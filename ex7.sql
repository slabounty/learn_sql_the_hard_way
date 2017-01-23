/* Make sure there's some dead pets. */
SELECT name, age FROM pet WHERE dead = 1;

DELETE from pet WHERE dead = 1;

SELECT * FROM pet;

INSERT INTO pet VALUES (0, 'Maddie', 'dog', 1, 0);

SELECT * FROM pet;
