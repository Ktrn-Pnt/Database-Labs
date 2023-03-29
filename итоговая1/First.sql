USE [KB301_Panteleeva]
GO

INSERT INTO [KB301_Panteleeva].Panteleeva.store(
		StoreId,
		StoreName,
		Street,
		HouseNumber)
		VALUES
		(1, 'Пятёрочка', 'Готвальда', 21),
		(2, 'Магнит', 'Готвальда', 19),
		(3, 'Перекрёсток', 'Машинистов', 1),
		(4, 'Пятёрочка', 'Готвальда', 6),
		(5, 'Монетка', 'Готвальда', 6),
		(6, 'Красное&Белое', 'Готвальда', 15)
GO

SELECT * FROM Panteleeva.store

INSERT INTO [KB301_Panteleeva].Panteleeva.productGroup(
		ProductGroupId,
		ProductGroupName
		)
		VALUES
		(1, 'Молочная продукция'),
		(2, 'Мясная продукция'),
		(3, 'Овощи'),
		(4, 'Фрукты'), 
		(5, 'Алкогольные напитки'), 
		(6, 'Безалкогольные напитки'), 
		(7, 'Полуфабрикаты'),
		(8, 'Крупы'), 
		(9, 'Хлебобулочные изделия'),
		(10, 'Рыбная продукция')
GO

SELECT * FROM Panteleeva.productGroup

INSERT INTO [KB301_Panteleeva].Panteleeva.product(
		ProductId,
		ProductName,
		Measure,
		ProductGroupId
		)
		VALUES
		(1, 'Молоко Ирбитское', 'л', 1), 
		(2, 'Творог Ирбитский', 'кг', 1),
		(3, 'Сметана Ирбитская', 'кг', 1),
		(4, 'Свинина', 'кг', 2), 
		(5, 'Говядина', 'кг', 2),
		(6, 'Курица', 'кг', 2),
		(7, 'Помидоры', 'кг', 3),
		(8, 'Огурцы', 'кг', 3),
		(9, 'Картофель', 'кг', 3),
		(10, 'Яблоки', 'кг', 4),
		(11, 'Груши', 'кг', 4),
		(12, 'Бананы', 'кг', 4),
		(13, 'Водка Финский Айс', 'л', 5),
		(14, 'Водка Русский стандарт', 'л', 5),
		(15, 'Пиво Белый медведь', 'л', 5),
		(16, 'Пиво Старый мельник', 'л', 5),
		(17, 'Кока-кола', 'л', 6),
		(18, 'Сок Рич', 'л', 6),
		(19, 'Вода Аква Минерале', 'л', 6),
		(20, 'Пельмени Цезарь', 'кг', 7),
		(21, 'Гречневая', 'кг', 8),
		(22, 'Пшеничная', 'кг', 8),
		(23, 'Хлеб Белый', 'шт', 9),
		(24, 'Хлеб Черный', 'шт', 9),
		(25, 'Лосось', 'кг', 10)
GO

INSERT INTO [KB301_Panteleeva].Panteleeva.product(
		ProductId,
		ProductName,
		Measure,
		ProductGroupId
		)
		VALUES
		(26, 'Молоко Кушвинское', 'л', 1),
		(27, 'Творог Кушвинский', 'кг', 1),
		(28, 'Сметана Кушвинская', 'кг', 1),
		(29, 'Сок Добрый', 'л', 1)
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


-- минимальная цена определенного товара по id Товара.
 SELECT ProductName AS "Имя товара", MIN(Price) AS "Минимальная цена товара"
  FROM [KB301_Panteleeva].Panteleeva.sclad INNER JOIN 
				[KB301_Panteleeva].Panteleeva.product ON [KB301_Panteleeva].Panteleeva.sclad.ProductId = [KB301_Panteleeva].Panteleeva.product.ProductId
  WHERE [KB301_Panteleeva].Panteleeva.sclad.ProductId = 20
  GROUP BY ProductName;

-- минимальная цена определенного товара по имени товара.
  SELECT ProductName AS "Имя товара", MIN(Price) AS "Минимальная цена товара"
  FROM [KB301_Panteleeva].Panteleeva.sclad INNER JOIN 
				[KB301_Panteleeva].Panteleeva.product ON [KB301_Panteleeva].Panteleeva.sclad.ProductId = [KB301_Panteleeva].Panteleeva.product.ProductId
  WHERE ProductName = 'Молоко Кушвинское'
  GROUP BY ProductName;

-- максимальная цена определенного товара по id товара.
  SELECT ProductName AS "Имя товара", MAX(Price) AS "Максимальная цена товара"
  FROM [KB301_Panteleeva].Panteleeva.sclad INNER JOIN 
				[KB301_Panteleeva].Panteleeva.product ON [KB301_Panteleeva].Panteleeva.sclad.ProductId = [KB301_Panteleeva].Panteleeva.product.ProductId
  WHERE [KB301_Panteleeva].Panteleeva.sclad.ProductId = 20
  GROUP BY ProductName;

