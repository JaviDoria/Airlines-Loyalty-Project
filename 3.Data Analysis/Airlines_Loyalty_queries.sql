

-- Counting the total number of customers by type of Loyalty Card --
SELECT Loyalty_Card, COUNT(Loyalty_Number) AS Customers
FROM customers
GROUP BY Loyalty_Card;

-- Analysis of Accumulated Points vs. Redeemed Points --
SELECT c.Loyalty_Card, cm.Year, 
       FORMAT(SUM(cm.Points_Accumulated),0) AS Total_Points_Accumulated,
       FORMAT(SUM(cm.Points_Redeemed),0) AS Total_Points_Redeemed
FROM customers c
JOIN customers_movements cm ON c.Loyalty_Number = cm.Loyalty_Number
GROUP BY c.Loyalty_Card, cm.Year
ORDER BY cm.Year;

-- Total Cost of Points Redeemed per Year --
SELECT cm.Year, FORMAT(SUM(cm.Cost_Points_Redeemed),0) AS "Total_Cost_Redeemed $"
FROM customers_movements cm
GROUP BY cm.Year
ORDER BY cm.Year;

-- Accumulation and Redemption of Points by Gender --
SELECT c.Gender, FORMAT(SUM(cm.Points_Accumulated),0) AS Total_Points_Accumulated,
       FORMAT(SUM(cm.Points_Redeemed),0) AS Total_Points_Redeemed
FROM customers c
JOIN customers_movements cm ON c.Loyalty_Number = cm.Loyalty_Number
GROUP BY c.Gender;

-- Total Points Accumulated by Marital_Status --
SELECT Marital_Status, FORMAT(SUM(Points_Accumulated),0) AS Total_Points
FROM customers
JOIN customers_movements ON customers.Loyalty_Number = customers_movements.Loyalty_Number
GROUP BY Marital_Status;

-- Total flights by Loyalty Card and Year --
SELECT Loyalty_Card, Year, FORMAT(SUM(Total_Flights),0) AS Total_Flights
FROM customers
JOIN customers_movements ON customers.Loyalty_Number = customers_movements.Loyalty_Number
GROUP BY Loyalty_Card, Year
ORDER BY Loyalty_Card, Year;

-- Travel Analysis by Education Level --
SELECT c.Education, FORMAT(COUNT(cm.Total_Flights),0) AS Total_Flights, 
       FORMAT(SUM(cm.Distance),0) AS Total_Distance
FROM customers c
JOIN customers_movements cm ON c.Loyalty_Number = cm.Loyalty_Number
GROUP BY c.Education
ORDER BY Total_Flights DESC;

-- Historical customers spend, total flights and points accumulated by Loyalty Card class  --
SELECT c.Loyalty_Card, FORMAT(SUM(c.CLV),0) AS "CLV $", 
       FORMAT(SUM(cm.Total_Flights),0) AS Total_Flights,
       FORMAT(SUM(cm.Points_Accumulated),0) AS Total_Points_Accumulated
FROM customers c
JOIN customers_movements cm ON c.Loyalty_Number = cm.Loyalty_Number
GROUP BY c.Loyalty_Card;

-- Total list of the number of users who have registered and deregistered each year -- 
SELECT Enrollment_Year AS Year, 
       FORMAT(COUNT(Enrollment_Month),0) AS Total_Enrollment, 
       COUNT(CASE WHEN Cancellation_Month > 0 THEN 1 END) AS Total_Cancellation
FROM customers
GROUP BY Enrollment_Year
ORDER BY Year DESC;


-- Flight Frequency by Year and Month --
SELECT cm.Year, cm.Month, 
       FORMAT(SUM(cm.Total_Flights),0) AS Total_Flights, 
       FORMAT(SUM(cm.Distance),0) AS Total_Distance
FROM customers_movements cm
GROUP BY cm.Year, cm.Month
ORDER BY cm.Year, cm.Month;

-- Analysis of Point Usage by Province --
SELECT c.Province, 
    FORMAT(SUM(cm.Points_Accumulated), 0) AS Total_Points_Accumulated, 
    FORMAT(SUM(cm.Points_Redeemed), 0) AS Total_Points_Redeemed
