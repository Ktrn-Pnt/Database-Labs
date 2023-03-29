USE [KB301_Panteleeva]
GO

INSERT INTO [KB301_Panteleeva].Panteleeva.store(
		StoreId,
		StoreName,
		Street,
		HouseNumber)
		VALUES
		(1, '��������', '���������', 21),
		(2, '������', '���������', 19),
		(3, '����������', '����������', 1),
		(4, '��������', '���������', 6),
		(5, '�������', '���������', 6),
		(6, '�������&�����', '���������', 15)
GO

SELECT * FROM Panteleeva.store

INSERT INTO [KB301_Panteleeva].Panteleeva.productGroup(
		ProductGroupId,
		ProductGroupName
		)
		VALUES
		(1, '�������� ���������'),
		(2, '������ ���������'),
		(3, '�����'),
		(4, '������'), 
		(5, '����������� �������'), 
		(6, '�������������� �������'), 
		(7, '�������������'),
		(8, '�����'), 
		(9, '������������� �������'),
		(10, '������ ���������')
GO

SELECT * FROM Panteleeva.productGroup

INSERT INTO [KB301_Panteleeva].Panteleeva.product(
		ProductId,
		ProductName,
		Measure,
		ProductGroupId
		)
		VALUES
		(1, '������ ���������', '�', 1), 
		(2, '������ ���������', '��', 1),
		(3, '������� ���������', '��', 1),
		(4, '�������', '��', 2), 
		(5, '��������', '��', 2),
		(6, '������', '��', 2),
		(7, '��������', '��', 3),
		(8, '������', '��', 3),
		(9, '���������', '��', 3),
		(10, '������', '��', 4),
		(11, '�����', '��', 4),
		(12, '������', '��', 4),
		(13, '����� ������� ���', '�', 5),
		(14, '����� ������� ��������', '�', 5),
		(15, '���� ����� �������', '�', 5),
		(16, '���� ������ �������', '�', 5),
		(17, '����-����', '�', 6),
		(18, '��� ���', '�', 6),
		(19, '���� ���� ��������', '�', 6),
		(20, '�������� ������', '��', 7),
		(21, '���������', '��', 8),
		(22, '���������', '��', 8),
		(23, '���� �����', '��', 9),
		(24, '���� ������', '��', 9),
		(25, '������', '��', 10)
GO

INSERT INTO [KB301_Panteleeva].Panteleeva.product(
		ProductId,
		ProductName,
		Measure,
		ProductGroupId
		)
		VALUES
		(26, '������ ����������', '�', 1),
		(27, '������ ����������', '��', 1),
		(28, '������� ����������', '��', 1),
		(29, '��� ������', '�', 1)
GO	

		
SELECT * FROM Panteleeva.product

INSERT INTO [KB301_Panteleeva].Panteleeva.sclad(
		StoreId,
		ProductId,
		Amount,
		Price,
		DateAndTime,
		ProductStatus
		)
		VALUES
		(1, 2, 30, 120, cast('2022-26-10 00:00:00' as smalldatetime), 1),
		(2, 3, 20, 100, cast('2022-25-10 00:00:00' as smalldatetime), 3),
		(3, 18, 50, 130, cast('2022-20-10 00:00:00' as smalldatetime), 7),
		(4, 20, 15, 170, cast('2022-23-10 00:00:00' as smalldatetime), 5),
		(5, 6, 32, 138, cast('2022-25-10 00:00:00' as smalldatetime), 5),
		(6, 20, 24, 159, cast('2022-25-10 00:00:00' as smalldatetime), 4),
		(1, 21, 16, 86, cast('2022-25-10 00:00:00' as smalldatetime), 3),
		(2, 21, 18, 90, cast('2022-23-10 00:00:00' as smalldatetime), 4),
		(3, 24, 10, 32, cast('2022-25-10 00:00:00' as smalldatetime), 2),
		(4, 25, 5, 350, cast('2022-25-10 00:00:00' as smalldatetime), 6),
		(5, 24, 16, 28, cast('2022-24-10 00:00:00' as smalldatetime), 2),
		(6, 10, 10, 58, cast('2022-25-10 00:00:00' as smalldatetime), 2),
		(1, 12, 3, 45, cast('2022-26-10 00:00:00' as smalldatetime), 4),
		(2, 24, 10, 32, cast('2022-25-10 00:00:00' as smalldatetime), 2),
		(3, 17, 50, 98, cast('2022-20-10 00:00:00' as smalldatetime), 3),
		(4, 17, 37, 91, cast('2022-20-10 00:00:00' as smalldatetime), 8),
		(5, 11, 5, 46, cast('2022-24-10 00:00:00' as smalldatetime), 1),
		(6, 11, 7, 55, cast('2022-25-10 00:00:00' as smalldatetime), 4),
		(1, 5, 10, 180, cast('2022-25-10 00:00:00' as smalldatetime), 3),
		(2, 5, 10, 180, cast('2022-26-10 00:00:00' as smalldatetime), 5),
		(3, 5, 13, 170, cast('2022-25-10 00:00:00' as smalldatetime), 8),
		(4, 5, 12, 170, cast('2022-25-10 00:00:00' as smalldatetime), 2),
		(5, 8, 7, 45, cast('2022-24-10 00:00:00' as smalldatetime), 3),
		(6, 8, 9, 45, cast('2022-24-10 00:00:00' as smalldatetime), 4)
