-- Final Project - Repair Shop - Messian Berry & Ralph McCloskey - CIS 205

-- The following statement removes the database if it exists so the new database can be created.
DROP DATABASE IF EXISTS repairShop;
-- The following statement creates the database.
CREATE DATABASE repairShop;
-- The following statement tells the database that the user wants to use the database.
USE repairShop;

-- The following statements ensure that the tables do not currently exist, and if they do, they are deleted.
DROP TABLE IF EXISTS repair_shop;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS vehicles;
DROP TABLE IF EXISTS vendors;
DROP TABLE IF EXISTS services;
DROP TABLE IF EXISTS parts;
DROP TABLE IF EXISTS invoices;

-- These statements create the tables we will use in the database.
CREATE TABLE repair_shop
(
    -- Each of the following lines creates a column in the table.  The column name is on the left, and the data type and parameters are on the right.
    rs_id    INT AUTO_INCREMENT PRIMARY KEY,
    rs_name  VARCHAR(50)  NOT NULL,
    address  VARCHAR(255) NOT NULL,
    city     VARCHAR(100) NOT NULL,
    state    VARCHAR(50)  NOT NULL,
    zip_code VARCHAR(10)  NOT NULL
);

show tables;

CREATE TABLE employees
(
    emp_id      INT AUTO_INCREMENT PRIMARY KEY,
    empFName    VARCHAR(30) NOT NULL,
    empLName    VARCHAR(50) NOT NULL,
    empPosition VARCHAR(20) NOT NULL,
    rs_id_FK    INT,
    -- The CONSTRAINT statement designates that a column in this table is either a primary key or a foreign key and shows to which table and which column it refers.  There is no need to designate the primary key in this case, as it is already designated by the parameters above.
    CONSTRAINT rs_id_FK1 FOREIGN KEY (rs_id_FK)
        REFERENCES repair_shop (rs_id)
);

show tables;

CREATE TABLE customers
(
    cust_id     INT AUTO_INCREMENT PRIMARY KEY,
    custFName   VARCHAR(30)  NOT NULL,
    custLName   VARCHAR(45)  NOT NULL,
    custAddress VARCHAR(255) NOT NULL,
    custPhone   CHAR(10)     NOT NULL
);

show tables;

CREATE TABLE vehicles
(
    vehicle_id INT AUTO_INCREMENT PRIMARY KEY,
    vin        VARCHAR(17) NOT NULL,
    year       INT         NOT NULL,
    make       VARCHAR(50) NOT NULL,
    model      VARCHAR(50) NOT NULL,
    color      VARCHAR(20) NOT NULL,
    mileage    INT         NOT NULL,
    cust_id_FK INT,

    CONSTRAINT cust_id_FK1 FOREIGN KEY (cust_id_FK)
        REFERENCES customers (cust_id)
);

show tables;

CREATE TABLE vendors
(
    vendor_id     INT AUTO_INCREMENT PRIMARY KEY,
    vendorName    VARCHAR(50)  NOT NULL,
    vendorContact VARCHAR(50),
    vendorAddress VARCHAR(255) NOT NULL,
    vendorCity    VARCHAR(50)  NOT NULL,
    vendorState   VARCHAR(15)  NOT NULL,
    vendorZip     VARCHAR(10)  NOT NULL,
    vendorPhone   CHAR(10)     NOT NULL,
    vendorEmail   VARCHAR(100),
    vendorWebsite VARCHAR(100),
    vendorTerms   VARCHAR(10),
    rs_id_FK      INT,

    CONSTRAINT rs_id_FK2 FOREIGN KEY (rs_id_FK)
        REFERENCES repair_shop (rs_id)
);

show tables;

CREATE TABLE services
(
    service_id    INT AUTO_INCREMENT PRIMARY KEY,
    serviceName   VARCHAR(50) NOT NULL,
    serviceType   VARCHAR(10) NOT NULL,
    svcMileage    INT,
    svcDate       DATE,
    rs_id_FK      INT,
    emp_id_FK     INT,
    vehicle_id_FK INT,

    CONSTRAINT rs_id_FK3 FOREIGN KEY (rs_id_FK)
        REFERENCES repair_shop (rs_id),
    CONSTRAINT emp_id_FK1 FOREIGN KEY (emp_id_FK)
        REFERENCES employees (emp_id),
    CONSTRAINT vehicle_ID_FK1 FOREIGN KEY (vehicle_id_FK)
        REFERENCES vehicles (vehicle_id)
);

