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