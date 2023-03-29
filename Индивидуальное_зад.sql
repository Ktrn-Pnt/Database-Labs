CREATE DATABASE KB301_Panteleeva
GO

USE KB301_Panteleeva
GO

CREATE SCHEMA IDZ_Panteleeva
GO

DROP TABLE Authors
DROP TABLE Publishing_house
DROP TABLE Books
DROP TABLE Deliveries
DROP TABLE Purchases

CREATE TABLE IDZ_Panteleeva.Authors(
   Code_author INT PRIMARY KEY NOT NULL, -- Код автора 
   Name_author CHAR(50) NULL,            -- Фамилия автора
   Birthday DATE NULL                    -- Дата рождения
)
 
CREATE TABLE IDZ_Panteleeva.Publishing_house(
    Code_publish INT PRIMARY KEY NOT NULL, -- Код издательства
    Publish CHAR(50),                      -- Название издательства
    City CHAR(50)                          -- Город издательства
)
 
CREATE TABLE IDZ_Panteleeva.Books(
    Code_book INT PRIMARY KEY NOT NULL,    -- Код книги
    Title_book CHAR(50) NULL,                   -- Название книги
    Code_author INT FOREIGN KEY REFERENCES IDZ_Panteleeva.Authors(Code_author) NOT NULL,
    Pages INT NULL,
    Code_publish INT FOREIGN KEY REFERENCES IDZ_Panteleeva.Publishing_house(Code_publish) NOT NULL
)
 
CREATE TABLE IDZ_Panteleeva.Deliveries(
    Code_delivery INT PRIMARY KEY NOT NULL, -- Код доставщика
    Name_delivery CHAR(50),                 -- Наименование доставщика
    Name_company CHAR(50),                  -- Наименование компании
    Address_company CHAR(50),               -- Адрес
    Phone NUMERIC(18, 0),                   -- Телефон
    INN CHAR(13)                            -- ИНН
)
 
CREATE TABLE IDZ_Panteleeva.Purchases(
    Code_purchase INT PRIMARY KEY NOT NULL,                                       -- Код продажи
    Code_book INT FOREIGN KEY REFERENCES IDZ_Panteleeva.Books(Code_book) NOT NULL,
    Date_order DATE NULL,                                                         -- Дата
    Code_delivery INT FOREIGN KEY REFERENCES IDZ_Panteleeva.Deliveries(Code_delivery) NOT NULL, 
    Type_purchase BIT NOT NULL,                                                   -- Тип продажи
    Cost DECIMAL(6, 2) NULL,                                                      -- Цена
    Amount INT NULL                                                               -- Количество
)

INSERT IDZ_Panteleeva.Authors (Code_author, Name_author, Birthday) VALUES (1, N'authorName1                                       ', CAST(N'1840-01-01' AS Date))
INSERT IDZ_Panteleeva.Authors (Code_author, Name_author, Birthday) VALUES (2, N'authorName2                                       ', CAST(N'1976-01-01' AS Date))
INSERT IDZ_Panteleeva.Authors (Code_author, Name_author, Birthday) VALUES (3, N'authorName3                                       ', CAST(N'1857-06-02' AS Date))
INSERT IDZ_Panteleeva.Authors (Code_author, Name_author, Birthday) VALUES (4, N'authorName4                                       ', CAST(N'1954-03-02' AS Date))
INSERT IDZ_Panteleeva.Authors (Code_author, Name_author, Birthday) VALUES (5, N'Акунин Борис                                      ', CAST(N'1956-05-20' AS Date))
INSERT IDZ_Panteleeva.Authors (Code_author, Name_author, Birthday) VALUES (6, N'authorName6                                       ', CAST(N'1860-08-22' AS Date))
INSERT IDZ_Panteleeva.Authors (Code_author, Name_author, Birthday) VALUES (7, N'Кассиль Лев Абрамович                             ', CAST(N'1905-06-27' AS Date))
INSERT IDZ_Panteleeva.Authors (Code_author, Name_author, Birthday) VALUES (8, N'Куприн Александр Иванович                         ', CAST(N'1870-08-26' AS Date))
INSERT IDZ_Panteleeva.Authors (Code_author, Name_author, Birthday) VALUES (9, N'Вишневский Владимир Петрович                      ', CAST(N'1953-08-20' AS Date))
INSERT IDZ_Panteleeva.Authors (Code_author, Name_author, Birthday) VALUES (10, N'Иванова Лидия Михайловна                         ', CAST(N'1936-03-07' AS Date))
INSERT IDZ_Panteleeva.Authors (Code_author, Name_author, Birthday) VALUES (11, N'Иванов Анатолий Степанович                       ', CAST(N'1928-05-05' AS Date))
INSERT IDZ_Panteleeva.Authors (Code_author, Name_author, Birthday) VALUES (12, N'Иванов Алексей Викторович                        ', CAST(N'1969-11-23' AS Date))
INSERT IDZ_Panteleeva.Authors (Code_author, Name_author, Birthday) VALUES (13, N'Асиман Андре                                     ', CAST(N'1951-01-02' AS Date))
INSERT IDZ_Panteleeva.Authors (Code_author, Name_author, Birthday) VALUES (14, N'Ширвиндт Михаил                                  ', CAST(N'1958-08-14' AS Date))
INSERT IDZ_Panteleeva.Authors (Code_author, Name_author, Birthday) VALUES (15, N'Голден Артур                                     ', CAST(N'1956-12-06' AS Date))
INSERT IDZ_Panteleeva.Authors (Code_author, Name_author, Birthday) VALUES (16, N'Толстой Л.Н.                                     ', CAST(N'1828-08-28' AS Date))
INSERT IDZ_Panteleeva.Authors (Code_author, Name_author, Birthday) VALUES (17, N'Достоевский Ф.М.                                 ', CAST(N'1821-10-30' AS Date))
INSERT IDZ_Panteleeva.Authors (Code_author, Name_author, Birthday) VALUES (18, N'Пушкин А.С.                                      ', CAST(N'1799-05-26' AS Date))
GO



