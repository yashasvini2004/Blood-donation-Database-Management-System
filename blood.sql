-- Create table for Donor
CREATE TABLE Donor (
    bd_id NUMBER PRIMARY KEY,
    bd_Name VARCHAR2(50),
    bd_age NUMBER,
    bd_sex CHAR(1),
    bd_bgrp VARCHAR2(10),
    bd_regdate DATE,
    reco_id NUMBER,
    city_id NUMBER,
    CONSTRAINT fk_reco_id FOREIGN KEY (reco_id) REFERENCES Recording_Staff(reco_id),
    CONSTRAINT fk_city_id FOREIGN KEY (city_id) REFERENCES City(city_id)
);

-- Insert sample data into Donor
INSERT INTO Donor (bd_id, bd_Name, bd_age, bd_sex, bd_bgrp, bd_regdate, reco_id, city_id) VALUES 
(1, 'John Doe', 30, 'M', 'O+', TO_DATE('2023-01-01', 'YYYY-MM-DD'), 1, 1),
(2, 'Jane Smith', 25, 'F', 'A-', TO_DATE('2023-02-15', 'YYYY-MM-DD'), 2, 2);

-- Create table for Recipient
CREATE TABLE Recipient (
    reci_id NUMBER PRIMARY KEY,
    reci_Name VARCHAR2(50),
    reci_age NUMBER,
    reci_sex CHAR(1),
    reci_bgrp VARCHAR2(10),
    reci_bqnty NUMBER,
    reci_reg_date DATE,
    reco_id NUMBER,
    city_id NUMBER,
    M_id NUMBER,
    CONSTRAINT fk_reco_id FOREIGN KEY (reco_id) REFERENCES Recording_Staff(reco_id),
    CONSTRAINT fk_city_id FOREIGN KEY (city_id) REFERENCES City(city_id),
    CONSTRAINT fk_M_id FOREIGN KEY (M_id) REFERENCES Blood_Bank_Manager(M_id)
);

-- Insert sample data into Recipient
INSERT INTO Recipient (reci_id, reci_Name, reci_age, reci_sex, reci_bgrp, reci_bqnty, reci_reg_date, reco_id, city_id, M_id) VALUES 
(1, 'Alice Brown', 28, 'F', 'B+', 2, TO_DATE('2023-03-10', 'YYYY-MM-DD'), 1, 1, 1),
(2, 'Bob Johnson', 40, 'M', 'AB-', 3, TO_DATE('2023-04-22', 'YYYY-MM-DD'), 2, 2, 2);

-- Create table for City
CREATE TABLE City (
    city_id NUMBER PRIMARY KEY,
    city_name VARCHAR2(50)
);

-- Insert sample data into City
INSERT INTO City (city_id, city_name) VALUES 
(1, 'New York'),
(2, 'Los Angeles');

-- Create table for Recording_Staff
CREATE TABLE Recording_Staff (
    reco_id NUMBER PRIMARY KEY,
    reco_name VARCHAR2(50),
    reco_PhNo NUMBER
);

-- Insert sample data into Recording_Staff
INSERT INTO Recording_Staff (reco_id, reco_name, reco_PhNo) VALUES 
(1, 'Emily Davis', 1234567890),
(2, 'Michael Wilson', 9876543210);

-- Create table for Blood_Specimen
CREATE TABLE Blood_Specimen (
    specimen_No NUMBER PRIMARY KEY,
    b_grp VARCHAR2(10),
    status NUMBER,
    M_id NUMBER,
    dfind_id NUMBER,
    CONSTRAINT fk_M_id FOREIGN KEY (M_id) REFERENCES Blood_Bank_Manager(M_id),
    CONSTRAINT fk_dfind_id FOREIGN KEY (dfind_id) REFERENCES Disease_Finder(dfind_id)
);

-- Insert sample data into Blood_Specimen
INSERT INTO Blood_Specimen (specimen_No, b_grp, status, M_id, dfind_id) VALUES 
(1, 'O+', 1, 1, 1),
(2, 'A-', 0, 2, 2);