GO

INSERT INTO [KB301_Panteleeva].Panteleeva.sclad(
		StoreId,
		ProductId,
		Amount,
		Price,
		DateAndTime,
		ProductStatus
		)
		VALUES
		(1, 26, 2, 50, cast('2022-26-10 00:00:00' as smalldatetime), 1),
		(1, 1, 3, 50, cast('2022-26-10 00:00:00' as smalldatetime), 2),
		(1, 27, 4, 120, cast('2022-26-10 00:00:00' as smalldatetime), 2),
		(2, 1, 3, 50, cast('2022-26-10 00:00:00' as smalldatetime), 2),
		(3, 13, 3, 100, cast('2022-26-10 00:00:00' as smalldatetime), 3),
		(3, 14, 3, 100, cast('2022-26-10 00:00:00' as smalldatetime), 3),
		(4, 15, 1, 60, cast('2022-26-10 00:00:00' as smalldatetime), 8),
		(4, 16, 2, 65, cast('2022-26-10 00:00:00' as smalldatetime), 8)
GO

SELECT * FROM Panteleeva.store



SELECT * FROM Panteleeva.store
SELECT * FROM Panteleeva.productGroup
SELECT * FROM Panteleeva.product
SELECT * FROM Panteleeva.sclad


-- ����������� ���� ������������� ������ �� id ������.
 SELECT ProductName AS "��� ������", MIN(Price) AS "����������� ���� ������"
  FROM [KB301_Panteleeva].Panteleeva.sclad INNER JOIN 
				[KB301_Panteleeva].Panteleeva.product ON [KB301_Panteleeva].Panteleeva.sclad.ProductId = [KB301_Panteleeva].Panteleeva.product.ProductId
  WHERE [KB301_Panteleeva].Panteleeva.sclad.ProductId = 20
  GROUP BY ProductName;

-- ����������� ���� ������������� ������ �� ����� ������.
  SELECT ProductName AS "��� ������", MIN(Price) AS "����������� ���� ������"
  FROM [KB301_Panteleeva].Panteleeva.sclad INNER JOIN 
				[KB301_Panteleeva].Panteleeva.product ON [KB301_Panteleeva].Panteleeva.sclad.ProductId = [KB301_Panteleeva].Panteleeva.product.ProductId
  WHERE ProductName = '������ ����������'
  GROUP BY ProductName;

-- ������������ ���� ������������� ������ �� id ������.
  SELECT ProductName AS "��� ������", MAX(Price) AS "������������ ���� ������"
  FROM [KB301_Panteleeva].Panteleeva.sclad INNER JOIN 
				[KB301_Panteleeva].Panteleeva.product ON [KB301_Panteleeva].Panteleeva.sclad.ProductId = [KB301_Panteleeva].Panteleeva.product.ProductId
  WHERE [KB301_Panteleeva].Panteleeva.sclad.ProductId = 20
  GROUP BY ProductName;

-- ������������ ���� ������������� ������ �� ����� ������.
  SELECT ProductName AS "��� ������", MAX(Price) AS "������������ ���� ������"
  FROM [KB301_Panteleeva].Panteleeva.sclad INNER JOIN 
				[KB301_Panteleeva].Panteleeva.product ON [KB301_Panteleeva].Panteleeva.sclad.ProductId = [KB301_Panteleeva].Panteleeva.product.ProductId
  WHERE ProductName = '������ ����������'
  GROUP BY ProductName;

