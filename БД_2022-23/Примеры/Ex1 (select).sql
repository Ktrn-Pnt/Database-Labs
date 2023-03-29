USE AA_db_demo
GO
-- Простейшие запросы 
-- работа с одной таблицей
--------------------------
-- Получение всех записей таблицы
SELECT * 
FROM ut_students
-----------------------------
-- Выбор конкретных полей
SELECT Family, Name, NameGroup 
FROM ut_students
--------------------------
-- Применяем условие выбора
SELECT Family, Name, NameGroup 
FROM ut_students
WHERE NameGroup = 'КН-302'
--------------------------
-- Упорядочиваем по алфавиту
SELECT Family, Name, NameGroup 
FROM ut_students
WHERE NameGroup = 'КН-302'
ORDER BY Family
---------------------------
-- Выбираем все записи (по умолчанию)
SELECT  NameGroup 
FROM ut_students
---------------------------
-- Выбираем различные записи 
SELECT DISTINCT  NameGroup 
FROM ut_students

---------------------------
-- Ограничиваем число записей
SELECT TOP 10 Family, Name, NameGroup 
FROM ut_students
WHERE NameGroup = 'КН-302'
ORDER BY Family
---------------------------
-- Ограничиваем объем записей
SELECT TOP 10 PERCENT Family, Name, NameGroup 
FROM ut_students
WHERE NameGroup = 'КН-302'
ORDER BY Family

---------------------------
-- Вводим псевдонимы полей
SELECT TOP 10 Family AS 'Фамилия'
            , Name AS 'Имя'
			, NameGroup AS 'Группа' 
FROM ut_students
WHERE NameGroup = 'КН-301'
ORDER BY [Фамилия] 

SELECT TOP 10 Family AS 'Фамилия'
             , Name AS 'Имя'
             , NameGroup AS 'Группа' 
FROM ut_students
WHERE NameGroup = 'КН-301'
ORDER BY Фамилия
---------------------------
-- Отправляем результат запроса
-- во временные таблицы
SELECT TOP 10 Family AS 'Фамилия'
              , Name AS 'Имя'
              , NameGroup AS 'Группа' 
INTO #T_Table
FROM ut_students
WHERE NameGroup = 'КБ-301'
ORDER BY [Фамилия] DESC
GO
SELECT * 
FROM #T_Table
GO
--DROP TABLE #T_Table


SELECT TOP 10 Family AS 'Фамилия'
            , Name AS 'Имя'
            , NameGroup AS 'Группа' 
INTO ##T_Table
FROM ut_students
WHERE NameGroup = 'КБ-301'
ORDER BY [Фамилия] DESC
GO
SELECT * 
FROM ##T_Table
GO
--DROP TABLE ##T_Table

-- Отправляем результат запроса
-- в новую таблицу и меняем 
-- порядок сортировки
USE AA_db_demo
GO

SELECT TOP 10 Family AS 'Фамилия'
            , Name AS 'Имя'
            , NameGroup AS 'Группа' 
INTO New_Table
FROM ut_students
WHERE NameGroup = 'КБ-301'
ORDER BY [Фамилия] DESC
GO
SELECT * 
FROM New_Table
GO
--DROP TABLE New_Table
--------------------------
-- Простейшие запросы из
-- нескольких источников данных
USE AA_db_demo
GO
--Создать диаграмму

SELECT TOP 17 ut_students.Family AS Фамилия 
           ,ut_students.Name AS Имя 
           ,ut_students.NameGroup AS Группа 
           ,ut_subject.SubjectName AS Предмет
           ,ut_zach.name AS Оценка
FROM       ut_results INNER JOIN
                      ut_subject ON ut_results.nmenu = ut_subject.Kod INNER JOIN
                      ut_zach ON ut_results.report = ut_zach.cod INNER JOIN
                      ut_students ON ut_results.number = ut_students.NumberZach
WHERE     (ut_results.semester = 1) AND (ut_results.kod = 1)
ORDER BY NumberZach

SELECT     ut_students.Family AS Фамилия 
           ,ut_students.Name AS Имя 
           ,ut_students.NameGroup AS Группа 
           ,ut_subject.SubjectName AS Предмет
           ,ut_zach.name AS Оценка
FROM       ut_results INNER JOIN
                      ut_subject ON ut_results.nmenu = ut_subject.Kod INNER JOIN
                      ut_zach ON ut_results.report = ut_zach.cod  LEFT OUTER JOIN
                      ut_students ON ut_results.number = ut_students.NumberZach
WHERE     (ut_results.semester = 1) AND (ut_results.kod = 1)
ORDER BY NumberZach

--delete from ut_students where NumberZach=55100521
--delete from ut_results where number=55100523

SELECT     ut_students.Family AS Фамилия 
           ,ut_students.Name AS Имя 
           ,ut_students.NameGroup AS Группа 
           ,ut_subject.SubjectName AS Предмет
           ,ut_zach.name AS Оценка
FROM       ut_results INNER JOIN
                      ut_subject ON ut_results.nmenu = ut_subject.Kod INNER JOIN
                      ut_zach ON ut_results.report = ut_zach.cod  FULL OUTER JOIN
                      ut_students ON ut_results.number = ut_students.NumberZach
WHERE     (ut_results.semester = 1) AND (ut_results.kod = 1)
ORDER BY NumberZach
-----------------------------------------
-- Псевдонимы (синонимы) таблиц в запросе