INSERT IDZ_Panteleeva.Publishing_house (Code_publish, Publish, City) VALUES (1, N'publish1                                           ', N'city1                                             ')
INSERT IDZ_Panteleeva.Publishing_house (Code_publish, Publish, City) VALUES (2, N'publish2                                           ', N'Москва                                            ')
INSERT IDZ_Panteleeva.Publishing_house (Code_publish, Publish, City) VALUES (3, N'publish3                                           ', N'city3                                             ')
INSERT IDZ_Panteleeva.Publishing_house (Code_publish, Publish, City) VALUES (4, N'Питер-Софт                                         ', N'Нижний Новгород                                   ')
INSERT IDZ_Panteleeva.Publishing_house (Code_publish, Publish, City) VALUES (5, N'publish5                                           ', N'city5                                             ')
INSERT IDZ_Panteleeva.Publishing_house (Code_publish, Publish, City) VALUES (6, N'Альфа                                              ', N'Москва                                            ')
INSERT IDZ_Panteleeva.Publishing_house (Code_publish, Publish, City) VALUES (7, N'publish7                                           ', N'Новосибирск                                       ')
INSERT IDZ_Panteleeva.Publishing_house (Code_publish, Publish, City) VALUES (8, N'publish8                                           ', N'Москва                                            ')
INSERT IDZ_Panteleeva.Publishing_house (Code_publish, Publish, City) VALUES (9, N'Наука                                              ', N'Москва                                            ')
INSERT IDZ_Panteleeva.Publishing_house (Code_publish, Publish, City) VALUES (10, N'publish10                                         ', N'city10                                            ')
INSERT IDZ_Panteleeva.Publishing_house (Code_publish, Publish, City) VALUES (11, N'publish11                                         ', N'city11                                            ')
INSERT IDZ_Panteleeva.Publishing_house (Code_publish, Publish, City) VALUES (12, N'publish12                                         ', N'Москва                                            ')
INSERT IDZ_Panteleeva.Publishing_house (Code_publish, Publish, City) VALUES (13, N'Мир                                               ', N'Москва                                            ')
INSERT IDZ_Panteleeva.Publishing_house (Code_publish, Publish, City) VALUES (14, N'Питер                                             ', N'Санкт-Петербург                                   ')
INSERT IDZ_Panteleeva.Publishing_house (Code_publish, Publish, City) VALUES (15, N'publish15                                         ', N'city15                                            ')
GO



