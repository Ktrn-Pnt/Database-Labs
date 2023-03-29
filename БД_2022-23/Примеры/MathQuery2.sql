use math
go
--������, ������������ ��� ��������������� (��������� �����������)
-- ���� �������� � ���������, �� ������ ����;
select FamStudent as '�������',FamTrener as '������',students.Vuz as '���'
FROM students INNER JOIN
     Abonement ON students.IdStudent = Abonement.IdStudent INNER JOIN
     Trener ON Abonement.IdTrener = Trener.IdTrener
where students.Vuz=Trener.Vuz

--������, ������������ ���� ��������� � �� ����, � ������� �� �����������, 
--������������� �� ����� ��������� � �������� �������� � �� �����, 
--��� �� ��������� ����� ������;
select FamStudent as '�������',students.Vuz as '���',
       (Abonement.KolZan*VidSporta.Stoimost) as '����� ����������'
from  students INNER JOIN
     Abonement ON students.IdStudent = Abonement.IdStudent INNER JOIN 
     Trener ON Abonement.IdTrener =Trener.IdTrener 
     INNER JOIN VidSporta ON Trener.IdSport = VidSporta.IdSport
where abs(Abonement.KolZan*VidSporta.Stoimost-
      (select  Abonement.KolZan*VidSporta.Stoimost
      from  students INNER JOIN
           Abonement ON students.IdStudent = Abonement.IdStudent
           INNER JOIN  Trener ON Abonement.IdTrener =Trener.IdTrener 
           INNER JOIN VidSporta ON Trener.IdSport = VidSporta.IdSport
      where FamStudent='�������'))<=100

--������, ������������ ������ 3 �������� �� ���� 
--(���, �������, ����� �� ����������� � ������� ��������)
select top 3 FamTrener as '������' ,
      sum(Abonement.KolZan*VidSporta.Stoimost) as '����� �� �����������'
from  Abonement INNER JOIN Trener ON Abonement.IdTrener =Trener.IdTrener 
                INNER JOIN VidSporta ON Trener.IdSport = VidSporta.IdSport
group by FamTrener
order by sum(Abonement.KolZan*VidSporta.Stoimost)DESC

-- ������, ������������ ��� ���� �������� �� ������ ����,
-- ���� ������ � ����� � ������� ���������

select rtrim(a.FamTrener)+'-'+rtrim(b.FamTrener) as '���� ��������',a.Vuz as '���'
from Trener a,Trener b
where a.Vuz=b.Vuz  and a.IdTrener<b.IdTrener
order by a.Vuz,a.FamTrener

--������, ������������ ���� �������� � �� ������
-- � ������ ����������, �������, ��� ������� ����� �� ��������� �����
select  FamTrener as '������',
        Trener.Vuz as '���',
        VidSporta.NameSport as '��� ������',
        Abonement.KolZan*VidSporta.Stoimost as '����� ����������'  
from  Abonement INNER JOIN Trener ON Abonement.IdTrener =Trener.IdTrener 
                INNER JOIN VidSporta ON Trener.IdSport = VidSporta.IdSport
where Abonement.KolZan*VidSporta.Stoimost>(
      select  avg(Abonement.KolZan*VidSporta.Stoimost) 
      from  Abonement INNER JOIN Trener ON Abonement.IdTrener =Trener.IdTrener 
                INNER JOIN VidSporta ON Trener.IdSport = VidSporta.IdSport
      where month(Abonement.DateAbon)=10
)

--������, ������������ ���� ��������� � �� ������,
-- � ����� ��� ������ �  ���������� ���� �� ������� ����� �� ����
select VidSporta.IdSport as b, 
avg(Abonement.KolZan*VidSporta.Stoimost) as a
       into #AvgSport 
       from Abonement
           INNER JOIN  Trener ON Abonement.IdTrener =Trener.IdTrener 
           INNER JOIN VidSporta ON Trener.IdSport = VidSporta.IdSport
       group by VidSporta.IdSport

select FamStudent as '�������',
       students.Vuz as '���',
       VidSporta.NameSport as '��� ������', 
       (Abonement.KolZan*VidSporta.Stoimost) as '����� ����������',
       #AvgSport.a as '������� ��������',
       (Abonement.KolZan*VidSporta.Stoimost)-#AvgSport.a as '���������� �� ��������'
from students, Abonement,Trener,VidSporta,#AvgSport
where students.IdStudent = Abonement.IdStudent and
      Abonement.IdTrener =Trener.IdTrener and
      Trener.IdSport = VidSporta.IdSport and
      VidSporta.IdSport = #AvgSport.b
----------------------------------------------------------------------------------------------

select FamStudent as '�������',
       students.Vuz as '���',
       VidSporta.NameSport as '��� ������', 
       (Abonement.KolZan*VidSporta.Stoimost) as '����� ����������',
       (Abonement.KolZan*VidSporta.Stoimost)-(select  avg(Abonement.KolZan*VidSporta.Stoimost) as a
       from Abonement
           INNER JOIN  Trener ON Abonement.IdTrener =Trener.IdTrener 
           INNER JOIN VidSporta ON Trener.IdSport = VidSporta.IdSport
       group by VidSporta.IdSport)
from students, Abonement,Trener,VidSporta
where students.IdStudent = Abonement.IdStudent and
      Abonement.IdTrener =Trener.IdTrener and
      Trener.IdSport = VidSporta.IdSport 
 
