DROP TABLE IF EXISTS person;

CREATE TABLE person (
  id INTEGER PRIMARY KEY,
  first_name TEXT,
  last_name TEXT,
  age INTEGER
);

/* Rename table to peoples */
ALTER TABLE person RENAME TO peoples;

ALTER TABLE peoples ADD COLUMN hatred INTEGER;

.schema peoples

ALTER TABLE peoples RENAME TO person;

.schema person

DROP TABLE IF EXISTS person;