show tables;

CREATE TABLE invoices
(
    invoice_id      INT AUTO_INCREMENT PRIMARY KEY,
    invoiceDate     DATE           NOT NULL,
    invoiceTotal    DECIMAL(10, 2) NOT NULL,
    invoicePaid     CHAR(1)        NOT NULL,
    invoiceBalance  DECIMAL(10, 2) NOT NULL,
    invoiceDueDate  DATE           NOT NULL,
    invoicePaidDate DATE,
    cust_id_FK      INT,
    emp_id_FK       INT,
    service_id_FK   INT,
    rs_id_FK        INT,

    CONSTRAINT cust_id_FK2 FOREIGN KEY (cust_id_FK)
        REFERENCES customers (cust_id),
    CONSTRAINT emp_id_FK2 FOREIGN KEY (emp_id_FK)
        REFERENCES employees (emp_id),
    CONSTRAINT service_id_FK1 FOREIGN KEY (service_id_FK)
        REFERENCES services (service_id),
    CONSTRAINT rs_id_FK4 FOREIGN KEY (rs_id_FK)
        REFERENCES repair_shop (rs_id)
);

show tables;

CREATE TABLE parts
(
    part_id         INT AUTO_INCREMENT PRIMARY KEY,
    partNum         VARCHAR(50)    NOT NULL,
    partName        VARCHAR(255)   NOT NULL,
    partDescription VARCHAR(255)   NOT NULL,
    partManufacture VARCHAR(50)    NOT NULL,
    partCategory    VARCHAR(50)    NOT NULL,
    partUnit        VARCHAR(10)    NOT NULL,
    partCost        DECIMAL(10, 2) NOT NULL,
    partWarranty    VARCHAR(20)    NOT NULL,
    rs_id_FK        INT,
    vendor_id_FK    INT,
    service_id_FK   INT,

    CONSTRAINT rs_id_FK5 FOREIGN KEY (rs_id_FK)
        REFERENCES repair_shop (rs_id),
    CONSTRAINT vendor_id_FK1 FOREIGN KEY (vendor_id_FK)
        REFERENCES vendors (vendor_id),
    CONSTRAINT service_id_FK2 FOREIGN KEY (service_id_FK)
        REFERENCES services (service_id)
);

show tables;

-- The following statements insert data into the tables.
INSERT INTO repair_shop
(
    -- This line designates what columns will be filled in with data.  The column names are separated by commas.
    rs_name, address, city, state, zip_code)
-- The following lines contain the data that will be inserted.  Strings are inside single quotes, numbers are just typed in, and NULL is used for empty values.
VALUES ('Main', '2485 South Street', 'Philadelphia', 'PA', '19145'),
       ('L1', '1723 West Christian Street', 'Philadelphia', 'PA', '19123'),
       ('L2', '2100 West Dauphin Street', 'Philadelphia', 'PA', '19221');

INSERT INTO employees
    (empFname, empLName, empPosition, rs_id_FK)
VALUES ('Joe', 'Brown', 'Manager', 1),
       ('Sam', 'Smucker', 'Head Mechanic', 1),
       ('Henry', 'Smulligan', 'Mechanic', 1),
       ('George', 'Liebig', 'Mechanic', 1),
       ('Corey', 'Wiggins', 'Mechanic', 1),
       ('Charlie', 'Reading', 'Manager', 2),
       ('Marc', 'Blundell', 'Head Mechanic', 2),
       ('Mark', 'Thomas', 'Mechanic', 2),
       ('Joe', 'Smith', 'Mechanic', 2);

