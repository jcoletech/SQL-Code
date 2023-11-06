-- CREATE DATABASE student;
-- USE student;

-- i created a table and create each coloum and made student_id primary key
-- CREATE TABLE student (
student_id INT PRIMARY KEY, 
    name VARCHAR (20), 
    major VARCHAR (20)
);

-- wanted to see the description of my student table 
-- DESCRIBE student; 

-- dececided to add another coloum to student table
-- ALTER TABLE student ADD gpa DECIMAL(3,2);

-- to drop the gpa a colunm we just added to the table
-- ALTER TABLE student DROP COLUMN gpa;

-- inserting data, insereted my first row to my data
-- INSERT INTO student VALUES (1, 'Jack', 'Biology');

-- to see the data i just inserted into the table row
-- SELECT * FROM student;

-- to inseret another row data
-- INSERT INTO student VALUES (2, 'Kate', 'Sociology');

-- to insert data into a specific without major 
-- INSERT INTO student(student_id, name) VALUES (3, 'Claire')

-- to insert remaining data to each rows  
-- INSERT INTO student VALUES (4, 'Jack', 'Biology'),
	(5, 'Mike', 'Comp.Sci');
    
-- Constraints 
-- to drop the table and use another method
-- DROP TABLE student;

-- CREATE TABLE student (
student_id INT PRIMARY KEY, 
    name VARCHAR (20) NOT NULL, 
    major VARCHAR (20) UNIQUE
);

-- SELECT * FROM student;

-- INSERT INTO student VALUES (1, 'Jack', 'Biology'),
	(2, 'Kate', 'Sociology');
    
-- INSERT INTO student VALUES (3, 'Claire', 'Chemistry')

-- it wont work because i already indicate unique so it cant duplicate
-- INSERT INTO student VALUES (4, 'Jack', 'Biology'),
	(5, 'Mike', 'Comp.Sci');
    
-- DROP TABLE student;

-- create a table and make major undecided 
-- CREATE TABLE student (
student_id INT PRIMARY KEY, 
    name VARCHAR (20), 
    major VARCHAR (20) DEFAULT 'undecided'
);

-- to make it work from making the major undecided with the default 
-- INSERT INTO student (student_id, name) VALUES (1, 'Jack');

-- auto_increment
-- DROP TABLE student;

-- create table to show auto_increment
-- CREATE TABLE student (
	student_id INT AUTO_INCREMENT, 
    name VARCHAR (20), 
    major VARCHAR (20),
    PRIMARY KEY (student_id)
);

-- SELECT * FROM student;

-- INSERT INTO student (name, major) VALUES ('Jack', 'Biology'),
	('Kate', 'Sociology');
    
-- INSERT INTO student (name, major) VALUES ('Claire', 'Chemistry'),
	('Jack', 'Biology'),
	('Mike', 'Comp.Sci');
    
-- SELECT * FROM student;

-- UPDATE & DELETE
-- UPDATE, is the first we would look out which is to update data
-- so what i want to achieve is to replace 'biology' with 'bio'
-- UPDATE student
SET major = 'Bio'
WHERE major = 'Biology'; 

-- SELECT * FROM student;

-- so what i want to achieve is to replace 'comp.sci' with 'comp science'
-- UPDATE student
SET major = 'Computer Science'
WHERE major = 'Comp.Sci'; 

-- SELECT * FROM student;

-- i can also decided to change the major of student_id
-- UPDATE student
SET major = 'Computer Science'
WHERE student_id = 4; 

-- SELECT * FROM student;

-- i can also decided to combine multiple things 'bio' and 'chemistry' to make it 'biochemistry'
-- UPDATE student
SET major = 'Biochemistry'
WHERE major = 'Bio' OR major = 'Chemistry'; 

-- SELECT * FROM student;

-- i can also decided the name and major data for student_id to replace with another data
-- UPDATE student
SET name = 'Tom', major = 'undecided'
WHERE student_id = 1; 

-- SELECT * FROM student;

-- note that the WHERE is for specific row now if i want to change all data i wont use WHERE
-- UPDATE student
SET name = 'Tom', major = 'undecided'
WHERE student_id = 1; 

-- SELECT * FROM student;

-- DELETE
-- Now to delete a specific row or delete a group of rows
-- DELETE FROM student; it would delete all the row

-- to delete student_id 5 row
-- DELETE FROM student
WHERE student_id = 5;

-- SELECT * FROM student;

-- i want to  delete from student where name is tom and undecided 
-- DELETE FROM student
WHERE name = 'Tom' AND major = 'undecided';

-- SELECT * FROM student;

-- now i want to delete everything
-- DELETE FROM student;

-- INSERT INTO student (name, major) VALUES ('Jack','Biology'),
	('Kate', 'Sociology'),
    ('Claire', 'Chemistry'),
	('Jack', 'Biology'),
	('Mike', 'Computer Science');

-- SELECT * FROM student;

-- BASIC QUERIES
-- if i want to select just name from the table 
SELECT name FROM student;

-- if i want to select just name and major from the table 
-- SELECT name, major FROM student;

-- or we can use another method to select specific coloum
-- SELECT student.name FROM student;

-- SELECT student.name, student.major FROM student;

-- to arrange in ascending alphabethic order for example using name colum to arrange
-- SELECT student.name, student.major 
FROM student
ORDER BY name;

-- to arrange in descending order for example using name colum to arrange
-- SELECT student.name, student.major 
FROM student
ORDER BY name DESC;


-- select everything in descending order 
-- SELECT *
FROM student
ORDER BY student_id DESC;

-- select everything in ascending order 
-- SELECT *
FROM student
ORDER BY student_id ASC;

-- LIMIT
-- To limit the data rows to a certain level this example is to 2 rows
-- SELECT *
FROM student 
LIMIT 2;

-- SELECT *
FROM student 
ORDER BY student_id DESC
LIMIT 2;

-- FILTER
-- to filter and see only a specific data from colum/row
-- SELECT *
FROM student 
WHERE major = 'Biology';

-- to filter and see 2colums to see only  specific data from colum/row
-- SELECT name, major
FROM student
WHERE major = 'Chemistry' OR major = 'Biology'

-- SELECT name, major
FROM student
WHERE major = 'Chemistry' OR name = 'Kate'

-- IN
-- IN is used as is for example i want to see only claire, kate and mike details
SELECT *
FROM student
WHERE name IN ('Claire', 'Kate', 'Mike')

