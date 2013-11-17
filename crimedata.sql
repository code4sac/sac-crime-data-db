-- phpMyAdmin SQL Dump
-- version 4.1.0-alpha2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 17, 2013 at 10:38 AM
-- Server version: 5.5.29
-- PHP Version: 5.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `CrimeData`
--
CREATE DATABASE IF NOT EXISTS `CrimeData` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `CrimeData`;

-- --------------------------------------------------------

--
-- Table structure for table `dispatch`
--

CREATE TABLE IF NOT EXISTS `dispatch` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `internal_id` varchar(8) NOT NULL,
  `occdate` datetime NOT NULL,
  `location` varchar(255) NOT NULL,
  `apartment` varchar(255) NOT NULL,
  `district` varchar(10) NOT NULL,
  `beat` varchar(10) NOT NULL,
  `grid` varchar(10) NOT NULL,
  `x_coord` int(8) NOT NULL,
  `y_coord` int(8) NOT NULL,
  `code` varchar(10) NOT NULL,
  `description` text NOT NULL,
  `priority` int(8) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `internal_id` (`internal_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=271397 ;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE IF NOT EXISTS `reports` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `internal_id` varchar(8) NOT NULL,
  `occdate` datetime NOT NULL,
  `location` varchar(255) NOT NULL,
  `apartment` varchar(255) NOT NULL,
  `district` varchar(10) NOT NULL,
  `beat` varchar(10) NOT NULL,
  `grid` varchar(10) NOT NULL,
  `x_coord` int(8) NOT NULL,
  `y_coord` int(8) NOT NULL,
  `code` varchar(10) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `internal_id` (`internal_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=50459 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
