select * from pet, person, person_pet
  where person.id = person_pet.person_id
  and pet.id = person_pet.pet_id
  and person.first_name = "Coach";

select * from pet join person, person_pet
  on person.id = person_pet.person_id
  and pet.id = person_pet.pet_id
  and person.first_name = "Coach";

select * from pet left outer join person, person_pet
  on person.id = person_pet.person_id
  and pet.id = person_pet.pet_id
  and person.first_name = "Coach";
