

-- Counting the total number of customers by type of Loyalty_Card --
SELECT Loyalty_Card, COUNT(Loyalty_Number) AS Customers
FROM customers
GROUP BY Loyalty_Card;

-- Total Points_Accumulated by Marital_Status --
SELECT Marital_Status, SUM(Points_Accumulated) AS Total_Points
FROM customers
JOIN customers_movements ON customers.Loyalty_Number = customers_movements.Loyalty_Number
GROUP BY Marital_Status;

-- List of customers who have taken the most flights along with the points they have redeemed, sorted by number of flights in descending order --
SELECT customers.Loyalty_Number, SUM(Total_Flights) AS Flights, SUM(Points_Redeemed) AS Points_Redeemed
FROM customers
JOIN customers_movements ON customers.Loyalty_Number = customers_movements.Loyalty_Number
GROUP BY customers.Loyalty_Number
ORDER BY Flights DESC;

-- Total list of the number of users who have registered and deregistered each year -- 
SELECT Enrollment_Year AS Year, 
       COUNT(Enrollment_Month) AS Total_Enrollment, 
       COUNT(CASE WHEN Cancellation_Month > 0 THEN 1 END) AS Total_Cancellation
FROM customers
GROUP BY Enrollment_Year
ORDER BY Year DESC;













