-- =============================================
-- Tiered Agent & Manager Commission Calculation
-- Author: Mahlatse Chiloane
-- Purpose: BI Portfolio Demonstration 
--
-- Business Rules:
-- - Commission is calculated based on premium tiers
-- - Agent and manager commissions are calculated separately
-- - One commission rule applies per transaction
-- =============================================

/*
    STEP 1:
    Match each transaction to the correct
    commission tier based on premium amount
*/
WITH CommissionTierMatch AS (
    SELECT
        st.TransactionID,
        st.PolicyID,
        st.TransactionDate,
        st.PremiumAmount,
        cr.AgentCommissionRate,
        cr.ManagerCommissionRate
    FROM SalesTransaction st
    INNER JOIN CommissionRule cr
        ON st.PremiumAmount BETWEEN cr.MinPremium AND cr.MaxPremium
),

/*
    STEP 2:
    Calculate commission amounts
*/
CommissionAmounts AS (
    SELECT
        TransactionID,
        PolicyID,
        TransactionDate,
        PremiumAmount,
        AgentCommissionRate,
        ManagerCommissionRate,
        (PremiumAmount * AgentCommissionRate / 100) AS AgentCommissionAmount,
        (PremiumAmount * ManagerCommissionRate / 100) AS ManagerCommissionAmount
    FROM CommissionTierMatch
)

-- =============================================
-- Final Commission Output
-- =============================================
SELECT
    TransactionID,
    PolicyID,
    TransactionDate,
    PremiumAmount,
    AgentCommissionRate,
    AgentCommissionAmount,
    ManagerCommissionRate,
    ManagerCommissionAmount
FROM CommissionAmounts
ORDER BY TransactionDate;
