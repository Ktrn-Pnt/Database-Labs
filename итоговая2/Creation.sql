USE KB301_Panteleeva
GO

IF EXISTS (
	SELECT name
	FROM sys.databases
	WHERE name = N'KB301_Panteleeva'

)
DROP DATABASE [KB301_Panteleeva]
GO

alter database [KB301_Panteleeva] set single_user with rollback immediate
go

CREATE DATABASE [KB301_Panteleeva]
GO

USE [KB301_Panteleeva]
GO

IF EXISTS(
	SELECT *
	FROM sys.schemas
	WHERE name = N'Task2'

)
DROP SCHEMA [Task2]
GO

CREATE SCHEMA [Task2]
GO


DROP TABLE [KB301_Panteleeva].Task2.DebitCard
GO

CREATE TABLE [KB301_Panteleeva].Task2.DebitCard(
	currency VARCHAR(3) NOT NULL,
	balance decimal(10,2) NULL,
	PRIMARY KEY(currency)
)
GO

Alter table [KB301_Panteleeva].Task2.DebitCard alter column balance decimal(10,2)


DROP TABLE [KB301_Panteleeva].Task2.Rates
GO

CREATE TABLE [KB301_Panteleeva].Task2.Rates(
	fromCurrency VARCHAR(3),
	toCurrency VARCHAR(3),
	rate DECIMAL(10,2)
	/*
	FOREIGN KEY (currencyNameFrom)  REFERENCES Task2.Card (currencyName),
	FOREIGN KEY (currencyNameTo)  REFERENCES Task2.Card (currencyName)
	*/
)
GO

