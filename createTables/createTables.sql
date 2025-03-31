DROP TABLE IF EXISTS locations;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS parts;
DROP TABLE IF EXISTS vendor;
DROP TABLE IF EXISTS services;
DROP TABLE IF EXISTS invoices;
DROP TABLE IF EXISTS vehicles;

CREATE TABLE locations
(
    location_id     INT AUTO_INCREMENT PRIMARY KEY,
    location_name   VARCHAR(50) NOT NULL,
    address         VARCHAR(255) NOT NULL,
    city            VARCHAR(100) NOT NULL,
    state           VARCHAR(50) NOT NULL,
    zip_code        VARCHAR(10) NOT NULL,

    CONSTRAINT location_id PRIMARY KEY (location_id)
);

CREATE TABLE employees
(
    emp_id          INT AUTO_INCREMENT PRIMARY KEY,
    empFName        VARCHAR(30) NOT NULL,
    empLName        VARCHAR(50) NOT NULL,
    empPosition     VARCHAR(20) NOT NULL,
    location_id_FK  INT,

    CONSTRAINT emp_id PRIMARY KEY (emp_id),
    CONSTRAINT location_id_FK FOREIGN KEY (location_id_FK)
        REFERENCES locations(location_id)
);

CREATE TABLE customers
(
    cust_id         INT AUTO_INCREMENT PRIMARY KEY,
    custFName       VARCHAR(30) NOT NULL,
    custLName       VARCHAR(45) NOT NULL,
    custAddress     VARCHAR(255) NOT NULL,
    custPhone       CHAR(10) NOT NULL,

    CONSTRAINT cust_id PRIMARY KEY (cust_id)
);

CREATE TABLE vehicles
(
    vehicle_id      INT AUTO_INCREMENT PRIMARY KEY,
    vin             VARCHAR(17) NOT NULL,
    year            INT NOT NULL,
    make            VARCHAR(50) NOT NULL,
    model           VARCHAR(50) NOT NULL,
    color           VARCHAR(20) NOT NULL,
    mileage         INT NOT NULL,
    cust_id_FK      INT,

    CONSTRAINT vehicle_id PRIMARY KEY (vehicle_id),
    CONSTRAINT cust_id_FK1 FOREIGN KEY (cust_id_FK)
        REFERENCES customers(cust_id)
);

CREATE TABLE parts
(
    part_id         INT AUTO_INCREMENT PRIMARY KEY,
    partNum         VARCHAR(50) NOT NULL,
    partName        VARCHAR(255) NOT NULL,
    partDescription VARCHAR(255) NOT NULL,
    partManufacture VARCHAR(50) NOT NULL,
    partCategory    VARCHAR(50) NOT NULL,
    partUnit        VARCHAR(10) NOT NULL,
    partCost        DECIMAL(10, 2) NOT NULL,
    partWarranty    VARCHAR(20) NOT NULL,

    CONSTRAINT part_id PRIMARY KEY (part_id)
);

CREATE TABLE vendors
(
    vendor_id       INT AUTO_INCREMENT PRIMARY KEY,
    vendorName      VARCHAR(50) NOT NULL,
    vendorContact   VARCHAR(50),
    vendorAddress   VARCHAR(255) NOT NULL,
    vendorCity      VARCHAR(50) NOT NULL,
    vendorState     VARCHAR(15) NOT NULL,
    vendorZip       VARCHAR(10) NOT NULL,
    vendorCountry   VARCHAR(50),
    vendorPhone     CHAR(10) NOT NULL,
    vendorEmail     VARCHAR(100),
    vendorWebsite   VARCHAR(100),
    vendorTerms     VARCHAR(10),
    part_id_FK     INT,

    CONSTRAINT vendor_id PRIMARY KEY (vendor_id),
    CONSTRAINT part_id_FK FOREIGN KEY (part_id_FK)
        REFERENCES parts(part_id)
);

CREATE TABLE services
(
    service_id      INT AUTO_INCREMENT PRIMARY KEY,
    serviceName     VARCHAR(50) NOT NULL,
    serviceType     VARCHAR(10) NOT NULL,
    servicePriority CHAR(2) NOT NULL,
    svcDateInterval VARCHAR(10) NOT NULL,
    svcNotifDays    VARCHAR(5),
    svcNotifMiles   VARCHAR(10),
    svcMileageInt   VARCHAR(10),
    location_id_FK  INT,
    emp_id_FK       INT,
    part_id_FK      INT,

    CONSTRAINT service_id_PK PRIMARY KEY (service_id),
    CONSTRAINT location_id_FK1 FOREIGN KEY (location_id_FK)
        REFERENCES locations(location_id),
    CONSTRAINT emp_id_FK2 FOREIGN KEY (emp_id_FK)
        REFERENCES employees(emp_id),
    CONSTRAINT part_id_FK1 FOREIGN KEY (part_id_FK)
        REFERENCES parts(part_id)
);

CREATE TABLE invoices
(
    invoice_id      INT AUTO_INCREMENT PRIMARY KEY,
    invoiceDate     DATE NOT NULL,
    invoiceTotal    DECIMAL(10, 2) NOT NULL,
    invoicePaid     CHAR(1) NOT NULL,
    invoiceBalance  DECIMAL(10, 2) NOT NULL,
    invoiceDueDate  DATE NOT NULL,
    invoicePaidDate DATE,
    cust_id_FK      INT,
    vehicle_id_FK   INT,
    emp_id_FK       INT,
    service_id_FK   INT,
    part_id_FK      INT,

    CONSTRAINT invoice_id PRIMARY KEY (invoice_id),
    CONSTRAINT cust_id_FK2 FOREIGN KEY (cust_id_FK)
        REFERENCES customers(cust_id),
    CONSTRAINT vehicle_id_FK1 FOREIGN KEY (vehicle_id_FK)
        REFERENCES vehicles(vehicle_id),
    CONSTRAINT emp_id_FK3 FOREIGN KEY (emp_id_FK)
        REFERENCES employees(emp_id),
    CONSTRAINT service_id_FK1 FOREIGN KEY (service_id_FK)
        REFERENCES services(service_id),
    CONSTRAINT part_id_FK2 FOREIGN KEY (part_id_FK)
        REFERENCES parts(part_id)
);