INSERT IDZ_Panteleeva.Books (Code_book, Title_book, Pages, Code_author, Code_publish) VALUES (1, N'bookname1                                          ', 308, 11, 4)
INSERT IDZ_Panteleeva.Books (Code_book, Title_book, Pages, Code_author, Code_publish) VALUES (2, N'Труды                                              ', 107, 11, 1)
INSERT IDZ_Panteleeva.Books (Code_book, Title_book, Pages, Code_author, Code_publish) VALUES (3, N'bookname3                                          ', 342, 12, 10)
INSERT IDZ_Panteleeva.Books (Code_book, Title_book, Pages, Code_author, Code_publish) VALUES (4, N'Мемуары гейши                                      ', 384, 13, 15)
INSERT IDZ_Panteleeva.Books (Code_book, Title_book, Pages, Code_author, Code_publish) VALUES (5, N'bookname5                                          ', 371, 3, 11)
INSERT IDZ_Panteleeva.Books (Code_book, Title_book, Pages, Code_author, Code_publish) VALUES (6, N'bookname6                                          ', 374, 5, 13)
INSERT IDZ_Panteleeva.Books (Code_book, Title_book, Pages, Code_author, Code_publish) VALUES (7, N'Из Египта. Мемуары                                 ', 250, 3, 13)
INSERT IDZ_Panteleeva.Books (Code_book, Title_book, Pages, Code_author, Code_publish) VALUES (8, N'bookname8                                          ', 339, 2, 1)
INSERT IDZ_Panteleeva.Books (Code_book, Title_book, Pages, Code_author, Code_publish) VALUES (9, N'bookname9                                          ', 384, 10, 6)
INSERT IDZ_Panteleeva.Books (Code_book, Title_book, Pages, Code_author, Code_publish) VALUES (10, N'bookname10                                        ', 324, 5, 6)
INSERT IDZ_Panteleeva.Books (Code_book, Title_book, Pages, Code_author, Code_publish) VALUES (11, N'bookname11                                        ', 353, 1, 6)
INSERT IDZ_Panteleeva.Books (Code_book, Title_book, Pages, Code_author, Code_publish) VALUES (12, N'Мемуары двоечника                                 ', 287, 13, 14)
INSERT IDZ_Panteleeva.Books (Code_book, Title_book, Pages, Code_author, Code_publish) VALUES (13, N'Труды Университета                                ', 389, 11, 7)
INSERT IDZ_Panteleeva.Books (Code_book, Title_book, Pages, Code_author, Code_publish) VALUES (14, N'bookname14                                        ', 337, 2, 11)
INSERT IDZ_Panteleeva.Books (Code_book, Title_book, Pages, Code_author, Code_publish) VALUES (15, N'bookname15                                        ', 388, 7, 7)
INSERT IDZ_Panteleeva.Books (Code_book, Title_book, Pages, Code_author, Code_publish) VALUES (16, N'bookname16                                        ', 362, 13, 4)
INSERT IDZ_Panteleeva.Books (Code_book, Title_book, Pages, Code_author, Code_publish) VALUES (17, N'bookname17                                        ', 379, 8, 5)
INSERT IDZ_Panteleeva.Books (Code_book, Title_book, Pages, Code_author, Code_publish) VALUES (18, N'bookname18                                        ', 238, 15, 4)
INSERT IDZ_Panteleeva.Books (Code_book, Title_book, Pages, Code_author, Code_publish) VALUES (19, N'bookname19                                        ', 337, 12, 11)
INSERT IDZ_Panteleeva.Books (Code_book, Title_book, Pages, Code_author, Code_publish) VALUES (20, N'bookname20                                        ', 326, 11, 2)
INSERT IDZ_Panteleeva.Books (Code_book, Title_book, Pages, Code_author, Code_publish) VALUES (21, N'bookname21                                        ', 364, 13, 9)
INSERT IDZ_Panteleeva.Books (Code_book, Title_book, Pages, Code_author, Code_publish) VALUES (22, N'bookname22                                        ', 347, 15, 3)
INSERT IDZ_Panteleeva.Books (Code_book, Title_book, Pages, Code_author, Code_publish) VALUES (23, N'bookname23                                        ', 301, 4, 9)
INSERT IDZ_Panteleeva.Books (Code_book, Title_book, Pages, Code_author, Code_publish) VALUES (24, N'bookname24                                        ', 398, 9, 7)
INSERT IDZ_Panteleeva.Books (Code_book, Title_book, Pages, Code_author, Code_publish) VALUES (25, N'bookname25                                        ', 361, 4, 2)
INSERT IDZ_Panteleeva.Books (Code_book, Title_book, Pages, Code_author, Code_publish) VALUES (26, N'bookname26                                        ', 303, 14, 1)
INSERT IDZ_Panteleeva.Books (Code_book, Title_book, Pages, Code_author, Code_publish) VALUES (27, N'bookname27                                        ', 380, 3, 4)
INSERT IDZ_Panteleeva.Books (Code_book, Title_book, Pages, Code_author, Code_publish) VALUES (28, N'bookname28                                        ', 320, 5, 13)
INSERT IDZ_Panteleeva.Books (Code_book, Title_book, Pages, Code_author, Code_publish) VALUES (29, N'bookname29                                        ', 344, 14, 13)
INSERT IDZ_Panteleeva.Books (Code_book, Title_book, Pages, Code_author, Code_publish) VALUES (30, N'bookname30                                        ', 364, 15, 10)
INSERT IDZ_Panteleeva.Books (Code_book, Title_book, Pages, Code_author, Code_publish) VALUES (31, N'Отрочество                                        ', 80, 16, 4)
INSERT IDZ_Panteleeva.Books (Code_book, Title_book, Pages, Code_author, Code_publish) VALUES (32, N'Казаки                                            ', 208, 16, 4)
INSERT IDZ_Panteleeva.Books (Code_book, Title_book, Pages, Code_author, Code_publish) VALUES (33, N'Игрок                                             ', 224, 17, 4)
INSERT IDZ_Panteleeva.Books (Code_book, Title_book, Pages, Code_author, Code_publish) VALUES (34, N'Сказки                                            ', 144, 18, 4)
GO



