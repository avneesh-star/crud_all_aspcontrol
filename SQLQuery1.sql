create database app19test
use app19test

create table tbl_country
(
country_id int primary key identity,
country_name varchar(50)
)

insert into tbl_country(country_name) values('India')
insert into tbl_country(country_name) values('USA')
insert into tbl_country(country_name) values('new zealand')
insert into tbl_country(country_name) values('Australia')

select * from tbl_country


create table tbl_state
(
state_id int primary key identity,
state_name varchar(50),
countryID int
)

insert into tbl_state(state_name,countryID) values('Uttar Pradesh',1)
insert into tbl_state(state_name,countryID) values('Bihar',1)
insert into tbl_state(state_name,countryID) values('Madhya Pradesh',1)
insert into tbl_state(state_name,countryID) values('Haryana',1)
insert into tbl_state(state_name,countryID) values('California',2)
insert into tbl_state(state_name,countryID) values('Texas',2)
insert into tbl_state(state_name,countryID) values('washigton',2)
insert into tbl_state(state_name,countryID) values('new york',2)
insert into tbl_state(state_name,countryID) values('Aucklank',3)
insert into tbl_state(state_name,countryID) values('Nelson',3)
insert into tbl_state(state_name,countryID) values('Westland',3)
insert into tbl_state(state_name,countryID) values('Southland',3)
insert into tbl_state(state_name,countryID) values('New South Wales',4)
insert into tbl_state(state_name,countryID) values('Victoria',4)
insert into tbl_state(state_name,countryID) values('South Australia',4)
insert into tbl_state(state_name,countryID) values('Western Australia',4)

select * from tbl_state

create table tbl_city
(
city_id int primary key identity,
city_name varchar(50),
stateID int 
)
select * from tbl_city

insert into tbl_city(city_name,stateID) values('Breilly',1)
insert into tbl_city(city_name,stateID) values('Kanpur',1)
insert into tbl_city(city_name,stateID) values('Lucknow',1)
insert into tbl_city(city_name,stateID) values('meerut',1)

insert into tbl_city(city_name,stateID) values('Patna',2)
insert into tbl_city(city_name,stateID) values('Shasaram',2)
insert into tbl_city(city_name,stateID) values('Madhubani',2)
insert into tbl_city(city_name,stateID) values('Sivan',2)

insert into tbl_city(city_name,stateID) values('Indore',3)
insert into tbl_city(city_name,stateID) values('Satna',3)
insert into tbl_city(city_name,stateID) values('Bhopal',3)
insert into tbl_city(city_name,stateID) values('Gwalior',3)

insert into tbl_city(city_name,stateID) values('Gurugram',4)
insert into tbl_city(city_name,stateID) values('Hisar',4)
insert into tbl_city(city_name,stateID) values('Karnal',4)
insert into tbl_city(city_name,stateID) values('Panipat',4)

insert into tbl_city(city_name,stateID) values('Los Angles',5)
insert into tbl_city(city_name,stateID) values('San Francisco',5)
insert into tbl_city(city_name,stateID) values('San Jose',5)
insert into tbl_city(city_name,stateID) values('Long Beach',5)

insert into tbl_city(city_name,stateID) values('Houston',6)
insert into tbl_city(city_name,stateID) values('Austin',6)
insert into tbl_city(city_name,stateID) values('Laredo',6)
insert into tbl_city(city_name,stateID) values('Fort Worth',6)

insert into tbl_city(city_name,stateID) values('Olympia',7)
insert into tbl_city(city_name,stateID) values('Seattle',7)
insert into tbl_city(city_name,stateID) values('Yakima',7)
insert into tbl_city(city_name,stateID) values('Forks',7)

insert into tbl_city(city_name,stateID) values('Albany',8)
insert into tbl_city(city_name,stateID) values('Rochester',8)
insert into tbl_city(city_name,stateID) values('Utica',8)
insert into tbl_city(city_name,stateID) values('Yonkers',8)

insert into tbl_city(city_name,stateID) values('Auckland',9)
insert into tbl_city(city_name,stateID) values('parakai',9)
insert into tbl_city(city_name,stateID) values('Drury',9)

insert into tbl_city(city_name,stateID) values('Nelson',10)
insert into tbl_city(city_name,stateID) values('Nelson central',10)

insert into tbl_city(city_name,stateID) values('Westland',11)
insert into tbl_city(city_name,stateID) values('Southland',12)


insert into tbl_city(city_name,stateID) values('Sydney',13)
insert into tbl_city(city_name,stateID) values('GoulBurn',13)
insert into tbl_city(city_name,stateID) values('Newcastle',13)
insert into tbl_city(city_name,stateID) values('Perks',13)

insert into tbl_city(city_name,stateID) values('Melbourne',14)
insert into tbl_city(city_name,stateID) values('Geelong',14)
insert into tbl_city(city_name,stateID) values('Portland',14)
insert into tbl_city(city_name,stateID) values('Swan Hill',14)

insert into tbl_city(city_name,stateID) values('Mount Gambier',15)
insert into tbl_city(city_name,stateID) values('Port Augusta',15)
insert into tbl_city(city_name,stateID) values('Whyalla',15)
insert into tbl_city(city_name,stateID) values('Victor Horbor',15)

insert into tbl_city(city_name,stateID) values('Perth',16)
insert into tbl_city(city_name,stateID) values('Albany',16)
insert into tbl_city(city_name,stateID) values('Bunbury',16)
insert into tbl_city(city_name,stateID) values('Busselton',16)

 select * from tbl_state where countryID=3
 select * from tbl_city where stateID=4

 create table tbl_patient
 (
 patient_id int primary key identity,
 patient_name varchar(50),
 patient_age int,
 patient_gender int,
 patient_symptoms varchar(150),
 patient_country int,
 patient_state int,
 patient_city int,
 inserted_date datetime
 )

 create procedure sp_patient_insert
 @patient_name varchar(50),
 @patient_age int,
 @patient_gender int,
 @patient_symptoms varchar(150),
 @patient_country int,
 @patient_state int,
 @patient_city int
 as
 begin
 insert into tbl_patient(patient_name,patient_age,patient_gender,patient_symptoms,patient_country,patient_state,patient_city,inserted_date)
 values (@patient_name,@patient_age,@patient_gender,@patient_symptoms,@patient_country,@patient_state,@patient_city,getdate())
 end
 select * from tbl_patient

 create proc sp_patient_join
 as
 begin
 select * from tbl_patient join 
 tbl_country on tbl_patient.patient_country=tbl_country.country_id
 join tbl_state on tbl_patient.patient_state=tbl_state.state_id
 join tbl_city on tbl_patient.patient_city=tbl_city.city_id
 end

 create proc sp_patient_delete
 @patient_id int
 as
 begin
 delete from tbl_patient where patient_id=@patient_id
 end

 create proc sp_patient_edit
 @patient_id int
 as
 begin
 select * from tbl_patient where patient_id=@patient_id
 end

 select * from tbl_patient

 create proc sp_sp_patient_update
 @patient_id int,
 @patient_name varchar(50),
 @patient_age int,
 @patient_gender int,
 @patient_symptoms varchar(150),
 @patient_country int,
 @patient_state int,
 @patient_city int
 as
 begin 
 update tbl_patient set patient_name=@patient_name,patient_age=@patient_age,patient_gender=@patient_gender,patient_symptoms=@patient_symptoms,patient_country=@patient_country,patient_state=@patient_state,patient_city=@patient_city,inserted_date=GETDATE()
 where patient_id=@patient_id
 end

delete from tbl_patient where patient_id=29
