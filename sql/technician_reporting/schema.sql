/* 
Technician Reporting Schema
Purpose: Simulate operational task allocation for field technicians
*/

CREATE TABLE Technician (
    TechnicianID INT PRIMARY KEY,
    TechnicianName VARCHAR(100),
    SkillLevel VARCHAR(50),
    Active BIT
);

CREATE TABLE Location (
    LocationID INT PRIMARY KEY,
    LocationName VARCHAR(150),
    City VARCHAR(100)
);

CREATE TABLE Task (
    TaskID INT PRIMARY KEY,
    TaskType VARCHAR(100),
    ScheduledDate DATE,
    EstimatedHours DECIMAL(5,2),
    LocationID INT,
    FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
);

CREATE TABLE TechnicianTask (
    TechnicianTaskID INT PRIMARY KEY,
    TechnicianID INT,
    TaskID INT,
    TaskStatus VARCHAR(50),
    AssignedDate DATE,
    CompletedDate DATE NULL,
    FOREIGN KEY (TechnicianID) REFERENCES Technician(TechnicianID),
    FOREIGN KEY (TaskID) REFERENCES Task(TaskID)
);
