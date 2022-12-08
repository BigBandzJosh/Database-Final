-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 06, 2022 at 08:15 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bank`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `BankID` int(11) DEFAULT NULL,
  `AccountID` int(11) DEFAULT NULL,
  `Balance` decimal(10,0) NOT NULL,
  `Chequing` char(1) DEFAULT NULL,
  `Savings` char(1) DEFAULT NULL,
  `LineOfCredit` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`BankID`, `AccountID`, `Balance`, `Chequing`, `Savings`, `LineOfCredit`) VALUES
(1011, 4011, '1000', 'Y', 'N', 'N'),
(1012, 4012, '2000', 'N', 'Y', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE `bank` (
  `BankID` int(11) NOT NULL,
  `BankName` varchar(255) DEFAULT NULL,
  `BankAddress` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bank`
--

INSERT INTO `bank` (`BankID`, `BankName`, `BankAddress`) VALUES
(1011, 'Lower Sackville', '123 Sackville Drive'),
(1012, 'Halifax', '123 Halifax Road');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `BankID` int(11) DEFAULT NULL,
  `DepartmentID` int(11) DEFAULT NULL,
  `EmployeeID` int(11) DEFAULT NULL,
  `AccountID` int(11) NOT NULL,
  `CustomerName` varchar(255) DEFAULT NULL,
  `AccountType` varchar(255) DEFAULT NULL,
  `Balance` decimal(10,0) DEFAULT NULL,
  `PhoneNum` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`BankID`, `DepartmentID`, `EmployeeID`, `AccountID`, `CustomerName`, `AccountType`, `Balance`, `PhoneNum`) VALUES
(1011, 2011, 3011, 4011, 'Jordan Steves', 'Chequing', '1000', '1233211122'),
(1012, 2012, 3012, 4012, 'James Gordon', 'Savings', '1000', '1233211211');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `DepartmentID` int(11) NOT NULL,
  `DepartmentName` varchar(255) DEFAULT NULL,
  `BankID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`DepartmentID`, `DepartmentName`, `BankID`) VALUES
(2011, 'IT STAFF', 1011),
(2012, 'Logicistics', 1012);

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `BankID` int(11) DEFAULT NULL,
  `AccountID` int(11) DEFAULT NULL,
  `Balance` decimal(10,0) DEFAULT NULL,
  `Chequing` char(1) DEFAULT NULL,
  `Savings` char(1) DEFAULT NULL,
  `LineOfCredit` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `deposits`
--

INSERT INTO `deposits` (`BankID`, `AccountID`, `Balance`, `Chequing`, `Savings`, `LineOfCredit`) VALUES
(1011, 4011, '1000', 'Y', 'N', 'N'),
(1012, 4012, '2000', 'N', 'Y', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `BankID` int(11) DEFAULT NULL,
  `DepartmentID` int(11) DEFAULT NULL,
  `EmployeeID` int(11) NOT NULL,
  `EmployeeName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`BankID`, `DepartmentID`, `EmployeeID`, `EmployeeName`) VALUES
(1011, 2011, 3011, 'Josh Scott'),
(1012, 2012, 3012, 'John Steves');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `BankID` int(11) DEFAULT NULL,
  `AccountID` int(11) DEFAULT NULL,
  `Balance` decimal(10,0) DEFAULT NULL,
  `Chequing` char(1) DEFAULT NULL,
  `Savings` char(1) DEFAULT NULL,
  `LineOfCredit` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`BankID`, `AccountID`, `Balance`, `Chequing`, `Savings`, `LineOfCredit`) VALUES
(1011, 4011, '1000', 'Y', 'N', 'N'),
(1012, 4012, '2000', 'N', 'Y', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `withdrawals`
--

CREATE TABLE `withdrawals` (
  `BankID` int(11) DEFAULT NULL,
  `AccountID` int(11) DEFAULT NULL,
  `Balance` decimal(10,0) DEFAULT NULL,
  `Chequing` char(1) DEFAULT NULL,
  `Savings` char(1) DEFAULT NULL,
  `LineOfCredit` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `withdrawals`
--

INSERT INTO `withdrawals` (`BankID`, `AccountID`, `Balance`, `Chequing`, `Savings`, `LineOfCredit`) VALUES
(1011, 4011, '1000', 'Y', 'N', 'N'),
(1012, 4012, '2000', 'N', 'Y', 'N');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`Balance`),
  ADD KEY `BankID` (`BankID`),
  ADD KEY `AccountID` (`AccountID`);

--
-- Indexes for table `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`BankID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`AccountID`),
  ADD KEY `BankID` (`BankID`),
  ADD KEY `DepartmentID` (`DepartmentID`),
  ADD KEY `EmployeeID` (`EmployeeID`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`DepartmentID`),
  ADD KEY `BankID` (`BankID`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD KEY `BankID` (`BankID`),
  ADD KEY `AccountID` (`AccountID`),
  ADD KEY `Balance` (`Balance`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`EmployeeID`),
  ADD KEY `BankID` (`BankID`),
  ADD KEY `DepartmentID` (`DepartmentID`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD KEY `BankID` (`BankID`),
  ADD KEY `AccountID` (`AccountID`),
  ADD KEY `Balance` (`Balance`);

--
-- Indexes for table `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD KEY `BankID` (`BankID`),
  ADD KEY `AccountID` (`AccountID`),
  ADD KEY `Balance` (`Balance`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts`
--
ALTER TABLE `accounts`
  ADD CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`BankID`) REFERENCES `bank` (`BankID`),
  ADD CONSTRAINT `accounts_ibfk_2` FOREIGN KEY (`AccountID`) REFERENCES `customer` (`AccountID`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`BankID`) REFERENCES `bank` (`BankID`),
  ADD CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`DepartmentID`) REFERENCES `department` (`DepartmentID`),
  ADD CONSTRAINT `customer_ibfk_3` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`);

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_ibfk_1` FOREIGN KEY (`BankID`) REFERENCES `bank` (`BankID`);

--
-- Constraints for table `deposits`
--
ALTER TABLE `deposits`
  ADD CONSTRAINT `deposits_ibfk_1` FOREIGN KEY (`BankID`) REFERENCES `bank` (`BankID`),
  ADD CONSTRAINT `deposits_ibfk_2` FOREIGN KEY (`AccountID`) REFERENCES `customer` (`AccountID`),
  ADD CONSTRAINT `deposits_ibfk_3` FOREIGN KEY (`Balance`) REFERENCES `accounts` (`Balance`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`BankID`) REFERENCES `bank` (`BankID`),
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`DepartmentID`) REFERENCES `department` (`DepartmentID`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`BankID`) REFERENCES `bank` (`BankID`),
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`AccountID`) REFERENCES `customer` (`AccountID`),
  ADD CONSTRAINT `transactions_ibfk_3` FOREIGN KEY (`Balance`) REFERENCES `accounts` (`Balance`);

--
-- Constraints for table `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD CONSTRAINT `withdrawals_ibfk_1` FOREIGN KEY (`BankID`) REFERENCES `bank` (`BankID`),
  ADD CONSTRAINT `withdrawals_ibfk_2` FOREIGN KEY (`AccountID`) REFERENCES `customer` (`AccountID`),
  ADD CONSTRAINT `withdrawals_ibfk_3` FOREIGN KEY (`Balance`) REFERENCES `accounts` (`Balance`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
