-- =============================================
-- Insurance Reporting Schema
-- Author: Mahlatse Chiloane
-- Purpose: BI Portfolio Demonstration (Fake-Safe Data)
-- Description:
-- This schema represents a simplified insurance
-- data model used for bordereaux, premium,
-- VAT, and commission reporting.
-- =============================================

CREATE TABLE Client (
    ClientID INT PRIMARY KEY,
    ClientName VARCHAR(100) NOT NULL,
    OrganizationType VARCHAR(50)
);

CREATE TABLE Policy (
    PolicyID INT PRIMARY KEY,
    ClientID INT NOT NULL,
    PolicyNumber VARCHAR(50) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    PremiumAmount DECIMAL(18,2) NOT NULL,
    VATAmount DECIMAL(18,2) NOT NULL,
    IsActive BIT NOT NULL,
    CONSTRAINT FK_Policy_Client
        FOREIGN KEY (ClientID) REFERENCES Client(ClientID)
);

CREATE TABLE Agent (
    AgentID INT PRIMARY KEY,
    AgentName VARCHAR(100) NOT NULL,
    CommissionRate DECIMAL(5,2) NOT NULL
);

CREATE TABLE PolicyAgent (
    PolicyID INT NOT NULL,
    AgentID INT NOT NULL,
    CONSTRAINT PK_PolicyAgent PRIMARY KEY (PolicyID, AgentID),
    CONSTRAINT FK_PolicyAgent_Policy
        FOREIGN KEY (PolicyID) REFERENCES Policy(PolicyID),
    CONSTRAINT FK_PolicyAgent_Agent
        FOREIGN KEY (AgentID) REFERENCES Agent(AgentID)
);
