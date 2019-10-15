-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 18, 2017 at 10:33 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.5.37

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mlb`
--

-- --------------------------------------------------------

--
-- Table structure for table `adm`
--

CREATE TABLE `adm` (
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `adm`
--

INSERT INTO `adm` (`username`, `password`) VALUES
('admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `cityname` varchar(100) NOT NULL,
  `constat` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`cityname`, `constat`) VALUES
('MELBOURNE', 1),
('EAST MELBOURNE', 1),
('WEST MELBOURNE', 1),
('NORTH MELBOURNE', 1),
('PORT MELBOURNE', 0);

-- --------------------------------------------------------

--
-- Table structure for table `consig`
--

CREATE TABLE `consig` (
  `id` int(10) NOT NULL,
  `ord_by` varchar(200) NOT NULL,
  `sc` varchar(100) NOT NULL,
  `dc` varchar(100) NOT NULL,
  `cc` varchar(100) NOT NULL,
  `serv_type` int(11) NOT NULL DEFAULT '2',
  `added_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(4) NOT NULL DEFAULT '-1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
--
--

-- --------------------------------------------------------

--
-- Table structure for table `distlist`
--

CREATE TABLE `distlist` (
  `city1` varchar(100) NOT NULL,
  `city2` varchar(100) NOT NULL,
  `dist` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
--
--


-- --------------------------------------------------------

--
-- Table structure for table `empuserinfo`
--

CREATE TABLE `empuserinfo` (
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `vstatus` int(1) NOT NULL DEFAULT '0',
  `pname` varchar(200) NOT NULL,
  `phno` varchar(15) NOT NULL,
  `eml` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `city` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
--
--


-- --------------------------------------------------------

--
-- Table structure for table `userinfo`
--

CREATE TABLE `userinfo` (
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `pname` varchar(100) NOT NULL,
  `phno` varchar(15) NOT NULL,
  `eml` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `city` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
--
--


-- --------------------------------------------------------

--
-- Table structure for table `vcons`
--

CREATE TABLE `vcons` (
  `id` int(10) NOT NULL,
  `price` int(10) NOT NULL,
  `vby` varchar(200) NOT NULL,
  `etd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 
--



--
-- Indexes for dumped tables
--

--
-- Indexes for table `adm`
--
ALTER TABLE `adm`
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `password` (`password`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD UNIQUE KEY `cityname` (`cityname`),
  ADD KEY `cityname_2` (`cityname`),
  ADD KEY `cityname_3` (`cityname`);

--
-- Indexes for table `consig`
--
ALTER TABLE `consig`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ord_by` (`ord_by`),
  ADD KEY `sc` (`sc`),
  ADD KEY `dc` (`dc`),
  ADD KEY `cc` (`cc`);

--
-- Indexes for table `distlist`
--
ALTER TABLE `distlist`
  ADD KEY `city1` (`city1`),
  ADD KEY `city2` (`city2`);

--
-- Indexes for table `empuserinfo`
--
ALTER TABLE `empuserinfo`
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `username_2` (`username`);

--
-- Indexes for table `userinfo`
--
ALTER TABLE `userinfo`
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `city` (`city`);

--
-- Indexes for table `vcons`
--
ALTER TABLE `vcons`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `vby` (`vby`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `consig`
--
ALTER TABLE `consig`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `consig`
--
ALTER TABLE `consig`
  ADD CONSTRAINT `consig_ibfk_1` FOREIGN KEY (`ord_by`) REFERENCES `userinfo` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `consig_ibfk_2` FOREIGN KEY (`sc`) REFERENCES `city` (`cityname`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `consig_ibfk_3` FOREIGN KEY (`dc`) REFERENCES `city` (`cityname`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `consig_ibfk_4` FOREIGN KEY (`cc`) REFERENCES `city` (`cityname`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `distlist`
--
ALTER TABLE `distlist`
  ADD CONSTRAINT `distlist_ibfk_1` FOREIGN KEY (`city1`) REFERENCES `city` (`cityname`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `distlist_ibfk_2` FOREIGN KEY (`city2`) REFERENCES `city` (`cityname`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vcons`
--
ALTER TABLE `vcons`
  ADD CONSTRAINT `vcons_ibfk_1` FOREIGN KEY (`id`) REFERENCES `consig` (`id`),
  ADD CONSTRAINT `vcons_ibfk_2` FOREIGN KEY (`vby`) REFERENCES `empuserinfo` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
