CREATE TABLE `Bank` (
  `BankID` int PRIMARY KEY,
  `BankName` varchar(255),
  `BankAddress` varchar(255)
);

CREATE TABLE `Department` (
  `DepartmentID` int PRIMARY KEY,
  `DepartmentName` varchar(255),
  `BankID` int
);

CREATE TABLE `Employee` (
  `BankID` int,
  `DepartmentID` int,
  `EmployeeID` int PRIMARY KEY,
  `EmployeeName` varchar(255)
);

CREATE TABLE `Customer` (
  `BankID` int,
  `DepartmentID` int,
  `EmployeeID` int,
  `AccountID` int PRIMARY KEY,
  `CustomerName` varchar(255),
  `AccountType` varchar(255),
  `Balance` decimal,
  `PhoneNum` varchar(255)
);

CREATE TABLE `Accounts` (
  `BankID` int,
  `AccountID` int,
  `Balance` decimal PRIMARY KEY,
  `Chequing` char,
  `Savings` char,
  `LineOfCredit` char
);

CREATE TABLE `Transactions` (
  `BankID` int,
  `AccountID` int,
  `Balance` decimal,
  `Chequing` char,
  `Savings` char,
  `LineOfCredit` char
);

CREATE TABLE `Withdrawals` (
  `BankID` int,
  `AccountID` int,
  `Balance` decimal,
  `Chequing` char,
  `Savings` char,
  `LineOfCredit` char
);

CREATE TABLE `Deposits` (
  `BankID` int,
  `AccountID` int,
  `Balance` decimal,
  `Chequing` char,
  `Savings` char,
  `LineOfCredit` char
);

ALTER TABLE `Department` ADD FOREIGN KEY (`BankID`) REFERENCES `Bank` (`BankID`);

ALTER TABLE `Employee` ADD FOREIGN KEY (`BankID`) REFERENCES `Bank` (`BankID`);

ALTER TABLE `Employee` ADD FOREIGN KEY (`DepartmentID`) REFERENCES `Department` (`DepartmentID`);

ALTER TABLE `Customer` ADD FOREIGN KEY (`BankID`) REFERENCES `Bank` (`BankID`);

ALTER TABLE `Customer` ADD FOREIGN KEY (`DepartmentID`) REFERENCES `Department` (`DepartmentID`);

ALTER TABLE `Customer` ADD FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`EmployeeID`);

ALTER TABLE `Accounts` ADD FOREIGN KEY (`BankID`) REFERENCES `Bank` (`BankID`);

ALTER TABLE `Accounts` ADD FOREIGN KEY (`AccountID`) REFERENCES `Customer` (`AccountID`);

ALTER TABLE `Transactions` ADD FOREIGN KEY (`BankID`) REFERENCES `Bank` (`BankID`);

ALTER TABLE `Transactions` ADD FOREIGN KEY (`AccountID`) REFERENCES `Customer` (`AccountID`);

ALTER TABLE `Transactions` ADD FOREIGN KEY (`Balance`) REFERENCES `Accounts` (`Balance`);

ALTER TABLE `Withdrawals` ADD FOREIGN KEY (`BankID`) REFERENCES `Bank` (`BankID`);

ALTER TABLE `Withdrawals` ADD FOREIGN KEY (`AccountID`) REFERENCES `Customer` (`AccountID`);

ALTER TABLE `Withdrawals` ADD FOREIGN KEY (`Balance`) REFERENCES `Accounts` (`Balance`);

ALTER TABLE `Deposits` ADD FOREIGN KEY (`BankID`) REFERENCES `Bank` (`BankID`);

ALTER TABLE `Deposits` ADD FOREIGN KEY (`AccountID`) REFERENCES `Customer` (`AccountID`);

ALTER TABLE `Deposits` ADD FOREIGN KEY (`Balance`) REFERENCES `Accounts` (`Balance`);
