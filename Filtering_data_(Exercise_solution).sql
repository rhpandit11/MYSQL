-- Task 1 solution: Write a SQL statement to print 
-- all records of orders where the cost is $250 or less.  
SELECT * FROM Orders WHERE Cost <= 250;

-- Task 2 solution: Write a SQL statement to print 
-- all records of orders where the cost is between $50 and $750.  
SELECT * FROM Orders WHERE Cost > 50 AND Cost < 750;

-- Task 3 solution: Write a SQL statement to print all records 
-- of orders that have been placed by the client with the
-- id of Cl3 and where the cost of the order is more than $100.  
SELECT * FROM Orders WHERE ClientID = "Cl3" and Cost > 100; 

-- Task 4 solution: Write a SQL statement to print 
-- all records of orders that have a 
-- product id of p1 or p2 and the order quantity is more than 2.
SELECT * FROM Orders WHERE ProductID = "P1" OR ProductID = "P2" AND Quantity > 2;  

-- Task 1 solution: Use the 
-- AND operator to find employees who earn an annual salary of $50,000 or more attached
-- to the Marketing department.
SELECT * FROM employees WHERE AnnualSalary >= 50000 AND Department = 'Marketing';

-- Task 2 solution: Use the NOT operator to find 
-- employees not earning over $50,000 across all departments. 
SELECT * FROM employees WHERE NOT AnnualSalary > 50000;

-- Task 3 solution: Use the
--  IN operator to find Marketing, Finance, and Legal employees whose annual salary is below $50,000. 
SELECT * FROM employees WHERE AnnualSalary < 50000 AND Department IN('Marketing', 'Finance', 'Legal');

-- Task 4 solution:
--  Use the BETWEEN operator to find employees who earn annual salaries between $10,000 and $50,000.
SELECT * FROM employees WHERE AnnualSalary BETWEEN 10000 AND 50000; 

-- Task 5 solution: Use the 
-- LIKE operator to find employees whose names start with ‘S’ and are at least 4 characters in length.
SELECT * FROM employees WHERE EmployeeName LIKE 'S___%';