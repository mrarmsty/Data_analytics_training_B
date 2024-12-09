
-- --select first 5 employees ordered by salary 
SELECT *
FROM Employee
ORDER BY salary DESC
LIMIT 5;

-- find the first and last names of employees
SELECT first_name AS Forename,last_name AS Surname
FROM Employee;

-- Find out all the different genders of the employees
SELECT DISTINCT sex
FROM Employee;

-- SQL Functions
-- find the number of employees
SELECT COUNT(emp_id)
FROM Employee;

-- Find the number of FEMALE employees born after 1970
SELECT COUNT(sex)
FROM Employee
WHERE sex = 'F' AND birth_date > '1970-00-00';

-- Find the average AVERAGE salary of male employees
SELECT AVG(salary)
FROM Employee
WHERE sex = 'M';

-- Sum of all employee salaries
SELECT SUM(salary)
FROM Employee;

-- Find out how many females and males there are
SELECT COUNT(sex), sex
FROM Employee
GROUP BY sex;

-- Find the total sales of each salesman
SELECT emp_id, SUM(total_sales)
FROM Works_with
GROUP BY emp_id;

-- WILD CARDS
-- Find all clients that has 'Ath' in them
SELECT *
FROM Client
WHERE client_name LIKE 'Ath%';

-- Find any branch supplier who is into 'ball'
SELECT *
FROM Branch_supplier
WHERE supplier_name LIKE '%ball';

-- Find any employee born in September(09). INSIGHT: 
in getting this data, we wrote 4 underscores and a dash because of the year format.
SELECT *
FROM Employee
WHERE birth_date LIKE '____-09%';

-- Union
-- find the list of employee and branch name
SELECT first_name
FROM Employee
UNION
SELECT branch_name
FROM Branch;

-- find the list of all company earnings and spendings
SELECT SUM(salary)
FROM Employee
UNION
SELECT SUM(total_sales)
FROM Works_with;

-- Join
-- Find the managers of the various branches
SELECT Employee.emp_id AS Employee_ID, Employee.first_name AS Supervisor_name, Branch.branch_name AS Branch
FROM Employee
LEFT JOIN branch
ON Employee.emp_id = Branch.mgr_id;

-- find the sales of various employees
SELECT Employee.emp_id AS Employee_ID, Employee.first_name AS Employee_name, Works_with.total_sales AS Total_sales
FROM Employee
JOIN Works_with
ON Employee.emp_id = works_with.emp_id
GROUP BY Employee.emp_id
ORDER BY total_sales DESC;

-- Nested Queries
-- Find names of all employees who have sold over 30,000 to a single client
SELECT Employee.emp_id AS Employee_ID, Employee.first_name, Employee.last_name, works_with.total_sales AS Sales_above_30k, Client.client_name
FROM Employee
JOIN Works_with
ON Employee.emp_id = Works_with.emp_id
JOIN Client
ON Works_with.client_id = Client.client_id
WHERE Works_with.total_sales > 30000;

-- Here's nested queries
SELECT Employee.first_name, Employee.last_name
FROM Employee
WHERE Employee.emp_id IN (
      SELECT Works_with.emp_id
      FROM Works_with
      WHERE Works_with.total_sales > 30000
)

-- Find all clients who are handled by the branch Bethany England manages, assume you know Bethany's ID
SELECT client.client_name
FROM client
WHERE client.branch_id = (
    SELECT branch.branch_id
    FROM Branch
    WHERE branch.mgr_id = 102
    LIMIT 1
)

