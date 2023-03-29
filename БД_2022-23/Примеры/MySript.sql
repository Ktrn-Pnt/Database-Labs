CREATE TABLE [KB301_Panteleeva].Panteleeva.DebitCard
(
	Currency nvarchar(3) NOT NULL, 
	Balance decimal(15,2) NULL,  
)
GO

CREATE TABLE [KB301_Panteleeva].Panteleeva.Rates
(
	FromCurrency nvarchar(3) NOT NULL, 
	ToCurrency nvarchar(3) NOT NULL, 
	Rate decimal(15,2) NULL, 
)
GO