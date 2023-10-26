-- Task 1 solution: Write a SQL REPLACE statement that inserts two new orders with the following details: 

--     Order 9 data: OrderID = 9, ClientID = "Cl1", ProductID = "P1", Quantity = 10, Cost = 5000  

--     Order 10 data: OrderID = 10, ClientID = "Cl2", ProductID = "P2", Quantity = 5, Cost = 100   
REPLACE INTO Orders (OrderID, ClientID, ProductID, Quantity, Cost) VALUES (9, "Cl1", "P1", 10, 5000), (10, "Cl2", "P2", 5, 100);

-- Task 2 solution: Lucky Shrub have noticed that the cost of order number 9 is $5000. This is a mistake. 
-- The order should cost $500. You must help them to change it to $500 by writing a relevant REPLACE statement.  
REPLACE INTO Orders SET OrderID = 9, ClientID = "Cl1", ProductID = "P1", Quantity = 10, Cost = 500;

-- Task 1 solution: Use the REPLACE statement to insert a new record of data with the following details: 

--     ‘StarterName’ = Cheese bread

--     ‘Cost’ = 9.50 

--     ‘StarterType’ = Indian   
REPLACE INTO Starters (StarterName, Cost, StarterType) VALUES ("Cheese bread ", 9.50, "Indian");

-- Task 2 solution: Use the REPLACE statement to change the cost of the Cheese bread from $9.50 to $9.75. 
-- There are two methods that can be used to complete this task. One of these solutions is as follows:
REPLACE INTO Starters (StarterName, Cost, StarterType) VALUES ("Cheese bread", 9.75, "Indian");
