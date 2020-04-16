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
--created patients table

-- CREATE USER 'kermit'@'localhost' IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, UPDATE ON Patients TO 'kermit'@'localhost';


CREATE TABLE IF NOT EXISTS `Medications` (
  `medicationID` int(11) NOT NULL AUTO_INCREMENT,
  `patientID` int(11) NOT NULL AUTO_INCREMENT,
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
  FOREIGN KEY (`patientID`) 
  	REFERENCES Patients(patientID)
	ON DELETE CASCADE
  	ON UPDATE CASCADE
)
--created medication table

GRANT SELECT, INSERT, UPDATE ON Medications TO 'kermit'@'localhost';


CREATE TABLE IF NOT EXISTS `DoctorVisits` (
  `patientID` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `doctorSeen` varchar(25) NOT NULL,
  `FEV1` int(11) NOT NULL,
  FOREIGN KEY(`patientID`) 
    REFERENCES Patient(patientID)
  	ON DELETE CASCADE
  	ON UPDATE CASCADE
)
GRANT SELECT, INSERT, UPDATE ON DoctorVisits TO 'kermit'@'localhost';