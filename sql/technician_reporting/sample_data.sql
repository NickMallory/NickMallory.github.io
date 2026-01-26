/* 
Sample Data for Technician Reporting
All data is fictional and for portfolio use only
*/

INSERT INTO Technician VALUES
(1, 'John Molefe', 'Senior Installer', 1),
(2, 'Sarah Dlamini', 'Installer', 1),
(3, 'Peter Naidoo', 'Junior Installer', 1);

INSERT INTO Location VALUES
(1, 'Mall of Africa', 'Johannesburg'),
(2, 'Sandton Office Park', 'Sandton'),
(3, 'Menlyn Retail Centre', 'Pretoria');

INSERT INTO Task VALUES
(101, 'Alarm Installation', '2026-01-10', 3.5, 1),
(102, 'Camera Installation', '2026-01-10', 4.0, 2),
(103, 'Maintenance Visit', '2026-01-11', 2.0, 3),
(104, 'System Upgrade', '2026-01-12', 5.0, 1);

INSERT INTO TechnicianTask VALUES
(1001, 1, 101, 'Completed', '2026-01-09', '2026-01-10'),
(1002, 1, 102, 'Completed', '2026-01-09', '2026-01-10'),
(1003, 2, 103, 'In Progress', '2026-01-10', NULL),
(1004, 3, 104, 'Assigned', '2026-01-11', NULL);
