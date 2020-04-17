DROP DATABASE IF EXISTS ACME_Medical;
CREATE DATABASE ACME_Medical;
USE ACME_Medical;
-- creates database

CREATE TABLE IF NOT EXISTS `Patients` (
  `patientID` int(11) NOT NULL AUTO_INCREMENT,
  `fName` varchar(50) NOT NULL,
  `lName` varchar(250) NOT NULL,
  `gender` varchar(7) NOT NULL,
  `birthdate` varchar(250) NOT NULL,
  `genetics` varchar(250) NOT NULL,
  `diabetic` varchar(3) NOT NULL,
  `other_conditions` varchar(100) NOT NULL,
  PRIMARY KEY (`patientID`)
)
--creates patients table
-- CREATE USER 'kermit'@'localhost' IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, UPDATE ON Patients TO 'kermit'@'localhost';

--

CREATE TABLE IF NOT EXISTS `Medications` (
  `medicationID` int(11) NOT NULL AUTO_INCREMENT,
  `patientID` int(11) NOT NULL,
  `vest` varchar(3) NOT NULL,
  `acapella` varchar(3) NOT NULL,
  `plumozyme` varchar(100) NOT NULL,
  `inhaledTobi` varchar(3) NOT NULL,
  `inhaledColistin` varchar(3) NOT NULL,
  `hypertonicSaline` varchar(6) NOT NULL,
  `azithromycin` varchar(3) NOT NULL,
  `clarithromycin` varchar(3) NOT NULL,
  `inhaledGentamicin` varchar(3) NOT NULL,
  `enzymes` varchar(100) NOT NULL,
  PRIMARY KEY (`medicationID`),
  CONSTRAINT FOREIGN KEY (`patientID`) REFERENCES `Patients`(`patientID`)
)
GRANT SELECT, INSERT, UPDATE ON Medications TO 'kermit'@'localhost';

--

CREATE TABLE IF NOT EXISTS `DoctorVisits` (
  `visitID` int(11) NOT NULL AUTO_INCREMENT,
  `patientID` int(11) NOT NULL,
  `date` date NOT NULL,
  `doctorSeen` varchar(25) NOT NULL,
  `FEV1` int(11) NOT NULL,
  PRIMARY KEY(`visitID`),
  CONSTRAINT FOREIGN KEY (`patientID`)  REFERENCES `Patients`(`patientID`)
)
GRANT SELECT, INSERT, UPDATE ON DoctorVisits TO 'kermit'@'localhost';

--

CREATE TABLE IF NOT EXISTS `LungExams` (
  `examID` int(11) NOT NULL AUTO_INCREMENT,
  `visitID` int(11) NOT NULL,
  `FEV1` int(11) NOT NULL,
  PRIMARY KEY(`examID`), 
  CONSTRAINT FOREIGN KEY (`visitID`) REFERENCES `DoctorVisits`(`visitID`)
)
GRANT SELECT, INSERT, UPDATE ON DoctorVisits TO 'kermit'@'localhost';

--

CREATE TABLE IF NOT EXISTS `MedDosage` (
  `dosageID` int(11) NOT NULL AUTO_INCREMENT,
  `medicationID` int(11) NOT NULL,
  `dosageAmount(mg)` int(11) NOT NULL,
  PRIMARY KEY(`dosageID`),
  CONSTRAINT FOREIGN KEY (`medicationID`) REFERENCES `Medications`(`medicationID`)
)