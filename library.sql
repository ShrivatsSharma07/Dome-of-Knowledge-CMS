-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2020 at 02:39 PM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `FullName` varchar(100) DEFAULT NULL,
  `AdminEmail` varchar(120) DEFAULT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `FullName`, `AdminEmail`, `UserName`, `Password`, `updationDate`) VALUES
(1, 'Vaishnav Vivek Prabhu', 'vvp@gmail.com', 'admin', '12345678', '2020-10-17 15:56:16');

-- --------------------------------------------------------

--
-- Table structure for table `tblbooks`
--

CREATE TABLE `tblbooks` (
  `id` int(11) NOT NULL,
  `BookName` varchar(255) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp(),
  `Link` varchar(255) DEFAULT NULL,
  `subject` varchar(30) DEFAULT NULL,
  `Author` varchar(255) DEFAULT NULL,
  `ISBNNumber` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblbooks`
--

INSERT INTO `tblbooks` (`id`, `BookName`, `RegDate`, `Link`, `subject`, `Author`, `ISBNNumber`) VALUES
(1, 'PHP And MySql programming', '2017-07-08 20:04:55', 'https://www.google.com', 'Web Tech', NULL, NULL),
(3, 'physics', '2017-07-08 20:17:31', NULL, NULL, NULL, NULL),
(6, 'final-test', '2020-11-19 07:11:00', 'uploads/books/5fb61a84de6f47.37478077.png', 'final-tytest', 'author', 3333),
(7, 'fin', '2020-11-19 07:13:32', 'uploads/books/5fb61b1c917c24.03600879.png', 'fin', 'fin', 2222),
(8, '1234', '2020-11-19 07:14:17', 'uploads/books/5fb61b49663110.43807342.png', '12345', '123456', 1111);

-- --------------------------------------------------------

--
-- Table structure for table `tblissuedbookdetails`
--

CREATE TABLE `tblissuedbookdetails` (
  `id` int(11) NOT NULL,
  `BookId` int(11) DEFAULT NULL,
  `StudentID` varchar(150) DEFAULT NULL,
  `IssuesDate` timestamp NULL DEFAULT current_timestamp(),
  `fine` int(11) DEFAULT NULL,
  `Returned` tinyint(1) DEFAULT NULL,
  `ReturnDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblissuedbookdetails`
--

INSERT INTO `tblissuedbookdetails` (`id`, `BookId`, `StudentID`, `IssuesDate`, `fine`, `Returned`, `ReturnDate`) VALUES
(1, 1, 'SID002', '2017-07-15 06:09:47', 0, NULL, '0000-00-00 00:00:00'),
(2, 1, 'SID002', '2017-07-15 06:12:27', 5, NULL, '0000-00-00 00:00:00'),
(3, 3, 'SID002', '2017-07-15 06:13:40', NULL, NULL, '0000-00-00 00:00:00'),
(4, 3, 'SID002', '2017-07-15 06:23:23', 2, NULL, '0000-00-00 00:00:00'),
(5, 1, 'SID009', '2017-07-15 10:59:26', NULL, NULL, '0000-00-00 00:00:00'),
(6, 3, 'SID011', '2017-07-15 18:02:55', NULL, NULL, '0000-00-00 00:00:00'),
(7, 3, 'SID002', '2020-10-21 12:10:56', NULL, NULL, '0000-00-00 00:00:00'),
(8, NULL, '1', '2020-11-19 07:44:42', NULL, NULL, '0000-00-00 00:00:00'),
(9, NULL, '1', '2020-11-19 07:49:41', NULL, NULL, '0000-00-00 00:00:00'),
(10, NULL, '1', '2020-11-19 07:50:49', NULL, NULL, '0000-00-00 00:00:00'),
(11, 8, '1', '2020-11-19 07:57:12', NULL, 1, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tblnotes`
--

CREATE TABLE `tblnotes` (
  `id` int(11) NOT NULL,
  `Name` varchar(150) DEFAULT NULL,
  `Subject` varchar(150) DEFAULT NULL,
  `Status` int(1) DEFAULT NULL,
  `Link` varchar(150) DEFAULT NULL,
  `UploadDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblnotes`
--

INSERT INTO `tblnotes` (`id`, `Name`, `Subject`, `Status`, `Link`, `UploadDate`, `UpdationDate`) VALUES
(8, 'TEST32145', 'TEST12354', 1, 'https://www.google.com/maps', '2020-10-22 06:26:23', '2020-11-18 07:40:33'),
(11, 'OS_TEST-changed12', 'BEST-changed1', 1, '', '2020-11-18 05:21:00', '2020-11-21 12:24:54'),
(12, 'TEST-FIN123', 'TEST-Subject', 0, 'https://www.github.com', '2020-11-18 05:27:00', '0000-00-00 00:00:00'),
(13, 'Computational Thinking', 'Class 1', 1, 'https://www.test.com', '2020-11-18 13:10:59', '0000-00-00 00:00:00'),
(14, 'TEST', 'TEST123', 1, NULL, '2020-11-19 04:19:45', '0000-00-00 00:00:00'),
(15, 'TEST432', 'TEST543', 1, NULL, '2020-11-19 04:21:10', '0000-00-00 00:00:00'),
(16, 'TESTTTTT', 'TESTTTTTTTTTT', 1, NULL, '2020-11-19 04:22:39', '0000-00-00 00:00:00'),
(17, 'water', 'waterfall', 1, NULL, '2020-11-19 05:10:28', '0000-00-00 00:00:00'),
(18, 'efafa', 'sdfadf', 1, NULL, '2020-11-19 05:11:58', '0000-00-00 00:00:00'),
(19, 'final-test', 'final-test', 1, NULL, '2020-11-19 05:13:05', '0000-00-00 00:00:00'),
(20, 'final-test', 'final-test', 1, NULL, '2020-11-19 05:13:36', '0000-00-00 00:00:00'),
(21, 'dewdferefr', 'faraefraefrearf', 1, NULL, '2020-11-19 05:13:53', '0000-00-00 00:00:00'),
(22, 'wefwef', 'wefff', NULL, 'uploads/notes/5fb6024f91dca4.93184081.png', '2020-11-19 05:27:43', '0000-00-00 00:00:00'),
(23, 'wrrfjb', 'jlbfdbgkjhdbhbh', NULL, 'uploads/notes/5fb602e4d33d42.32001047.png', '2020-11-19 05:30:12', '0000-00-00 00:00:00'),
(24, 'testtttttttttttttttttttt', 'test', 1, 'uploads/notes/5fb60343c794e5.38914381.png', '2020-11-19 05:31:47', '2020-11-19 05:33:10'),
(25, 'ABCD', 'ECO', 1, 'uploads/notes/5fb60c6bb6f263.35801565.png', '2020-11-19 05:35:58', '2020-11-19 06:10:51');

-- --------------------------------------------------------

--
-- Table structure for table `tblstudents`
--

CREATE TABLE `tblstudents` (
  `id` int(11) NOT NULL,
  `StudentId` varchar(100) DEFAULT NULL,
  `FullName` varchar(120) DEFAULT NULL,
  `EmailId` varchar(120) DEFAULT NULL,
  `MobileNumber` char(11) DEFAULT NULL,
  `Password` varchar(120) DEFAULT NULL,
  `Status` int(1) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblstudents`
--

INSERT INTO `tblstudents` (`id`, `StudentId`, `FullName`, `EmailId`, `MobileNumber`, `Password`, `Status`, `RegDate`, `UpdationDate`) VALUES
(1, 'SID002', 'Vaishnav Vivek Prabhu', 'vvp@gmail.com', '9818698804', '12345678', 1, '2017-07-11 15:37:05', '2020-10-22 05:04:13'),
(4, 'SID005', 'sdfsd', 'csfsd@dfsfks.com', '8569710025', '92228410fc8b872914e023160cf4ae8f', 1, '2017-07-11 15:41:27', '2020-10-17 17:17:36'),
(8, 'SID009', 'test', 'test@gmail.com', '2359874527', 'f925916e2754e5e03f75dd58a5733251', 0, '2017-07-11 15:58:28', '2020-11-21 12:50:11'),
(9, 'SID010', 'Amit', 'amit@gmail.com', '8585856224', 'f925916e2754e5e03f75dd58a5733251', 1, '2017-07-15 13:40:30', NULL),
(10, 'SID011', 'Sarita Pandey', 'sarita@gmail.com', '4672423754', 'f925916e2754e5e03f75dd58a5733251', 1, '2017-07-15 18:00:59', NULL),
(11, '2', 'wefwf', 'dfasdfsd@gmail.cpm', '8977978', '25f9e794323b453885f5181f1b624d0b', 1, '2020-10-17 13:43:01', NULL),
(19, '1', 'VIVEK M PRABHU', 'vaishnavvprabhu@gmail.com', '7233561784', '1234567890', 1, '2020-11-18 05:04:34', NULL),
(22, '3', 'Vaishnav Vivek Prabhu', 'vvp@gmail.com', '9818698804', '123456789', 1, '2020-11-27 19:08:30', NULL),
(23, '4', 'Vaishnav Vivek Prabhu', 'vvp@gmail.com', '9818698804', '123456789', 1, '2020-11-27 19:12:15', NULL),
(24, '5', 'Vaishnav Vivek Prabhu', 'vvp@gmail.com', '9818698804', '12345678', 1, '2020-11-27 19:17:17', NULL),
(25, '19', 'Vaishnav Vivek Prabhu', 'vvp@gmail.com', '9818698804', '12345678', 1, '2020-11-27 22:33:42', NULL),
(26, '28', 'Vaishnav Vivek Prabhu', 'vvp@gmail.com', '9818698804', '12345678', 1, '2020-11-27 22:49:49', NULL),
(27, '29', 'Vaishnav Vivek Prabhu', 'vvp@gmail.com', '9818698804', '12345678', 1, '2020-11-27 22:50:08', NULL),
(28, '30', 'Vaishnav Vivek Prabhu', 'vvp@gmail.com', '9818698804', '12345678', 1, '2020-11-27 22:51:15', NULL),
(29, '31', 'Vaishnav Vivek Prabhu', 'vvp@gmail.com', '9818698804', '12345678', 1, '2020-11-27 22:57:32', NULL),
(30, '35', 'Vaishnav Vivek Prabhu', 'vaishnavvprabhu@gmail.com', '9818698805', '12345678', 1, '2020-11-30 07:52:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblvideos`
--

CREATE TABLE `tblvideos` (
  `id` int(11) NOT NULL,
  `Name` varchar(150) DEFAULT NULL,
  `Status` int(1) DEFAULT NULL,
  `UploadDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `Link` varchar(255) NOT NULL,
  `Subject` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblvideos`
--

INSERT INTO `tblvideos` (`id`, `Name`, `Status`, `UploadDate`, `UpdationDate`, `Link`, `Subject`) VALUES
(4, 'Class 21 - Computational Thinking Division B', 1, '2017-07-04 18:35:25', '2020-10-21 13:31:18', './Vex/test.mp3', NULL),
(5, 'Class 20 - Business Communication', 1, '2017-07-04 18:35:39', '2020-10-21 10:52:09', 'https://www.microsoft.com', NULL),
(6, 'Science', 1, '2017-07-04 18:35:55', '0000-00-00 00:00:00', '', NULL),
(7, 'Management', 0, '2017-07-04 18:36:16', '0000-00-00 00:00:00', '', NULL),
(8, 'sss', 1, '2020-10-21 08:19:55', '0000-00-00 00:00:00', 'www.google.com', NULL),
(9, 'ada', 1, '2020-10-22 06:10:32', '0000-00-00 00:00:00', 'dafdf', NULL),
(11, 'test-video-changed', 1, '2020-11-19 14:44:13', '2020-11-21 12:14:18', '', 'test-subject-chnaged'),
(16, '1234567890', 1, '2020-11-30 07:45:47', '0000-00-00 00:00:00', 'uploads/videos/5fc4a32b0bdd41.69473777.jpg', '1234567890');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblbooks`
--
ALTER TABLE `tblbooks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblissuedbookdetails`
--
ALTER TABLE `tblissuedbookdetails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblnotes`
--
ALTER TABLE `tblnotes`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `tblstudents`
--
ALTER TABLE `tblstudents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `StudentId` (`StudentId`);

--
-- Indexes for table `tblvideos`
--
ALTER TABLE `tblvideos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblbooks`
--
ALTER TABLE `tblbooks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tblissuedbookdetails`
--
ALTER TABLE `tblissuedbookdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tblnotes`
--
ALTER TABLE `tblnotes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `tblstudents`
--
ALTER TABLE `tblstudents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `tblvideos`
--
ALTER TABLE `tblvideos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
