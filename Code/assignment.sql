CREATE DATABASE IF NOT EXISTS `bank`;

USE `bank`;

DROP TABLE IF EXISTS `tblCustomers`;
DROP TABLE IF EXISTS `tblBankAccounts`;

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
  `OpeningBalance` Float(10, 2) SIGNED NOT NULL,
  `SortCode` int(6) NOT NULL,
  PRIMARY KEY (`AccountNumber`),
  KEY `CustomerID` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

ALTER TABLE `tblBankAccounts`
ADD CONSTRAINT FOREIGN KEY (`CustomerID`) REFERENCES `tblCustomers` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE,

INSERT INTO `tblCustomers` (`FirstName`, `LastName`, `DateOfBirth`, `Address1`, `Telephone`) VALUES
('John', 'Smith', '11/2/1988', '1 Fleeting Street', '07711 192337943'),
('Buzz', 'Lightyear', '22/3/1996', '1 Fleeting Street', '07711 192337943'),
('John', 'Smith', '11/2/1988', '1 Fleeting Street', '07711 192337943'),
('John', 'Smith', '11/2/1988', '1 Fleeting Street', '07711 192337943'),
('John', 'Smith', '11/2/1988', '1 Fleeting Street', '07711 192337943'),
('John', 'Smith', '11/2/1988', '1 Fleeting Street', '07711 192337943'),
('John', 'Smith', '11/2/1988', '1 Fleeting Street', '07711 192337943'),
('John', 'Smith', '11/2/1988', '1 Fleeting Street', '07711 192337943'),
('John', 'Smith', '11/2/1988', '1 Fleeting Street', '07711 192337943'),
('John', 'Smith', '11/2/1988', '1 Fleeting Street', '07711 192337943'),