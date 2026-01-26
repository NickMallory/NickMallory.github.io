/*
============================================================
Report Name : Technician Task Assignment Report
Purpose     : Displays all tasks assigned to a technician
              for installation at various locations.
Author      : Mahlatse Chiloane
Notes       : Uses synthetic / anonymised data for portfolio
============================================================
*/

DECLARE @TechnicianID INT = 101;  -- SSRS / Power BI parameter

SELECT
    t.TaskID,
    t.TaskReference,
    tech.TechnicianID,
    tech.TechnicianName,

    -- Location details
    loc.LocationName,
    loc.City,
    loc.Region,

    -- Unit details
    u.UnitSerialNumber,
    u.UnitType,

    -- Task status & dates
    t.TaskStatus,
    t.AssignedDate,
    t.ScheduledInstallDate,
    t.CompletedDate,

    -- SLA & performance indicators
    DATEDIFF(DAY, t.AssignedDate, ISNULL(t.CompletedDate, GETDATE())) 
        AS DaysOpen,

    CASE
        WHEN t.CompletedDate IS NULL 
             AND t.ScheduledInstallDate < GETDATE()
            THEN 'Overdue'
        WHEN t.CompletedDate IS NOT NULL
            THEN 'Completed'
        ELSE 'On Track'
    END AS SLAStatus

FROM dbo.Task t
INNER JOIN dbo.Technician tech
    ON tech.TechnicianID = t.TechnicianID

INNER JOIN dbo.Location loc
    ON loc.LocationID = t.LocationID

INNER JOIN dbo.Unit u
    ON u.UnitID = t.UnitID

WHERE t.TechnicianID = @TechnicianID
ORDER BY
    t.ScheduledInstallDate,
    t.TaskStatus;
