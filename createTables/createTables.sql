DROP TABLE IF EXISTS locations;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS parts;
DROP TABLE IF EXISTS vendor;
DROP TABLE IF EXISTS invoices;
DROP TABLE IF EXISTS services;

CREATE TABLE locations
(
    location_id     INT AUTOINCREMENT PRIMARY KEY,
    location_name   VARCHAR(255) NOT NULL,
    address         VARCHAR(255) NOT NULL,
    city            VARCHAR(100) NOT NULL,
    state           VARCHAR(50) NOT NULL,
    zip_code        VARCHAR(10) NOT NULL,

    CONSTRAINT location_id PRIMARY KEY (location_id)
);

CREATE TABLE employees
(
    emp_id          INT AUTOINCREMENT PRIMARY KEY,
    empFName        VARCHAR(30) NOT NULL,
    empLName        VARCHAR(50) NOT NULL,
    empPosition     VARCHAR(20) NOT NULL,

    CONSTRAINT emp_id PRIMARY KEY (emp_id)
);

CREATE TABLE customers
(
    cust_id         INT AUTOINCREMENT PRIMARY KEY,
    custFName       VARCHAR(30) NOT NULL,
    custLName       VARCHAR(45) NOT NULL,
    custAddress     VARCHAR(255) NOT NULL,
    custPhone       CHAR(10) NOT NULL,

    CONSTRAINT cust_id PRIMARY KEY (cust_id)
);

CREATE TABLE parts
(
    part_id         INT AUTOINCREMENT PRIMARY KEY,
    partNum         VARCHAR(50) NOT NULL,
    partName        VARCHAR(255) NOT NULL,

    CONSTRAINT part_id PRIMARY KEY (part_id)
);

CREATE TABLE vendors
(
    vendor_id       INT AUTOINCREMENT PRIMARY KEY,
    vendorName      VARCHAR(50) NOT NULL,
    vendorAddress   VARCHAR(255) NOT NULL,
    vendorPhone     CHAR(10) NOT NULL,

    CONSTRAINT vendor_id PRIMARY KEY (vendor_id)
);

CREATE TABLE services
(
    service_id      INT AUTOINCREMENT PRIMARY KEY,
    location_id_FK     INT,
    emp_id_FK          INT,

    CONSTRAINT service_id_PK PRIMARY KEY (service_id),
    CONSTRAINT location_id_FK1 FOREIGN KEY (location_id_FK)
        REFERENCES locations(location_id),
    CONSTRAINT emp_id_FK2 FOREIGN KEY (emp_id_FK)
        REFERENCES employees(emp_id)
);

CREATE TABLE invoices
(
    invoice_id      INT AUTOINCREMENT PRIMARY KEY

);
