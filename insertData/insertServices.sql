USE repairShop;

INSERT INTO services
(serviceName, serviceType, servicePriority, svcDateInterval, svcNotifDays, svcNotifMiles, svcMileageInt, location_id_FK, emp_id_FK, part_id_FK)
VALUES
('Oil Change', '', '01', '6 Months', '', '6000', '6000', 1, 12, 34);