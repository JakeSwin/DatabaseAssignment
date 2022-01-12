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
  `OpeningBalance` Float(10, 2) check(`OpeningBalance` >= 50),
  `SortCode` int(6) NOT NULL,
  PRIMARY KEY (`AccountNumber`),
  KEY `CustomerID` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `tblTransactions` (
  `TransactionID` int(11) NOT NULL AUTO_INCREMENT,
  `AccountNumber` int(8) NOT NULL,
  `TransactionType` ENUM('Deposit','withdrawal') NOT NULL,
  `Timestamp` DATETIME DEFAULT NOW(),
  `Amount` Float(10, 2) NOT NULL,
  PRIMARY KEY (`TransactionID`),
  KEY `AccountNumber` (`AccountNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `tblLoans` (
  `LoanID` int(11) NOT NULL AUTO_INCREMENT,
  `AccountNumber` int(8) NOT NULL,
  `MonthlyPaymentRate` Float(10, 2) NOT NULL,
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
('John', 'Smith', DATE '1988-11-2', '1 Fleeting Street', '7450 815095'),
('Buzz', 'Lightyear', DATE '1963-07-04', '50 Main Street', '7159 304422'),
('Asma', 'Delacruz', DATE '1966-06-21', '566 Park Avenue', '7456 018528'),
('Kristofer', 'Draper', DATE '1969-10-28', '447 The Grove', '7379 325214'),
('Aurelia', 'Carroll', DATE '1971-09-15', '78 High Street', '7911 076792'),
('Wesley', 'Huffman', DATE '1977-08-25', '26 Highfield Road', '7459 578235'),
('Terrell', 'Harvey', DATE '1983-10-16', '9961 Springfield Road', '7339 444099'),
('Sally', 'Kinney', DATE '1985-04-01', '33 King Street', '7911 269972'),
('Saxon', 'Betts', DATE '1990-05-12', '9334 Kings Road', '7700 128665'),
('Devonte', 'Webb', DATE '1998-06-05', '32 Broadway', '7700 090223'),
('Glenna', 'Clinton', DATE '1965-01-25', '1 Crookfold Place', '7457 274823'),
('Emmalyn', 'Moors', DATE '1971-11-09', '22 Windrush Oak', '7911 030192'),
('Crispin', 'Botterill', DATE '1987-12-31', '41 Austin Broadway', '7457 570544'),
('Marlena', 'Priestley', DATE '1991-03-10', '17 Brockley Drive', '7700 021885'),
('McKenna', 'Underhill', DATE '1999-02-17', '9 Colne Orchard', '7457 001807');

INSERT INTO `tblBankAccounts` (`CustomerID`, `OpeningBalance`, `SortCode`) VALUES
(1, 50, 222222),
(2, 150, 220201),
(3, 2120, 222222),
(5, 50, 220201),
(7, 90, 227503),
(8, 55, 227503),
(9, 2020, 220201),
(10, 160, 220201),
(11, 2250, 222222),
(13, 175, 222222),
(14, 1900, 227503);

INSERT INTO `tblLoans` (`AccountNumber`, `MonthlyPaymentRate`, `NumberOfPayments`, `FirstPaymentDate`, `MonthlyDueDate`) VALUES
(1, 399.96, 13, '2021-06-13', 9),
(2, 637.76, 20, '2021-02-17', 4),
(3, 736.29, 40, '2021-06-19', 2),
(7, 235.99, 36, '2020-11-26', 25),
(8, 309.82, 71, '2021-06-17', 23),
(9, 249.94, 76, '2021-09-23', 24),
(10, 628.52, 57, '2021-03-20', 25),
(11, 915.79, 79, '2021-05-24', 23);

INSERT INTO `tblTransactions` (`AccountNumber`, `TransactionType`, `Timestamp`, `Amount`) VALUES
(11, 'Withdrawal', '2021-11-15 00:34:58', 185.34),
(10, 'Deposit', '2021-11-01 13:13:45', 53.68),
(4, 'Withdrawal', '2021-11-17 21:31:50', 697.62),
(3, 'Withdrawal', '2021-11-13 12:35:24', 977.0),
(3, 'Withdrawal', '2021-12-11 09:44:54', 295.44),
(7, 'Withdrawal', '2021-12-25 09:54:14', 466.22),
(2, 'Withdrawal', '2022-01-04 16:36:48', 217.05),
(2, 'Deposit', '2021-12-21 08:16:49', 770.56),
(4, 'Deposit', '2021-11-02 10:43:26', 421.95),
(11, 'Withdrawal', '2021-12-19 02:51:31', 428.82),
(1, 'Deposit', '2021-11-27 09:24:20', 854.64),
(3, 'Withdrawal', '2021-12-04 02:02:43', 687.53),
(7, 'Withdrawal', '2021-11-08 10:57:06', 330.41),
(2, 'Deposit', '2021-12-13 15:46:38', 895.66),
(3, 'Withdrawal', '2021-11-10 13:04:41', 972.43),
(2, 'Deposit', '2021-12-20 07:12:10', 184.26),
(8, 'Withdrawal', '2021-11-18 05:56:36', 348.82),
(8, 'Deposit', '2022-01-05 07:30:02', 470.7),
(8, 'Deposit', '2022-01-01 13:14:36', 324.18),
(4, 'Deposit', '2021-11-18 15:27:01', 998.03),
(4, 'Withdrawal', '2021-11-02 06:18:36', 26.97),
(4, 'Deposit', '2021-12-14 16:13:17', 9.04),
(5, 'Deposit', '2022-01-01 05:26:32', 122.97),
(3, 'Deposit', '2021-11-01 00:30:34', 818.55),
(7, 'Withdrawal', '2021-11-23 04:08:06', 525.14),
(1, 'Withdrawal', '2021-11-25 14:12:43', 881.88),
(10, 'Withdrawal', '2021-12-25 20:32:54', 764.41),
(2, 'Deposit', '2021-11-22 18:13:06', 664.8),
(3, 'Withdrawal', '2021-12-16 16:47:32', 599.21),
(2, 'Withdrawal', '2021-12-18 03:57:21', 630.29),
(8, 'Deposit', '2021-12-21 10:00:27', 329.39),
(11, 'Deposit', '2021-12-27 08:42:14', 789.18),
(9, 'Deposit', '2021-11-20 01:14:19', 15.95),
(3, 'Withdrawal', '2021-11-01 17:19:20', 583.83),
(6, 'Deposit', '2021-11-12 05:11:04', 356.49),
(10, 'Withdrawal', '2021-11-19 13:30:33', 265.8),
(4, 'Deposit', '2021-11-19 20:28:16', 107.3),
(6, 'Withdrawal', '2021-12-16 04:59:02', 490.76),
(11, 'Deposit', '2021-11-10 10:50:47', 715.02),
(10, 'Deposit', '2021-12-23 05:10:15', 494.04),
(8, 'Withdrawal', '2022-01-03 00:50:26', 720.0),
(7, 'Withdrawal', '2022-01-04 21:53:16', 723.51),
(2, 'Deposit', '2022-01-06 15:56:32', 388.2),
(10, 'Deposit', '2021-12-01 20:05:03', 168.7),
(9, 'Deposit', '2021-12-26 01:49:07', 543.23),
(7, 'Withdrawal', '2021-12-06 20:02:06', 920.46),
(10, 'Deposit', '2021-12-26 21:39:17', 641.26),
(3, 'Withdrawal', '2021-11-10 21:07:14', 76.6),
(9, 'Withdrawal', '2021-11-20 10:32:05', 258.14),
(10, 'Withdrawal', '2021-12-20 10:13:42', 597.18),
(2, 'Deposit', '2022-01-09 14:14:15', 292.98),
(10, 'Withdrawal', '2021-11-27 17:33:09', 278.43),
(10, 'Withdrawal', '2022-01-06 17:20:32', 163.9),
(6, 'Deposit', '2021-11-05 08:34:56', 529.74),
(10, 'Withdrawal', '2021-11-23 11:03:51', 508.93),
(1, 'Withdrawal', '2021-12-25 08:20:39', 407.64),
(2, 'Deposit', '2021-12-21 12:30:38', 121.0),
(6, 'Withdrawal', '2021-11-14 17:31:55', 387.09),
(3, 'Withdrawal', '2021-11-17 00:08:21', 229.13),
(7, 'Deposit', '2021-12-11 06:45:03', 583.3),
(3, 'Withdrawal', '2021-11-24 01:36:03', 877.43),
(1, 'Deposit', '2021-11-16 19:30:58', 383.26),
(4, 'Deposit', '2021-11-22 19:26:57', 105.83),
(9, 'Deposit', '2021-12-15 20:29:45', 688.12),
(1, 'Withdrawal', '2021-12-19 05:36:44', 431.39),
(4, 'Deposit', '2021-12-11 19:48:07', 911.43),
(10, 'Withdrawal', '2022-01-02 19:24:20', 331.95),
(5, 'Deposit', '2021-11-12 08:33:57', 148.08),
(6, 'Deposit', '2021-12-16 21:10:44', 92.58),
(2, 'Withdrawal', '2021-12-14 19:23:17', 430.67),
(7, 'Deposit', '2021-12-11 15:07:45', 166.78),
(6, 'Deposit', '2021-12-27 14:29:44', 631.38),
(4, 'Withdrawal', '2021-12-14 08:10:29', 691.05),
(2, 'Withdrawal', '2021-12-17 23:49:54', 764.85),
(5, 'Deposit', '2021-11-22 01:45:36', 549.38),
(7, 'Withdrawal', '2022-01-03 02:20:50', 507.24),
(5, 'Withdrawal', '2022-01-10 23:05:47', 225.53),
(10, 'Deposit', '2021-11-10 07:32:24', 821.4),
(1, 'Withdrawal', '2021-11-26 05:29:21', 467.93),
(2, 'Withdrawal', '2021-12-03 11:55:05', 27.34);