INSERT INTO customers
(custFName, custLName, custAddress, custPhone)
VALUES ('John', 'Doe', '123 Elm St, Philadelphia, PA', '2175551234'),
       ('Jane', 'Smith', '456 Oak St, Philadelphia, PA', '2175555678'),
       ('Bob', 'Johnson', '789 Pine St, Philadelphia, PA', '2175559012'),
       ('Alice', 'Williams', '321 Maple St, Philadelphia, PA', '2175553456'),
       ('Charlie', 'Brown', '654 Cedar St, Philadelphia, PA', '2175557890'),
       ('David', 'Jones', '987 Birch St, Philadelphia, PA', '2175552345'),
       ('Eve', 'Davis', '159 Spruce St, Philadelphia, PA', '2175556789'),
       ('Frank', 'Miller', '753 Willow St, Philadelphia, PA', '2175550123'),
       ('Grace', 'Wilson', '852 Cherry St, Philadelphia, PA', '2175554567'),
       ('Hank', 'Moore', '951 Walnut St, Philadelphia, PA', '2175558901'),
       ('Ivy', 'Taylor', '357 Poplar St, Philadelphia, PA', '2175552345'),
       ('Jack', 'Anderson', '258 Fir St, Philadelphia, PA', '2175556789'),
       ('Kathy', 'Thomas', '369 Ash St, Philadelphia, PA', '2175550123'),
       ('Leo', 'Jackson', '147 Elm St, Philadelphia, PA', '2175554567'),
       ('Mia', 'White', '258 Oak St, Philadelphia, PA', '2175558901'),
       ('Nina', 'Harris', '369 Pine St, Philadelphia, PA', '2175552345');


INSERT INTO vehicles
(vin, year, make, model, color, mileage, cust_id_FK)
VALUES ('1HGCM82633A123456', 2003, 'Honda', 'Accord', 'Blue', 120000, 1),
       ('1FAFP404X4F123456', 2004, 'Ford', 'Mustang', 'Red', 80000, 2),
       ('1G1ZT628X5F123456', 2005, 'Chevrolet', 'Malibu', 'Black', 60000, 3),
       ('1N4AL3AP7EC123456', 2014, 'Nissan', 'Altima', 'White', 40000, 4),
       ('2C3CCACG9EH123456', 2014, 'Chrysler', '300C', 'Silver', 50000, 5),
       ('1J4BA3H10AL123456', 2010, 'Jeep', 'Wrangler', 'Green', 70000, 6),
       ('1FTFW1EF8EKE12345', 2014, 'Ford', 'F-150', 'Black', 30000, 7),
       ('2G1WT58KX91123456', 2009, 'Chevrolet', 'Impala', 'Blue', 90000, 8),
       ('3VW2K7AJ6BM123456', 2011, 'Volkswagen', 'Jetta', 'Red', 80000, 9),
       ('5NPEB4AC0CH123456', 2012, 'Hyundai', 'Sonata', 'White', 60000, 10),
       ('1GNSKCKC8ER123456', 2014, 'Chevrolet', 'Tahoe', 'Silver', 50000, 11),
       ('1C4RJFBG5EC123456', 2014, 'Jeep', 'Grand Cherokee', 'Green', 70000, 12),
       ('1FADP3F21EL123456', 2014, 'Ford', 'Focus', 'Black', 30000, 13),
       ('2C3CCACG9EH123456', 2014, 'Chrysler', '300C', 'Silver', 50000, 14),
       ('1J4BA3H10AL123456', 2010, 'Jeep', 'Wrangler', 'Green', 70000, 15);

INSERT INTO vendors
(vendorName, vendorContact, vendorAddress, vendorCity, vendorState, vendorZip, vendorPhone, rs_id_FK)
VALUES ('Autozone', '', '2101 Oregon Avenue', 'Philadelphia', 'PA', '19145', '21543063+6', 1),
       ('Autozone', '', '2101 Oregon Avenue', 'Philadelphia', 'PA', '19145', '21543063+6', 2),
       ('Autozone', '', '2101 Oregon Avenue', 'Philadelphia', 'PA', '19145', '21543063+6', 3),
       ('Pep Boys', '', '2298 West Ritner Street', 'Philadelphia', 'PA', '19145', '2153367180', 1),
       ('Pep Boys', '', '2298 West Ritner Street', 'Philadelphia', 'PA', '19145', '2153367180', 2),
       ('Pep Boys', '', '2298 West Ritner Street', 'Philadelphia', 'PA', '19145', '2153367180', 3);

