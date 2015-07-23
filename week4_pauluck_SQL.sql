/* Puneet Auluck - SQL Assignment #4 */

/* Please create an organization chart for a real or imagined organization, implemented in a single SQL table.  */

/* 1. Create the table. Each row should minimally include the person’s name, the person’s supervisor, and the
person’s job title. Using ID columns is encouraged. */

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
  emp_id	integer PRIMARY KEY NOT NULL,
  first_name	varchar(50) NOT NULL,
  last_name	varchar(50) NOT NULL,
  title		varchar(100) NOT NULL,
  supervisor_id	integer
);


/* 2. Populate the table with a few sample rows.*/
INSERT INTO employees (emp_id, first_name, last_name, title, supervisor_id) VALUES (101, 'John', 'Smith', 'Deputy Commissioner', null);
INSERT INTO employees (emp_id, first_name, last_name, title, supervisor_id) VALUES (102, 'Monica', 'Bing', 'Assistant Commissioner',101);
INSERT INTO employees (emp_id, first_name, last_name, title, supervisor_id) VALUES (103, 'Zehra', 'Holiak', 'Director', 102);
INSERT INTO employees (emp_id, first_name, last_name, title, supervisor_id) VALUES (104, 'Fred', 'Russo', 'Director', 102);
INSERT INTO employees (emp_id, first_name, last_name, title, supervisor_id) VALUES (105, 'Sameer', 'Anki', 'Division Chief', 103);
INSERT INTO employees (emp_id, first_name, last_name, title, supervisor_id) VALUES (106, 'Jai', 'Maher', 'Division Chief', 104);
INSERT INTO employees (emp_id, first_name, last_name, title, supervisor_id) VALUES (107, 'Sumika', 'Jas', 'Section Chief', 105);
INSERT INTO employees (emp_id, first_name, last_name, title, supervisor_id) VALUES (108, 'Edward', 'Zing', 'Section Chief', 105);
INSERT INTO employees (emp_id, first_name, last_name, title, supervisor_id) VALUES (109, 'Allen', 'Chu', 'Section Chief', 106);
INSERT INTO employees (emp_id, first_name, last_name, title, supervisor_id) VALUES (110, 'Jane', 'Miller', 'Inventory Specialist', 107);
INSERT INTO employees (emp_id, first_name, last_name, title, supervisor_id) VALUES (111, 'Laura', 'Riccio', 'Report Sepcialist', 108);
INSERT INTO employees (emp_id, first_name, last_name, title, supervisor_id) VALUES (112, 'Ron', 'Dillon', 'Database Specialist', 108);
INSERT INTO employees (emp_id, first_name, last_name, title, supervisor_id) VALUES (113, 'Jason', 'Aiden', 'Programmer', 109);


/*3. Provide a single SELECT statement that displays the information in the table, showing who reports to whom */
SELECT e.emp_id AS "Employee ID", 
  e.first_name AS "First Name", 
  e.last_name AS "Last Name", 
  e.title AS "Title", 
  e2.first_name || ' ' || e2.last_name AS "Supervisor"
 FROM employees e LEFT JOIN employees e2 
 ON e.supervisor_id=e2.emp_id;

