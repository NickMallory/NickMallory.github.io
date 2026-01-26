/*
============================================================
Sample Data : Finance Reporting
============================================================
*/

INSERT INTO dbo.Customer VALUES
(2001, 'ABC Manufacturing', 'finance@abc.co.za'),
(2002, 'XYZ Services', 'accounts@xyz.co.za');

INSERT INTO dbo.Invoice VALUES
(5001, 'INV-2026-001', 2001, '2026-01-05'),
(5002, 'INV-2026-002', 2001, '2026-01-20');

INSERT INTO dbo.Transaction VALUES
(1, 5001, '2026-01-05', 'Installation Service', 1, 2500.00),
(2, 5001, '2026-01-05', 'Hardware Unit', 2, 1200.00),
(3, 5002, '2026-01-20', 'Maintenance Service', 1, 1800.00);

INSERT INTO dbo.FinancialTransaction VALUES
(1, 2001, '2026-01-05', 'Invoice', 'INV-2026-001', 'Invoice issued', 4900.00),
(2, 2001, '2026-01-15', 'Payment', 'PAY-001', 'Customer payment', 3000.00),
(3, 2001, '2026-01-20', 'Invoice', 'INV-2026-002', 'Invoice issued', 1800.00);
