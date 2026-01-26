/*
============================================================
Schema : Finance Reporting
Purpose: Portfolio finance & VAT reporting examples
Author : Mahlatse Chiloane
============================================================
*/

CREATE TABLE dbo.Customer (
    CustomerID     INT PRIMARY KEY,
    CustomerName   VARCHAR(200),
    CustomerEmail  VARCHAR(200)
);

CREATE TABLE dbo.Invoice (
    InvoiceID      INT PRIMARY KEY,
    InvoiceNumber  VARCHAR(50),
    CustomerID     INT,
    InvoiceDate    DATE,
    FOREIGN KEY (CustomerID) REFERENCES dbo.Customer(CustomerID)
);

CREATE TABLE dbo.Transaction (
    TransactionID   INT PRIMARY KEY,
    InvoiceID       INT,
    TransactionDate DATE,
    Description     VARCHAR(255),
    Quantity        INT,
    UnitPrice       DECIMAL(18,2),
    FOREIGN KEY (InvoiceID) REFERENCES dbo.Invoice(InvoiceID)
);

CREATE TABLE dbo.FinancialTransaction (
    FinancialTransactionID INT PRIMARY KEY,
    CustomerID             INT,
    TransactionDate        DATE,
    TransactionType        VARCHAR(20), -- Invoice / Payment
    ReferenceNumber        VARCHAR(50),
    Description            VARCHAR(255),
    AmountExclVAT          DECIMAL(18,2),
    FOREIGN KEY (CustomerID) REFERENCES dbo.Customer(CustomerID)
);
