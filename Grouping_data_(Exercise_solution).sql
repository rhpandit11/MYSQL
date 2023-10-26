-- Task 1 solution: Write a SQL SELECT statement to group all records that have the same order date.
SELECT OrderDate FROM Orders GROUP BY OrderDate;

-- Task 2 solution: Write a SQL SELECT statement to retrieve the number of orders placed on the same day.
SELECT OrderDate,COUNT(OrderID) FROM Orders GROUP BY OrderDate;

-- Task 3 solution: 
-- Write a SQL SELECT statement to retrieve the total order quantities placed by each department.
SELECT Department, SUM(OrderQty) FROM Orders GROUP BY Department;

-- Task 4 solution:  Write a SQL SELECT statement to retrieve the number 
-- of orders placed on the same day between the following dates: 1st June 2022 and 30th June 2022.
SELECT OrderDate,COUNT(OrderID) FROM Orders 
GROUP BY OrderDate HAVING OrderDate BETWEEN '2022-06-01' AND '2022-06-30';