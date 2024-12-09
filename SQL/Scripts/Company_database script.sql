
 
 CREATE DATABASE COMPANY_DATABASE;
 
--  Employee table
 CREATE TABLE Employee(
 emp_id INT PRIMARY KEY,
 first_name VARCHAR(40),
 last_name VARCHAR(40),
 birth_date DATE,
 sex VARCHAR(2),
 salary INT,
 super_id INT,
 branch_id INT
 );
 
 INSERT INTO Employee VALUES(100, 'Thiago', 'Silva', 19840922, 'M', 370000, NULL,1);
  INSERT INTO Employee VALUES(101, 'Lauren', 'James', 20001209, 'F', 170000, 100,1);
  INSERT INTO Employee VALUES(102, 'Kai', 'Havertz', 19690404, 'M', 200500, 100,2);
   INSERT INTO Employee VALUES(103, 'Mason', 'Mount', 19990719, 'M', 230000, 102,2);
    INSERT INTO Employee VALUES(104, 'Fran', 'Kirby', 19790922, 'F', 70000, 102,2);
     INSERT INTO Employee VALUES(105, 'Bethany', 'England', 19961128, 'F', 100000, 102,2);
      INSERT INTO Employee VALUES(106, 'Mateo', 'Kovacic', 19920130, 'M', 200000, 100,3);
       INSERT INTO Employee VALUES(107, 'Carney', 'Chukwuemeka', 20031022, 'M', 50000, 106,3);
        INSERT INTO Employee VALUES(108, 'Reece', 'James', 20001209, 'M', 270000, 106,1);
         INSERT INTO Employee VALUES(109, 'Jorginho', 'Frello', 19940902, 'M', 170000, 100,3);
         
 SELECT * FROM employee;
--   ORDER BY sex, first_name;
--   ORDER BY salary;
  
  DESCRIBE Employee;



-- Branch Table
CREATE TABLE Branch(
branch_id INT PRIMARY KEY,
branch_name VARCHAR(40),
mgr_id INT,
mgr_start_date DATE,
FOREIGN KEY(mgr_id) REFERENCES Employee(emp_id) ON DELETE SET NULL
);
 
 INSERT INTO Branch VALUES(1, 'London',100,20040412);
  INSERT INTO Branch VALUES(2, 'Liverpool',102,20080822);
   INSERT INTO Branch VALUES(3, 'Manchester',106,19970205);
 SELECT * FROM Branch;
 


ALTER TABLE Employee
ADD FOREIGN KEY(branch_id) REFERENCES Branch(branch_id)
ON DELETE SET NULL;

ALTER TABLE Employee
ADD FOREIGN KEY(super_id)
REFERENCES Employee(emp_id)
ON DELETE SET NULL;


--  Client Table
CREATE TABLE Client(
client_id INT PRIMARY KEY,
client_name VARCHAR(40),
branch_id INT,
FOREIGN KEY(branch_id) REFERENCES Branch(branch_id) ON DELETE SET NULL
);

INSERT INTO Client VALUES(400,'Bristol',2);
INSERT INTO Client VALUES(401,'Cagliari',2);
INSERT INTO Client VALUES(402,'Athletico',3);
INSERT INTO Client VALUES(403,'Lyon',3);
INSERT INTO Client VALUES(404,'Milano',2);
INSERT INTO Client VALUES(405,'Athletico',3);
INSERT INTO Client VALUES(406,'Sevilla',2);
SELECT * FROM Client;



-- Works_with Table
CREATE TABLE Works_with(
emp_id INT,
client_id INT,
total_sales INT,
PRIMARY KEY(emp_id,client_id),
FOREIGN KEY(emp_id) REFERENCES Employee(emp_id) ON DELETE CASCADE,
FOREIGN KEY(client_id) REFERENCES Client(client_id) ON DELETE CASCADE
);

INSERT INTO Works_with VALUES (105, 400, 55000);
INSERT INTO Works_with VALUES (102,401,267000);
INSERT INTO Works_with VALUES(108,402,22500);
INSERT INTO Works_with VALUES (107,403,5000);
INSERT INTO Works_with VALUES (108,403,12000);
INSERT INTO Works_with VALUES (105,404,33000);
INSERT INTO Works_with VALUES (107,405,26000);
INSERT INTO Works_with VALUES (102,406,15000);
INSERT INTO Works_with VALUES (105,406,130000);
SELECT * FROM Works_with;



-- Branch_supplier Table
CREATE TABLE Branch_supplier(
branch_id INT,
supplier_name VARCHAR(40),
supply_type VARCHAR(30),
PRIMARY KEY(branch_id,supplier_name),
FOREIGN KEY(branch_id) REFERENCES Branch(branch_id) ON DELETE CASCADE
);

INSERT INTO Branch_supplier VALUES (2,'Fabrizio','Transfer_news');
INSERT INTO Branch_supplier VALUES (2,'Sarri-ball','Football');
INSERT INTO Branch_supplier VALUES(3,'Matt','Transfer_news');
INSERT INTO Branch_supplier VALUES (2,'Roberto','Cones');
INSERT INTO Branch_supplier VALUES (3,'Sarri-ball','Football');
INSERT INTO Branch_supplier VALUES (3,'Fabrizio','Transfer_news');
INSERT INTO Branch_supplier VALUES (3,'Lisandro','Cones');
SELECT * FROM Branch_supplier;







   DELETE FROM Employee
 WHERE last_name = 'Frello';
 
  DROP TABLE Branch;
   DROP TABLE Employee;
    DROP TABLE Client;
     DROP TABLE works_with;
      DROP TABLE branch_supplier;