INSERT INTO services
(serviceName, serviceType, svcMileage, svcDate, rs_id_FK, emp_id_FK, vehicle_id_FK)
VALUES ('Oil Change', 'Oil', 5000, '2023-10-01', 1, 2, 1),
       ('Tire Rotation', 'Tire', 10000, '2023-10-02', 1, 3, 2),
       ('Brake Inspection', 'Brake', 15000, '2023-10-03', 2, 4, 3),
       ('Transmission Flush', 'Transm', 20000, '2023-10-04', 2, 5, 4),
       ('Battery Replacement', 'Battery', 25000, '2023-10-05', 1, 7, 5),
       ('Alignment', 'Alignment', 30000, '2023-10-06', 1, 8, 6),
       ('Fuel System Cleaning', 'Fuel', 35000, '2023-10-07', 2, 9, 7),
       ('Cooling System Flush', 'Cooling', 40000, '2023-10-08', 2, 2, 8),
       ('Exhaust Inspection', 'Exhaust', 45000, '2023-10-09', 1, 3, 9),
       ('Suspension Check', 'Suspension', 50000, '2023-10-10', 1, 4, 10),
       ('Detailing Service', 'Detailing', NULL, '2023-10-11', 2, 5, 11),
       ('Windshield Replacement', 'Windshield', NULL, '2023-10-12', 2, 7, 12),
       ('Bodywork Repair', 'Bodywork', NULL, '2023-10-13', 1, 8, 13),
       ('Engine Diagnostic', 'Diagnostic', NULL, '2023-10-14', 1, 9, 14),
       ('AC Recharge', 'AC Service', NULL, '2023-10-15', 2, 3, 15);

INSERT INTO parts
(partNum, partName, partDescription, partManufacture, partCategory, partUnit, partCost, partWarranty, rs_id_FK, vendor_id_FK, service_id_FK)
VALUES ('113645', 'Rain-X -25', 'Windshield Washer Fluid', 'Rain-X', 'Windshield', 'Gallon', 6.29, 'None', 1, 1, 12),
       ('113645', 'Rain-X -25', 'Windshield Washer Fluid', 'Rain-X', 'Windshield', 'Gallon', 6.29, 'None', 2, 1, 12),
       ('113645', 'Rain-X -25', 'Windshield Washer Fluid', 'Rain-X', 'Windshield', 'Gallon', 6.29, 'None', 3, 1, 12),
       ('54070', 'Brake Rotor', 'Front Brake Rotor', 'Duralast', 'Brakes', 'Each', 81.49, '2 Year', 1, 1, 3),
       ('54070', 'Brake Rotor', 'Front Brake Rotor', 'Duralast', 'Brakes', 'Each', 81.49, '2 Year', 2, 1, 3),
       ('54070', 'Brake Rotor', 'Front Brake Rotor', 'Duralast', 'Brakes', 'Each', 81.49, '2 Year', 3, 1, 3),
       ('C614', 'Brake Caliper', 'Front Brake Caliper (Left)', 'Duralast', 'Brakes', 'Each', 61.99, 'Limited Lifetime',
        1, 1, 3),
       ('C614', 'Brake Caliper', 'Front Brake Caliper (Left)', 'Duralast', 'Brakes', 'Each', 61.99, 'Limited Lifetime',
        2, 1, 3),
       ('C614', 'Brake Caliper', 'Front Brake Caliper (Left)', 'Duralast', 'Brakes', 'Each', 61.99, 'Limited Lifetime',
        3, 1, 3),
       ('C615', 'Brake Caliper', 'Front Brake Caliper (Right)', 'Duralast', 'Brakes', 'Each', 61.99, 'Limited Lifetime',
        1, 1, 3),
       ('C615', 'Brake Caliper', 'Front Brake Caliper (Right)', 'Duralast', 'Brakes', 'Each', 61.99, 'Limited Lifetime',
        2, 1, 3),
       ('C615', 'Brake Caliper', 'Front Brake Caliper (Right)', 'Duralast', 'Brakes', 'Each', 61.99, 'Limited Lifetime',
        3, 1, 3),
       ('H7-AGM', 'Battery', 'Car Battery Group 7', 'Duralast', 'Electrical', 'Each', 229.99, '3 Year', 1, 1, 5),
       ('H7-AGM', 'Battery', 'Car Battery Group 7', 'Duralast', 'Electrical', 'Each', 229.99, '3 Year', 2, 1, 5),
       ('H7-AGM', 'Battery', 'Car Battery Group 7', 'Duralast', 'Electrical', 'Each', 229.99, '3 Year', 3, 1, 5),
       ('DL1701-16-3', 'Alternator', 'Alternator', 'Duralast', 'Electrical', 'Each', 181.99, 'Limited Lifetime', 1, 1,
        5),
       ('DL1701-16-3', 'Alternator', 'Alternator', 'Duralast', 'Electrical', 'Each', 181.99, 'Limited Lifetime', 2, 1,
        5),
       ('DL1701-16-3', 'Alternator', 'Alternator', 'Duralast', 'Electrical', 'Each', 181.99, 'Limited Lifetime', 3, 1,
        5),
       ('DL1701-16-4', 'Starter', 'Starter', 'Duralast', 'Electrical', 'Each', 181.99, 'Limited Lifetime', 1, 1, 5),
       ('DL1701-16-4', 'Starter', 'Starter', 'Duralast', 'Electrical', 'Each', 181.99, 'Limited Lifetime', 2, 1, 5),
       ('DL1701-16-4', 'Starter', 'Starter', 'Duralast', 'Electrical', 'Each', 181.99, 'Limited Lifetime', 3, 1, 5),
       ('CAS10W30-1', 'Quart 10W-30 Oil', 'Quart of engine oil', 'Castrol', 'Engine', 'Quart', '6.35', '', 1, 1, 1),
       ('CAS10W30-1', 'Quart 10W-30 Oil', 'Quart of engine oil', 'Castrol', 'Engine', 'Quart', '6.35', '', 2, 1, 1),
       ('CAS10W30-1', 'Quart 10W-30 Oil', 'Quart of engine oil', 'Castrol', 'Engine', 'Quart', '6.35', '', 3, 1, 1),
       ('CAS10W30-1', 'Quart 10W-30 Oil', 'Quart of engine oil', 'Castrol', 'Engine', 'Quart', '6.35', '', 1, 2, 1),
       ('CAS10W30-1', 'Quart 10W-30 Oil', 'Quart of engine oil', 'Castrol', 'Engine', 'Quart', '6.35', '', 2, 2, 1),
       ('CAS10W30-1', 'Quart 10W-30 Oil', 'Quart of engine oil', 'Castrol', 'Engine', 'Quart', '6.35', '', 3, 2, 1);