-- максимальная цена определенного товара по имени товара.
  SELECT ProductName AS "Имя товара", MAX(Price) AS "Максимальная цена товара"
  FROM [KB301_Panteleeva].Panteleeva.sclad INNER JOIN 
				[KB301_Panteleeva].Panteleeva.product ON [KB301_Panteleeva].Panteleeva.sclad.ProductId = [KB301_Panteleeva].Panteleeva.product.ProductId
  WHERE ProductName = 'Молоко Кушвинское'
  GROUP BY ProductName;

--средняя цена определенного товара по Id товара.
  SELECT ProductName AS "Имя товара", Avg(Price) AS "Средняя цена товара"
  FROM [KB301_Panteleeva].Panteleeva.sclad INNER JOIN 
				[KB301_Panteleeva].Panteleeva.product ON [KB301_Panteleeva].Panteleeva.sclad.ProductId = [KB301_Panteleeva].Panteleeva.product.ProductId
  WHERE [KB301_Panteleeva].Panteleeva.sclad.ProductId = 20
  GROUP BY ProductName;

-- средняя цена определенного товара по имени товара.
  SELECT ProductName AS "Имя товара", Avg(Price) AS "Средняя цена товара"
  FROM [KB301_Panteleeva].Panteleeva.sclad INNER JOIN 
				[KB301_Panteleeva].Panteleeva.product ON [KB301_Panteleeva].Panteleeva.sclad.ProductId = [KB301_Panteleeva].Panteleeva.product.ProductId
  WHERE ProductName = 'Молоко Кушвинское'
  GROUP BY ProductName;

-- количество товара во всех магазинах по id товара
  SELECT ProductName AS "Имя товара", 			
			SUM(case
				when ProductStatus = 2 then
				Amount
				else 
				Amount
			end) AS "Количество товаров во всех магазинах"
  FROM [KB301_Panteleeva].Panteleeva.sclad INNER JOIN 
				[KB301_Panteleeva].Panteleeva.product ON [KB301_Panteleeva].Panteleeva.sclad.ProductId = [KB301_Panteleeva].Panteleeva.product.ProductId
  WHERE [KB301_Panteleeva].Panteleeva.sclad.ProductId = 20
  GROUP BY ProductName;

-- количество товара во всех магазинах по имени товара
  SELECT ProductName AS "Имя товара", 			
			SUM(case
				when ProductStatus = 2 then
				Amount
				else 
				Amount
			end) AS "Количество товаров во всех магазинах"
  FROM [KB301_Panteleeva].Panteleeva.sclad INNER JOIN 
				[KB301_Panteleeva].Panteleeva.product ON [KB301_Panteleeva].Panteleeva.sclad.ProductId = [KB301_Panteleeva].Panteleeva.product.ProductId
  WHERE ProductName = 'Молоко Кушвинское'
  GROUP BY ProductName;

-- количество товара в каждом магазине по дате
  SELECT ProductName AS "Имя продукта", FORMAT (getdate(), 'D', 'ru-ru') AS "Дата и время", StoreName AS "Имя магазина", 
			SUM(case
				when ProductStatus = 1 then
				Amount
				else 
				Amount
			end)  AS "Количество товара"
  FROM [KB301_Panteleeva].Panteleeva.sclad INNER JOIN 
				[KB301_Panteleeva].Panteleeva.store ON [KB301_Panteleeva].Panteleeva.sclad.StoreId = [KB301_Panteleeva].Panteleeva.store.StoreId INNER JOIN
				[KB301_Panteleeva].Panteleeva.product ON [KB301_Panteleeva].Panteleeva.sclad.ProductId = [KB301_Panteleeva].Panteleeva.product.ProductId
  WHERE [KB301_Panteleeva].Panteleeva.sclad.ProductId = 20 AND DateAndTime BETWEEN '2022-20-10 00:00:00' AND '2022-26-10 00:00:00'
  GROUP BY DateAndTime, StoreName, ProductName;

-- Доп запрос: (В каком магазине наименьшая цена товара)

SELECT store.StoreName AS 'Название магазина', product.ProductName AS 'Название товара',  MAX(sclad.price) AS 'Наибольшая цена' FROM [KB301_Panteleeva].Panteleeva.sclad
	JOIN [KB301_Panteleeva].Panteleeva.store ON sclad.StoreId = store.StoreId
	JOIN [KB301_Panteleeva].Panteleeva.product ON sclad.ProductId = product.ProductId
WHERE sclad.Price = (SELECT MAX(sclad.Price) FROM [KB301_Panteleeva].Panteleeva.sclad WHERE sclad.ProductId = 11) AND sclad.ProductId = 11
GROUP BY product.ProductName, store.StoreName
