CREATE DATABASE IF NOT EXISTS bank;

USE bank;

CREATE TABLE IF NOT EXISTS tblCustomers (
  CustomerID int(11) NOT NULL AUTO_INCREMENT,
  FirstName varchar(20) DEFAULT NULL,
  LastName varchar(30) DEFAULT NULL,
  DateOfBirth DATE DEFAULT NULL,
  Address1 varchar(50) DEFAULT NULL,
  Telephone varchar(15) DEFAULT NULL,
  PRIMARY KEY (CustomerID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS tblBankAccounts (
  AccountNumber int(8) NOT NULL AUTO_INCREMENT,
  CustomerID int(11) NOT NULL,
  OpeningBalance Float(10, 2) SIGNED NOT NULL,
  SortCode int(6) NOT NULL,
  PRIMARY KEY (CustomerID),
  KEY CustomerID (CustomerID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;