INSERT IDZ_Panteleeva.Deliveries (Code_delivery, Name_delivery, Name_company, Address_company, Phone, INN) VALUES (1,  N'dilvery1                                          ', N'company1                                          ', N'adress1                                           ', CAST(256678 AS Numeric(18, 0)), N'19354851  ')
INSERT IDZ_Panteleeva.Deliveries (Code_delivery, Name_delivery, Name_company, Address_company, Phone, INN) VALUES (2,  N'dilvery2                                          ', N'company2                                          ', N'adress2                                           ', CAST(256679 AS Numeric(18, 0)), N'13498045  ')
INSERT IDZ_Panteleeva.Deliveries (Code_delivery, Name_delivery, Name_company, Address_company, Phone, INN) VALUES (3,  N'dilvery3                                          ', N'ОАО "Книги"                                       ', N'adress3                                           ', CAST(256680 AS Numeric(18, 0)), N'8601020863')
INSERT IDZ_Panteleeva.Deliveries (Code_delivery, Name_delivery, Name_company, Address_company, Phone, INN) VALUES (4,  N'dilvery4                                          ', N'ОАО Луч                                           ', N'adress4                                           ', CAST(256681 AS Numeric(18, 0)), N'7709028658')
INSERT IDZ_Panteleeva.Deliveries (Code_delivery, Name_delivery, Name_company, Address_company, Phone, INN) VALUES (5,  N'dilvery5                                          ', N'company5                                          ', N'adress5                                           ', CAST(256682 AS Numeric(18, 0)), N'14401362  ')
INSERT IDZ_Panteleeva.Deliveries (Code_delivery, Name_delivery, Name_company, Address_company, Phone, INN) VALUES (6,  N'dilvery6                                          ', N'ОАО «Каменск-Уральская типография»                ', N'adress6                                           ', CAST(256683 AS Numeric(18, 0)), N'6612045778')
INSERT IDZ_Panteleeva.Deliveries (Code_delivery, Name_delivery, Name_company, Address_company, Phone, INN) VALUES (7,  N'dilvery7                                          ', N'ОАО Книготорг                                     ', N'adress7                                           ', CAST(256684 AS Numeric(18, 0)), N'917024242 ')
INSERT IDZ_Panteleeva.Deliveries (Code_delivery, Name_delivery, Name_company, Address_company, Phone, INN) VALUES (8,  N'dilvery8                                          ', N'ЗАО Квантор                                       ', N'adress8                                           ', CAST(256685 AS Numeric(18, 0)), N'7725704102')
INSERT IDZ_Panteleeva.Deliveries (Code_delivery, Name_delivery, Name_company, Address_company, Phone, INN) VALUES (9,  N'dilvery9                                          ', N'company9                                          ', N'adress9                                           ', CAST(256686 AS Numeric(18, 0)), N'16251647  ')
INSERT IDZ_Panteleeva.Deliveries (Code_delivery, Name_delivery, Name_company, Address_company, Phone, INN) VALUES (10, N'dilvery10                                         ', N'ОАО «Полиграфическое объединение «Север»          ', N'adress10                                          ', CAST(256687 AS Numeric(18, 0)), N'6680004508')
INSERT IDZ_Panteleeva.Deliveries (Code_delivery, Name_delivery, Name_company, Address_company, Phone, INN) VALUES (11, N'dilvery11                                         ', N'Комбинат Волгоградский                            ', N'adress11                                          ', CAST(256688 AS Numeric(18, 0)), N'3446015546')
INSERT IDZ_Panteleeva.Deliveries (Code_delivery, Name_delivery, Name_company, Address_company, Phone, INN) VALUES (12, N'dilvery12                                         ', N'Торговый Дом Волжский                             ', N'adress12                                          ', CAST(256689 AS Numeric(18, 0)), N'6313001606')
INSERT IDZ_Panteleeva.Deliveries (Code_delivery, Name_delivery, Name_company, Address_company, Phone, INN) VALUES (13, N'dilvery13                                         ', N'company13                                         ', N'adress13                                          ', CAST(256690 AS Numeric(18, 0)), N'15316511  ')
INSERT IDZ_Panteleeva.Deliveries (Code_delivery, Name_delivery, Name_company, Address_company, Phone, INN) VALUES (14, N'dilvery14                                         ', N'ЗАО Оптторг                                       ', N'adress14                                          ', CAST(256691 AS Numeric(18, 0)), N'6670129307')
INSERT IDZ_Panteleeva.Deliveries (Code_delivery, Name_delivery, Name_company, Address_company, Phone, INN) VALUES (15, N'dilvery15                                         ', N'company15                                         ', N'adress15                                          ', CAST(256692 AS Numeric(18, 0)), N'18175323  ')
GO



INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (1, CAST(N'2018-01-01' AS Date), 0, CAST(174.00 AS Decimal(6, 2)), 7, 9, 21)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (2, CAST(N'2018-01-02' AS Date), 0, CAST(137.00 AS Decimal(6, 2)), 13, 4, 24)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (3, CAST(N'2018-01-03' AS Date), 1, CAST(117.00 AS Decimal(6, 2)), 10, 11, 5)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (4, CAST(N'2003-01-04' AS Date), 1, CAST(164.00 AS Decimal(6, 2)), 2, 8, 12)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (5, CAST(N'2003-03-12' AS Date), 0, CAST(185.00 AS Decimal(6, 2)), 1, 7, 5)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (6, CAST(N'2003-01-13' AS Date), 1, CAST(145.00 AS Decimal(6, 2)), 6, 10, 16)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (7, CAST(N'2018-01-07' AS Date), 0, CAST(120.00 AS Decimal(6, 2)), 19, 8, 19)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (8, CAST(N'2003-05-14' AS Date), 1, CAST(149.00 AS Decimal(6, 2)), 0, 5, 15)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (9, CAST(N'2003-05-15' AS Date), 0, CAST(188.00 AS Decimal(6, 2)), 19, 4, 22)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (10, CAST(N'2003-06-10' AS Date), 1, CAST(169.00 AS Decimal(6, 2)), 19, 4, 11)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (11, CAST(N'2002-01-11' AS Date), 1, CAST(128.00 AS Decimal(6, 2)), 10, 10, 21)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (12, CAST(N'2018-01-12' AS Date), 0, CAST(172.00 AS Decimal(6, 2)), 10, 8, 8)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (13, CAST(N'2018-01-13' AS Date), 0, CAST(187.00 AS Decimal(6, 2)), 1, 5, 3)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (14, CAST(N'2002-01-14' AS Date), 1, CAST(128.00 AS Decimal(6, 2)), 1, 2, 10)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (15, CAST(N'2018-01-15' AS Date), 0, CAST(139.00 AS Decimal(6, 2)), 17, 2, 17)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (16, CAST(N'2018-01-16' AS Date), 0, CAST(176.00 AS Decimal(6, 2)), 1, 11, 10)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (17, CAST(N'2018-01-17' AS Date), 1, CAST(201.00 AS Decimal(6, 2)), 3, 7, 1)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (18, CAST(N'2018-01-18' AS Date), 1, CAST(178.00 AS Decimal(6, 2)), 5, 6, 1)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (19, CAST(N'2018-01-19' AS Date), 0, CAST(132.00 AS Decimal(6, 2)), 18, 11, 24)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (20, CAST(N'2002-03-20' AS Date), 1, CAST(153.00 AS Decimal(6, 2)), 3, 11, 7)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (21, CAST(N'2018-01-21' AS Date), 1, CAST(146.00 AS Decimal(6, 2)), 20, 9, 3)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (22, CAST(N'2002-05-22' AS Date), 0, CAST(118.00 AS Decimal(6, 2)), 12, 1, 2)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (23, CAST(N'2018-01-23' AS Date), 0, CAST(132.00 AS Decimal(6, 2)), 14, 6, 25)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (24, CAST(N'2018-01-24' AS Date), 1, CAST(150.00 AS Decimal(6, 2)), 18, 7, 26)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (25, CAST(N'2018-01-25' AS Date), 0, CAST(150.00 AS Decimal(6, 2)), 6, 12, 20)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (26, CAST(N'2018-01-26' AS Date), 1, CAST(103.00 AS Decimal(6, 2)), 7, 8, 23)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (27, CAST(N'2018-01-27' AS Date), 1, CAST(134.00 AS Decimal(6, 2)), 5, 14, 22)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (28, CAST(N'2018-01-28' AS Date), 0, CAST(186.00 AS Decimal(6, 2)), 22, 4, 28)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (29, CAST(N'2018-01-29' AS Date), 0, CAST(164.00 AS Decimal(6, 2)), 2, 11, 5)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (30, CAST(N'2018-01-30' AS Date), 0, CAST(110.00 AS Decimal(6, 2)), 23, 12, 27)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (31, CAST(N'2018-01-31' AS Date), 0, CAST(110.00 AS Decimal(6, 2)), 12, 13, 19)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (32, CAST(N'2018-02-01' AS Date), 1, CAST(127.00 AS Decimal(6, 2)), 3, 2, 27)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (33, CAST(N'2018-02-02' AS Date), 0, CAST(170.00 AS Decimal(6, 2)), 19, 5, 16)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (34, CAST(N'2018-02-03' AS Date), 1, CAST(148.00 AS Decimal(6, 2)), 22, 5, 12)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (35, CAST(N'2018-02-04' AS Date), 0, CAST(145.00 AS Decimal(6, 2)), 4, 7, 24)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (36, CAST(N'2018-02-05' AS Date), 0, CAST(190.00 AS Decimal(6, 2)), 21, 11, 24)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (37, CAST(N'2018-02-06' AS Date), 1, CAST(122.00 AS Decimal(6, 2)), 1, 11, 4)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (38, CAST(N'2018-02-07' AS Date), 0, CAST(113.00 AS Decimal(6, 2)), 0, 3, 4)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (39, CAST(N'2018-02-08' AS Date), 1, CAST(156.00 AS Decimal(6, 2)), 0, 11, 21)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (40, CAST(N'2018-02-09' AS Date), 0, CAST(186.00 AS Decimal(6, 2)), 3, 14, 14)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (41, CAST(N'2018-02-10' AS Date), 0, CAST(111.00 AS Decimal(6, 2)), 15, 11, 19)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (42, CAST(N'2018-02-11' AS Date), 1, CAST(161.00 AS Decimal(6, 2)), 24, 10, 27)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (43, CAST(N'2018-02-12' AS Date), 1, CAST(137.00 AS Decimal(6, 2)), 16, 1, 5)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (44, CAST(N'2018-02-13' AS Date), 1, CAST(180.00 AS Decimal(6, 2)), 12, 5, 26)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (45, CAST(N'2018-02-14' AS Date), 0, CAST(198.00 AS Decimal(6, 2)), 16, 12, 9)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (46, CAST(N'2018-02-15' AS Date), 1, CAST(163.00 AS Decimal(6, 2)), 21, 7, 7)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (47, CAST(N'2018-02-16' AS Date), 0, CAST(105.00 AS Decimal(6, 2)), 17, 1, 8)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (48, CAST(N'2018-02-17' AS Date), 1, CAST(157.00 AS Decimal(6, 2)), 1, 11, 28)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (49, CAST(N'2018-02-18' AS Date), 0, CAST(192.00 AS Decimal(6, 2)), 9, 10, 22)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (50, CAST(N'2018-02-19' AS Date), 0, CAST(125.00 AS Decimal(6, 2)), 6, 10, 25)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (51, CAST(N'2018-02-20' AS Date), 1, CAST(190.00 AS Decimal(6, 2)), 11, 4, 30)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (52, CAST(N'2018-02-21' AS Date), 0, CAST(178.00 AS Decimal(6, 2)), 16, 1, 5)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (53, CAST(N'2018-02-22' AS Date), 0, CAST(149.00 AS Decimal(6, 2)), 6, 11, 11)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (54, CAST(N'2018-02-23' AS Date), 0, CAST(123.00 AS Decimal(6, 2)), 13, 15, 24)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (55, CAST(N'2018-02-24' AS Date), 1, CAST(140.00 AS Decimal(6, 2)), 5, 4, 13)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (56, CAST(N'2018-02-25' AS Date), 0, CAST(180.00 AS Decimal(6, 2)), 20, 2, 1)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (57, CAST(N'2018-02-26' AS Date), 0, CAST(197.00 AS Decimal(6, 2)), 24, 6, 19)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (58, CAST(N'2018-02-27' AS Date), 0, CAST(160.00 AS Decimal(6, 2)), 22, 13, 10)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (59, CAST(N'2018-02-28' AS Date), 1, CAST(180.00 AS Decimal(6, 2)), 16, 2, 21)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (60, CAST(N'2018-03-01' AS Date), 1, CAST(119.00 AS Decimal(6, 2)), 5, 1, 9)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (61, CAST(N'2018-01-01' AS Date), 1, CAST(51.00 AS Decimal(6, 2)), 5, 3, 31)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (62, CAST(N'2013-02-01' AS Date), 1, CAST(70.00 AS Decimal(6, 2)), 5, 3, 32)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (63, CAST(N'2020-11-21' AS Date), 1, CAST(191.00 AS Decimal(6, 2)), 5, 4, 33)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (64, CAST(N'2020-11-22' AS Date), 1, CAST(185.00 AS Decimal(6, 2)), 6, 4, 34)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (65, CAST(N'2020-11-23' AS Date), 0, CAST(185.00 AS Decimal(6, 2)), 110, 4, 34)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (66, CAST(N'2020-11-24' AS Date), 1, CAST(400.00 AS Decimal(6, 2)), 5, 2, 9)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (67, CAST(N'2018-03-21' AS Date), 0, CAST(69.00 AS Decimal(6, 2)), 20, 1, 32)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (68, CAST(N'2018-02-20' AS Date), 0, CAST(100.00 AS Decimal(6, 2)), 20, 8, 23)
INSERT IDZ_Panteleeva.Purchases (Code_purchase, Date_order, Type_purchase, Cost, Amount, Code_delivery, Code_book) VALUES (69, CAST(N'2018-02-21' AS Date), 0, CAST(150.00 AS Decimal(6, 2)), 20, 9, 21)
GO


