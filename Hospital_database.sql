CREATE DATABASE Hospital_db;
SHOW DATABASES;

USE Hospital_db;
SHOW TABLES;

CREATE TABLE Patients (
Patient_ID INT PRIMARY KEY,
Patient_Name VARCHAR(100) NOT NULL,
Age INT,
Gender VARCHAR(10),
Phone VARCHAR(15) UNIQUE,
Address VARCHAR(100),
Blood_Group VARCHAR(5)
);
DESC Patients;

CREATE TABLE Doctors (
Doctor_ID INT PRIMARY KEY,
Doctor_Name VARCHAR(100) NOT NULL,
Specialization VARCHAR(50),
Experience INT,
Phone VARCHAR(15) UNIQUE,
Department VARCHAR(50)
);
DESC Doctors;

CREATE TABLE Appointments (
Appointment_ID INT PRIMARY KEY,
Patient_ID INT,
Doctor_ID INT,
Appointment_Date DATE,
Appointment_Time TIME,
Status VARCHAR(20),
FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID),
FOREIGN KEY (Doctor_ID) REFERENCES Doctors(Doctor_ID)
);
DESC Appointments;

CREATE TABLE Treatments (
Treatment_ID INT PRIMARY KEY,
Appointment_ID INT,
Diagnosis VARCHAR(100),
Treatment_Cost DECIMAL(10,2),
FOREIGN KEY (Appointment_ID) REFERENCES Appointments(Appointment_ID)
);
DESC Treatments;

CREATE TABLE Bills (
Bill_ID INT PRIMARY KEY,
Patient_ID INT,
Treatment_ID INT,
Total_Amount DECIMAL(10,2),
Payment_Status VARCHAR(20),
Bill_Date DATE,
FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID),
FOREIGN KEY (Treatment_ID) REFERENCES Treatments(Treatment_ID)
);
DESC Bills

INSERT INTO Patients
VALUES
(1,'Rahul Sharma',25,'Male','9876543210','Mumbai','O+'),
(2,'Priya Verma',30,'Female','9123456780','Pune','A+'),
(3,'Amit Patel',45,'Male','9988776655','Surat','B+'),
(4,'Neha Singh',28,'Female','9012345678','Delhi','AB+'),
(5,'Rohan Mehta',35,'Male','9876501234','Ahmedabad','O-'),
(6,'Sneha Joshi',40,'Female','9090909090','Nashik','A-'),
(7,'Vikas Kumar',50,'Male','9765432109','Jaipur','B-'),
(8,'Anjali Shah',22,'Female','9555666777','Mumbai','O+'),
(9,'Karan Desai',38,'Male','9444555666','Vadodara','AB-'),
(10,'Meera Nair',29,'Female','9333444555','Kochi','A+');
SELECT * FROM Patients;

INSERT INTO Doctors
VALUES
(101,'Dr. Amit Sharma','Cardiologist',12,'9876500001','Cardiology'),
(102,'Dr. Neha Verma','Neurologist',8,'9876500002','Neurology'),
(103,'Dr. Raj Patel','Orthopedic',10,'9876500003','Orthopedics'),
(104,'Dr. Priya Singh','Pediatrician',6,'9876500004','Pediatrics'),
(105,'Dr. Karan Mehta','Dermatologist',9,'9876500005','Dermatology'),
(106,'Dr. Sneha Joshi','Gynecologist',11,'9876500006','Gynecology'),
(107,'Dr. Vikas Kumar','ENT Specialist',7,'9876500007','ENT'),
(108,'Dr. Anjali Shah','Ophthalmologist',5,'9876500008','Ophthalmology'),
(109,'Dr. Meera Nair','Psychiatrist',13,'9876500009','Psychiatry'),
(110,'Dr. Rahul Desai','General Physician',15,'9876500010','General Medicine');
SELECT * FROM Doctors

INSERT INTO Appointments
VALUES
(1001,1,101,'2025-07-20','10:00:00','Completed'),
(1002,2,102,'2025-07-20','11:00:00','Completed'),
(1003,3,103,'2025-07-21','09:30:00','Pending'),
(1004,4,104,'2025-07-21','12:00:00','Completed'),
(1005,5,105,'2025-07-22','10:30:00','Cancelled'),
(1006,6,106,'2025-07-22','02:00:00','Completed'),
(1007,7,107,'2025-07-23','11:30:00','Pending'),
(1008,8,108,'2025-07-23','03:00:00','Completed'),
(1009,9,109,'2025-07-24','09:00:00','Completed'),
(1010,10,110,'2025-07-24','04:00:00','Pending');
SELECT * FROM Appointments;

INSERT INTO Treatments
VALUES
(201,1001,'Fever',1500.00),
(202,1002,'Migraine',2500.00),
(203,1003,'Fracture',8000.00),
(204,1004,'Cold & Cough',1200.00),
(205,1005,'Skin Allergy',1800.00),
(206,1006,'Pregnancy Checkup',3000.00),
(207,1007,'Ear Infection',2200.00),
(208,1008,'Eye Checkup',1700.00),
(209,1009,'Depression',4000.00),
(210,1010,'General Checkup',1000.00);
SELECT * FROM Treatments;

