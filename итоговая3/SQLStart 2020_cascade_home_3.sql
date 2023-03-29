CREATE DATABASE [KB301_Panteleeva]
GO

USE [KB301_Panteleeva]
GO

CREATE SCHEMA Task3 
GO

CREATE TABLE [KB301_Panteleeva].Task3.region_number
(
	PK_region_id varchar(3) not null,
	another_region_number varchar(3),
	another_region_number2 varchar(3)
	CONSTRAINT PK_T_ID PRIMARY KEY (PK_region_id)
)
GO

CREATE TABLE [KB301_Panteleeva].Task3.region
( 
	PK_region varchar(32) not null,
	region_id varchar(3) not null,
	CONSTRAINT PK_R_NAME PRIMARY KEY (PK_region),
	CONSTRAINT FG_R_ID FOREIGN KEY (region_id) references [KB301_Panteleeva].Task3.region_number (PK_region_id)
	
)
GO

CREATE TABLE [KB301_Panteleeva].Task3.post
(
	post_id tinyint primary key not null,
	region_name varchar(32) not null,
	constraint FG_R_NAME foreign key (region_name) references [KB301_Panteleeva].Task3.region (PK_region)
)
GO

CREATE TABLE [KB301_Panteleeva].Task3.detected
(
	record_id tinyint IDENTITY(1,1) not null,
	first_letters varchar(1) not null,
	first_number varchar(3) not null,
	last_letters varchar(2) not null,
	last_number varchar(3) not null,
	car_in varchar(10) not null,
	post_id tinyint foreign key references [KB301_Panteleeva].Task3.post(post_id),
	time_detected time not null,
	check (upper(first_letters) like N'%[АВЕКМНОРСТУХАDdABEKMHOPCTYXA]%'),
	check (first_number like N'%[0-9]%' and first_number not like N'%[0][0][0]%'),
	check (upper(last_letters) like N'%[АВЕКМНОРСТУХАDdABEKMHOPCTYXA]%'),
	check (((LEN(last_number) = 2) or (len(last_number) = 3 and SUBSTRING(last_number, 1, 1) like N'%[1, 2, 7]%')) and last_number like N'%[0-9]%')
)
GO

create trigger i_detected on [KB301_Panteleeva].Task3.detected
for insert, update
as 
	declare @first_letters varchar(1)
	select @first_letters = first_letters from inserted 
	declare @first_number varchar(3)
	select @first_number = first_number from inserted
	declare @last_letters varchar(2)
	select @last_letters = last_letters from inserted
	declare @last_number varchar(3)
	select @last_number = last_number from inserted
	if (not exists(select * from [KB301_Panteleeva].Task3.region_number as r_n
	where r_n.PK_region_id = @last_number or r_n.another_region_number = @last_number 
	or r_n.another_region_number2 = @last_number))
	begin
		print 'Такого региона не существует'
		rollback transaction
	end
go

create procedure Car_detected
(
	@car_number varchar(9),
	@car_in varchar(10),
	@time time,
	@post_number tinyint
)
as
begin
	declare @first_letters varchar(1)
	set @first_letters = SUBSTRING(@car_number, 1, 1)
	declare @first_number varchar(3)
	set @first_number = SUBSTRING(@car_number, 2, 3)
	declare @last_letters varchar(2)
	set @last_letters = SUBSTRING(@car_number, 5, 2)
	declare @last_number varchar(3)
	set @last_number = SUBSTRING(@car_number, 7, 3)
	declare @max_record_id tinyint
	select @max_record_id = max(record_id) from [KB301_Panteleeva].Task3.detected as detect
	where detect.first_letters = @first_letters
	and detect.first_number  = @first_number
	and detect.last_letters = @last_letters
	and detect.last_number = @last_number

	if(exists(select * from [KB301_Panteleeva].Task3.detected as detect 
	where detect.first_letters = @first_letters
	and detect.first_number  = @first_number
	and detect.last_letters = @last_letters
	and detect.last_number = @last_number
	and detect.car_in = @car_in
	and detect.record_id = @max_record_id
	))
		print 'Машина не может выехать или въехать дважды'
	else
	begin
		if (@car_in = 'Выезжает' and exists(select * from [KB301_Panteleeva].Task3.detected as detect 
			where detect.first_letters = @first_letters
			and detect.first_number  = @first_number
			and detect.last_letters = @last_letters
			and detect.last_number = @last_number))
		begin
			declare @delta_time int
			set @delta_time = datediff(minute, (select detect.time_detected from [KB301_Panteleeva].Task3.detected as detect
			where detect.first_letters = @first_letters
				and detect.first_number = @first_number
				and detect.last_letters = @last_letters
				and detect.last_number = @last_number
				and detect.record_id = @max_record_id), @time)
			if(@delta_time > 5)
				begin try
				insert into [KB301_Panteleeva].Task3.detected
				(first_letters, first_number , last_letters, last_number, car_in, post_id, time_detected)
				values
				(@first_letters, @first_number, @last_letters, @last_number, @car_in, @post_number, @time)
				end try
				begin catch
					print 'Неправильный номер'
				end catch
			else
				print 'Прошло меньше 5 минут'
		end

		else
		begin
		begin try
			insert into [KB301_Panteleeva].Task3.detected
			(first_letters, first_number , last_letters, last_number, car_in, post_id, time_detected)
			values
			(@first_letters, @first_number, @last_letters, @last_number, @car_in, @post_number, @time)
		end try
		begin catch
			print 'Неправильный номер'
		end catch
		end
	end
