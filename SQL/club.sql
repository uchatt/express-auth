-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 28, 2020 at 06:45 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `club`
--
CREATE DATABASE IF NOT EXISTS `club` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `club`;

-- --------------------------------------------------------

--
-- Table structure for table `t_club`
--

DROP TABLE IF EXISTS `t_club`;
CREATE TABLE `t_club` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `addr` varchar(512) NOT NULL,
  `created_at` date NOT NULL DEFAULT current_timestamp(),
  `updated_at` date DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_club`
--

INSERT INTO `t_club` (`id`, `name`, `addr`, `created_at`, `updated_at`, `is_active`) VALUES
(1, 'Chetla Agrani Club', 'ZYX, Chetla, Kolkata - 700027', '2020-12-26', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `t_club_sections`
--

DROP TABLE IF EXISTS `t_club_sections`;
CREATE TABLE `t_club_sections` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `section_type_id` int(11) NOT NULL,
  `created_at` date NOT NULL DEFAULT current_timestamp(),
  `updated_at` date DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_club_sections`
--

INSERT INTO `t_club_sections` (`id`, `name`, `section_type_id`, `created_at`, `updated_at`, `is_active`) VALUES
(1, 'Swimming', 1, '2020-12-26', NULL, 1),
(2, 'Badminton', 1, '2020-12-26', NULL, 1),
(3, 'Gym', 1, '2020-12-26', NULL, 1),
(4, 'Cricket', 1, '2020-12-26', NULL, 1),
(5, 'Football', 1, '2020-12-26', NULL, 1),
(6, 'Billiards', 1, '2020-12-26', NULL, 1),
(7, 'Volleyball', 1, '2020-12-26', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `t_club_section_type`
--

DROP TABLE IF EXISTS `t_club_section_type`;
CREATE TABLE `t_club_section_type` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `created_at` date NOT NULL DEFAULT current_timestamp(),
  `updated_at` date DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_club_section_type`
--

INSERT INTO `t_club_section_type` (`id`, `name`, `created_at`, `updated_at`, `is_active`) VALUES
(1, 'Sports', '2020-12-26', NULL, 1),
(2, 'Entertainment', '2020-12-26', NULL, 1),
(3, 'Charitable Contributions', '2020-12-26', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `t_user_profile`
--

DROP TABLE IF EXISTS `t_user_profile`;
CREATE TABLE `t_user_profile` (
  `id` int(11) NOT NULL,
  `first` varchar(128) NOT NULL,
  `last` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `dob` date NOT NULL,
  `password_hash` varchar(64) NOT NULL,
  `salt` varchar(30) NOT NULL,
  `created_at` date NOT NULL DEFAULT current_timestamp(),
  `updated_at` date DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `t_club`
--
ALTER TABLE `t_club`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_club_sections`
--
ALTER TABLE `t_club_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_section_type_id` (`section_type_id`);

--
-- Indexes for table `t_club_section_type`
--
ALTER TABLE `t_club_section_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_user_profile`
--
ALTER TABLE `t_user_profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `t_club`
--
ALTER TABLE `t_club`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `t_club_sections`
--
ALTER TABLE `t_club_sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `t_club_section_type`
--
ALTER TABLE `t_club_section_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `t_user_profile`
--
ALTER TABLE `t_user_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `t_club_sections`
--
ALTER TABLE `t_club_sections`
  ADD CONSTRAINT `fk_section_type_id` FOREIGN KEY (`section_type_id`) REFERENCES `t_club_section_type` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