INSERT INTO invoices
(invoiceDate, emp_id_FK, service_id_FK, cust_id_FK, invoiceTotal, invoicePaid, invoiceBalance, invoiceDueDate, invoicePaidDate, rs_id_FK)
VALUES ('2023-01-15', 1, 2, 1, 150.00, 'N', 150.00, '2023-02-15', '0000-00-00', 1),
       ('2023-02-20', 3, 2, 2, 200.00, 'N', 200.00, '2023-03-20', '0000-00-00', 1),
       ('2023-03-10', 5, 2, 3, 250.00, 'N', 250.00, '2023-04-10', '0000-00-00', 1),
       ('2023-04-05', 4, 2, 4, 300.00, 'N', 300.00, '2023-05-05', '0000-00-00', 1),
       ('2023-05-12', 2, 2, 5, 350.00, 'N', 350.00, '2023-06-12', '0000-00-00', 1),
       ('2023-06-18', 5, 2, 6, 400.00, 'N', 400.00, '2023-07-18', '0000-00-00', 1),
       ('2023-07-25', 8, 2, 7, 450.00, 'N', 450.00, '2023-08-25', '0000-00-00', 2),
       ('2023-08-30', 8, 4, 8, 500.00, 'N', 500.00, '2023-09-30', '0000-00-00', 2),
       ('2023-09-15', 7, 5, 9, 550.00, 'N', 550.00, '2023-10-15', '0000-00-00', 2),
       ('2023-10-20', 2, 3, 10, 600.00, 'N', 600.00, '2023-11-20', '0000-00-00', 1),
       ('2023-11-05', 3, 7, 11, 650.00, 'N', 650.00, '2023-12-05', '0000-00-00', 2),
       ('2023-12-12', 9, 1, 12, 700.00, 'N', 700.00, '2024-01-12', '0000-00-00', 2),
       ('2024-01-18', 6, 4, 13, 750.00, 'N', 750.00, '2024-02-18', '0000-00-00', 2),
       ('2024-02-25', 4, 5, 14, 800.00, 'N', 800.00, '2024-03-25', '0000-00-00', 1),
       ('2024-03-10', 6, 1, 15, 850.00, 'N', 850.00, '2024-04-10', '0000-00-00', 2);

SELECT * FROM repair_shop;
SELECT * FROM employees;
SELECT * FROM customers;
SELECT * FROM vehicles;
SELECT * FROM vendors;
SELECT * FROM services;
SELECT * FROM invoices;
SELECT * FROM parts;