-- Create table for Disease_Finder
CREATE TABLE Disease_Finder (
    dfind_id NUMBER PRIMARY KEY,
    dfind_name VARCHAR2(50),
    dfind_phNo NUMBER
);

-- Insert sample data into Disease_Finder
INSERT INTO Disease_Finder (dfind_id, dfind_name, dfind_phNo) VALUES 
(1, 'Dr. Lisa Turner', 5551234567),
(2, 'Dr. Kevin White', 5557654321);

-- Create table for Blood_Bank_Manager
CREATE TABLE Blood_Bank_Manager (
    M_id NUMBER PRIMARY KEY,
    m_name VARCHAR2(50),
    M_phno NUMBER
);

-- Insert sample data into Blood_Bank_Manager
INSERT INTO Blood_Bank_Manager (M_id, m_name, M_phno) VALUES 
(1, 'Dr. William Clark', 4441234567),
(2, 'Dr. Patricia Moore', 4447654321);

-- Create table for Hospital_Info
CREATE TABLE Hospital_Info (
    hosp_id NUMBER PRIMARY KEY,
    hosp_name VARCHAR2(50),
    hosp_needed_Bgrp VARCHAR2(10),
    hosp_needed_qnty NUMBER,
    City_id NUMBER,
    M_id NUMBER,
    CONSTRAINT fk_city_id FOREIGN KEY (City_id) REFERENCES City(city_id),
    CONSTRAINT fk_M_id FOREIGN KEY (M_id) REFERENCES Blood_Bank_Manager(M_id)
);

-- Insert sample data into Hospital_Info
INSERT INTO Hospital_Info (hosp_id, hosp_name, hosp_needed_Bgrp, hosp_needed_qnty, City_id, M_id) VALUES 
(1, 'City Hospital', 'A+', 5, 1, 1),
(2, 'County General', 'B-', 3, 2, 2);

-- Sample Insert Queries
INSERT INTO BB_Manager VALUES
(102, 'Jack', 4693959671), (103, 'Peter', 4693959601), (104, 'Mark', 4693959677), (105, 'Jason', 4693957671);

INSERT INTO BB_Manager VALUES
(106, 'Steve', 4694959671), (107, 'Jason', 4695959671), (108, 'Stella', 4663959671), (109, 'Monika', 4673959671), (110, 'John', 4693859671);

INSERT INTO Blood_Donor VALUES
(150221, 'Mark', 25, 'M', 'B+', '2015-12-17', 101, 212, 1100),
(160011, 'Abdul', 35, 'F', 'A+', '2016-11-22', 101, 212, 1100),
(160101, 'Smith', 22, 'M', 'O+', '2016-01-04', 101, 312, 1200),
(150011, 'Pat', 29, 'M', 'O+', '2015-07-19', 101, 412, 1300),
(150021, 'Shyam', 42, 'F', 'A-', '2015-12-24', 101, 412, 1300),
(150121, 'Dan', 44, 'M', 'AB+', '2015-08-28', 101, 212, 1200),
(160031, 'Mike', 33, 'F', 'AB-', '2016-02-06', 101, 212, 1400),
(160301, 'Elisa', 31, 'F', 'AB+', '2016-09-10', 101, 312, 1200),
(160091, 'Carrol', 24, 'M', 'B-', '2016-10-15', 101, 312, 1500),
(160401, 'Mark', 29, 'M', 'O-', '2016-12-17', 101, 212, 1200);

INSERT INTO BloodSpecimen VALUES
(1001, 'B+', 111101), (1002, 'O+', 112102), (1003, 'AB+', 111102), (1004, 'O-', 113103),
(1005, 'A+', 014101), (1006, 'A-', 113104), (1007, 'AB-', 115104), (1008, 'AB-', 011105),
(1009, 'B+', 113105), (1010, 'O+', 012105), (1011, 'O+', 113103), (1012, 'O-', 114102),
(1013, 'B-', 114102), (1014, 'AB+', 015101);

INSERT INTO City VALUES
(1200, 'Austin'), (1300, 'Irving'), (1400, 'Houston'), (1500, 'Richardson'),
(1600, 'Plano'), (1700, 'Frisco'), (1800, 'Arlington'), (1900, 'San Antonio'), (2000, 'Tyler');

