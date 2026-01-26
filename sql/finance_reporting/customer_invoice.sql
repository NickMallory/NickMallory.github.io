/*
============================================================
Report Name : Customer Invoice Report
Purpose     : Generates an invoice for a customer including
              VAT calculations from transaction data.
Author      : Mahlatse Chiloane
Notes       : Portfolio-safe data model
============================================================
*/

DECLARE @InvoiceID INT = 5001;   -- SSRS parameter
DECLARE @VATRate DECIMAL(5,2) = 0.15; -- 15% VAT

SELECT
    i.InvoiceID,
    i.InvoiceNumber,
    i.InvoiceDate,

    c.CustomerID,
    c.CustomerName,
    c.CustomerEmail,

    t.TransactionID,
    t.TransactionDate,
    t.Description,
    t.Quantity,
    t.UnitPrice,

    -- Line totals
    (t.Quantity * t.UnitPrice) AS LineAmount,

    -- VAT per line
    (t.Quantity * t.UnitPrice) * @VATRate AS VATAmount,

    -- Line total incl VAT
    (t.Quantity * t.UnitPrice) * (1 + @VATRate) AS LineTotalInclVAT

FROM dbo.Invoice i
INNER JOIN dbo.Customer c
    ON c.CustomerID = i.CustomerID

INNER JOIN dbo.Transaction t
    ON t.InvoiceID = i.InvoiceID

WHERE i.InvoiceID = @InvoiceID
ORDER BY t.TransactionDate;