--������� ���� ������������� ������ �� Id ������.
  SELECT ProductName AS "��� ������", Avg(Price) AS "������� ���� ������"
  FROM [KB301_Panteleeva].Panteleeva.sclad INNER JOIN 
				[KB301_Panteleeva].Panteleeva.product ON [KB301_Panteleeva].Panteleeva.sclad.ProductId = [KB301_Panteleeva].Panteleeva.product.ProductId
  WHERE [KB301_Panteleeva].Panteleeva.sclad.ProductId = 20
  GROUP BY ProductName;

-- ������� ���� ������������� ������ �� ����� ������.
  SELECT ProductName AS "��� ������", Avg(Price) AS "������� ���� ������"
  FROM [KB301_Panteleeva].Panteleeva.sclad INNER JOIN 
				[KB301_Panteleeva].Panteleeva.product ON [KB301_Panteleeva].Panteleeva.sclad.ProductId = [KB301_Panteleeva].Panteleeva.product.ProductId
  WHERE ProductName = '������ ����������'
  GROUP BY ProductName;

-- ���������� ������ �� ���� ��������� �� id ������
  SELECT ProductName AS "��� ������", 			
			SUM(case
				when ProductStatus = 2 then
				Amount
				else 
				Amount
			end) AS "���������� ������� �� ���� ���������"
  FROM [KB301_Panteleeva].Panteleeva.sclad INNER JOIN 
				[KB301_Panteleeva].Panteleeva.product ON [KB301_Panteleeva].Panteleeva.sclad.ProductId = [KB301_Panteleeva].Panteleeva.product.ProductId
  WHERE [KB301_Panteleeva].Panteleeva.sclad.ProductId = 20
  GROUP BY ProductName;

-- ���������� ������ �� ���� ��������� �� ����� ������
  SELECT ProductName AS "��� ������", 			
			SUM(case
				when ProductStatus = 2 then
				Amount
				else 
				Amount
			end) AS "���������� ������� �� ���� ���������"
  FROM [KB301_Panteleeva].Panteleeva.sclad INNER JOIN 
				[KB301_Panteleeva].Panteleeva.product ON [KB301_Panteleeva].Panteleeva.sclad.ProductId = [KB301_Panteleeva].Panteleeva.product.ProductId
  WHERE ProductName = '������ ����������'
  GROUP BY ProductName;

-- ���������� ������ � ������ �������� �� ����
  SELECT ProductName AS "��� ��������", FORMAT (getdate(), 'D', 'ru-ru') AS "���� � �����", StoreName AS "��� ��������", 
			SUM(case
				when ProductStatus = 1 then
				Amount
				else 
				Amount
			end)  AS "���������� ������"
  FROM [KB301_Panteleeva].Panteleeva.sclad INNER JOIN 
				[KB301_Panteleeva].Panteleeva.store ON [KB301_Panteleeva].Panteleeva.sclad.StoreId = [KB301_Panteleeva].Panteleeva.store.StoreId INNER JOIN
				[KB301_Panteleeva].Panteleeva.product ON [KB301_Panteleeva].Panteleeva.sclad.ProductId = [KB301_Panteleeva].Panteleeva.product.ProductId
  WHERE [KB301_Panteleeva].Panteleeva.sclad.ProductId = 20 AND DateAndTime BETWEEN '2022-20-10 00:00:00' AND '2022-26-10 00:00:00'
  GROUP BY DateAndTime, StoreName, ProductName;

-- ��� ������: (� ����� �������� ���������� ���� ������)

SELECT store.StoreName AS '�������� ��������', product.ProductName AS '�������� ������',  MAX(sclad.price) AS '���������� ����' FROM [KB301_Panteleeva].Panteleeva.sclad
	JOIN [KB301_Panteleeva].Panteleeva.store ON sclad.StoreId = store.StoreId
	JOIN [KB301_Panteleeva].Panteleeva.product ON sclad.ProductId = product.ProductId
WHERE sclad.Price = (SELECT MAX(sclad.Price) FROM [KB301_Panteleeva].Panteleeva.sclad WHERE sclad.ProductId = 11) AND sclad.ProductId = 11
GROUP BY product.ProductName, store.StoreName
