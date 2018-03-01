-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 01, 2018 at 06:30 PM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `booking-app`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `ID` int(10) NOT NULL,
  `Name` char(100) NOT NULL,
  `numOfGuest` tinyint(4) NOT NULL,
  `Date` date NOT NULL,
  `Email` varchar(100) NOT NULL,
  `hour` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`ID`, `Name`, `numOfGuest`, `Date`, `Email`, `hour`) VALUES
(1, 'J D', 2, '2017-09-21', 'sample@email.com', '[5]'),
(2, 'David', 4, '2017-09-21', 'sample@email.com', '[8]'),
(3, 'Joe', 2, '2017-09-24', 'sample@email.com', '[6]'),
(4, 'Q', 2, '2017-09-21', 'sample@email.com', '[5]'),
(5, 'M', 4, '2017-09-21', 'sample@email.com', '[5]'),
(6, 'G', 2, '2017-09-21', 'sample@email.com', '[5]'),
(7, 'Steve', 2, '2018-02-26', 'steve@steve.com', '6'),
(8, 'sampleName', 2, '2018-02-27', 'sampleaddr@addr.com', '7');

-- --------------------------------------------------------

--
-- Table structure for table `bookingrestauranttables`
--

CREATE TABLE `bookingrestauranttables` (
  `bookingtableID` int(11) NOT NULL,
  `tableID` int(11) NOT NULL,
  `bookingID` int(10) NOT NULL,
  `hours` varchar(12) NOT NULL,
  `date` date NOT NULL,
  `canceled` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bookingrestauranttables`
--

INSERT INTO `bookingrestauranttables` (`bookingtableID`, `tableID`, `bookingID`, `hours`, `date`, `canceled`) VALUES
(1, 1, 1, '[5]', '2017-09-21', 0),
(3, 1, 7, '6', '2018-02-26', 0),
(4, 6, 8, '7', '2018-02-27', 0);

-- --------------------------------------------------------

--
-- Table structure for table `restauranttables`
--

CREATE TABLE `restauranttables` (
  `tableID` int(11) NOT NULL,
  `seats` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `restauranttables`
--

INSERT INTO `restauranttables` (`tableID`, `seats`) VALUES
(1, 2),
(2, 2),
(3, 2),
(4, 4),
(5, 4),
(6, 2),
(7, 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `bookingrestauranttables`
--
ALTER TABLE `bookingrestauranttables`
  ADD PRIMARY KEY (`bookingtableID`),
  ADD KEY `tableID` (`tableID`),
  ADD KEY `bookingID` (`bookingID`);

--
-- Indexes for table `restauranttables`
--
ALTER TABLE `restauranttables`
  ADD PRIMARY KEY (`tableID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `bookingrestauranttables`
--
ALTER TABLE `bookingrestauranttables`
  MODIFY `bookingtableID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `restauranttables`
--
ALTER TABLE `restauranttables`
  MODIFY `tableID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookingrestauranttables`
--
ALTER TABLE `bookingrestauranttables`
  ADD CONSTRAINT `bookingrestauranttables_ibfk_1` FOREIGN KEY (`tableID`) REFERENCES `restauranttables` (`tableID`),
  ADD CONSTRAINT `bookingrestauranttables_ibfk_2` FOREIGN KEY (`bookingID`) REFERENCES `booking` (`ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
