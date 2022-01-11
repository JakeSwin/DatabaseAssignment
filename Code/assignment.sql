DROP DATABASE IF EXISTS `bank`;

CREATE DATABASE IF NOT EXISTS `bank`;

USE `bank`;

DROP TABLE IF EXISTS `tblCustomers`;
DROP TABLE IF EXISTS `tblBankAccounts`;
DROP TABLE IF EXISTS `tblTransactions`;
DROP TABLE IF EXISTS `tblLoans`;

CREATE TABLE IF NOT EXISTS `tblCustomers` (
  `CustomerID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(20) DEFAULT NULL,
  `LastName` varchar(30) DEFAULT NULL,
  `DateOfBirth` DATE DEFAULT NULL,
  `Address1` varchar(50) DEFAULT NULL,
  `Telephone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `tblBankAccounts` (
  `AccountNumber` int(8) NOT NULL AUTO_INCREMENT,
  `CustomerID` int(11) NOT NULL,
  `OpeningBalance` Float(10, 2) NOT NULL,
  `SortCode` int(6) NOT NULL,
  PRIMARY KEY (`AccountNumber`),
  KEY `CustomerID` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `tblTransactions` (
  `TransactionID` int(11) NOT NULL AUTO_INCREMENT,
  `AccountNumber` int(8) NOT NULL,
  `TransactionType` varchar(15) NOT NULL,
  `TransactionDate` DATE NOT NULL,
  `Amount` Float(10, 2) NOT NULL,
  PRIMARY KEY (`TransactionID`),
  KEY `AccountNumber` (`AccountNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `tblLoans` (
  `LoanID` int(11) NOT NULL AUTO_INCREMENT,
  `AccountNumber` int(8) NOT NULL,
  `MonthlyPaymentRate` varchar(15) NOT NULL,
  `NumberOfPayments` int(8) NOT NULL,
  `FirstPaymentDate` DATE NOT NULL,
  `MonthlyDueDate` int(6) NOT NULL,
  PRIMARY KEY (`LoanID`),
  KEY `AccountNumber` (`AccountNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

ALTER TABLE `tblBankAccounts`
ADD CONSTRAINT FOREIGN KEY (`CustomerID`) REFERENCES `tblCustomers` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `tblTransactions`
ADD CONSTRAINT FOREIGN KEY (`AccountNumber`) REFERENCES `tblBankAccounts` (`AccountNumber`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `tblLoans`
ADD CONSTRAINT FOREIGN KEY (`AccountNumber`) REFERENCES `tblBankAccounts` (`AccountNumber`) ON DELETE CASCADE ON UPDATE CASCADE;

INSERT INTO `tblCustomers` (`FirstName`, `LastName`, `DateOfBirth`, `Address1`, `Telephone`) VALUES
('John', 'Smith', DATE '1988-11-2', '1 Fleeting Street', '01632 960320'),
('Buzz', 'Lightyear', DATE '1963-07-04', '50 Main Street', '01632 960253'),
('Asma', 'Delacruz', DATE '1966-06-21', '566 Park Avenue', '01632 960935'),
('Kristofer', 'Draper', DATE '1969-10-28', '447 The Grove', '01632 960499'),
('Aurelia', 'Carroll', DATE '1971-09-15', '78 High Street', '01632 960557'),
('Wesley', 'Huffman', DATE '1977-08-25', '26 Highfield Road', '01632 960570'),
('Terrell', 'Harvey', DATE '1983-10-16', '9961 Springfield Road', '01632 960483'),
('Sally', 'Kinney', DATE '1985-04-01', '33 King Street', '01632 960308'),
('Saxon', 'Betts', DATE '1990-05-12', '9334 Kings Road', '01632 960428'),
('Devonte', 'Webb', DATE '1998-06-05', '32 Broadway', '01632 960823');