FROM customers c
JOIN customers_movements cm ON c.Loyalty_Number = cm.Loyalty_Number
GROUP BY c.Province
ORDER BY SUM(cm.Points_Accumulated) DESC;

-- Analysis of Point Usage by City --
SELECT c.City, 
    FORMAT(SUM(cm.Points_Accumulated), 0) AS Total_Points_Accumulated, 
    FORMAT(SUM(cm.Points_Redeemed), 0) AS Total_Points_Redeemed
FROM customers c
JOIN customers_movements cm ON c.Loyalty_Number = cm.Loyalty_Number
GROUP BY c.City
ORDER BY SUM(cm.Points_Accumulated) DESC;


-- Analysis of Points by Enrollment Type --
SELECT c.Enrollment_Type, 
       FORMAT(SUM(cm.Points_Accumulated),0) AS Total_Points_Accumulated,
       FORMAT(SUM(cm.Points_Redeemed),0) AS Total_Points_Redeemed
FROM customers c
JOIN customers_movements cm ON c.Loyalty_Number = cm.Loyalty_Number
GROUP BY c.Enrollment_Type
ORDER BY SUM(cm.Points_Accumulated) DESC;

-- Total Cost of points redeemed by Loyalty Card and Year --
SELECT Loyalty_Card, Year, FORMAT(SUM(Cost_Points_Redeemed),0) AS "Cost_Redeemed $"
FROM customers
JOIN customers_movements ON customers.Loyalty_Number = customers_movements.Loyalty_Number
GROUP BY Loyalty_Card, Year
ORDER BY Loyalty_Card, Year;

-- Flight Frequency and Points Use by Education Level --
SELECT cm.Year,c.Education, 
       FORMAT(COUNT(cm.Total_Flights),0) AS Total_Flights, 
       FORMAT(SUM(cm.Points_Accumulated),0) AS Total_Points_Accumulated,
       FORMAT(SUM(cm.Points_Redeemed),0) AS Total_Points_Redeemed,
       FORMAT(SUM(cm.Cost_Points_Redeemed),0) AS "Total_Cost_Redeemed $"
FROM customers c
JOIN customers_movements cm ON c.Loyalty_Number = cm.Loyalty_Number
GROUP BY cm.Year, c.Education
ORDER BY COUNT(cm.Total_Flights) DESC;

-- Combined Analysis: Type of Membership and Educational Level --
SELECT c.Enrollment_Type, c.Education, 
       FORMAT(SUM(cm.Points_Accumulated),0) AS Total_Points_Accumulated, 
       FORMAT(SUM(cm.Points_Redeemed),0) AS Total_Points_Redeemed
FROM customers c
JOIN customers_movements cm ON c.Loyalty_Number = cm.Loyalty_Number
GROUP BY c.Enrollment_Type, c.Education
ORDER BY c.Enrollment_Type DESC;

-- Segmentation by Educational Level --
SELECT c.Education, FORMAT(AVG(c.CLV),0) AS "Avg_CLV $", 
    FORMAT(SUM(cm.Points_Accumulated),0) AS Total_Points_Accumulated,
    FORMAT(SUM(cm.Points_Redeemed),0) AS Total_Points_Redeemed
FROM customers c
JOIN customers_movements cm ON c.Loyalty_Number = cm.Loyalty_Number
GROUP BY c.Education;

-- Loyalty Program Growth --
SELECT 
    c.Enrollment_Year, 
    FORMAT(COUNT(c.Loyalty_Number),0) AS New_Enrollments
FROM customers c
GROUP BY c.Enrollment_Year
ORDER BY c.Enrollment_Year;

-- Customer Satisfaction (Estimated from Points Redeemed) --
SELECT 
    c.Loyalty_Card, 
    ROUND(SUM(cm.Points_Redeemed) * 100 / SUM(cm.Points_Accumulated),2) AS Redemption_Rate
FROM customers c
JOIN customers_movements cm ON c.Loyalty_Number = cm.Loyalty_Number
GROUP BY c.Loyalty_Card;



