SELECT Name_delivery, INN, Phone, Address_company, Code_Delivery FROM IDZ_Panteleeva.Deliveries
GO --1

SELECT Name_company, Phone, INN FROM IDZ_Panteleeva.Deliveries
WHERE Name_company LIKE 'ОАО%'
GO --2

SELECT Name_author FROM IDZ_Panteleeva.Authors
WHERE Birthday BETWEEN '1840-01-01' AND '1860-06-01'
GO --3

SELECT Title_book, Publish
FROM IDZ_Panteleeva.Books INNER JOIN IDZ_Panteleeva.Publishing_house
ON Books.Code_publish = Publishing_house.Code_publish
WHERE Publish IN ('Питер-Софт', 'Наука', 'Альфа')
GO --4

SELECT Code_delivery, Date_order, Title_book
FROM IDZ_Panteleeva.Purchases INNER JOIN IDZ_Panteleeva.Books 
ON Books.Code_book = Purchases.Code_book
WHERE (Amount > '100') OR (Cost BETWEEN '200' AND '500')
GO --5

SELECT DISTINCT Name_company
FROM 
    IDZ_Panteleeva.Books b, 
    IDZ_Panteleeva.Publishing_house ph,
    IDZ_Panteleeva.Purchases p,
    IDZ_Panteleeva.Deliveries d
