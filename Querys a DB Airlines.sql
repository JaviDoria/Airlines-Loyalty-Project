# AGREGAR LA FOREIGN KEY PARA RELACIONAR LAS TABLAS

ALTER TABLE `customers_movements`
ADD CONSTRAINT `fk_customers`
FOREIGN KEY (`Loyalty_Number`)
REFERENCES `customers`(`Loyalty_Number`);

# AHORA QUE YA TENEMOS LAS TABLAS RELACIONADAS PODEMOS EMPEZAR A TRABAJAR CON EL MODELO


# LISTA CON ALGUNOS DATOS BÁSICOS DE LA TABLA CUSTOMERS
SELECT Loyalty_Number, Loyalty_Card, Marital_Status, Gender, Education 
FROM customers;

# TOTAL DE PUNTOS ACUMULADOS POR MARITAL STATUS
SELECT Marital_Status, SUM(Points_Accumulated) AS Total_Points
FROM customers
JOIN customers_movements ON customers.Loyalty_Number = customers_movements.Loyalty_Number
GROUP BY Marital_Status;

# LISTA DE USUARIOS QUE HAN REALIZADO MÁS VUELOS JUNTO A LOS PUNTOS QUE HAN CANJEADO, ORDENADO POR NÚMERO DE VUELOS DE MANERA DESCENDENTE
SELECT customers.Loyalty_Number, SUM(Total_Flights) AS Total_Flights, SUM(Points_Redeemed) AS Total_Points_Redeemed
FROM customers
JOIN customers_movements ON customers.Loyalty_Number = customers_movements.Loyalty_Number
GROUP BY customers.Loyalty_Number
ORDER BY Total_Flights DESC;

# LISTA TOTAL DE LA CANTIDAD DE USUARIOS QUE SE HAN DADO DE ALTA  Y DE BAJA EN CADA AÑO
SELECT Enrollment_Year AS Year, 
       COUNT(Enrollment_Month) AS Total_Enrollment, 
       COUNT(CASE WHEN Cancellation_Month > 0 THEN 1 END) AS Total_Cancellation
FROM customers
GROUP BY Enrollment_Year
ORDER BY Year DESC;













