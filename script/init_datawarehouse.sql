/*
====================================================================
Create Database and Schemas
====================================================================
Script Purpose:
  This script creates a new database named 'DataWarehouse'. Additionally the script sets up three schemas within the
  Database: 'bronze', 'silver','gold'.
*/

Use master
Go

-- Create the 'DataWarehouse' database
Create Database DataWarehouse;
Use DataWarehouse

-- Create the three schemas
Create Schema bronze;
Go
Create Schema silver;
Go
Create Schema gold;
GO
