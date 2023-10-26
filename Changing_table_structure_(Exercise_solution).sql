-- Task 1 solution: Write a SQL statement that creates the Staff table with the following columns: 

--     StaffID: INT 

--     FullName: VARCHAR(100) 

--     PhoneNumber: VARCHAR(10)
CREATE TABLE Staff (StaffID INT, FullName VARCHAR(100), PhoneNumber VARCHAR(10));

-- Task 2 solution: Write a SQL statement to apply the following constraints to the Staff table:

--     StaffID: INT NOT NULL and PRIMARY KEY 

--     FullName: VARCHAR(100) and NOT NULL 

--     PhoneNumber: INT NOT NULL
ALTER TABLE Staff MODIFY StaffID INT PRIMARY KEY, MODIFY FullName VARCHAR(100) NOT NULL, MODIFY PhoneNumber INT NOT NULL; 

-- Task 3 solution: Write a SQL statement that adds a new column called 'Role' to the Staff table with the following constraint: 

--     Role: VARCHAR(50) and NOT NULL
ALTER TABLE Staff ADD COLUMN Role VARCHAR(50) NOT NULL;

-- Task 4 solution: Write a SQL statement that drops the Phone Number column from the 'Staff' table.   
ALTER TABLE Staff DROP COLUMN PhoneNumber;

-- Task 1 solution: Add a PRIMARY KEY to the table 
ALTER TABLE FoodOrders MODIFY OrderID INT PRIMARY KEY;

-- Task 2 solution: Add the NOT NULL constraint to the columns
ALTER TABLE FoodOrders, MODIFY Quantity INT NOT NULL, MODIFY Cost decimal(4,2) NOT NULL;

-- Task 3 solution: Add new columns and create links between existing tables
ALTER TABLE FoodOrders ADD COLUMN OrderDate DATE NOT NULL, ADD COLUMN CustomerID INT NOT NULL, ADD FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID);

-- Task 4 solution: Delete a column using the DROP command with ALTER
ALTER TABLE FoodOrders DROP COLUMN OrderDate;

-- Task 5 solution: Rename a column using the CHANGE command with ALTER 
ALTER TABLE OrderStatus CHANGE Order_status DeliveryStatus VARCHAR(15);

-- Task 6 solution: Rename a table using the RENAME command with ALTER
ALTER TABLE OrderStatus RENAME OrderDeliveryStatus;

-- Commands to use with the ALTER Statement

-- ADD
ALTER TABLE table_name ADD column_name datatype;

-- Example:
ALTER TABLE Employees ADD Email VARCHAR(255);

-- MODIFY
ALTER TABLE table_name MODIFY COLUMN column_name datatype;

-- Example:
ALTER TABLE Employees MODIFY COLUMN Email VARCHAR(50);

-- Adding a FOREIGN KEY to an existing table using ADD
ALTER TABLE table_name ADD FOREIGN KEY (primary_key_column_name) REFERENCES link_table_name(reference_column_name);

-- Example:
ALTER TABLE Orders ADD FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID);

-- DROP COLUMN
ALTER TABLE table_name DROP COLUMN column_name;

-- Example:
ALTER TABLE Employees DROP COLUMN Email;

-- CHANGE
ALTER TABLE table_name CHANGE from_column to_column datatype;

-- Example:
ALTER TABLE Employees CHANGE Email BusinessEmail VARCHAR(50);

-- RENAME  
ALTER TABLE table_name RENAME new_table_name;

-- Example:
ALTER TABLE OrderStatus RENAME OrderDeliveryStatus;