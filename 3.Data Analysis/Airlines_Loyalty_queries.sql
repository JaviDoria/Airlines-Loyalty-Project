

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

-- Total flights by Loyalty_Card and Year --
SELECT Loyalty_Card, Year, SUM(Total_Flights) AS Total_Flights
FROM customers
JOIN customers_movements ON customers.Loyalty_Number = customers_movements.Loyalty_Number
GROUP BY Loyalty_Card, Year
ORDER BY Loyalty_Card, Year;

-- Total cost of points redeemed by Loyalty_Card and Year --
SELECT Loyalty_Card, Year, SUM(Cost_Points_Redeemed) AS Cost_Redeemed
FROM customers
JOIN customers_movements ON customers.Loyalty_Number = customers_movements.Loyalty_Number
GROUP BY Loyalty_Card, Year
ORDER BY Loyalty_Card, Year;

-------------------------------------------

-- Analysis of Accumulated Points vs. Redeemed Points --
SELECT c.Loyalty_Card, cm.Year, 
       SUM(cm.Points_Accumulated) AS Total_Points_Accumulated,
       SUM(cm.Points_Redeemed) AS Total_Points_Redeemed
FROM customers c
JOIN customers_movements cm ON c.Loyalty_Number = cm.Loyalty_Number
GROUP BY c.Loyalty_Card, cm.Year
ORDER BY cm.Year;

-- Total Cost of Points Redeemed per Year --
SELECT cm.Year, SUM(cm.Cost_Points_Redeemed) AS Total_Cost_Redeemed
FROM customers_movements cm
GROUP BY cm.Year
ORDER BY cm.Year;

-- Accumulation and Redemption of Points by Gender --
SELECT c.Gender, SUM(cm.Points_Accumulated) AS Total_Points_Accumulated,
       SUM(cm.Points_Redeemed) AS Total_Points_Redeemed
FROM customers c
JOIN customers_movements cm ON c.Loyalty_Number = cm.Loyalty_Number
GROUP BY c.Gender;

-- Travel Analysis by Education Level --
SELECT c.Education, COUNT(cm.Total_Flights) AS Total_Flights, 
       SUM(cm.Distance) AS Total_Distance
FROM customers c
JOIN customers_movements cm ON c.Loyalty_Number = cm.Loyalty_Number
GROUP BY c.Education
ORDER BY Total_Flights DESC;

-- Customer livetime value !!!!!!!!--
SELECT c.Loyalty_Card, c.CLV, 
       SUM(cm.Total_Flights) AS Total_Flights,
       SUM(cm.Points_Accumulated) AS Total_Points_Accumulated
FROM customers c
JOIN customers_movements cm ON c.Loyalty_Number = cm.Loyalty_Number
GROUP BY c.Loyalty_Card, c.CLV
ORDER BY c.CLV DESC;

-- Membership Duration vs. Membership Cancellation !!!!!!--
SELECT c.Loyalty_Card, 
       (c.Cancellation_Year - c.Enrollment_Year) AS Membership_Duration_Years, 
       SUM(cm.Total_Flights) AS Total_Flights
FROM customers c
JOIN customers_movements cm ON c.Loyalty_Number = cm.Loyalty_Number
WHERE c.Cancellation_Year IS NOT NULL
GROUP BY c.Loyalty_Card, Membership_Duration_Years
ORDER BY Membership_Duration_Years DESC;

-- Flight Frequency by Year and Month --
SELECT cm.Year, cm.Month, 
       SUM(cm.Total_Flights) AS Total_Flights, 
       SUM(cm.Distance) AS Total_Distance
FROM customers_movements cm
GROUP BY cm.Year, cm.Month
ORDER BY cm.Year, cm.Month;

-- Analysis of Point Usage by Province --
SELECT c.Province, SUM(cm.Points_Accumulated) AS Total_Points_Accumulated,
       SUM(cm.Points_Redeemed) AS Total_Points_Redeemed
FROM customers c
JOIN customers_movements cm ON c.Loyalty_Number = cm.Loyalty_Number
GROUP BY c.Province
ORDER BY Total_Points_Accumulated DESC;

-- Analysis of Point Usage by City --
SELECT c.City, SUM(cm.Points_Accumulated) AS Total_Points_Accumulated,
       SUM(cm.Points_Redeemed) AS Total_Points_Redeemed
FROM customers c
JOIN customers_movements cm ON c.Loyalty_Number = cm.Loyalty_Number
GROUP BY c.City
ORDER BY Total_Points_Accumulated DESC;

-- Analysis of Points by Enrollment Type --
SELECT c.Enrollment_Type, 
       SUM(cm.Points_Accumulated) AS Total_Points_Accumulated,
       SUM(cm.Points_Redeemed) AS Total_Points_Redeemed
FROM customers c
JOIN customers_movements cm ON c.Loyalty_Number = cm.Loyalty_Number
GROUP BY c.Enrollment_Type
ORDER BY Total_Points_Accumulated DESC;

-- Flight Frequency and Points Use by Education Level --
SELECT c.Education, 
       COUNT(cm.Total_Flights) AS Total_Flights, 
       SUM(cm.Points_Accumulated) AS Total_Points_Accumulated,
       SUM(cm.Points_Redeemed) AS Total_Points_Redeemed,
       SUM(cm.Cost_Points_Redeemed) AS Total_Cost_Redeemed
FROM customers c
JOIN customers_movements cm ON c.Loyalty_Number = cm.Loyalty_Number
GROUP BY c.Education
ORDER BY Total_Flights DESC;

-- Duration of Membership by Education Level  !!!!--
SELECT c.Education, 
       AVG(c.Cancellation_Year - c.Enrollment_Year) AS Avg_Membership_Duration_Years
FROM customers c
WHERE c.Cancellation_Year IS NOT NULL
GROUP BY c.Education
ORDER BY Avg_Membership_Duration_Years DESC;

-- Combined Analysis: Type of Membership and Educational Level --
SELECT c.Enrollment_Type, c.Education, 
       SUM(cm.Points_Accumulated) AS Total_Points_Accumulated, 
       SUM(cm.Points_Redeemed) AS Total_Points_Redeemed
FROM customers c
JOIN customers_movements cm ON c.Loyalty_Number = cm.Loyalty_Number
GROUP BY c.Enrollment_Type, c.Education
ORDER BY Total_Points_Accumulated DESC;

-- Segmentation by Educational Level --
SELECT c.Education, AVG(c.CLV) AS Avg_CLV, 
    SUM(cm.Points_Accumulated) AS Total_Points_Accumulated,
    SUM(cm.Points_Redeemed) AS Total_Points_Redeemed
FROM customers c
JOIN customers_movements cm ON c.Loyalty_Number = cm.Loyalty_Number
GROUP BY c.Education;

-- Loyalty Program Growth --
SELECT 
    c.Enrollment_Year, 
    COUNT(c.Loyalty_Number) AS New_Enrollments
FROM customers c
GROUP BY c.Enrollment_Year
ORDER BY c.Enrollment_Year;

-- Customer Satisfaction (Estimated from Points Redeemed) --
SELECT 
    c.Loyalty_Card, 
    SUM(cm.Points_Redeemed) * 100 / SUM(cm.Points_Accumulated) AS Redemption_Rate
FROM customers c
JOIN customers_movements cm ON c.Loyalty_Number = cm.Loyalty_Number
GROUP BY c.Loyalty_Card;



