INSERT INTO DiseaseFinder VALUES
(11, 'Peter', 4693804223), (12, 'Park', 4693804223), (13, 'Jerry', 4693804223),
(14, 'Mark', 4693804223), (15, 'Monika', 4693804223), (16, 'Ram', 4693804123),
(17, 'Swathi', 4693804223), (18, 'Gautham', 4693804323), (19, 'Ashwin', 4693804423),
(20, 'Yash', 4693804523);

INSERT INTO HospitalInfo VALUES
(1001, 'Apollo', 'A+', 2.0, 1200, 111102), (1002, 'Continental', 'O+', 4.0, 1300, 111102),
(1003, 'Sunshine', 'AB+', 1.0, 1300, 112102), (1004, 'City Hospitals', 'B+', 3.0, 1400, 113103),
(1005, 'Global', 'B-', 1.5, 1400, 114101), (1006, 'Yashoda', 'O-', 2.5, 1500, 113104),
(1007, 'Eash Hospitals', 'O+', 4.0, 1500, 115104), (1008, 'MIOT', 'AB-', 2.5, 1500, 011105),
(1009, 'Hometown', 'AB+', 1.5, 1600, 113105), (1010, 'MaxCure', 'B+', 3.0, 1700, 012105);

INSERT INTO BloodDonation VALUES
(10001, 'Mark', 25, 'B+', 1.5, 101, 212, 1100, 'M', '2015-12-17'), (10002, 'Dan', 60, 'A+', 1.1, 101, 312, 1200, 'M', '2015-12-16'),
(10003, 'Steve', 35, 'AB+', 0.5, 101, 312, 1200, 'M', '2015-10-17'), (10004, 'Parker', 66, 'B+', 1.1, 101, 412, 1300, 'M', '2016-11-17'),
(10005, 'Jason', 53, 'B-', 1.1, 101, 412, 1300, 'M', '2015-04-17'), (10006, 'Preetham', 45, 'O+', 1.5, 101, 512, 1300, 'M', '2015-12-17'),
(10007, 'Swetha', 22, 'AB-', 1.1, 101, 512, 1300, 'F', '2015-05-17'), (10008, 'Hemanth', 33, 'AB+', 1.0, 101, 612, 1300, 'M', '2015-05-17'),
(10009, 'John', 21, 'B+', 1.5, 101, 712, 1300, 'M', '2015-07-17'), (10010, 'Liam', 23, 'O-', 1.1, 101, 812, 1300, 'M', '2015-12-17'),
(10011, 'Olivia', 25, 'B-', 1.1, 101, 912, 1300, 'F', '2015-12-17'), (10012, 'Emma', 22, 'A-', 1.0, 101, 1012, 1300, 'F', '2015-12-17'),
(10013, 'Ava', 21, 'O+', 1.5, 101, 1112, 1300, 'F', '2015-12-17');

INSERT INTO Recording_Staff VALUES
(101, 'John', 4693809671), (102, 'Steve', 4693809672), (103, 'Monika', 4693809673),
(104, 'Yash', 4693809674), (105, 'Jason', 4693809675), (106, 'Mark', 4693809676),
(107, 'Swetha', 4693809677), (108, 'Gautham', 4693809678), (109, 'Swathi', 4693809679),
(110, 'Ashwin', 4693809680);

