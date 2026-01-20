-- =============================================
-- Insurance Bordereaux & Commission Report
-- Author: Mahlatse Chiloane
-- Purpose: BI Portfolio Demonstration 
--
-- Description:
-- This query simulates a real-world insurance
-- bordereaux report combining policy, client,
-- premium, VAT, and commission calculations.
--
-- Business Logic:
-- - Only active policies are included
-- - Premium and VAT are presented separately
-- - Commission is calculated on premium only
-- =============================================

/*
    STEP 1:
    Filter active policies and prepare core
    financial values for reporting
*/
WITH PolicyFinancials AS (
    SELECT
        p.PolicyID,
        p.PolicyNumber,
        c.ClientName,
        p.PremiumAmount,
        p.VATAmount,
        (p.PremiumAmount + p.VATAmount) AS TotalPremium
    FROM Policy p
    INNER JOIN Client c
        ON p.ClientID = c.ClientID
    WHERE p.IsActive = 1
),

/*
    STEP 2:
    Apply agent commission rules based on
    policy-to-agent relationships
*/
CommissionCalculation AS (
    SELECT
        pf.PolicyID,
        pf.PolicyNumber,
        pf.ClientName,
        pf.PremiumAmount,
        pf.VATAmount,
        pf.TotalPremium,
        a.AgentName,
        a.CommissionRate,
        (pf.PremiumAmount * a.CommissionRate / 100) AS CommissionAmount
    FROM PolicyFinancials pf
    INNER JOIN PolicyAgent pa
        ON pf.PolicyID = pa.PolicyID
    INNER JOIN Agent a
        ON pa.AgentID = a.AgentID
)

-- =============================================
-- Final Bordereaux Output
-- =============================================
SELECT
    PolicyNumber,
    ClientName,
    PremiumAmount,
    VATAmount,
    TotalPremium,
    AgentName,
    CommissionRate,
    CommissionAmount
FROM CommissionCalculation
ORDER BY PolicyNumber;
