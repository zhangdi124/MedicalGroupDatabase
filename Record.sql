CS 623 Project Step 5.4

/* Patient Table */
INSERT INTO Patient VALUES('222334444’,’1’,'1965-06-29', 'Sally', 'Fields', 'sfields23@example.com', '1213336644','9173238833', '20 Maple Street, Dallas Texas, 08982');

INSERT INTO Patient VALUES('222334444’,’2’,’1965-06-29', ‘Alex’, 'Fields', 'sfields23@example.com', '1213336644','9173238833', '20 Maple Street, Dallas Texas, 08982');

INSERT INTO Patient VALUES('987651212', '1945-05-22’,’3’, 'Jane', 'Doe', 'janeDoe34@example.com', '2013335678','6238884321', '121 Limebrook street Florez California 13498');

INSERT INTO Patient VALUES('932104512’,’4’,'1972-09-14', 'Harry', 'Potter', 'hPotter13@example.com', '7186461313','23245452121', '1.4 Muggles Street Potterville England 23345');

INSERT INTO Patient VALUES('787119876’,’5’, '1981-03-21', 'Annie', 'McDavies, 'billBean543@example.com', '2128782312','6469874562', '567 East 82nd street New York New York 08123');

/* Staff Table */
INSERT INTO Staff VALUES(‘1’,’980875678', 'David', 'Cazooli', '2014448723', 8,'Physician', 'FT');

INSERT INTO Staff VALUES(‘2’,’567983171', 'Sam', 'Shepherd', '8722323939', 7,'Registered Nurse', 'FT');

INSERT INTO Staff VALUES(‘3’,’667565676', 'Lisa', 'Cambell', '8722323931', 7,'Midwife', 'PT');

INSERT INTO Staff VALUES(‘4’,’980875678', 'Mira', 'Badii', '8723456565', 8,'Physician', 'FT');

INSERT INTO Staff VALUES(‘5’,’980875678', 'Michael', 'Bernstein', '8722321875', 5,'Pharmacist', 'FT');



/*Appointment*/
INSERT INTO Appointment VALUES(2,’1’, '2016-04-12', '01:00:00’,’101’,’Patient exhibiting Flu like symptoms');

INSERT INTO Appointment VALUES(3,’2’, '2016-04-09', '01:20:00’,’102’,'Yearly Physical with Bloodwork');

INSERT INTO Appointment(4,’3’, '2016-05-03', '12:30:00’,’101’,’Sonagram and General checkup on pregnancy in 3rd trimester');

INSERT INTO Appointment VALUES(1,’4’, '2016-04-04', '12:40:00’,’200’,'Follow Up visit on high cholestral');

/*schedule*/
INSERT INTO Schedule VALUES(‘1’,’1’,’2016-04-12’,’01:00:00’);
INSERT INTO Schedule VALUES(‘2’,’2’,’2016-04-09’,’01:20:00’);
INSERT INTO Schedule VALUES(‘3’,’3’,’2016-05-03’,’12:30:00’);
INSERT INTO Schedule VALUES(‘4’,’4’,’2016-04-04’,’12:40:00’);


/* Billing */
INSERT INTO Billing VALUES(‘1’,’2016-05-10', '121 Limebrook street Florez California 13498','Migrane headaches', '2016-03-02', 3);

INSERT INTO Billing VALUES(‘2’,’2016-03-12', '14 Cedar Lane Birchtown New Jersey 045345', 'Twisted Ankle', '2016-02-08' , 2);



/* labTest */
INSERT INTO labTest VALUES(‘1’,’CBC’ '6399Z', 'Blood', '2016-02-12', 1, 3);

INSERT INTO labTest VALUES(‘2’,’Urine Analysis', '6304R', 'Urine', '2015-11-12', 1, 3);



/* Prescription */ 
INSERT INTO labTest VALUES(1,1, 3, 'Atorvastatin', '30', '20MG', '2 Refills');

INSERT INTO labTest(staffID, patientID, prescriptDrug, prescriptQuantity, prescriptDosage, prescriptRefill) VALUES(2,1, 2, 'ZPack', '10', '5MG', 'NO Refills');





/* Diagnosis */
INSERT INTO Diagnosis VALUES(1,1, 1,'The patient seems to be having some problem with their blah blah blah due to inconsistent diet', 'I gave them B12 injection', '2015-12-3');

INSERT INTO Diagnosis VALUES(2,1, 2,'While taking the patients blood pressure I observed that it was unusally low', 'I gave prescribed a medication to treat high blood pressure', '2015-11-21');



/* Procedures */ 
INSERT INTO Procedures VALUES(1,’Sonogram', 1, 1, '2016-02-03');

INSERT INTO Procedures VALUES(2, ’X-RAY', 1, 2, '2015-09-14');


/* InsurancePolicy */ 


INSERT INTO InsurancePolicy VALUES('876-4321-B', 2, '4242-54321-YZQ','Oxford Health','212-321-7654','Dr. Sam Smith','100','30', '25', ’15’,’oxforhealth@example.com', '1000', '300', '10', '15' );


********************** CS 623 Step 5.5 Queries**********************
English: Get the full name, home phone, and date of birth of patient 2.
SELECT patientLastName, patientFirstName, patientHPhoneNo, patientDOB 
FROM Patient 
WHERE patientID = 2; 

English: Get the full name , postion, and whether staff member with ID 3 is is a full time or part time employee. 
SELECT staffFirstName, staffLastName, staffPosition, staffType 
FROM Staff 
WHERE staffID = 3; 

English: Get the full name, home phone number and appointment time of all patients who have an appointment on April 4th 2016.
SELECT patientFirstName, patientLastName, patientHPhoneNo, appDate, appTime
FROM Patient, Appointment
WHERE appDate = '2016-04-04';

English: Get all informat on complete bloodwork labtests.
SELECT * FROM labTest 
WHERE labTestType = 'CBC';

English: Get full name and position of all staff who have a staff rating greater than 6; 
SELECT staffFirstName, staffLastName, staffPosition 
FROM Staff 
WHERE staffRating > 6;  
