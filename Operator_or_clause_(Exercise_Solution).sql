-- Task 1 solution: 
-- Use the ANY operator to identify all employees with the Order Status status 'Completed'. 
WHERE EmployeeID = ANY (SELECT EmployeeID FROM employee_orders WHERE Status='Completed'); 

-- Task 2 solution: Use the ALL operator to identify the IDs of employees
-- who earned a handling cost of "more than 20% of the order value" from all orders they have handled.
SELECT EmployeeID,HandlingCost
FROM employee_orders 
WHERE HandlingCost > ALL(SELECT ROUND(OrderTotal/100 * 20) FROM orders); 

-- Task 3 solution: Use the GROUP BY clause to summarize the duplicate 
-- records with the same column values into a single record by grouping them based on those columns.
SELECT EmployeeID,HandlingCost
FROM employee_orders
WHERE HandlingCost > ALL(SELECT ROUND(OrderTotal/100 * 20) FROM orders) GROUP BY EmployeeID,HandlingCost;

-- Task 4 solution: Use the HAVING clause to filter the grouped data in the subquery that you wrote 
-- in task 3 to filter the 20% OrderTotal values to only retrieve values that are more than $100.
SELECT EmployeeID,HandlingCost
FROM employee_orders
WHERE HandlingCost > ALL(SELECT ROUND(OrderTotal/100 * 20) AS twentyPercent FROM orders GROUP BY OrderTotal  
HAVING twentyPercent > 100) GROUP BY EmployeeID,HandlingCost;     