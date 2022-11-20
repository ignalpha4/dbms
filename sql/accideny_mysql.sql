/* Consider insurance database with following schema : 
 person(driver-id, name, address) 
 car(license, model, year) 
 accident (report - no, date, location) 
 owns(driver-id,license) 
 participated(driver-id,car,report-no,damage-amount) 
Write a query in SQL for following requirements */



use practical;
/*-------------table creation and insertion---------------------*/

create table person(
driver_id int primary key,
name varchar(30),
address varchar(50)
);



insert into person values (01, 'shubham','Baramati');
insert into person values (02, 'Rushi','Indapur');
insert into person values (03, 'adi','Akluj');
insert into person values (05, 'vishal','daund');
insert into person values (06, 'pratik','malegaon');

select * from person;

/*---------------------------------------------*/

create table car(
license int primary key,
model varchar(30),
year int
);

insert into car values (201, 'venono',2018);
insert into car values (202, 'sian',2019);
insert into car values (203, 'chiron',2016);
insert into car values (204, 'aventador',2021);

select * from car;
/*------------------------------------------------*/
create table accident(
report_no int primary key,
date_of_aac date,
location varchar(30)
);



insert into accident values(3001, '2016-11-03', 'malegaon');
insert into accident values(3002, '2020-11-11', 'Pune');
insert into accident values(3003, '2019-01-03', 'Mumbai');
insert into accident values(3004, '2018-07-19', 'Nashik');
insert into accident values(3005, '2016-02-20', 'Pune');


/*-----------------------------------------------------------*/

create table owns(
driver_id int,
license int,
foreign key(driver_id) references person(driver_id),
foreign key(license) references car(license)
);


insert into owns values(01, 201);
insert into owns values(02, 202);
insert into owns values(03, 203);
insert into owns values(05, 204);

/*-----------------------------------------------------------*/

create table participated(
driver_id int,
car varchar(20),
report_no int,
damage_amount int,
foreign key(driver_id) references person(driver_id),
foreign key(report_no) references accident(report_no)
);


insert into participated values(01, 'Innova', 3001, 23000);
insert into participated values(02, 'Baleno', 3002, 15000);
insert into participated values(03, 'Swift Dzire', 3003, 13000);
insert into participated values(05, 'Fortuner', 3004, 50000);
insert into participated values(06, 'Audi', 3005, 65000);
/*--------------------------------------------------------------------------------------------------------------------*/

/* 1-Find the total no. of people who owned cars that were involved in accidents in 2016*/

select count(DISTINCT name) from person p, accident a, participated pr
where a.report_no=pr.report_no 
and pr.driver_id=p.driver_id
and a.date_of_aac between '2016-00-00' and '2016-12-31';


/*2-Retrieve the name of person whose address contains Pune*/

select name from person where address='Pune';

/*3-Find the name of persons having more than two cars.*/

select p.driver_id,p.name
from  person p, car c,owns o
where c.license=o.license 
and o.driver_id=p.driver_id 
group by p.driver_id,p.name 
having count(p.driver_id)>2;







