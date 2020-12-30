-- very important query -> show engine innodb status;

DROP DATABASE IF EXISTS `club`;
CREATE DATABASE IF NOT EXISTS `club`;
USE `club`;

DROP TABLE IF EXISTS `t_club`;
CREATE TABLE `t_club` (
  `id` SERIAL,
  `name` varchar(256) NOT NULL,
  `addr` varchar(512) NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT current_timestamp(),
  `updated_at` DATETIME DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB;

INSERT INTO `t_club` (`name`, `addr`) VALUES
('Chetla Agrani Club', 'ZYX, Chetla, Kolkata - 700027');

DROP TABLE IF EXISTS `t_user_profile`;
CREATE TABLE `t_user_profile` (
  `id` SERIAL,
  `first` varchar(128) NOT NULL,
  `last` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL UNIQUE,
  `phone` varchar(10) NOT NULL UNIQUE,
  `dob` DATE NOT NULL,
  `password_hash` varchar(64) NOT NULL,
  `salt` varchar(30) NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT current_timestamp(),
  `updated_at` DATETIME DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT 1
) ENGINE=InnoDB;
