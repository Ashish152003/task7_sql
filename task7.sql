-- SCHEMA CREATION

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(50),
    Salary INT
);

CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(50),
    Budget INT,
    LeadID INT,
    FOREIGN KEY (LeadID) REFERENCES Employees(EmployeeID)
);

-- DATA INSERTION

INSERT INTO Employees VALUES
(1, 'Ashish', 'IT', 70000),
(2, 'Neha', 'HR', 60000),
(3, 'Ravi', 'Finance', 55000),
(4, 'Priya', 'IT', 80000),
(5, 'Anil', 'HR', 58000);

INSERT INTO Projects VALUES
(101, 'Apollo', 100000, 1),
(102, 'Hermes', 200000, 4),
(103, 'Zeus', 150000, 2);

-- VIEW CREATION

-- 1. View to show high salary employees
CREATE VIEW HighSalaryEmployees AS
SELECT Name, Department, Salary
FROM Employees
WHERE Salary > 60000;

-- 2. View to show project with lead name (joining two tables)
CREATE VIEW ProjectDetails AS
SELECT 
    P.ProjectName, 
    P.Budget, 
    E.Name AS LeadName, 
    E.Department
FROM Projects P
JOIN Employees E ON P.LeadID = E.EmployeeID;

-- 3. View using aggregation (average salary by department)
CREATE VIEW AvgSalaryPerDept AS
SELECT Department, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY Department;

-- 4. View with CHECK OPTION (updateable only if row matches view condition)
CREATE VIEW HR_Only_View AS
SELECT * FROM Employees
WHERE Department = 'HR'
WITH CHECK OPTION;

-- VIEW USAGE EXAMPLES

-- a. Select from a basic view
SELECT * FROM HighSalaryEmployees;

-- b. Join view with other tables
SELECT * FROM ProjectDetails;

-- c. Select department-wise average salaries
SELECT * FROM AvgSalaryPerDept;

-- d. Attempt insert into CHECK OPTION view (will only work for HR dept)
-- This will succeed
INSERT INTO HR_Only_View VALUES (6, 'Kiran', 'HR', 59000);

-- This will fail (CHECK OPTION violation)
-- INSERT INTO HR_Only_View VALUES (7, 'John', 'IT', 62000);

-- DROP VIEW EXAMPLE
-- DROP VIEW IF EXISTS HighSalaryEmployees;