WHERE b.code_publish=ph.code_publish
AND ph.publish LIKE '%Питер%'
AND b.code_book=p.code_book
AND p.code_delivery=d.code_delivery
GO --6

SELECT SUM(Purchases.Cost * Purchases.Amount) AS VALUE
FROM IDZ_Panteleeva.Deliveries INNER JOIN IDZ_Panteleeva.Purchases 
ON Deliveries.Code_delivery = Purchases.Code_delivery
WHERE Deliveries.Name_company = 'ЗАО Оптторг'
GO --7

SELECT Books.Title_book, Purchases.Cost * Purchases.Amount AS 'ITOGO'
FROM IDZ_Panteleeva.Books INNER JOIN IDZ_Panteleeva.Purchases 
ON Books.code_book = Purchases.Code_book
WHERE Purchases.date_order BETWEEN  '2002-01-01' AND '2002-06-01' 
GO --8

DECLARE @min_amount INT -- объявляем целочисленную переменную 
SET @min_amount = 10    -- присваиваем этой переменной значение 10
SELECT Books.Title_book, Purchases.Amount
FROM IDZ_Panteleeva.Books INNER JOIN IDZ_Panteleeva.Purchases 
ON Books.Code_book = Purchases.Code_book
WHERE Amount < @min_amount  -- выбираем из таблицы только те записи названий книг, 
                            -- количество которых меньше @min_amount 
GO --9

