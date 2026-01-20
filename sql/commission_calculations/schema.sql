-- =============================================
-- Commission Calculation Schema
-- Author: Mahlatse Chiloane
-- Purpose: BI Portfolio Demonstration (Fake-Safe Data)
--
-- Description:
-- This schema supports tiered commission
-- calculations for agents and managers,
-- commonly used in insurance and sales
-- reporting environments.
-- =============================================

CREATE TABLE CommissionRule (
    RuleID INT PRIMARY KEY,
    MinPremium DECIMAL(18,2),
    MaxPremium DECIMAL(18,2),
    AgentCommissionRate DECIMAL(5,2),
    ManagerCommissionRate DECIMAL(5,2)
);

CREATE TABLE SalesTransaction (
    TransactionID INT PRIMARY KEY,
    PolicyID INT,
    TransactionDate DATE,
    PremiumAmount DECIMAL(18,2)
);

CREATE TABLE Manager (
    ManagerID INT PRIMARY KEY,
    ManagerName VARCHAR(100)
);

CREATE TABLE AgentManager (
    AgentID INT,
    ManagerID INT,
    CONSTRAINT PK_AgentManager PRIMARY KEY (AgentID, ManagerID),
    CONSTRAINT FK_AgentManager_Manager
        FOREIGN KEY (ManagerID) REFERENCES Manager(ManagerID)
);
