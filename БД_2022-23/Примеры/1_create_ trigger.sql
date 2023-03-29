USE AA_db_demo
GO
	  --SELECT * 
   --   FROM dbo.ut_students
	  --ORDER BY  NumberZach

 
IF OBJECT_ID ('dbo.utr_del_results','TR') IS NOT NULL
   DROP TRIGGER dbo.utr_del_results 
GO

CREATE TRIGGER dbo.utr_del_results 
   ON  dbo.ut_results 
  FOR DELETE
-- INSTEAD OF DELETE
AS 
 SELECT NumberZach, family as 'students + deleted'
 FROM ut_students,deleted
 WHERE ut_students.NumberZach=deleted.number
IF NOT EXISTS
-- ��������� ���������� ������� ���� �.�.
--������ ������� ��� ��� �������� ��� ��������
(
 SELECT *
 FROM ut_students,deleted
 WHERE ut_students.NumberZach=deleted.number
 )
 BEGIN
      PRINT '������ ����� �������'
      SELECT *, report as '������� deleted'  
      FROM deleted
	  -- ������� ��������������� �������
	  SELECT *,report as '�������  results  ����� ��������'  
      FROM dbo.ut_results 
	  WHERE number = 100709 and semester = 1 AND kod = 1
	  -- �������  �������, �� ������� �������� �������
	  --DELETE FROM ut_results
   --   WHERE ut_results.number=100709
 END
 ELSE
  BEGIN
     PRINT '������ ������� ������'
	  SELECT  *, report as '������� deleted' 
      FROM deleted
	  -- ������� ��������������� �������
	  SELECT  Number, report as '�������  results  �� ������'
      FROM dbo.ut_results 
	  WHERE number = 100709 and semester = 1 AND kod = 1
	  -- �������  �������, �� ������� �������� �������
     ROLLBACK
 	  SELECT *,report as '�������  results  ����� ������' 
      FROM dbo.ut_results 
	  WHERE number = 100709 and semester = 1 AND kod = 1
	  -- �������  �������, �� ������� �������� ������� ����� ������
  END
GO
