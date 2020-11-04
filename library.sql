-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 04, 2020 at 03:07 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

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
CREATE DATABASE IF NOT EXISTS `library` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `library`;

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `address_ID` int(11) NOT NULL,
  `country` varchar(100) DEFAULT NULL,
  `town` varchar(100) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `number` varchar(10) DEFAULT NULL,
  `top` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`address_ID`, `country`, `town`, `street`, `number`, `top`) VALUES
(1, 'Austria', 'Vienna', 'Blablastreet', '11', '4'),
(2, 'Austria', 'Graz', 'Stadtpark', '1', '18'),
(3, 'Wakanda', 'Lullaby', 'meihartstraße', '66', '6'),
(4, 'Kroatien', 'Split', NULL, NULL, NULL),
(5, 'Belgien', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `author_ID` int(11) NOT NULL,
  `numberBooksWritten` int(11) DEFAULT NULL,
  `fk_person_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`author_ID`, `numberBooksWritten`, `fk_person_ID`) VALUES
(1, 10, 2),
(2, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `book_ID` int(11) NOT NULL,
  `isbn` int(11) DEFAULT NULL,
  `title` varchar(1000) DEFAULT NULL,
  `genre` varchar(50) DEFAULT NULL,
  `releaseDATE` date DEFAULT NULL,
  `borrowed` enum('false','true') NOT NULL,
  `blurb` varchar(2000) DEFAULT NULL,
  `numberOfPages` int(11) DEFAULT NULL,
  `dateBorrowed` date DEFAULT NULL,
  `row` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `fk_shelve_ID` int(11) DEFAULT NULL,
  `fk_author_ID` int(11) DEFAULT NULL,
  `fk_friend_ID` int(11) DEFAULT NULL,
  `fk_publisher_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`book_ID`, `isbn`, `title`, `genre`, `releaseDATE`, `borrowed`, `blurb`, `numberOfPages`, `dateBorrowed`, `row`, `position`, `fk_shelve_ID`, `fk_author_ID`, `fk_friend_ID`, `fk_publisher_ID`) VALUES
(1, 1234567890, 'Holy Moly Guacamole', 'Horror', '2020-11-01', 'true', 'Blurrrrrp lorem', 100, '2020-11-03', 1, 1, 1, 1, 1, 2),
(2, 1234567891, 'Post it massacre', 'comedy', '1928-03-01', 'true', 'Passionsblume Dr. Böhm', 483, '2020-11-04', 1, 2, 1, 2, 3, 3),
(3, 1234567892, 'Algorhitms', 'Drama', '2020-09-11', 'true', 'Are Algorhitms Racist?', 101, '2020-10-31', 1, 3, 1, 2, 2, 1),
(4, 1234567893, 'Kauf dich glücklich und verpiss dich!', 'Rom-Com', '1984-06-12', 'false', 'Ja, die verlieben sich und so', 1432, NULL, 1, 1, 2, 1, NULL, 1),
(5, 1234567894, 'Milchschaumreparatur', 'Sachbuch', '1992-07-09', 'false', 'Machen Sie Ihren Kaffee unwiderstehlich!', 56, NULL, 1, 2, 2, 1, NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `friend`
--

CREATE TABLE `friend` (
  `friend_ID` int(11) NOT NULL,
  `numberBorrowed` int(11) DEFAULT NULL,
  `warnings` int(11) DEFAULT NULL,
  `fk_person_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `friend`
--

INSERT INTO `friend` (`friend_ID`, `numberBorrowed`, `warnings`, `fk_person_ID`) VALUES
(1, NULL, NULL, 4),
(2, 100, 5, 3),
(3, NULL, NULL, 5);

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `person_ID` int(11) NOT NULL,
  `firstName` varchar(55) DEFAULT NULL,
  `lastName` varchar(55) DEFAULT NULL,
  `telephoneNumber` int(11) DEFAULT NULL,
  `fk_address_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`person_ID`, `firstName`, `lastName`, `telephoneNumber`, `fk_address_ID`) VALUES
(1, 'Bla', 'Blublu', 98123, 2),
(2, 'Simon', 'Bauer', 8004, 1),
(3, 'Karen', 'Authorson', 9752, 4),
(4, 'Bubi', 'Trump', 6845564, 3),
(5, 'Truman', 'Gump', 9849259, 5);

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

CREATE TABLE `publisher` (
  `publisher_ID` int(11) NOT NULL,
  `publisherName` varchar(100) DEFAULT NULL,
  `fk_address_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `publisher`
--

INSERT INTO `publisher` (`publisher_ID`, `publisherName`, `fk_address_ID`) VALUES
(1, 'Pinguin Haus', 5),
(2, 'Bibelshop', 3),
(3, 'Wakanda Press', 4);

-- --------------------------------------------------------

--
-- Table structure for table `shelve`
--

CREATE TABLE `shelve` (
  `shelve_ID` int(11) NOT NULL,
  `numberOfBooks` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shelve`
--

INSERT INTO `shelve` (`shelve_ID`, `numberOfBooks`) VALUES
(1, NULL),
(2, NULL),
(3, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_ID`);

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`author_ID`),
  ADD KEY `fk_person_ID` (`fk_person_ID`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`book_ID`),
  ADD KEY `fk_shelve_ID` (`fk_shelve_ID`),
  ADD KEY `fk_author_ID` (`fk_author_ID`),
  ADD KEY `fk_friend_ID` (`fk_friend_ID`),
  ADD KEY `fk_publisher_ID` (`fk_publisher_ID`);

--
-- Indexes for table `friend`
--
ALTER TABLE `friend`
  ADD PRIMARY KEY (`friend_ID`),
  ADD KEY `fk_person_ID` (`fk_person_ID`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`person_ID`),
  ADD KEY `fk_address_ID` (`fk_address_ID`);

--
-- Indexes for table `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`publisher_ID`),
  ADD KEY `fk_address_ID` (`fk_address_ID`);

--
-- Indexes for table `shelve`
--
ALTER TABLE `shelve`
  ADD PRIMARY KEY (`shelve_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `address_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `book_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `author`
--
ALTER TABLE `author`
  ADD CONSTRAINT `author_ibfk_1` FOREIGN KEY (`fk_person_ID`) REFERENCES `person` (`person_ID`);

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`fk_shelve_ID`) REFERENCES `shelve` (`shelve_ID`),
  ADD CONSTRAINT `book_ibfk_2` FOREIGN KEY (`fk_author_ID`) REFERENCES `author` (`author_ID`),
  ADD CONSTRAINT `book_ibfk_3` FOREIGN KEY (`fk_friend_ID`) REFERENCES `friend` (`friend_ID`),
  ADD CONSTRAINT `book_ibfk_4` FOREIGN KEY (`fk_publisher_ID`) REFERENCES `publisher` (`publisher_ID`);

--
-- Constraints for table `friend`
--
ALTER TABLE `friend`
  ADD CONSTRAINT `friend_ibfk_1` FOREIGN KEY (`fk_person_ID`) REFERENCES `person` (`person_ID`);

--
-- Constraints for table `person`
--
ALTER TABLE `person`
  ADD CONSTRAINT `person_ibfk_1` FOREIGN KEY (`fk_address_ID`) REFERENCES `address` (`address_ID`);

--
-- Constraints for table `publisher`
--
ALTER TABLE `publisher`
  ADD CONSTRAINT `publisher_ibfk_1` FOREIGN KEY (`fk_address_ID`) REFERENCES `address` (`address_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