end
go


drop view PrintCars

create view PrintCars as
select concat(detect.first_letters, detect.first_number, detect.last_letters, detect.last_number) as 'Номер автомобиля', detect.post_id as 'Пост',
format(detect.time_detected, 'hh\:mm') as 'Время', detect.car_in as 'Куда едет', region.PK_region as 'Регион'  from [KB301_Panteleeva].Task3.detected as detect 
join [KB301_Panteleeva].Task3.region_number as r_n on r_n.PK_region_id = detect.last_number or r_n.another_region_number = detect.last_number or r_n.another_region_number2 = detect.last_number  
join [KB301_Panteleeva].Task3.region as region on region.region_id = r_n.PK_region_id
go

create view PrintLocalCars as
select concat(detect.first_letters, detect.first_number, detect.last_letters, detect.last_number) as 'Номер автомобиля', detect.post_id as 'Пост',
format(detect.time_detected, 'hh\:mm') as 'Время', detect.car_in as 'Куда едет', region.PK_region as 'Регион' from [KB301_Panteleeva].Task3.detected as detect
join [KB301_Panteleeva].Task3.post as post on detect.post_id = post.post_id
join [KB301_Panteleeva].Task3.region as region on region.PK_region = post.region_name
join [KB301_Panteleeva].Task3.region_number as r_n on r_n.PK_region_id = region.region_id
where detect.last_number = r_n.PK_region_id 
or detect.last_number = r_n.another_region_number
or detect.last_number = r_n.another_region_number2
go


create view PrintNonLocalCars as
select concat(detect.first_letters, detect.first_number, detect.last_letters, detect.last_number) as 'Номер автомобиля', detect.post_id as 'Пост',
format(detect.time_detected, 'hh\:mm') as 'Время', detect.car_in as 'Куда едет', region.PK_region as 'Регион' from [KB301_Panteleeva].Task3.detected as detect
join [KB301_Panteleeva].Task3.post as post on detect.post_id = post.post_id
join [KB301_Panteleeva].Task3.region as region on region.PK_region = post.region_name
join [KB301_Panteleeva].Task3.region_number as r_n on r_n.PK_region_id = region.region_id
where detect.last_number != r_n.PK_region_id 
and detect.last_number != r_n.another_region_number
and detect.last_number != r_n.another_region_number2
and detect.car_in = 'Въезжает'
and detect.post_id = (select top 1 detect2.post_id from [KB301_Panteleeva].Task3.detected as detect2
where detect.first_letters = detect2.first_letters
and detect.first_number = detect2.first_number
and detect.last_letters = detect2.last_letters
and detect.last_number = detect2.last_number
and detect2.car_in = 'Выезжает' order by detect2.record_id desc)
go

