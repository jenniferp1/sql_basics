-- Change database to AdventureWorks
USE AdventureWorks

-- Select data from the database and the specified table in the database
-- SQL Server is case sensitive
SELECT * FROM Person.Contact

/**** NEW Create databases ****/
-- Create and Delete our database
CREATE DATABASE JenP

-- Command requires a semi-colon at end
DROP DATABASE JenP;

-- Recreate database
CREATE DATABASE JenP

/**** NEW Set up tables ****/
-- Switch to your database
-- Create table Cities with 3 fields
CREATE TABLE Cities(
CityID int primary key, 
City nvarchar(25),
Population bigint
);

-- Delete table (dbo = database object)
DROP TABLE dbo.Cities;

/**** NEW Modify table ****/
-- Add a column
-- Done from SSMS console

/**** NEW Manage security premissions ****/
-- Create user Janet and then delete when done

-- Make sure master database is chosen in SSMS
USE master

-- Create user
CREATE LOGIN Janet WITH PASSWORD = 'ABCxyz123'

-- Open and close SSMS
-- Choose SQL Server Authentification and test with Janet and her password (Not Windows Authentification

-- Change Janet's password
ALTER LOGIN Janet WITH PASSWORD = 'XYZabd123'

-- Delete Janet
DROP LOGIN Janet

/*** NEW Manage Time of Queries ***/
CREATE DATABASE JenP
CREATE Table Cities (
CityID int primary key, 
City nvarchar(25),
Population bigint
);

-- Add values into Cities table
USE JenP;
GO

INSERT INTO Cities
VALUES (1, 'Seattle', 520000),
	(2, 'Redmond', 1100000),
	(3, 'Kirkland', 85000),
	(4, 'Bothell', 70000);
	
GO

SELECT * FROM Cities


/*** NEW Execute 2 queries you created ***/
-- Use Transaction statement: TRAN to lock on Cities table to prevent action in second query from executing while lock is in effect (e.g., 20 seconds)
-- Query #1
BEGIN TRAN;
UPDATE Cities
SET Population=Population+555;
WAITFOR DELAY '00:00:20'
COMMIT TRAN;

GO

-- Query #2 - Immediately execute this one after execuitng query #1
SELECT * FROM Cities
-- after 20 seconds you should see populations field updated by 555
	

/*** NEW Create a backup database ***/
-- create folder tmp location to save backups
BACKUP DATABASE JenP
TO DISK = 'C:\tmp\JenP.bak'
GO
/*** Quit SSMS and Open again **/
-- Create new query window
DROP DATABASE JenP
-- See you db is now gone
-- Right click on Databases and choose restore
-- Add JenP.bak from C:\temp
-- This will restore you database 

-- New Query Window
SELECT * FROM Cities
-- see restore was successful



