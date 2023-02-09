DROP TABLE IF EXISTS assignments;
DROP TABLE IF EXISTS animals;
DROP TABLE IF EXISTS staff;
DROP TABLE IF EXISTS enclosures;

-- CREATE.
CREATE TABLE staff (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    employeenumber INT
);

CREATE TABLE enclosures (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    capacity INT,
    closedForMaintenance BOOLEAN
);

CREATE TABLE animals (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    type VARCHAR(50),
    age INT,
    enclosure_id INT REFERENCES enclosures(id)
);

CREATE TABLE assignments (
    id SERIAL PRIMARY KEY,
    employee_id INT REFERENCES staff(id),
    enclosure_id INT REFERENCES enclosures(id),
    day VARCHAR(10)
);

-- INSERT.
INSERT INTO staff (name, employeenumber) VALUES ('Kenneth', 05);
INSERT INTO staff (name, employeenumber) VALUES ('Ian', 04);
INSERT INTO staff (name, employeenumber) VALUES ('Samantha', 03);
INSERT INTO staff (name, employeenumber) VALUES ('Emma', 01);
INSERT INTO staff (name, employeenumber) VALUES ('Spencer', 01);


INSERT INTO enclosures (name, capacity, closedForMaintenance) VALUES ('Gorilla Kingdom', 4, false);
INSERT INTO enclosures (name, capacity, closedForMaintenance) VALUES ('Cats', 2, false);
INSERT INTO enclosures (name, capacity, closedForMaintenance) VALUES ('Tropical Birds', 10, false);
INSERT INTO enclosures (name, capacity, closedForMaintenance) VALUES ('Reptiles', 2, true);
INSERT INTO enclosures (name, capacity, closedForMaintenance) VALUES ('Seal and Otter Rock', 5, true);

INSERT INTO animals (name, type, age, enclosure_id) VALUES ('Tony', 'Tiger', 5, 1);
INSERT INTO animals (name, type, age, enclosure_id) VALUES ('Erica', 'Snake', 10, 2);
INSERT INTO animals (name, type, age, enclosure_id) VALUES ('Emmitt', 'Otter', 4, 2);
INSERT INTO animals (name, type, age, enclosure_id) VALUES ('Pelcan', 'Seagull', 2, 3);

INSERT INTO assignments (employee_id, enclosure_id, day) VALUES (05, 1, 'Monday');
INSERT INTO assignments (employee_id, enclosure_id, day) VALUES (04, 2, 'Monday');
INSERT INTO assignments (employee_id, enclosure_id, day) VALUES (03, 2, 'Tuesday');
INSERT INTO assignments (employee_id, enclosure_id, day) VALUES (02, 3, 'Wednesday');
INSERT INTO assignments (employee_id, enclosure_id, day) VALUES (01, 2, 'Wednesday');

/*ANSWERS.
The names of the animals in a given enclosure
SELECT enclosures.name as enclosures, animals.name FROM enclosures INNER JOIN animals ON enclosures.id = animals.enclosure_id WHERE enclosures.name = 'Cats';

The names of the staff working in a given enclosure
SELECT enclosures.name as enclosure_name, staff.name as staff_name FROM assignments INNER JOIN staff ON assignments.employee_id = staff.id INNER JOIN enclosures ON assignments.enclosure_id = enclosures.id WHERE enclosures.name = 'Cats';

EXTENSIONS.
The names of staff working in enclosures which are closed for maintenance
SELECT staff.name
FROM staff
INNER JOIN assignments ON staff.id = assignments.employee_id
INNER JOIN enclosures ON assignments.enclosure_id = enclosures.id
WHERE enclosures.closedForMaintenance = 'False';
*/
