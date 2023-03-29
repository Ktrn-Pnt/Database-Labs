USE AA_db_demo
GO
-- ���������� ������� 
-- ������ � ����� ��������
--------------------------
-- ��������� ���� ������� �������
SELECT * 
FROM ut_students
-----------------------------
-- ����� ���������� �����
SELECT Family, Name, NameGroup 
FROM ut_students
--------------------------
-- ��������� ������� ������
SELECT Family, Name, NameGroup 
FROM ut_students
WHERE NameGroup = '��-302'
--------------------------
-- ������������� �� ��������
SELECT Family, Name, NameGroup 
FROM ut_students
WHERE NameGroup = '��-302'
ORDER BY Family
---------------------------
-- �������� ��� ������ (�� ���������)
SELECT  NameGroup 
FROM ut_students
---------------------------
-- �������� ��������� ������ 
SELECT DISTINCT  NameGroup 
FROM ut_students

---------------------------
-- ������������ ����� �������
SELECT TOP 10 Family, Name, NameGroup 
FROM ut_students
WHERE NameGroup = '��-302'
ORDER BY Family
---------------------------
-- ������������ ����� �������
SELECT TOP 10 PERCENT Family, Name, NameGroup 
FROM ut_students
WHERE NameGroup = '��-302'
ORDER BY Family

---------------------------
-- ������ ���������� �����
SELECT TOP 10 Family AS '�������'
            , Name AS '���'
			, NameGroup AS '������' 
FROM ut_students
WHERE NameGroup = '��-301'
ORDER BY [�������] 

SELECT TOP 10 Family AS '�������'
             , Name AS '���'
             , NameGroup AS '������' 
FROM ut_students
WHERE NameGroup = '��-301'
ORDER BY �������
---------------------------
-- ���������� ��������� �������
-- �� ��������� �������
SELECT TOP 10 Family AS '�������'
              , Name AS '���'
              , NameGroup AS '������' 
INTO #T_Table
FROM ut_students
WHERE NameGroup = '��-301'
ORDER BY [�������] DESC
GO
SELECT * 
FROM #T_Table
GO
--DROP TABLE #T_Table


SELECT TOP 10 Family AS '�������'
            , Name AS '���'
            , NameGroup AS '������' 
INTO ##T_Table
FROM ut_students
WHERE NameGroup = '��-301'
ORDER BY [�������] DESC
GO
SELECT * 
FROM ##T_Table
GO
--DROP TABLE ##T_Table

-- ���������� ��������� �������
-- � ����� ������� � ������ 
-- ������� ����������
USE AA_db_demo
GO

SELECT TOP 10 Family AS '�������'
            , Name AS '���'
            , NameGroup AS '������' 
INTO New_Table
FROM ut_students
WHERE NameGroup = '��-301'
ORDER BY [�������] DESC
GO
SELECT * 
FROM New_Table
GO
--DROP TABLE New_Table
--------------------------
-- ���������� ������� ��
-- ���������� ���������� ������
USE AA_db_demo
GO
--������� ���������

SELECT TOP 17 ut_students.Family AS ������� 
           ,ut_students.Name AS ��� 
           ,ut_students.NameGroup AS ������ 
           ,ut_subject.SubjectName AS �������
           ,ut_zach.name AS ������
FROM       ut_results INNER JOIN
                      ut_subject ON ut_results.nmenu = ut_subject.Kod INNER JOIN
                      ut_zach ON ut_results.report = ut_zach.cod INNER JOIN
                      ut_students ON ut_results.number = ut_students.NumberZach
WHERE     (ut_results.semester = 1) AND (ut_results.kod = 1)
ORDER BY NumberZach

SELECT     ut_students.Family AS ������� 
           ,ut_students.Name AS ��� 
           ,ut_students.NameGroup AS ������ 
           ,ut_subject.SubjectName AS �������
           ,ut_zach.name AS ������
FROM       ut_results INNER JOIN
                      ut_subject ON ut_results.nmenu = ut_subject.Kod INNER JOIN
                      ut_zach ON ut_results.report = ut_zach.cod  LEFT OUTER JOIN
                      ut_students ON ut_results.number = ut_students.NumberZach
WHERE     (ut_results.semester = 1) AND (ut_results.kod = 1)
ORDER BY NumberZach

--delete from ut_students where NumberZach=55100521
--delete from ut_results where number=55100523

SELECT     ut_students.Family AS ������� 
           ,ut_students.Name AS ��� 
           ,ut_students.NameGroup AS ������ 
           ,ut_subject.SubjectName AS �������
           ,ut_zach.name AS ������
FROM       ut_results INNER JOIN
                      ut_subject ON ut_results.nmenu = ut_subject.Kod INNER JOIN
                      ut_zach ON ut_results.report = ut_zach.cod  FULL OUTER JOIN
                      ut_students ON ut_results.number = ut_students.NumberZach
