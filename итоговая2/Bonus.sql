USE KB301_Panteleeva
GO

CREATE SCHEMA Task2
GO

DROP TABLE Task2.Stavki

CREATE TABLE [KB301_Panteleeva].Task2.Stavki(
	currencyNameFrom VARCHAR(3),
	currencyNameTo VARCHAR(3),
	rate MONEY
)
GO

INSERT INTO Task2.Stavki (currencyNameFrom, currencyNameTo, rate)	
	VALUES
	('USD','USD', 1),
	('USD','GBP', 0.623),
	('USD','JPY', 78.065),
	('USD','CHF', 0.9011),
	('USD','CAD', 1.0134),
	('USD','DKK', 5.4064),
	('USD','SEK', 6.562),
	('USD','EUR', 0.7263),
	('USD','AUD', 0.9639),
	('USD','NZD', 1.2549),

	('GBP','USD', 1.6052), 
	('GBP','GBP', 1), 
	('GBP','JPY', 125.31),
	('GBP','CHF', 1.4467),
	('GBP','CAD', 1.6268),
	('GBP','DKK', 8.6788),
	('GBP','SEK', 10.5285),
	('GBP','EUR', 1.1658),
	('GBP','AUD', 1.5473),
	('GBP','NZD', 2.0144),

	('JPY','USD', 0.0128),
	('JPY','GBP', 0.008),
	('JPY','JPY', 1),
	('JPY','CHF', 0.0115),
	('JPY','CAD', 0.013),
	('JPY','DKK', 0.0692),
	('JPY','SEK', 8.4),
	('JPY','EUR', 0.0093),
	('JPY','AUD', 0.0123),
	('JPY','NZD', 0.0161),

	('CHF','USD', 1.1098),
	('CHF','GBP', 0.6912),
	('CHF','JPY', 86.6275),
	('CHF','CHF', 1),
	('CHF','CAD', 1.1246),
	('CHF','DKK', 0.06),
	('CHF','SEK', 7.2825),
	('CHF','EUR', 0.8059),
	('CHF','AUD', 1.0696),
	('CHF','NZD', 1.3924),

	('CAD','USD', 0.9868),
	('CAD','GBP', 0.6147),
	('CAD','JPY', 77.0345),
	('CAD','CHF', 0.8892),
	('CAD','CAD', 1),
	('CAD','DKK', 5.335),
	('CAD','SEK', 6.4754),
	('CAD','EUR', 0.7166),
	('CAD','AUD', 0.9512),
	('CAD','NZD', 1.2383),

	('DKK','USD', 0.185),
	('DKK','GBP', 0.1152),
	('DKK','JPY', 14.442),
	('DKK','CHF', 16.67),
	('DKK','CAD', 0.1874),
	('DKK','DKK', 1),
	('DKK','SEK', 1.2137),
	('DKK','EUR', 0.1343),
	('DKK','AUD', 0.1783),
	('DKK','NZD', 0.2322),

	('SEK','USD', 0.1524),
	('SEK','GBP', 0.095),
	('SEK','JPY', 0.119),
	('SEK','CHF', 0.1373),
	('SEK','CAD', 0.1544),
	('SEK','DKK', 0.8239),
	('SEK','SEK', 1),
	('SEK','EUR', 0.1107),
	('SEK','AUD', 0.1469),
	('SEK','NZD', 0.1912),

	('EUR','USD', 1.3769),
	('EUR','GBP', 0.8578),
	('EUR','JPY', 107.495),
	('EUR','CHF', 1.2409),
	('EUR','CAD', 1.3954),
	('EUR','DKK', 7.443),
	('EUR','SEK', 9.0357),
	('EUR','EUR', 1),
	('EUR','AUD', 1.3273),
	('EUR','NZD', 1.7279),

	('AUD','USD', 1.0374),
	('AUD','GBP', 0.6463),
	('AUD','JPY', 80.979),
	('AUD','CHF', 0.9349),
	('AUD','CAD', 1.0513),
	('AUD','DKK', 5.6086),
	('AUD','SEK', 6.8074),
	('AUD','EUR', 0.7534),
	('AUD','AUD', 1),
	('AUD','NZD', 1.3018),

	('NZD','USD', 0.7969),
	('NZD','GBP', 0.4964),
	('NZD','JPY', 62.1118),
	('NZD','CHF', 0.7182),
	('NZD','CAD', 0.8076),
	('NZD','DKK', 4.3066),
	('NZD','SEK', 5.2293),
	('NZD','EUR', 0.5787),
	('NZD','AUD', 0.7682),
	('NZD','NZD', 1)
GO

--���� ��������� � ���, ��� ������ ����������� ������������ �������� �������� � ����� � ������ �� ��������, � ������ ���������
DROP PROCEDURE Bonus

CREATE PROCEDURE Bonus
AS 
BEGIN   
	--���������� ��� �������� ������ �������
    DECLARE @Query NVARCHAR(MAX);   
	--���������� ��� �������� ���� ��������
    DECLARE @ColumnNames NVARCHAR(MAX);              
     --������� ��� �������� ���������� ��������, ������� ����� �������������� � �������� �������� 
    CREATE TABLE TemporaryColumnNames(ColumnName NVARCHAR(100) NOT NULL PRIMARY KEY);
        
    INSERT INTO TemporaryColumnNames (ColumnName)
    SELECT DISTINCT currencyNameTo FROM Task2.Stavki;

	 --��������� ������ � ������� ��������
    SELECT @ColumnNames = ISNULL(@ColumnNames + ', ','') + QUOTENAME(ColumnName) 
    FROM TemporaryColumnNames;

	SET @Query = N'SELECT * FROM Task2.Stavki 
                   PIVOT ( 
						SUM(rate) FOR currencyNameTo IN (' + @ColumnNames + ')
				   ) AS PVT;'
                
    DROP TABLE TemporaryColumnNames;

    EXEC (@Query);
END;
GO

EXEC Bonus 

