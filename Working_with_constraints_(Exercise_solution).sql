-- Task 1 solution: Create the Clients table with the following columns and constraints.

--     ClientID: INT, NOT NULL and PRIMARY KEY

--     FullName: VARCHAR(100) NOT NULL

--     PhoneNumber: INT, NOT NULL and UNIQUE
CREATE TABLE Clients (ClientID INT PRIMARY KEY, FullName VARCHAR(100) NOT NULL, PhoneNumber INT NOT NULL UNIQUE);

-- Task 2 solution: Create the Items table with the following attributes and constraints:

--     ItemID: INT, NOT NULL and PRIMARY KEY

--     ItemName: VARCHAR(100) and NOT NULL

--     Price: Decimal(5,2) and NOT NULL
CREATE TABLE Items (ItemID INT PRIMARY KEY, ItemName VARCHAR(100) NOT NULL, Price DECIMAL(5,2) NOT NULL);

-- Task 3 solution: Create the Orders table with the following constraints.

--     OrderID: INT, NOT NULL and PRIMARY KEY

--     ClientID: INT, NOT NULL and FOREIGN KEY

--     ItemID: INT, NOT NULL and FOREIGN KEY

--     Quantity: INT, NOT NULL and maximum allowed items in each order 3 only

--     COST Decimal(6,2) and NOT NULL
CREATE TABLE Orders ( 
OrderID INT PRIMARY KEY,  
ItemID INT NOT NULL,   
ClientID INT NOT NULL,   
Quantity INT NOT NULL CHECK (Quantity < 4),  
Cost DECIMAL(6,2) NOT NULL,  
FOREIGN KEY (ClientID) REFERENCES Clients (ClientID), 
FOREIGN KEY (ItemID) REFERENCES Items (ItemID) 
);

-- Task 1 solution: Practice using Key constraints

-- To create the Staff table in MySQL, you can use the CREATE TABLE Staff, followed by the StaffID, PhoneNumber and FullName columns, and the related constraints as shown below.
-- 1
CREATE TABLE Staff (StaffID INT NOT NULL PRIMARY KEY, PhoneNumber INT NOT NULL UNIQUE, FullName VARCHAR(100) NOT NULL);

-- Once you execute the above query, you should be able to view the table structure by running the following query:
SHOW COLUMNS FROM Staff;

Task 2 solution: Practice using Domain constraints

-- To create the ‘Contract info’ table, you can use the CREATE TABLE ContractInfo followed by 
-- the ContractID, StaffID, Salary and StaffType columns, and the related constraints as shown below.
CREATE TABLE ContractInfo (ContractID INT NOT NULL PRIMARY KEY, StaffID INT NOT NULL, 
Salary Decimal(7, 2) NOT NULL, Location VARCHAR(50) NOT NULL DEFAULT "Texas", 
StaffType VARCHAR(20) NOT NULL CHECK (StaffType = "Junior" OR StaffType = "Senior"));

Task 3 solution: Practice using Referential integrity constraints

-- To create the relationship between the Staff 
-- table and the Contract Info table, run the following SQL query with the foreign key constraint:
FOREIGN KEY (StaffID) REFERENCES Staff(StaffID);