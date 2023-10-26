-- Task 1 solution: Use the SQL SELECT 
-- query to find all bookings that are due after the booking of the guest ‘Vanessa McCarthy’:  
SELECT * FROM Bookings WHERE BookingSlot > (SELECT BookingSlot FROM Bookings WHERE GuestFirstName = 'Vanessa' AND GuestLastName = 'McCarthy');

-- Task 2 solution: Use the SQL SELECT query to find the 
-- menu items that are more expensive than all the 'Starters' and 'Desserts' menu item types:
SELECT * FROM MenuItems WHERE Price > ALL (SELECT Price FROM MenuItems WHERE Type IN ('Starters', 'Desserts')); 

-- Task 3 solution: Use the SQL SELECT query to find the menu items that costs the 
-- same as the starter menu items that are Italian cuisine:
SELECT * FROM MenuItems WHERE Price = (SELECT Price FROM Menus, MenuItems WHERE Menus.ItemID = MenuItems.ItemID AND MenuItems.Type = 'Starters' AND Cuisine = 'Italian'); 

-- Task 4 solution: Use the SQL SELECT query to find the menu items that were not ordered by the guests who placed bookings:
WHERE NOT EXISTS (SELECT * FROM TableOrders, Menus WHERE TableOrders.MenuID = Menus.MenuID AND Menus.ItemID = MenuItems.ItemID); 

-- Task 1 solution: Find the minimum and the maximum average 
-- prices at which the customers can purchase food and drinks. 
SELECT Type, AVG(Price) AS avgPrice 
FROM MenuItems 
GROUP BY Type;

-- It can, in turn, be the source from which data (average price) is used to find the min and max average prices. So, you 
-- write this outer SELECT statement and add the above query as a subquery in its FROM clause as follows:
SELECT ROUND(MIN(avgPrice),2), ROUND(MAX(avgPrice),2) 
FROM (SELECT Type,AVG(Price) AS avgPrice
FROM MenuItems 
GROUP BY Type) AS aPrice;

-- Task 2 solution: Insert data of menu items with a minimum price based on the 'Type' into the LowCostMenuItems table. 
INSERT INTO LowCostMenuItems 
SELECT ItemID,Name,Price 
FROM MenuItems 
WHERE Price =ANY(SELECT MIN(Price) FROM MenuItems GROUP BY Type);

-- Task 3 solution: Delete all the low-cost menu items whose price is 
-- more than the minimum price of menu items that have a price between $5 and $10. 

DELETE FROM LowCostMenuItems 
WHERE Price > ALL(SELECT MIN(Price) as p 
FROM MenuItems 
GROUP BY Type 
HAVING p BETWEEN 5 AND 10);

