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
-- результат следующего запроса пуст т.е.
--строки вис€щие или нет объектов дл€ удалени€
(
 SELECT *
 FROM ut_students,deleted
 WHERE ut_students.NumberZach=deleted.number
 )
 BEGIN
      PRINT '«апись можно удалить'
      SELECT *, report as 'таблица deleted'  
      FROM deleted
	  -- смотрим вспомогательную таблицу
	  SELECT *,report as 'таблица  results  после удалени€'  
      FROM dbo.ut_results 
	  WHERE number = 100709 and semester = 1 AND kod = 1
	  -- смотрим  таблицу, на которую навесили триггер
	  --DELETE FROM ut_results
   --   WHERE ut_results.number=100709
 END
 ELSE
  BEGIN
     PRINT '«апись удалить нельз€'
	  SELECT  *, report as 'таблица deleted' 
      FROM deleted
	  -- смотрим вспомогательную таблицу
	  SELECT  Number, report as 'таблица  results  до отката'
      FROM dbo.ut_results 
	  WHERE number = 100709 and semester = 1 AND kod = 1
	  -- смотрим  таблицу, на которую навесили триггер
     ROLLBACK
 	  SELECT *,report as 'таблица  results  после отката' 
      FROM dbo.ut_results 
	  WHERE number = 100709 and semester = 1 AND kod = 1
	  -- смотрим  таблицу, на которую навесили триггер после отката
  END
GO
