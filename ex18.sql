/* Average age of every person */
select avg(age) from person;

/* Average age of every pet */
select avg(age) from pet;

/* select the agverage age of all pets by breed */
select breed, avg(age) from pet group by breed;

/*  select the average age of every breed by dead or alive */
select breed, dead, avg(age) from pet group by breed, dead;

/* Select the sum of all ages of people */
select sum(age) from person;

/* Select the sum of all ages of pet */
select sum(age) from pet;

/* select min and max ages of people */
select min(age), max(age) from person;

/* select min and max ages of pet */
select min(age), max(age) from pet;

/* breed dead/alive min/max age from pet */
select breed, dead, min(age), max(age) from pet where age > 0 group by breed, dead;
