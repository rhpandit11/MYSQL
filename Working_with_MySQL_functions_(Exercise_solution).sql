-- Task 1 solution: Write a SQL SELECT query using appropriate MySQL string functions 
-- to list items, quantities and order status in the following format: 
-- Item name–quantity–order status 
SELECT CONCAT(LCASE(Name),'-',Quantity,'-', UCASE(OrderStatus)) 
FROM item,mg_orders 
WHERE item.ItemID = mg_orders.ItemID;

-- Task 2 solution: Write a SQL SELECT query using an appropriate date function 
-- and a format string to find the name of the weekday on which M&G's orders are to be delivered. 
SELECT DATE_FORMAT(DeliveryDate,'%W') FROM mg_orders; 

-- Task 3 solution: Write a SQL SELECT query that calculates the cost of handling each order. This is 5% of the total order cost. 
-- Use an appropriate math function to round that value to 2 decimal places.
SELECT OrderID, ROUND((Cost * 5 / 100),2) AS HandlingCost FROM mg_orders; 

-- Task 4 solution: Review the query you wrote in the second task. Use an appropriate comparison 
-- function to filter out the records that do not have a NULL value in the delivery date column.  
SELECT DATE_FORMAT(DeliveryDate,'%W') FROM mg_orders WHERE !ISNULL(DeliveryDate);

-- Task 1 solution: Use the MySQL CEIL function in order to 
-- express the cost after the discount in the form of the smallest integer.
SELECT ClientID, OrderID, CEIL((Cost -(Cost * 5 /100))) AS afterDiscount 
FROM client_orders
WHERE ItemID = 4;

-- Task 2 solution: Format the afterDiscount column value from the earlier result for 5% 
-- discount in '#,###,###.##' format rounded to 2 decimal places using the FORMAT function.
SELECT ClientID, OrderID, FORMAT ((Cost -(Cost * 5 /100)), 2) AS afterDiscount 
FROM client_orders
WHERE ItemID = 4;

-- Task 3 solution: Find the expected delivery dates for their orders. 
-- The scheduled delivery date is 30 days after the order date. Use the ADDDATE function.
SELECT ADDDATE(OrderDate,INTERVAL 30 DAY) AS ExpectedDelDate 
FROM mg_orders;

-- Here’s the query using the second form:
SELECT ADDDATE(OrderDate,30) AS ExpectedDelDate FROM mg_orders;

-- Task 4 solution: Generate data required for a report with details of all 
-- orders that have not yet been delivered. The DeliveryDate column has a NULL value for 
-- orders not yet delivered. It would help if you showed a value of 'NOT DELIVERED' 
-- instead of showing NULL for orders that are not yet delivered. Use the COALESCE function to do this.
SELECT OrderID, ItemID, Quantity, Cost,  OrderDate,COALESCE (DeliveryDate,'NOT DELIVERED'), OrderStatus 
FROM mg_orders;

-- Task 5 solution: Generate data required for the report by retrieving a list of M&G 
-- orders that are yet to be delivered. These are the orders with a status of 'In Progress', using the 
-- NULLIF function. This is the query that gives the desired result, using the COALESCE function.
SELECT OrderID, NULLIF(OrderStatus,'In Progress') AS status 
FROM mg_orders;