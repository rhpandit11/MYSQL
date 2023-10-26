-- Task 1 solution: Write a SQL statement to create the OrdersView Virtual table based on the Orders table. 
-- The table must include the following columns: Order ID, Quantity and Cost. 
CREATE VIEW OrdersView AS SELECT OrderID, Quantity, Cost FROM Orders; 

-- Task 2 solution: Write a SQL statement that utilizes the ‘OrdersView’ virtual table to Update the base Orders table. 
-- In the UPDATE TABLE statement, change the cost to 200 where the order id equals 2. 
UPDATE OrdersView SET Cost = 200 WHERE OrderID = 2; 

-- Task 3 solution: Write a SQL statement that changes the name of the ‘OrdersView’ virtual table to ClientsOrdersView.  
RENAME TABLE OrdersView TO ClientsOrdersView;

-- Task 4 solution: Write a SQL statement to delete the Orders virtual table. 
DROP VIEW ClientsOrdersView; 

-- Creating virtual tables in MySQL
CREATE VIEW TableView AS SELECT STATEMENT;

-- Example:
CREATE VIEW OrdersView AS SELECT OrderID, Cost FROM Orders;

-- Retrieving Data from Virtual Tables
SELECT * FROM TableView;

-- Example:
SELECT * FROM OrdersView;

-- Updating Data in Virtual Tables
Update TableView set ColumnName = value where condition;

-- Example: 
Update OrdersView set Cost = 500 WHERE OrderID = 1;

-- Renaming Virtual Tables 
RENAME TABLE VirtualTableName TO NewVirtualTableName;

-- Example:
RENAME TABLE OrdersView TO OrdersViewTable;

-- Dropping Virtual Tables 
DROP VIEW VirtualTableName;

-- Example:
DROP VIEW OrdersViewTable;
