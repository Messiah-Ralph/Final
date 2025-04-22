INSERT INTO services
(serviceName, serviceType, svcMileage, svcDate, rs_id_FK, emp_id_FK, vehicle_id_FK)
VALUES
('Oil Change', 'Oil', 5000, '2023-10-01', 1, 2, 1),
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