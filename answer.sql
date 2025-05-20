-- Create Database
CREATE DATABASE IF NOT EXISTS studentDB;
USE studentDB;

-- Create Students Table
CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- Create Courses Table
CREATE TABLE Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    course_code VARCHAR(10) UNIQUE NOT NULL
);

-- Enrollments Table (Many-to-Many between Students and Courses)
CREATE TABLE Enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    UNIQUE (student_id, course_id)
);

-- Grades Table (1-to-1 with Enrollments)
CREATE TABLE Grades (
    enrollment_id INT PRIMARY KEY,
    grade CHAR(2),
    FOREIGN KEY (enrollment_id) REFERENCES Enrollments(enrollment_id)
);

