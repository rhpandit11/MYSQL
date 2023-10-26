CREATE PROCEDURE GetItalianCustomers() SELECT * FROM Customers WHERE Country = “Italy”;
CALL GetItalianCustomers();

CREATE PROCEDURE GetProductsDetails() SELECT * FROM Products; 

CREATE PROCEDURE GetProductsBasedOnPrice (inputPrice INT) 
SELECT * FROM Products WHERE Price <= inputPrice;
CALL GetProductsBasedOnPrice (50);

-- Task 1 solution: Write a SQL statement that creates a stored procedure called 'GetOrdersData', 
-- which retrieves all data from the Orders table.
CREATE PROCEDURE GetOrdersData ()  SELECT * FROM Orders; 

-- To call the GetOrdersData procedure write the following syntax.  
CALL GetOrdersData(); 

-- Task 2 solution: Write SQL statement that creates a stored procedure called “GetListOfOrdersInRange”.
--  The procedure must contain two parameters that determine the range of 
-- retrieved data based on the user input of two cost values “MinimumValue” and “MaximumValue”.
CREATE PROCEDURE GetListOfOrdersInRange (MinimumValue DECIMAL, MaximumValue DECIMAL)
SELECT * FROM Orders WHERE Cost >= MinimumValue AND Cost <= MaximumValue;

-- Write the following syntax to call the GetListOfOrdersInRange procedure.  
CALL GetListOfOrdersInRange (150, 600);