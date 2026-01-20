-- =============================================
-- Sample Data for Insurance Reporting
-- Author: Mahlatse Chiloane
-- Purpose: BI Portfolio Demonstration
-- Description:
-- This data simulates clients, agents, and policies
-- used for insurance bordereaux and commission reporting.
-- =============================================

-- Clients
INSERT INTO Client (ClientID, ClientName, OrganizationType) VALUES
(1, 'ABC Holdings', 'Corporate'),
(2, 'XYZ Traders', 'SME'),
(3, 'Delta Manufacturing', 'Enterprise');

-- Agents
INSERT INTO Agent (AgentID, AgentName, CommissionRate) VALUES
(1, 'John Smith', 7.50),
(2, 'Mary Nkosi', 10.00),
(3, 'Peter Jacobs', 6.00);

-- Policies
INSERT INTO Policy (
    PolicyID,
    ClientID,
    PolicyNumber,
    StartDate,
    EndDate,
    PremiumAmount,
    VATAmount,
    IsActive
) VALUES
(1001, 1, 'POL-001', '2024-01-01', '2024-12-31', 12000.00, 1800.00, 1),
(1002, 2, 'POL-002', '2024-02-01', '2025-01-31', 8000.00, 1200.00, 1),
(1003, 3, 'POL-003', '2024-03-01', '2025-02-28', 15000.00, 2250.00, 0);

-- Policy to Agent mapping
INSERT INTO PolicyAgent (PolicyID, AgentID) VALUES
(1001, 1),
(1002, 2),
(1003, 3);
