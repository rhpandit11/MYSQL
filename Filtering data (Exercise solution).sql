-- Task 1 solution: Write a SQL statement to print 
-- all records of orders where the cost is $250 or less.  
SELECT * FROM Orders WHERE Cost <= 250;

-- Task 2 solution: Write a SQL statement to print 
-- all records of orders where the cost is between $50 and $750.  
SELECT * FROM Orders WHERE Cost > 50 AND Cost < 750;