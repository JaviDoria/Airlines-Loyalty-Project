-- Creating the airlines_loyalty database --

CREATE DATABASE airlines_loyalty;


-- Creating dimension table customers --

CREATE TABLE `customers` (
  `Loyalty_Number` VARCHAR(12) PRIMARY KEY,
  `Country` VARCHAR(30) DEFAULT NULL,
  `Province` VARCHAR(30) DEFAULT NULL,
  `City` VARCHAR(30) DEFAULT NULL,
  `Postal_Code` VARCHAR(12) DEFAULT NULL,
  `Gender` VARCHAR(10) DEFAULT NULL,
  `Education` VARCHAR(50) DEFAULT NULL,
  `Salary` INT DEFAULT 0,
  `Marital_Status` VARCHAR(50) DEFAULT NULL,
  `Loyalty_Card` VARCHAR(20),
  `CLV` INT DEFAULT NULL,
  `Enrollment_Type` VARCHAR(50),
  `Enrollment_Year` INT,
  `Enrollment_Month` INT,
  `Cancellation_Year` INT,
  `Cancellation_Month` INT
);

-- Creating fact table customers_movements --

CREATE TABLE `customers_movements` (
  `Loyalty_Number` VARCHAR(12),
  `Year` INT,
  `Month` INT,
  `Total_Flights` INT DEFAULT 0,
  `Distance` INT DEFAULT 0,
  `Points_Accumulated` INT DEFAULT 0,
  `Points_Redeemed` INT DEFAULT 0,
  `Cost_Points_Redeemed` INT DEFAULT 0,
  FOREIGN KEY (Loyalty_Number) REFERENCES customers(Loyalty_Number)
);

-- Loading file into dimension table --

LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\DB_Airlines_customers.csv"
INTO TABLE customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

-- One query for checking that the data load was correct --

SELECT * FROM customers;


-- Loading file fact dimension table --

LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\DB_Customers_movements.csv"
INTO TABLE customers_movements
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

-- One query for checking that the data load was correct --

SELECT * FROM customers_movements;

