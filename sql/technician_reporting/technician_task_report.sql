/*
============================================================
Report Name : Technician Task Assignment Report
Purpose     : Displays all tasks assigned to a technician
              for installation at various locations.
Author      : Mahlatse Chiloane
Notes       : Uses synthetic / anonymised data for portfolio
============================================================
*/


DECLARE @TechnicianID INT = 1;

SELECT
    t.TechnicianName,
    t.SkillLevel,
    ta.TaskID,
    tk.TaskType,
    tk.ScheduledDate,
    l.LocationName,
    l.City,
    ta.TaskStatus,
    tk.EstimatedHours,
    ta.AssignedDate,
    ta.CompletedDate
FROM TechnicianTask ta
INNER JOIN Technician t ON ta.TechnicianID = t.TechnicianID
INNER JOIN Task tk ON ta.TaskID = tk.TaskID
INNER JOIN Location l ON tk.LocationID = l.LocationID
WHERE ta.TechnicianID = @TechnicianID
ORDER BY tk.ScheduledDate;
