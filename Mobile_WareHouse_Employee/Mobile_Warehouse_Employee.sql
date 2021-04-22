CREATE TABLE mobile(
id int(2) primary key, name varchar(10), ram int(2),rom int(3),camera varchar(4),battery int(4)
);

insert into mobile values(1,'Redmi K20',6,64,'48MP',4000);
insert into mobile values(2,'Pixel 3a',4,64,'12MP',3700);
insert into mobile values(3,'Realme X',8,128,'48MP',3765);
insert into mobile values(4,'Redmi 7a',2,32,'12MP',4000);
insert into mobile values(5,'Oppo Reno2',8,256,'48MP',4000);



create table warehouse(
id int(2), location varchar(10), quantity int(4),
foreign key(id) references mobile(id)
);

insert into warehouse values(1,'Delhi',2000);
insert into warehouse values(1,'Kolkata',1000);
insert into warehouse values(2,'Mumbai',1000);
insert into warehouse values(3,'Banglore',3000);
insert into warehouse values(4,'Mumbai',2000);
insert into warehouse values(4,'Delhi',1000);
insert into warehouse values(5,'Mumbai',2000);



select * from mobile;
select * from mobile where battery=(select max(battery) from mobile);
select name,camera from mobile order by camera;
select * from mobile where battery>2000;
select * from warehouse where quantity<2000;
select sum(quantity) as 'total amount'from warehouse where location='Delhi';
select count(*) from warehouse where location='Mumbai';
select location,sum(quantity) from warehouse group by location;
select name from mobile where id in (select id from warehouse where location='Mumbai');
select * from mobile,warehouse where mobile.id=warehouse.id;


create table employee(
employee_id int(2), first_name varchar(10), last_name varchar(11), salary int(7),department varchar(10),
primary key(first_name,last_name)
);

insert into employee values(1,'Leonel','Messi',927413,'Admin');
insert into employee values(2,'Cristiano','Ronaldo',8648752,'HR');
insert into employee values(3,'David','Beckham',2465624,'Accounts');
insert into employee values(4,'Neymar','Santos',5455212,'Admin');
insert into employee values(5,'Kylian','Mbappe',545545,'Admin');
insert into employee values(6,'Zlatan','Ibrahimovic',8514751,'Accounts');
insert into employee values(7,'Luis','Suarez',5484512,'HR');
insert into employee values(8,'Edinson','Cavani',4846151,'HR');

select * from employee;
delete from employee where first_name='Kylian' and last_name='Mbappe';
update employee set salary=7254854 where first_name='Luis' and last_name='Suarez';
select concat(first_name,' ',last_name) as name ,salary from employee;
select first_name,last_name from employee where salary > 6000000;
select department,count(*) as 'No of Employees' from employee group by department;
select * from employee order by department;
select * from employee as e where salary IN (select max(salary) from employee as emp group by department having e.department=emp.department);
select department,sum(salary) as 'Total Salary' from employee group by department;
select department,avg(salary) as 'Average Salary' from employee group by department;