SELECT TOP 10 a.Family AS Фамилия 
           ,a.Name AS Имя 
           ,a.NameGroup AS Группа 
           ,b.SubjectName AS Предмет
           ,c.name AS Оценка
FROM       ut_results d INNER JOIN 
                      ut_subject b ON d.nmenu = b.Kod INNER JOIN
                      ut_zach c ON d.report = c.cod INNER JOIN
                      ut_students a ON d.number = a.NumberZach
WHERE     (d.semester = 1) AND (d.kod = 1)
ORDER BY  Группа, Фамилия
 
 -----------------------------------------
-- Оценим варианты запроса

SELECT TOP 10  a.Family AS Фамилия 
           ,a.Name AS Имя 
           ,a.NameGroup AS Группа 
           ,b.SubjectName AS Предмет
           ,c.name AS Оценка
FROM       ut_students a
           ,ut_subject b
		   ,ut_zach c
           ,ut_results d 
WHERE     (d.nmenu = b.Kod) AND (d.report = c.cod) AND (d.number = a.NumberZach)
          AND(d.semester = 1) AND (d.kod = 1)
ORDER BY  Группа, Фамилия


USE AA_db_demo
GO
 -----------------------------------------
-- Применение инструкции LIKE

SELECT   Family AS Фамилия, 
         Name AS Имя, 
         NameGroup AS Группа,
         NumberZach AS Номер 
FROM     ut_students
WHERE    (Name LIKE  'Александр')
ORDER BY NameGroup,Family

 SELECT   Family AS Фамилия, 
         Name AS Имя, 
         NameGroup AS Группа,
         NumberZach AS Номер 
FROM     ut_students
WHERE    (Name LIKE  '%ал%')
ORDER BY NameGroup,Family      
  
 SELECT   Family AS Фамилия, 
         Name AS Имя, 
         NameGroup AS Группа,
         NumberZach AS Номер 
FROM     ut_students
WHERE    (Name LIKE  '%_ал%')
ORDER BY NameGroup,Family 

SELECT   Family AS Фамилия, 
         Name AS Имя, 
         NameGroup AS Группа,
         NumberZach AS Номер 
FROM     ut_students
WHERE    (Name LIKE  '%[б_л]%')
ORDER BY NameGroup,Family           
------------------------------
-- Применение оператора BETWEEN

SELECT Family, Name, NameGroup 
FROM ut_students
WHERE Name between  'а' and  'д'

SELECT Family, Name, NameGroup,DATENAME(DAY,ut_students.Birthday)
         +' '+DATENAME(MONTH,ut_students.Birthday)
         +' '+DATENAME(YY,ut_students.Birthday)
          AS [День рождения] 
FROM ut_students
WHERE Birthday between  '19961001' and '19961030'
ORDER BY ut_students.Birthday

------------------------------
-- Применение агрегирующих функций и группировки

SELECT   NameGroup AS Группа,MAX(NumberZach) AS 'Максимальный номер зачетной книжки' 
FROM ut_students
GROUP BY NameGroup

SELECT   NameGroup AS Группа 
FROM ut_students
GROUP BY NameGroup

SELECT   NameGroup AS Группа,Family 
FROM ut_students
GROUP BY NameGroup 

SELECT   NameGroup AS Группа,Family 
FROM ut_students
GROUP BY NameGroup,Family 


SELECT   NameGroup AS Группа,COUNT(NameGroup) AS 'Количество студентов в группе' 
,MAX(NumberZach) AS 'Максимальный номер зачетной книжки' 
FROM ut_students
GROUP BY NameGroup
WITH CUBE

SELECT   NameGroup AS Группа,COUNT(NameGroup) AS 'Количество студентов в группе' 
,MAX(NumberZach) AS 'Максимальный номер зачетной книжки' 
,GROUPING (NameGroup) as Итог
FROM ut_students
GROUP BY NameGroup
WITH CUBE



SELECT  avg(NumberZach) AS 'Средний номер зачетной книжки' 
FROM ut_students


--ALTER TABLE AFirstBase.dekanat.ut_students 
--ALTER COLUMN NumberZach bigint  NOT NULL
--GO

--ALTER TABLE ut_students 
--ALTER COLUMN NumberZach bigint  NOT NULL
--GO

--ALTER TABLE ut_students 
--ALTER COLUMN NumberZach int  NOT NULL
--GO

------------------------------
-- Простейшие примеры вложенных запросов
SELECT   Family AS Фамилия, 
         Name AS Имя, 
         NameGroup AS Группа,
         NumberZach AS Номер 
FROM     ut_students
WHERE    NumberZach>=( SELECT  max(NumberZach)
                     FROM ut_students)
ORDER BY NameGroup,Family


SELECT   Family AS Фамилия 
         ,Name AS Имя 
         ,NameGroup AS Группа
         ,NumberZach AS Номер 
FROM     ut_students
WHERE    NumberZach>( SELECT  max(NumberZach)as a
                     FROM ut_students
                     GROUP BY NameGroup
                     ORDER BY a )
ORDER BY NameGroup,Family

SELECT   Family AS Фамилия, 
         Name AS Имя, 
         NameGroup AS Группа,
         NumberZach AS Номер 
FROM     ut_students
WHERE    NumberZach>( SELECT top 2 max(NumberZach)as a
                     FROM ut_students
                     GROUP BY NameGroup
                     ORDER BY a )
ORDER BY NameGroup,Family