WHERE     (ut_results.semester = 1) AND (ut_results.kod = 1)
ORDER BY NumberZach
-----------------------------------------
-- ���������� (��������) ������ � �������

SELECT TOP 10 a.Family AS ������� 
           ,a.Name AS ��� 
           ,a.NameGroup AS ������ 
           ,b.SubjectName AS �������
           ,c.name AS ������
FROM       ut_results d INNER JOIN 
                      ut_subject b ON d.nmenu = b.Kod INNER JOIN
                      ut_zach c ON d.report = c.cod INNER JOIN
                      ut_students a ON d.number = a.NumberZach
WHERE     (d.semester = 1) AND (d.kod = 1)
ORDER BY  ������, �������
 
 -----------------------------------------
-- ������ �������� �������

SELECT TOP 10  a.Family AS ������� 
           ,a.Name AS ��� 
           ,a.NameGroup AS ������ 
           ,b.SubjectName AS �������
           ,c.name AS ������
FROM       ut_students a
           ,ut_subject b
		   ,ut_zach c
           ,ut_results d 
WHERE     (d.nmenu = b.Kod) AND (d.report = c.cod) AND (d.number = a.NumberZach)
          AND(d.semester = 1) AND (d.kod = 1)
ORDER BY  ������, �������


USE AA_db_demo
GO
 -----------------------------------------
-- ���������� ���������� LIKE

SELECT   Family AS �������, 
         Name AS ���, 
         NameGroup AS ������,
         NumberZach AS ����� 
FROM     ut_students
WHERE    (Name LIKE  '���������')
ORDER BY NameGroup,Family

 SELECT   Family AS �������, 
         Name AS ���, 
         NameGroup AS ������,
         NumberZach AS ����� 
FROM     ut_students
WHERE    (Name LIKE  '%��%')
ORDER BY NameGroup,Family      
  
 SELECT   Family AS �������, 
         Name AS ���, 
         NameGroup AS ������,
         NumberZach AS ����� 
FROM     ut_students
WHERE    (Name LIKE  '%_��%')
ORDER BY NameGroup,Family 

SELECT   Family AS �������, 
         Name AS ���, 
         NameGroup AS ������,
         NumberZach AS ����� 
FROM     ut_students
WHERE    (Name LIKE  '%[�_�]%')
ORDER BY NameGroup,Family           
------------------------------
-- ���������� ��������� BETWEEN

SELECT Family, Name, NameGroup 
FROM ut_students
WHERE Name between  '�' and  '�'

SELECT Family, Name, NameGroup,DATENAME(DAY,ut_students.Birthday)
         +' '+DATENAME(MONTH,ut_students.Birthday)
         +' '+DATENAME(YY,ut_students.Birthday)
          AS [���� ��������] 
FROM ut_students
WHERE Birthday between  '19961001' and '19961030'
ORDER BY ut_students.Birthday

------------------------------
-- ���������� ������������ ������� � �����������

SELECT   NameGroup AS ������,MAX(NumberZach) AS '������������ ����� �������� ������' 
FROM ut_students
GROUP BY NameGroup

SELECT   NameGroup AS ������ 
FROM ut_students
GROUP BY NameGroup

SELECT   NameGroup AS ������,Family 
FROM ut_students
GROUP BY NameGroup 

SELECT   NameGroup AS ������,Family 
FROM ut_students
GROUP BY NameGroup,Family 


SELECT   NameGroup AS ������,COUNT(NameGroup) AS '���������� ��������� � ������' 
,MAX(NumberZach) AS '������������ ����� �������� ������' 
FROM ut_students
GROUP BY NameGroup
WITH CUBE

SELECT   NameGroup AS ������,COUNT(NameGroup) AS '���������� ��������� � ������' 
,MAX(NumberZach) AS '������������ ����� �������� ������' 
,GROUPING (NameGroup) as ����
FROM ut_students
GROUP BY NameGroup
WITH CUBE



SELECT  avg(NumberZach) AS '������� ����� �������� ������' 
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
-- ���������� ������� ��������� ��������
SELECT   Family AS �������, 
         Name AS ���, 
         NameGroup AS ������,
         NumberZach AS ����� 
FROM     ut_students
WHERE    NumberZach>=( SELECT  max(NumberZach)
                     FROM ut_students)
ORDER BY NameGroup,Family


SELECT   Family AS ������� 
         ,Name AS ��� 
         ,NameGroup AS ������
         ,NumberZach AS ����� 
FROM     ut_students
WHERE    NumberZach>( SELECT  max(NumberZach)as a
                     FROM ut_students
                     GROUP BY NameGroup
                     ORDER BY a )
ORDER BY NameGroup,Family

SELECT   Family AS �������, 
         Name AS ���, 
         NameGroup AS ������,
         NumberZach AS ����� 
FROM     ut_students
WHERE    NumberZach>( SELECT top 2 max(NumberZach)as a
                     FROM ut_students
                     GROUP BY NameGroup
                     ORDER BY a )
ORDER BY NameGroup,Family

