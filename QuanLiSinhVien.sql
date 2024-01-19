drop database if exists quan_li_sinh_vien;
create database if not exists quan_li_sinh_vien;

use quan_li_sinh_vien;

create table class (
class_id int primary key auto_increment,
class_name varchar(20) not null,
startdate datetime not null,
statuss bit 
);

create table student (
student_id int auto_increment primary key,
student_name varchar(30) not null,
adress varchar(50),
phone varchar(20),
statuss bit,
class_id int not null,
foreign key (class_id) references class(class_id)
);

create table `subject` (
sub_id int primary key auto_increment,
sub_name varchar(200) not null,
credit tinyint not null default 1 check (credit >= 1),
statuss bit default 1
);

create table mark (
mark_id int primary key auto_increment,
sub_id int not null unique,
student_id int not null unique,
mark float default 0 check(mark between 0 and 100),
exam_time tinyint default 1,
foreign key (sub_id) references `subject`(sub_id),
foreign key (student_id) references student(student_id)
);



