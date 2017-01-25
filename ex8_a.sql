/* Remove Pets that are no longer with us. */

DELETE FROM pet WHERE id IN (
  SELECT pet.id
  FROM pet, person_pet, person
  WHERE
  person.id = person_pet.person_id AND
  pet_id = person_pet.pet_id AND
  pet.dead = 1
);

SELECT * FROM pet;
SELECT * FROM person_pet;

DELETE FROM person_pet
  WHERE pet_id NOT IN (
    SELECt id FROM pet
  );

SELECT * FROM person_pet;
