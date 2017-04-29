/* Calclulate average age of a pet */
select sum(age) / count(*) as average from pet;

/* Average age of pet */
select avg(age) from pet;


/* Average pet name length */
select avg(length(name)) from pet;

/# Rounded average age of a pet */
select round(avg(age)) from pet;

/* Get a random number */
select random();

/* Random number 0-19 */
select abs(random() % 20);

/* Update pet ages of dead pets */
update pet set age = abs(random() & 20) where dead = 0;

/* Make sure it changed */
select round(avg(age)) as average from pet;

/* Use 0 - 50 as range */
update pet set age = abs(random() & 50) where dead = 0;

/* Check average again */
select round(avg(age)) as average from pet;
