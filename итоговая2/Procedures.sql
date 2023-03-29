USE KB301_Panteleeva
GO

--������ ��������� ����� � ��������� ������ �� ����, ���� ����� ��� - �������.
CREATE PROCEDURE Deposit 
	@currency VARCHAR(3),
	@count MONEY 
	AS
	BEGIN
		IF EXISTS(SELECT * FROM Task2.DebitCard WHERE currency = @currency)
			BEGIN 
				UPDATE Task2.DebitCard SET balance = balance + @count WHERE currency = @currency;
				PRINT('���� ������� ��������.')
			END
		ELSE 
			BEGIN
				INSERT INTO Task2.DebitCard (currency, balance) 
					VALUES (@currency, @count)
				PRINT('���� ������� ������ � ��������.')
			END
	END

DROP PROCEDURE Deposit

--����� ������� ���� ������, ��� ������� > 0
CREATE PROCEDURE CheckCardBalance 
	AS 
	BEGIN
		SELECT currency as ������, FORMAT(balance, 'F2')  as ������
			FROM Task2.DebitCard 
			WHERE balance > 0
			GROUP BY currency, balance
	END

	DROP PROCEDURE  CheckCardBalance 


--����� ��������� ���������� ������� � ���������� ����� 
CREATE PROCEDURE TakeOff
	@currency VARCHAR(3),
	@count MONEY
	AS
	BEGIN 
		IF EXISTS(SELECT * FROM Task2.DebitCard WHERE currency = @currency and balance >= @count)
			BEGIN 
			IF EXISTS(SELECT * FROM Task2.DebitCard WHERE currency = @currency and balance = @count) 
			BEGIN
				DELETE Task2.DebitCard WHERE currency = @currency and balance = @count
			END
			ELSE BEGIN
				UPDATE Task2.DebitCard SET balance = balance - @count WHERE currency = @currency
				PRINT('���������� ��������� �������.')
				END
			END
		ELSE
			BEGIN
				PRINT('������������ ������� ��� ���������� ����������.')
			END
	END

DROP PROCEDURE TakeOff


--������� ��������� ���������� ������� �� ��������� ������
CREATE PROCEDURE Sell
	@fromCurrency VARCHAR(3),
	@count MONEY,
	@toCurrency VARCHAR(3)
	AS 
	BEGIN
		IF EXISTS(SELECT * FROM Task2.DebitCard WHERE currency = @fromCurrency and balance >= @count)
			BEGIN 
				EXEC TakeOff @fromCurrency, @count
				DECLARE @rate DECIMAL(10,2)
				SELECT @rate = rate  FROM Task2.Rates
					WHERE fromCurrency = @fromCurrency and toCurrency = @toCurrency
				DECLARE @balance MONEY = @rate * @count;
				EXEC Deposit @toCurrency, @balance
			END
		ELSE 
			BEGIN
				PRINT('������������ ������� ��� ���������� ����������.')
			END
	END

DROP PROCEDURE Sell	


--������� ��� �������� �� ��������� ������
CREATE PROCEDURE SellEverything
	@toCurrency VARCHAR(3)
	AS
	BEGIN
		IF EXISTS(SELECT * FROM Task2.DebitCard WHERE currency NOT LIKE @toCurrency)
			BEGIN 
				SELECT CAST(SUM(balance * rate) AS DECIMAL(10,2)) AS '����� ������'
					FROM Task2.DebitCard JOIN Task2.Rates ON Task2.Rates.toCurrency = @toCurrency
						AND Task2.DebitCard.currency = Task2.Rates.fromCurrency
			END 
		ELSE
			BEGIN 
				PRINT('���-�� ����� �� ���')
			END
	END

DROP PROCEDURE SellEverything

----------------------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE Bonus
(
    @TableSRC NVARCHAR(100),   --������� �������� (�������������)
    @ColumnName NVARCHAR(100), --�������, ���������� ��������, ������� ������ ������� ��������
    @Field NVARCHAR(100),      --�������, ��� ������� ��������� ���������
    @FieldRows NVARCHAR(100),  --������� (�������) ��� ����������� �� ������� (Column1, Column2)
    @FunctionType NVARCHAR(20) = 'SUM',--���������� ������� (SUM, COUNT, MAX, MIN, AVG), �� ��������� SUM
    @Condition NVARCHAR(200) = '' --������� (WHERE � �.�.). �� ��������� ��� �������
)
AS 
BEGIN        
    --���������� ��� �������� ������ �������
    DECLARE @Query NVARCHAR(MAX);                     
    --���������� ��� �������� ���� ��������
    DECLARE @ColumnNames NVARCHAR(MAX);              
    --���������� ��� �������� ���������� ��������������� ������ ������
    DECLARE @ColumnNamesHeader NVARCHAR(MAX); 

	--������� ��� �������� ���������� ��������, ������� ����� �������������� � �������� ��������      
    CREATE TABLE TempColumnNames(ColumnName NVARCHAR(100) NOT NULL PRIMARY KEY);
        
    --��������� ������ ������� ��� ��������� ���������� �������� ��� ���� ��������
    SET @Query = N'INSERT INTO TempColumnNames (ColumnName)
                   SELECT DISTINCT ' + @ColumnName + 
                 ' FROM ' + @TableSRC + ';'
                
    --��������� ������ �������
    EXEC (@Query);

	SELECT @ColumnNames AS '�������� ��������'
	SELECT '' + QUOTENAME(ColumnName) AS '������ qn' FROM TempColumnNames;
	SELECT ISNULL(@ColumnNames + ', ','') AS 'simple null'
    --��������� ������ � ������� ��������
    SELECT @ColumnNames = ISNULL(@ColumnNames + ', ','') + QUOTENAME(ColumnName) 
    FROM TempColumnNames;

	SELECT @ColumnNames AS '�������� �������� �����'
               
    --��������� ������ ��� ��������� ������������� ������������� ������� (PIVOT)
    SELECT @ColumnNamesHeader = ISNULL(@ColumnNamesHeader + ', ','') 
								+ 'COALESCE(' + QUOTENAME(ColumnName) + ', 0) AS '+ QUOTENAME(ColumnName)
    FROM TempColumnNames;
        
    --��������� ������ � �������� PIVOT
    SET @Query = N'SELECT ' + @FieldRows + ' , ' + @ColumnNamesHeader + ' 
                   FROM (SELECT ' + @FieldRows + ', ' + @ColumnName + ', ' + @Field 
               + ' FROM ' + @TableSRC  + ' ' + @Condition + ') AS SRC
                   PIVOT ( ' + @FunctionType + '(' + @Field + ')' +' FOR ' +  
                   @ColumnName + ' IN (' + @ColumnNames + ')) AS PVT
                   ORDER BY ' + @FieldRows + ';'
                
    --������� ��������� �������
    DROP TABLE TempColumnNames;

    --��������� ������ ������� � PIVOT
    EXEC (@Query);
END;
GO

DROP PROCEDURE Bonus

EXEC Bonus @TableSRC = 'Task2.Stavki',
           @ColumnName = 'currencyNameTo',
           @Field = 'rate',
           @FieldRows = 'currencyNameFrom'