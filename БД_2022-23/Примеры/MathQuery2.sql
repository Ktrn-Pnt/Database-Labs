use math
go
--запрос, показывающий все зафиксированные (связанные абонементом)
-- пары тренеров и студентов, из одного вуза;
select FamStudent as 'Студент',FamTrener as 'Тренер',students.Vuz as 'ВУЗ'
FROM students INNER JOIN
     Abonement ON students.IdStudent = Abonement.IdStudent INNER JOIN
     Trener ON Abonement.IdTrener = Trener.IdTrener
where students.Vuz=Trener.Vuz

--запрос, показывающий всех студентов и их вузы, с суммами по абонементам, 
--отличающимися от суммы “студента с вводимой фамилией ” не более, 
--чем на “заданное число рублей”;
select FamStudent as 'Студент',students.Vuz as 'ВУЗ',
       (Abonement.KolZan*VidSporta.Stoimost) as 'Сумма абонемента'
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
      where FamStudent='Борисов'))<=100

--запрос, показывающий первых 3 тренеров из всех 
--(код, фамилию, суммы по абонементам в порядке убывания)
select top 3 FamTrener as 'Тренер' ,
      sum(Abonement.KolZan*VidSporta.Stoimost) as 'Сумма по абонементам'
from  Abonement INNER JOIN Trener ON Abonement.IdTrener =Trener.IdTrener 
                INNER JOIN VidSporta ON Trener.IdSport = VidSporta.IdSport
group by FamTrener
order by sum(Abonement.KolZan*VidSporta.Stoimost)DESC

-- запрос, показывающий все пары тренеров из одного вуза,
-- пары самого с собой и повторы исключить

select rtrim(a.FamTrener)+'-'+rtrim(b.FamTrener) as 'пары тренеров',a.Vuz as 'ВУЗ'
from Trener a,Trener b
where a.Vuz=b.Vuz  and a.IdTrener<b.IdTrener
order by a.Vuz,a.FamTrener

--запрос, показывающий всех тренеров и их данные
-- с суммой абонемента, большей, чем средняя сумма за выбранный месяц
select  FamTrener as 'Тренер',
        Trener.Vuz as 'ВУЗ',
        VidSporta.NameSport as 'Вид спорта',
        Abonement.KolZan*VidSporta.Stoimost as 'Сумма абонемента'  
from  Abonement INNER JOIN Trener ON Abonement.IdTrener =Trener.IdTrener 
                INNER JOIN VidSporta ON Trener.IdSport = VidSporta.IdSport
where Abonement.KolZan*VidSporta.Stoimost>(
      select  avg(Abonement.KolZan*VidSporta.Stoimost) 
      from  Abonement INNER JOIN Trener ON Abonement.IdTrener =Trener.IdTrener 
                INNER JOIN VidSporta ON Trener.IdSport = VidSporta.IdSport
      where month(Abonement.DateAbon)=10
)

--запрос, показывающий всех студентов и их данные,
-- а также вид спорта и  отклонения сумм от средней суммы по виду
select VidSporta.IdSport as b, 
avg(Abonement.KolZan*VidSporta.Stoimost) as a
       into #AvgSport 
       from Abonement
           INNER JOIN  Trener ON Abonement.IdTrener =Trener.IdTrener 
           INNER JOIN VidSporta ON Trener.IdSport = VidSporta.IdSport
       group by VidSporta.IdSport

select FamStudent as 'Студент',
       students.Vuz as 'ВУЗ',
       VidSporta.NameSport as 'Вид спорта', 
       (Abonement.KolZan*VidSporta.Stoimost) as 'Сумма абонемента',
       #AvgSport.a as 'Среднее значение',
       (Abonement.KolZan*VidSporta.Stoimost)-#AvgSport.a as 'отклонение от среднего'
from students, Abonement,Trener,VidSporta,#AvgSport
where students.IdStudent = Abonement.IdStudent and
      Abonement.IdTrener =Trener.IdTrener and
      Trener.IdSport = VidSporta.IdSport and
      VidSporta.IdSport = #AvgSport.b
----------------------------------------------------------------------------------------------

select FamStudent as 'Студент',
       students.Vuz as 'ВУЗ',
       VidSporta.NameSport as 'Вид спорта', 
       (Abonement.KolZan*VidSporta.Stoimost) as 'Сумма абонемента',
       (Abonement.KolZan*VidSporta.Stoimost)-(select  avg(Abonement.KolZan*VidSporta.Stoimost) as a
       from Abonement
           INNER JOIN  Trener ON Abonement.IdTrener =Trener.IdTrener 
           INNER JOIN VidSporta ON Trener.IdSport = VidSporta.IdSport
       group by VidSporta.IdSport)
from students, Abonement,Trener,VidSporta
where students.IdStudent = Abonement.IdStudent and
      Abonement.IdTrener =Trener.IdTrener and
      Trener.IdSport = VidSporta.IdSport 
 