INSERT INTO Recipient2 VALUES
(10001, 'Mark', 25, 'M', 'B+', 1.5, '2015-12-17', 101, 212, 1100),
(10002, 'Dan', 60, 'M', 'A+', 1.1, '2015-12-16', 101, 312, 1200),
(10003, 'Steve', 35, 'M', 'AB+', 0.5, '2015-10-17', 101, 312, 1200),
(10004, 'Parker', 66, 'M', 'B+', 1.1, '2016-11-17', 101, 412, 1300),
(10005, 'Jason', 53, 'M', 'B-', 1.1, '2015-04-17', 101, 412, 1300),
(10006, 'Preetham', 45, 'M', 'O+', 1.5, '2015-12-17', 101, 512, 1300),
(10007, 'Swetha', 22, 'F', 'AB-', 1.1, '2015-05-17', 101, 512, 1300),
(10008, 'Hemanth', 33, 'M', 'AB+', 1.0, '2015-05-17', 101, 612, 1300),
(10009, 'John', 21, 'M', 'B+', 1.5, '2015-07-17', 101, 712, 1300),
(10010, 'Liam', 23, 'M', 'O-', 1.1, '2015-12-17', 101, 812, 1300),
(10011, 'Olivia', 25, 'F', 'B-', 1.1, '2015-12-17', 101, 912, 1300),
(10012, 'Emma', 22, 'F', 'A-', 1.0, '2015-12-17', 101, 1012, 1300),
(10013, 'Ava', 21, 'F', 'O+', 1.5, '2015-12-17', 101, 1112, 1300);

-- Sample Queries
-- Select all blood donors with blood group 'A+'
SELECT * FROM Blood_Donor WHERE bd_bgrp = 'A+';

-- Select all recipients with blood group 'B+'
SELECT * FROM Recipient WHERE reci_bgrp = 'B+';

-- Select blood donors who registered between 2023-01-01 and 2023-12-31
SELECT bd_name, bd_bgrp FROM Blood_Donor WHERE bd_regdate BETWEEN TO_DATE('2023-01-01', 'YYYY-MM-DD') AND TO_DATE('2023-12-31', 'YYYY-MM-DD');

-- Select all blood specimens with status 1
SELECT * FROM BloodSpecimen WHERE status = 1;

-- Select all recipients with blood group 'O-'
SELECT * FROM Recipient WHERE reci_bgrp = 'O-';

-- Select the name and blood group of all blood donors who registered in 2022
SELECT bd_name, bd_bgrp FROM Blood_Donor WHERE bd_regdate BETWEEN TO_DATE('2022-01-01', 'YYYY-MM-DD') AND TO_DATE('2022-12-31', 'YYYY-MM-DD');

-- Select all blood specimens with blood group 'AB+'
SELECT * FROM BloodSpecimen WHERE b_grp = 'AB+';

-- Select all recording staff names and phone numbers
SELECT reco_name, reco_PhNo FROM Recording_Staff;

-- Select all disease finders with phone number starting with '469'
SELECT * FROM Disease_Finder WHERE dfind_phNo LIKE '469%';

-- Select all blood bank managers' names
SELECT m_name FROM Blood_Bank_Manager;

-- Select all cities' names
SELECT city_name FROM City;

-- Select all donors older than 30
SELECT * FROM Blood_Donor WHERE bd_age > 30;

-- Select all recipients who need more than 2 units of blood
SELECT * FROM Recipient WHERE reci_bqnty > 2;

-- Select all blood specimens managed by manager with id 1
SELECT * FROM BloodSpecimen WHERE M_id = 1;

-- Select the number of donors by blood group
SELECT bd_bgrp, COUNT(*) FROM Blood_Donor GROUP BY bd_bgrp;

-- Select the name and phone number of the manager responsible for 'City Hospital'
SELECT BBM.m_name, BBM.M_phno
FROM Hospital_Info HI
JOIN Blood_Bank_Manager BBM ON HI.M_id = BBM.M_id
WHERE HI.hosp_name = 'City Hospital';

-- Select all recipients from 'New York'
SELECT * FROM Recipient R
JOIN City C ON R.city_id = C.city_id
WHERE C.city_name = 'New York';

-- Select all donors who donated blood after '2023-06-01'
SELECT * FROM Blood_Donor WHERE bd_regdate > TO_DATE('2023-06-01', 'YYYY-MM-DD');

-- Select all recipients along with the city they belong to
SELECT R.reci_Name, C.city_name
FROM Recipient R
JOIN City C ON R.city_id = C.city_id;

-- Select the total quantity of blood needed by each hospital
SELECT hosp_name, SUM(hosp_needed_qnty) AS total_blood_needed
FROM Hospital_Info
GROUP BY hosp_name;
