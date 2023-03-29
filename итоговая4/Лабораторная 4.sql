USE master
IF EXISTS(select * from sys.databases where name='MichaelUskov2')
BEGIN
	ALTER DATABASE MichaelUskov2 SET SINGLE_USER WITH ROLLBACK IMMEDIATE
	ALTER DATABASE MichaelUskov2 SET MULTI_USER
	DROP DATABASE MichaelUskov2
END
GO

CREATE DATABASE MichaelUskov2
GO

USE MichaelUskov2
GO
 
CREATE TABLE Rate( 
	ID INT IDENTITY,
	Fee FLOAT NOT NULL,
	Minutes FLOAT NOT NULL,
	Cost FLOAT NOT NULL
	CONSTRAINT Rate__PK PRIMARY KEY(ID)
)
GO

CREATE FUNCTION BestRate(@q FLOAT)
	RETURNS INT
	AS
	BEGIN
		DECLARE @min FLOAT
		DECLARE @id INT	
		SET @min =
		(
			SELECT MIN(Fee + Cost * 
									CASE 
									WHEN @q-Minutes < 0 THEN 0
									ELSE @q-Minutes
									END
									) FROM Rate
		)
		SET @id =
		(
			SELECT TOP 1 ID FROM Rate
			WHERE (Fee + Cost * CASE 
									WHEN @q-Minutes < 0 THEN 0
									ELSE @q-Minutes
									END = @min)
		)
		RETURN @id
	END
 GO

CREATE PROCEDURE OptimalTariffs
AS
BEGIN
	DECLARE @max int
	CREATE TABLE #t (
		Point float
	)
	INSERT INTO #t VALUES (0), (43200)
	INSERT INTO #t SELECT MAX(Minutes) FROM Rate
	SET @max = 43200
	INSERT INTO #t 
				SELECT (a.Fee-b.Fee)/b.Cost
				FROM Rate as a, Rate as b
				WHERE b.Cost <> 0 AND a.ID<>b.ID AND (a.Fee-b.Fee)/b.Cost>0
	INSERT INTO #t 
				SELECT (b.Fee - a.Fee - b.Minutes*b.Cost  + a.Minutes*a.Cost)/(a.Cost - b.Cost)
				FROM Rate as a, Rate as b
				WHERE (a.Cost - b.Cost) <> 0 AND a.ID<>b.ID AND (b.Fee - a.Fee - b.Minutes*b.Cost  + a.Minutes*a.Cost)/(a.Cost - b.Cost) > 0
	UPDATE #t SET Point=ROUND(Point,0)
	DELETE FROM #t WHERE
					 Point != 0
					AND Point != @max
					AND  dbo.BestRate(Point-1) = dbo.BestRate(Point+1) 
					AND  dbo.BestRate(Point) = dbo.BestRate(Point+1)
	CREATE TABLE #answ (
			L int,
			R int,
			Tariff int
			)
	DECLARE @cursor CURSOR
	DECLARE @left int
	DECLARE @right int
	 SELECT DISTINCT * FROM #t ORDER BY Point ASC
	SET @cursor = CURSOR SCROLL FOR
				 SELECT DISTINCT * FROM #t ORDER BY Point ASC
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @right
	SET @left = @right
	FETCH NEXT FROM @cursor INTO @right
	WHILE @@FETCH_STATUS = 0
	BEGIN
		INSERT INTO #answ VALUES (@left, @right, dbo.BestRate((@left+@right)/2))
		SET @left=@right
		FETCH NEXT FROM @cursor INTO @right
	END
	SELECT l as [Левая граница],
		   r as [Правая граница],
		   Tariff as [Тариф]
		   FROM #answ 
				   ORDER BY L ASC
END
GO

INSERT INTO Rate VALUES
	(0, 0, 1),
	(300, 600, 2),
	(1000, 43200, 0)
GO

PRINT dbo.BestRate(777)
GO

EXEC dbo.OptimalTariffs
GO