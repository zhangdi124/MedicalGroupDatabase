-- Di Zhang 
-- This script creates the medmenter database in MySQL 
-- first create the Medical Center database space 
 
create database IF NOT EXISTS WellnessClinicMedicalGroup; 
 
-- then create the tables in that space 
 
use WellnessClinicMedicalGroup; 
CREATE TABLE IF NOT EXISTS Patient ( 
 patientSocSecNo           CHAR(11) NOT NULL UNIQUE, 
 patientID                 INTEGER(11) NOT NULL, 
 patientDOB                DATE, 
 patientFirstName          VARCHAR(20) NOT NULL DEFAULT'', 
 patientLastName           VARCHAR(20) NOT NULL, 
 PatientEmail              VARCHAR(30), 
 patientHPhoneNo           VARCHAR(12), 
 patientMPhoneNo           VARCHAR(12), 
 patientAdress             VARCHAR(50), 
 CONSTRAINT Patient_patientID_pk PRIMARY KEY (patientID)); 
  
  
CREATE TABLE IF NOT EXISTS Staff ( 
 staffID               INTEGER(11), 
 staffSocSecNo         CHAR(11) NOT NULL, 
 staffFirstName        VARCHAR(20) NOT NULL, 
 staffLastName         VARCHAR(20) NOT NULL, 
 staffPhone            VARCHAR(12), 
 staffRating           SMALLINT(2), 
 staffPosition         VARCHAR(20), 
 staffType             CHAR(2), 
 CONSTRAINT Staff_staffID_pk PRIMARY KEY (staffID));  
  
 
CREATE TABLE IF NOT EXISTS Appointment ( 
 patientID               INTEGER(11), 
 appID                   INTEGER(11), 
 appDate                 DATE, 
 appTime                 TIME, 
 appRoomNo               INTEGER(2), 
 appDescription          TEXT DEFAULT'', 
 CONSTRAINT Appointment_patientID_fk FOREIGN KEY (patientID) REFERENCES Patient (patientID) ON DELETE CASCADE, 
 CONSTRAINT Appointment_appID_pk PRIMARY KEY (appID)); 
 
 
CREATE TABLE IF NOT EXISTS Schedule ( 
 staffID                INTEGER(11), 
 appID                  INTEGER(11), 
 schedDate              DATE, 
 schedTime              TIME, 
 CONSTRAINT Schedule_staffID_fk FOREIGN KEY (staffID) REFERENCES Staff (staffID) ON DELETE CASCADE, 
 CONSTRAINT Schedule_appID_fk FOREIGN KEY (appID) REFERENCES Appointment (appID) ON DELETE CASCADE); 
 
 
 
CREATE TABLE IF NOT EXISTS Billing ( 
 billNo                INTEGER(11) NOT NULL, 
 billDueDate           DATE, 
 billAddress           VARCHAR(50), 
 billServiceFor        TEXT, 
 billServiceDate       DATE, 
 patientID             INTEGER(11), 
 CONSTRAINT Billing_billNo_pk PRIMARY KEY (billNo), 
 CONSTRAINT Billing_patientID_fk FOREIGN KEY (patientID) REFERENCES Patient  
 
(patientID)); 
 
 
 
 
 
 
CREATE TABLE IF NOT EXISTS Prescription ( 
 prescriptNo                 INTEGER(11), 
 staffID                     INTEGER(11), 
 patientID                   INTEGER(11), 
 prescriptDrug               VARCHAR(20), 
 prescriptQuantity           CHAR(3), 
 prescriptDosage             VARCHAR(50), 
 prescriptRefill             VARCHAR(50), 
 CONSTRAINT Prescription_prescriptNo_pk PRIMARY KEY (prescriptNo),   
 CONSTRAINT Prescription_staffID_fk FOREIGN KEY (staffID) REFERENCES Staff  
 
(staffID),  
 CONSTRAINT Prescription_patientID_fk FOREIGN KEY ( patientID ) REFERENCES  

 
Patient (patientID));  
 
 
 
CREATE TABLE IF NOT EXISTS Diagnosis ( 
 diagID                INTEGER(11), 
 staffID               INTEGER(11), 
 patientID             INTEGER(11), 
 diagDescription       TEXT DEFAULT'', 
 diagTreatment         TEXT DEFAULT'', 
 diagDate              DATE NOT NULL, 
 CONSTRAINT Diagnosis_diagID_pk PRIMARY KEY (diagID), 
 CONSTRAINT Diagnosis_staffID_fk FOREIGN KEY (staffID) REFERENCES Staff  
 
(staffID), 
 CONSTRAINT Diagnosis_patientID_fk FOREIGN KEY (patientID) REFERENCES Patient  
 
(patientID)); 
 
 
CREATE TABLE IF NOT EXISTS Procedures ( 
 procedureID INTEGER(11),  
 procedureName VARCHAR(20),  
 staffID INTEGER(11),  
 PatientID INTEGER(11) NOT NULL,  
 Date DATE NOT NULL,  
 PRIMARY KEY (procedureID),  
 CONSTRAINT Procedures_staffID_fk FOREIGN KEY (staffID) REFERENCES Staff (staffID),  
 CONSTRAINT Procedures_patientID_fk FOREIGN KEY (patientID) REFERENCES Patient (patientID) 
); 
 
 
CREATE TABLE IF NOT EXISTS InsurancePolicy ( 
 insurPolID                        VARCHAR(20), 
 patientID                         INTEGER(11), 
 insurPolGroupNo                   VARCHAR(20) NOT NULL, 
 insurPolPlanType                  VARCHAR(10), 
 insurPolCopany                    VARCHAR(20), 
 insurPolCompanyContact            VARCHAR(15), 
 insurPolPCP                       VARCHAR(50), 
 insurPolCoPayEmergency            VARCHAR(3), 
 insurPolCoPaySpecialtyCare        VARCHAR(3), 
 insurPolCoPayPCP                  VARCHAR(3), 
 insurPolCompanyWebsite            VARCHAR(512), 
 outOfNetworkDeductable            VARCHAR(4),         
 inNetwordDeductable               VARCHAR(4), 
 rxCoPayGeneric                    VARCHAR(512), 
 rxCoPayNameBrand                  VARCHAR(512), 
 CONSTRAINT InsurancePolicy_insurPolID_pk PRIMARY KEY (insurPolID), 
 CONSTRAINT InsurancePolicy_patientID_fk FOREIGN KEY (patientID) REFERENCES  
 
Patient (patientID)); 
 
 
 
 
CREATE TABLE IF NOT EXISTS labTest ( 
 labTestNo               INTEGER(11), 
 labtestType             VARCHAR(20), 
 labtestcode             CHAR(6), 
 labsampleType           VARCHAR(30), 
 labRequestedDate        DATE, 
 staffID                 INTEGER(11), 
 patientID               INTEGER(11), 
 CONSTRAINT labTest_labTestNo_pk PRIMARY KEY (labTestNo), 
 CONSTRAINT labTest_staffID_fk FOREIGN KEY (staffID) REFERENCES Staff (staffID), 
 CONSTRAINT labTest_patientID_fk FOREIGN KEY (patientID) REFERENCES Patient (patientID)); 