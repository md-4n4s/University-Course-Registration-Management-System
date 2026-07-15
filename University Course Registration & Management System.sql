create database universitySystem;
use universitySystem;

create table Student(
	studentID int primary key,
    studentName varchar(100) not null,
    studentGender varchar(50) not null,
    studentDOB date not null,
    studentPhone int unique,
    studentEmail varchar(100) unique,
    studentAddress text not null,
    studentAdmissionDate date
);

alter table Student
modify studentPhone varchar(50);

create table Teacher(
	teacherID int primary key,
    teacherName varchar(100) not null,
    teacherQualification text not null,
    teacherSalary int not null,
    teacherPhone varchar(50) unique,
    teacherEmail varchar(100) unique,
    teacherDepartment varchar(100) not null
);

