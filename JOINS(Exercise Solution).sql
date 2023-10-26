-- Task 1 solution: Little Lemon wants a list of all customers who have made bookings. 
-- Write an INNER JOIN SQL statement to combine the customer's full name and phone number from 
-- the Customers table with the related booking date and the "number of guests" from the Bookings table.
SELECT Customers.FullName, Customers.PhoneNumber, Bookings.BookingDate, Bookings.NumberOfGuests 
FROM Customers INNER JOIN Bookings 
ON Customers.CustomerID = Bookings.CustomerID;

-- Task 2 solution: Little Lemon wants to view information about all existing customers with bookings 
-- made so far. This data must include customers who haven’t made any bookings yet. 
-- Write a LEFT JOIN SQL statement to view the customer id from the Customers table and 
-- the related booking id from the Bookings table.
SELECT Customers.CustomerID, Bookings.BookingID 
FROM Customers LEFT JOIN Bookings 
ON Customers.CustomerID = Bookings.CustomerID;