USE KB301_Panteleeva
GO

--Внести указанную сумму в указанной валюте на счет, если счета нет - создать.
CREATE PROCEDURE Deposit 
	@currency VARCHAR(3),
	@count MONEY 
	AS
	BEGIN
		IF EXISTS(SELECT * FROM Task2.DebitCard WHERE currency = @currency)
			BEGIN 
				UPDATE Task2.DebitCard SET balance = balance + @count WHERE currency = @currency;
				PRINT('Счет успешно пополнен.')
			END
		ELSE 
			BEGIN
				INSERT INTO Task2.DebitCard (currency, balance) 
					VALUES (@currency, @count)
				PRINT('Счет успешно создан и пополнен.')
			END
	END

DROP PROCEDURE Deposit

--Показ баланса всех счетов, где остаток > 0
CREATE PROCEDURE CheckCardBalance 
	AS 
	BEGIN
		SELECT currency as Валюта, FORMAT(balance, 'F2')  as Баланс
			FROM Task2.DebitCard 
			WHERE balance > 0
			GROUP BY currency, balance
	END

	DROP PROCEDURE  CheckCardBalance 


--Снять указанное количество средств с указанного счета 
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
				PRINT('Транзакция проведена успешно.')
				END
			END
		ELSE
			BEGIN
				PRINT('Недостаточно средств для проведения транзакции.')
			END
	END

DROP PROCEDURE TakeOff


--Продать указанное количество средств за указанную валюту
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
				PRINT('Недостаточно средств для проведения транзакции.')
			END
	END

DROP PROCEDURE Sell	


--Продать все средства за указанную валюту
CREATE PROCEDURE SellEverything
	@toCurrency VARCHAR(3)
	AS
	BEGIN
		IF EXISTS(SELECT * FROM Task2.DebitCard WHERE currency NOT LIKE @toCurrency)
			BEGIN 
				SELECT CAST(SUM(balance * rate) AS DECIMAL(10,2)) AS 'Общий баланс'
					FROM Task2.DebitCard JOIN Task2.Rates ON Task2.Rates.toCurrency = @toCurrency
						AND Task2.DebitCard.currency = Task2.Rates.fromCurrency
			END 
		ELSE
			BEGIN 
				PRINT('Что-то пошло не так')
			END
	END

DROP PROCEDURE SellEverything

----------------------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE Bonus
(
    @TableSRC NVARCHAR(100),   --Таблица источник (Представление)
    @ColumnName NVARCHAR(100), --Столбец, содержащий значения, которые станут именами столбцов
    @Field NVARCHAR(100),      --Столбец, над которым проводить агрегацию
    @FieldRows NVARCHAR(100),  --Столбец (столбцы) для группировки по строкам (Column1, Column2)
    @FunctionType NVARCHAR(20) = 'SUM',--Агрегатная функция (SUM, COUNT, MAX, MIN, AVG), по умолчанию SUM
    @Condition NVARCHAR(200) = '' --Условие (WHERE и т.д.). По умолчанию без условия
)
AS 
BEGIN        
    --Переменная для хранения строки запроса
    DECLARE @Query NVARCHAR(MAX);                     
    --Переменная для хранения имен столбцов
    DECLARE @ColumnNames NVARCHAR(MAX);              
    --Переменная для хранения заголовков результирующего набора данных
    DECLARE @ColumnNamesHeader NVARCHAR(MAX); 

	--Таблица для хранения уникальных значений, которые будут использоваться в качестве столбцов      
    CREATE TABLE TempColumnNames(ColumnName NVARCHAR(100) NOT NULL PRIMARY KEY);
        
    --Формируем строку запроса для получения уникальных значений для имен столбцов
    SET @Query = N'INSERT INTO TempColumnNames (ColumnName)
                   SELECT DISTINCT ' + @ColumnName + 
                 ' FROM ' + @TableSRC + ';'
                
    --Выполняем строку запроса
    EXEC (@Query);

	SELECT @ColumnNames AS 'названия столбцов'
	SELECT '' + QUOTENAME(ColumnName) AS 'просто qn' FROM TempColumnNames;
	SELECT ISNULL(@ColumnNames + ', ','') AS 'simple null'
    --Формируем строку с именами столбцов
    SELECT @ColumnNames = ISNULL(@ColumnNames + ', ','') + QUOTENAME(ColumnName) 
    FROM TempColumnNames;

	SELECT @ColumnNames AS 'названия столбцов после'
               
    --Формируем строку для заголовка динамического перекрестного запроса (PIVOT)
    SELECT @ColumnNamesHeader = ISNULL(@ColumnNamesHeader + ', ','') 
								+ 'COALESCE(' + QUOTENAME(ColumnName) + ', 0) AS '+ QUOTENAME(ColumnName)
    FROM TempColumnNames;
        
    --Формируем строку с запросом PIVOT
    SET @Query = N'SELECT ' + @FieldRows + ' , ' + @ColumnNamesHeader + ' 
                   FROM (SELECT ' + @FieldRows + ', ' + @ColumnName + ', ' + @Field 
               + ' FROM ' + @TableSRC  + ' ' + @Condition + ') AS SRC
                   PIVOT ( ' + @FunctionType + '(' + @Field + ')' +' FOR ' +  
                   @ColumnName + ' IN (' + @ColumnNames + ')) AS PVT
                   ORDER BY ' + @FieldRows + ';'
                
    --Удаляем временную таблицу
    DROP TABLE TempColumnNames;

    --Выполняем строку запроса с PIVOT
    EXEC (@Query);
END;
GO

DROP PROCEDURE Bonus

EXEC Bonus @TableSRC = 'Task2.Stavki',
           @ColumnName = 'currencyNameTo',
           @Field = 'rate',
           @FieldRows = 'currencyNameFrom'