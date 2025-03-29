DROP TABLE IF EXISTS locations;

CREATE TABLE locations
(
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    location_name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(50) NOT NULL,
    zip_code VARCHAR(10) NOT NULL
);