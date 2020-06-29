/** TASK 1 First Query **/
-- Uses SQLiteStudio 3.2.1
-- DB = Curryco
-- Tables = Building, Department, Employee

/** 
SELECT is the command that begins a retrieval query
* means show me ALL the columns in the table
FROM tells the DBMS that the next word is teh name of the table from which the data will be retrieved
**/
SELECT * FROM Building

/** TASK 2 SELECT Clause **/
-- Retrieval query basic syntax

SELECT * FROM Employee

/** 
Limiting columns is called projection
**/
SELECT EmpLastName FROM Employee

SELECT EmpLastName, EmpFirstName, EmpSalary FROM Employee

/** TASK 3 ORDER BY Clause **/
-- Arranging and sorting output
-- SQL is for data retieval and manipulation (order presenation and sort in useful sequence) -- not for formatting, swithc to another language for higher level processing
-- Display columns with first name  than last name
SELECT EmpFirstName, EmpLastName, EmpSalary FROM Employee

/** ORDER BY Clause
Add after FROM clause
to sort rows in ascedning order according to the column name designated **/

SELECT EmpFirstName, EmpLastName, EmpSalary FROM Employee ORDER BY EmpSalary

-- For highest salary first
SELECT EmpFirstName, EmpLastName, EmpSalary FROM Employee ORDER BY EmpSalary DESC

/** ORDER By clause can be used with multiple columns
	Major sort column listed first
	Columns seprarated by commas
**/
SELECT EmpDeptId, EmpFirstName, EmpLastName, EmpSalary 
FROM Employee 
ORDER BY EmpDeptId, EmpSalary DESC


/** TASK 4 WHERE Clause **/
-- Limit the output to only specific rows
-- Only ONE where clause per statement allowed, but can add to it using AND

-- List employee names from highest paid to lowest in the IT department
SELECT EmpDeptId, EmpFirstName, EmpLastName
FROM Employee 
WHERE EmpDeptId = 300
ORDER BY EmpDeptId

/** Comparison operators
= Equal to
> Greater than
< Less than
>= Greater than or equal to
<= Less than or equal to
<> Not equal to
**/
SELECT EmpDeptId, EmpFirstName, EmpLastName
FROM Employee 
WHERE EmpDeptId = 300 AND EmSalary > 200000
ORDER BY EmpDeptId, EmpSalary DESC

/** WHERE clause is like a test.  SQL goes through EVERY row in the table and tests to see if row meets condition in WHERE clause **/

/** TASK 5 the Combination WHERE clause **/
-- Connect conditions with a logical operator: AND or OR
SELECT EmpDeptId, EmpFirstName, EmpLastName
FROM Employee 
WHERE EmpDeptId = 300 AND EmpSalary < 200000
ORDER BY EmpDeptId

SELECT EmpDeptId, EmpFirstName, EmpLastName
FROM Employee 
WHERE EmpDeptId = 300 OR EmpSalary < 200000
ORDER BY EmpDeptId

-- list employees, salaries, dept ids for any making < 75000 and more 225000
SELECT EmpDeptId, EmpFirstName, EmpLastName, EmpSalary
FROM Employee 
WHERE EmpSalary < 75000 OR EmpSalary > 225000
ORDER BY EmpDeptId, EmpSalary DESC


/** TASK 6 Analysis to Query **/
/** Scenario: 
A list of employees who work in the Barrow Building is needed.  They should be sorted by employee last name within department
**/

-- Use an iterative approach starting with what we know (we don't know how to connect employees/departments to buildings yet)

SELECT EmpLastName, EmpFirstName, EmpDeptID
FROM Employee
ORDER BY EmpDeptID, EmpLastName

-- If we look at the Building table we see BldID and BldName, need to connect that back
-- If we look at the Department table we see DeptID and DeptBuilding (where DeptBuilding is the same as BldID in the Building table)

SELECT Employee.EmpLastName, Employee.EmpFirstName, Employee.EmpDeptID, Department.DeptName, Building.BldName
FROM Employee 
JOIN Department ON Employee.EmpDeptID = Department.DeptID
JOIN Building ON Building.BldID = Department.DeptBuilding
WHERE Building.BldName = 'Barrow Building'
ORDER BY Employee.EmpDeptID, Employee.EmpLastName

-- Alternative: Use the IN Operator to limit by EmpDeptID since we know Dept ids = 200, 220, and 520 are in Barrows
SELECT Employee.EmpLastName, Employee.EmpFirstName, Employee.EmpDeptID
FROM Employee 
WHERE Employee.EmpDeptID IN (200, 220, 520)
ORDER BY Employee.EmpDeptID, Employee.EmpLastName

/** TASK 7 Save & Reuse a Query **/
/** Senario
President wants a list of dept ids, hire dates, employee names, and job titles of all employees who are directors
Listed in order by last name within department
**/

SELECT EmpLastName, EmpFirstName, EmpDeptID, EmpHireDate, EmpTitle
FROM Employee
WHERE EmpTitle = 'Director'
ORDER BY Employee.EmpDeptID, Employee.EmpLastName

-- Saved queries also called scripts or procedures
-- Can be embeded into other programs and run by other users














