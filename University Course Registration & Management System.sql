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

create table Department(
	departmentID int primary key,
    departmentName varchar(100) unique,
    departmentBuilding varchar(50) not null,
    departmentHOD varchar(50) not null
);

create table Course(
	courseCode varchar(50) primary key,
    courseName varchar(100) unique,
	courseCreditHours int not null,
    courseSemester int,
    check (courseSemester>=1 and courseSemester<=8),
    courseDepartment int
);

create table Section(
	sectionTeacher varchar(100) not null,
    sectionRoom varchar(100) not null,
    sectionTiming time not null,
    sectionCapacity int
);

create table Enrollment(
	enrollmentDate date not null,
    enrollmentStatus bool default false
);

create table Attendance(
	studentID int not null,
    section varchar(10) not null,
    attendanceDate datetime not null,
    attendanceStatus bool default false
);

create table Exam(
	midMarks int default 0,
    finalMarks int default 0,
    quizMarks int default 0,
    assignmentMarks int default 0
);

create table Result(
	marksObtained int not null,
    totalMarks int default 100,
    grade char not null,
    gpaPoints int not null
);

show tables;

alter table Teacher
drop column teacherDepartment;

select * from Teacher;

alter table Teacher
add column departmentID int,
add foreign key (departmentID) references Department (departmentID);

alter table Course
drop column courseDepartment;

create table teacherCourse(
	teacherID int,
    courseCode varchar(50),
    foreign key (teacherID) references teacher (teacherID),
    foreign key (courseCode) references course (courseCode),
    primary key (teacherID, courseCode)
);

alter table Section
drop column sectionTeacher;

alter table Section
add column sectionID int,
add column courseCode varchar(50),
add foreign key (courseCode) references Course (courseCode),
add primary key (sectionID, courseCode);

drop table Enrollment;

create table Enrollment(
	studentID int,
    sectionID int,
    courseCode varchar(50),
    foreign key (studentID) references Student (studentID),
    foreign key (sectionID, courseCode) references Section (sectionID, courseCode)
);

alter table Enrollment
add primary key (studentID, sectionID, courseCode);