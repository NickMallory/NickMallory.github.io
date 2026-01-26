/*
============================================================
Report Name : Customer Statement Report
Purpose     : Displays customer financial statement with
              VAT and running balances.
Author      : Mahlatse Chiloane
Notes       : Suitable for BI / SSRS reporting
============================================================
*/

DECLARE @CustomerID INT = 2001;
DECLARE @VATRate DECIMAL(5,2) = 0.15;

SELECT
    c.CustomerID,
    c.CustomerName,

    tr.TransactionDate,
    tr.TransactionType,  -- Invoice / Payment
    tr.ReferenceNumber,
    tr.Description,

    -- Amounts
    tr.AmountExclVAT,
    tr.AmountExclVAT * @VATRate AS VATAmount,
    tr.AmountExclVAT * (1 + @VATRate) AS AmountInclVAT,

    -- Running balance
    SUM(
        CASE 
            WHEN tr.TransactionType = 'Invoice'
                THEN tr.AmountExclVAT * (1 + @VATRate)
            WHEN tr.TransactionType = 'Payment'
                THEN -1 * tr.AmountExclVAT
        END
    ) OVER (
        PARTITION BY c.CustomerID
        ORDER BY tr.TransactionDate
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS RunningBalance

FROM dbo.Customer c
INNER JOIN dbo.FinancialTransaction tr
    ON tr.CustomerID = c.CustomerID

WHERE c.CustomerID = @CustomerID
ORDER BY tr.TransactionDate;