INSERT INTO Bills
VALUES
(301,1,201,1500.00,'Paid','2025-07-20'),
(302,2,202,2500.00,'Paid','2025-07-20'),
(303,3,203,8000.00,'Pending','2025-07-21'),
(304,4,204,1200.00,'Paid','2025-07-21'),
(305,5,205,1800.00,'Cancelled','2025-07-22'),
(306,6,206,3000.00,'Paid','2025-07-22'),
(307,7,207,2200.00,'Pending','2025-07-23'),
(308,8,208,1700.00,'Paid','2025-07-23'),
(309,9,209,4000.00,'Paid','2025-07-24'),
(310,10,210,1000.00,'Paid','2025-07-24');
SELECT * FROM Bills;

-- 1. Display the details of patients whose age is above 30 years.
SELECT *
FROM Patients
WHERE Age > 30;

-- 2. Display the names and departments of doctors with more than 8 years of experience.
SELECT Doctor_Name, Department, Experience
FROM Doctors
WHERE Experience > 8;

-- 3. Display all appointments that are scheduled as 'Pending'.
SELECT *
FROM Appointments
WHERE Status = 'Pending';

-- 4. Display the top 5 highest treatment costs.
SELECT *
FROM Treatments
ORDER BY Treatment_Cost DESC
LIMIT 5;

-- 5. Display the details of patients belonging to the 'O+' blood group.
SELECT *
FROM Patients
WHERE Blood_Group = 'O+';

-- 6. Find the total number of appointments.
SELECT COUNT(*) AS Total_Appointments
FROM Appointments;

-- 7. Find the total revenue collected from paid bills.
SELECT SUM(Total_Amount) AS Total_Revenue
FROM Bills
WHERE Payment_Status = 'Paid';

-- 8. Find the average treatment cost.
SELECT AVG(Treatment_Cost) AS Average_Treatment_Cost
FROM Treatments;

-- 9. Find the maximum and minimum bill amount.
SELECT MAX(Total_Amount) AS Maximum_Bill,
MIN(Total_Amount) AS Minimum_Bill
FROM Bills;

-- 10. Count the number of doctors in each department.
SELECT Department,
COUNT(*) AS Total_Doctors
FROM Doctors
GROUP BY Department;
-- 11. Calculate the total revenue generated by each payment status.
SELECT Payment_Status,
SUM(Total_Amount) AS Total_Revenue
FROM Bills
GROUP BY Payment_Status;

-- 12. Display payment statuses having total revenue greater than 3000.
SELECT Payment_Status,
SUM(Total_Amount) AS Total_Revenue
FROM Bills
GROUP BY Payment_Status
HAVING SUM(Total_Amount) > 3000;

-- 13. Display all patients, even if they have no appointment.
SELECT P.Patient_Name, A.Appointment_Date
FROM Patients P
LEFT JOIN Appointments A
ON P.Patient_ID = A.Patient_ID;

-- 14. Display all doctors, even if they have no appointments.
SELECT D.Doctor_Name, A.Appointment_Date
FROM Appointments A
RIGHT JOIN Doctors D
ON A.Doctor_ID = D.Doctor_ID;

-- 15. Display patient name, doctor name, diagnosis, and bill amount.
SELECT P.Patient_Name,
D.Doctor_Name,
T.Diagnosis,
B.Total_Amount
FROM Bills B
JOIN Treatments T
ON B.Treatment_ID = T.Treatment_ID
JOIN Appointments A
ON T.Appointment_ID = A.Appointment_ID
JOIN Patients P
ON A.Patient_ID = P.Patient_ID
JOIN Doctors D
ON A.Doctor_ID = D.Doctor_ID;

-- 16. Display patients whose age is greater than the average age.
SELECT *
FROM Patients
WHERE Age >
(
SELECT AVG(Age)
FROM Patients
);

-- 17. Find the doctor having the highest experience.
SELECT *
FROM Doctors
WHERE Experience =
(
SELECT MAX(Experience)
FROM Doctors
);

-- 18. Rank doctors based on their experience.
SELECT Doctor_Name,
Experience,
RANK() OVER(ORDER BY Experience DESC) AS Doctor_Rank
FROM Doctors;

-- 19. Assign row numbers to appointments based on appointment date.
SELECT 
    Appointment_ID,
    Appointment_Date,
    ROW_NUMBER() OVER (ORDER BY Appointment_Date) AS RowNum
FROM Appointments;

-- 20.Find the doctor with the second highest experience.
SELECT Doctor_Name,
experience
FROM(
SELECT Doctor_Name,
Experience,
DENSE_RANK() OVER(ORDER BY Experience DESC) AS Rank_
FROM Doctors
) d                                                               -- inner query is aliased as d
WHERE Rank_= 2

-- 21. Update the status of all pending appointments to 'Completed'.

SET SQL_SAFE_UPDATES = 0;

UPDATE Appointments
SET Status = 'Completed'
WHERE Status = 'Pending';

SET SQL_SAFE_UPDATES = 1;
select* from appointments;

-- 22. Insert a new patient record.
INSERT INTO Patients
VALUES
(11,'Arjun Patil',27,'Male','9000011111','Pune','B+');

-- 23. Create a view named Patient_Doctor_View to display the patient name, doctor name, and appointment date.
CREATE VIEW Patient_Doctor_View AS
SELECT P.Patient_Name,
D.Doctor_Name,
A.Appointment_Date
FROM Appointments A
JOIN Patients P
ON A.Patient_ID = P.Patient_ID
JOIN Doctors D
ON A.Doctor_ID = D.Doctor_ID;
SELECT * FROM Patient_Doctor_View;

-- 24. Using the Patient_Doctor_View, display all appointments scheduled on '2025-07-20'.
SELECT *
FROM Patient_Doctor_View
WHERE Appointment_Date = '2025-07-20';