select pet.breed, pet.dead, count(dead)
  from person, person_pet, pet
  where person.id = person_pet.person_id and pet.id = person_pet.pet_id
  group by pet.breed, pet.dead;

create view dead_pets as
select pet.breed, pet.dead, count(dead) as total
  from person, person_pet, pet
  where person.id = person_pet.person_id and pet.id = person_pet.pet_id
  group by pet.breed, pet.dead;

select * from dead_pets where total > 10;

delete from pet where breed = "Cat";

select * from dead_pets;

drop view dead_pets;
