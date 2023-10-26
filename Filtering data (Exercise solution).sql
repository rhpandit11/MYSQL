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