DECLARE Temp2 CURSOR FOR SELECT Name_company FROM IDZ_Panteleeva.Deliveries
GO --10


SELECT DISTINCT Publish FROM IDZ_Panteleeva.Publishing_house
INNER JOIN IDZ_Panteleeva.Books ON Books.Code_publish = Publishing_house.Code_publish
INNER JOIN IDZ_Panteleeva.Purchases ON Purchases.Code_book = Books.Code_book
WHERE Type_purchase = 1
GO --11

UPDATE IDZ_Panteleeva.Purchases SET Cost = Cost * 1.20 WHERE 
MONTH(Date_order) = MONTH(getdate()) AND YEAR(Date_order) = YEAR(getdate())
GO --12

DELETE FROM IDZ_Panteleeva.Authors WHERE Name_author = ''
GO --13

CREATE PROCEDURE IDZ_Panteleeva.reportBook
@title_book varchar(30)
AS
BEGIN
    SELECT  Date_order AS 'Дата' 
            , PH.Publish AS 'Название издательства'
            , Name_delivery AS 'Имя поставщика'
            , P.Cost * P.Amount AS 'Общая стоимость'
    INTO #ReportAboutBook
    FROM [KB301_Panteleeva].IDZ_Panteleeva.Publishing_house AS PH
                INNER JOIN [KB301_Panteleeva].IDZ_Panteleeva.Books AS B
                ON PH.Code_publish = B.Code_publish
                INNER JOIN [KB301_Panteleeva].IDZ_Panteleeva.Purchases AS P
                ON B.Code_book = P.Code_book
                INNER JOIN [KB301_Panteleeva].IDZ_Panteleeva.Deliveries AS D
                ON P.Code_delivery = D.Code_delivery
    WHERE B.Title_book =  @title_book
    GROUP BY Date_order, Amount, Cost, Name_delivery, Publish
    --select * from #ReportAboutBook
    DECLARE @current_month smallint = 1
    DECLARE @current_money int = 0
    DECLARE @all_money int = 0
    WHILE @current_month <= 12
    BEGIN
        SELECT *
        INTO #ReportAboutBookByMonth
        FROM #ReportAboutBook 
        WHERE MONTH([#ReportAboutBook].Дата) = @current_month 
        
        IF (EXISTS(SELECT 1 FROM dbo.#ReportAboutBookByMonth)) --печатаем только те месяца, за которые есть данные
        BEGIN
            SET @current_money = ( 
                                    SELECT SUM([#ReportAboutBookByMonth].[Общая стоимость]) 
                                    FROM #ReportAboutBookByMonth
                                 )
            SET @all_money = @all_money + @current_money
            SELECT * 
            FROM #ReportAboutBookByMonth
            PRINT 'за месяц № ' + CAST(@current_month AS varchar(2)) + ' заработано: ' + CAST(@current_money AS varchar(10))
        END
        DROP TABLE #ReportAboutBookByMonth
        SET @current_month = @current_month + 1
    END
 
    SELECT *
        FROM #ReportAboutBook 
    PRINT 'за год заработано: ' + CAST(@all_money AS varchar(10))
    DROP TABLE #ReportAboutBook
END
GO --15

EXEC IDZ_Panteleeva.reportBook @title_book = 'Мемуары гейши'

DROP PROCEDURE IDZ_Panteleeva.reportBook 


create trigger Books_delete
  on IDZ_Panteleeva.Books
  after delete
  as
  if exists(select Publishing_house.Code_publish from IDZ_Panteleeva.Publishing_house --проверка на существование издательства
    where Publishing_house.Code_publish = (select Code_publish from deleted)) --книгу которого мы удалили
    begin 
      if not exists(select Code_book from IDZ_Panteleeva.Books 
        where Code_publish = (select Code_publish from deleted)) --проверяем есть ли у этого издательства еще книги\
      begin 
        print('Произошло удаление издательства')
        delete from IDZ_Panteleeva.Publishing_house where Code_publish = (select Code_publish from deleted)
      end
    end 
GO --14


INSERT IDZ_Panteleeva.Publishing_house (Code_publish, Publish, City) VALUES (99, N'test1', N'Екатеринбург')
INSERT IDZ_Panteleeva.Books (Code_book, Title_book, Pages, Code_author, Code_publish) VALUES (100, N'testBook', 999, 1, 99)

SELECT * FROM IDZ_Panteleeva.Publishing_house
SELECT * FROM IDZ_Panteleeva.Books
DELETE FROM IDZ_Panteleeva.Books WHERE title_book = 'testBook'