create view PrintTransitCars as 
select concat(detect.first_letters, detect.first_number, detect.last_letters, detect.last_number) as 'Номер автомобиля', detect.post_id as 'Пост',
format(detect.time_detected, 'hh\:mm') as 'Время', detect.car_in as 'Куда едет', region.PK_region as 'Регион' from [KB301_Panteleeva].Task3.detected as detect
join [KB301_Panteleeva].Task3.post as post on detect.post_id = post.post_id
join [KB301_Panteleeva].Task3.region as region on region.PK_region = post.region_name
join [KB301_Panteleeva].Task3.region_number as r_n on r_n.PK_region_id = region.region_id
where detect.last_number != r_n.PK_region_id 
and detect.last_number != r_n.another_region_number
and detect.last_number != r_n.another_region_number2
and detect.car_in = 'Въезжает'
and detect.post_id != (select top 1 detect2.post_id from [KB301_Panteleeva].Task3.detected as detect2
where detect.first_letters = detect2.first_letters
and detect.first_number = detect2.first_number
and detect.last_letters = detect2.last_letters
and detect.last_number = detect2.last_number
and detect2.car_in = 'Выезжает' order by detect2.record_id desc)
go

insert into [KB301_Panteleeva].Task3.region_number
(PK_region_id, another_region_number, another_region_number2)
values
('46', '', ''),
('25', '125', ''),
('47', '147', ''),
('02', '102', ''),
('66', '96', '196')

insert into [KB301_Panteleeva].Task3.region
(PK_region, region_id)
values
('Курская область', '46'),
('Приморский край', '25'),
('Санкт-Петербург', '47'),
('Республика Башкоркостан', '02'),
('Свердловская область', '66')


insert into [KB301_Panteleeva].Task3.post
(post_id, region_name)
values
(1, 'Свердловская область'),
(2, 'Свердловская область'),
(3, 'Свердловская область'),
(4, 'Свердловская область'),
(5, 'Свердловская область'),
(6, 'Свердловская область')


-- Примеры

-- Два раза вьезжаем

exec Car_detected @car_number = 'к646ер46', @time = '12:00', @post_number = 1, @car_in = 'Въезжает'
exec Car_detected @car_number = 'к646ер46', @time = '13:00', @post_number = 1, @car_in = 'Въезжает'


select * from PrintCars
delete from [KB301_Panteleeva].Task3.detected


-- Два раза выезжаем

exec Car_detected @car_number = 'к646ер46', @time = '12:00', @post_number = 1, @car_in = 'Выезжает'
exec Car_detected @car_number = 'к646ер46', @time = '13:00', @post_number = 1, @car_in = 'Выезжает'

select * from PrintCars
delete from [KB301_Panteleeva].Task3.detected


--Въезжаем и выезжаем сразу

exec Car_detected @car_number = 'к646ер46', @time = '12:00', @post_number = 1, @car_in = 'Въезжает'
exec Car_detected @car_number = 'к646ер46', @time = '12:10', @post_number = 1, @car_in = 'Выезжает'

select * from PrintCars
delete from [KB301_Panteleeva].Task3.detected


-- Невалидные номера

exec Car_detected @car_number = '123132156', @time = '12:00', @post_number = 1,  @car_in = 'Въезжает'
exec Car_detected @car_number = 'к000ер46', @time = '12:00', @post_number = 1,  @car_in = 'Въезжает'
exec Car_detected @car_number = 'к646ер146', @time = '12:00', @post_number = 1,  @car_in = 'Выезжает'
exec Car_detected @car_number = 'кавыер46', @time = '12:00', @post_number = 1,  @car_in = 'Выезжает'
exec Car_detected @car_number = 'к646ераыв', @time = '12:00', @post_number = 1,  @car_in = 'Въезжает'

select * from PrintCars



-- Транзитное авто

exec Car_detected @car_number = 'к646ер25', @time = '12:01', @post_number = 1, @car_in = 'Въезжает'
exec Car_detected @car_number = 'к646ер25', @time = '13:01', @post_number = 2, @car_in = 'Выезжает'



-- Местное авто

exec Car_detected @car_number = 'к646ер66', @time = '12:01', @post_number = 1, @car_in = 'Выезжает'
exec Car_detected @car_number = 'к646ер66', @time = '14:01', @post_number = 1, @car_in = 'Въезжает'




-- Иногороднее авто

exec Car_detected @car_number = 'к646ер02', @time = '12:01', @post_number = 1, @car_in = 'Въезжает'
exec Car_detected @car_number = 'к646ер02', @time = '15:01', @post_number = 1, @car_in = 'Выезжает' 


-- транзитные машины
select * from PrintTransitCars
--локальные машины
select * from PrintLocalCars
-- иногородние машины
select * from PrintNonLocalCars
-- все машины 
select * from PrintCars