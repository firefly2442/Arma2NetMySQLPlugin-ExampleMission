-- Create "arma" user
CREATE USER 'arma'@'%' IDENTIFIED BY '123';

-- Database: `weapons`
CREATE DATABASE IF NOT EXISTS `weapons`;

-- Grant privileges
GRANT ALL PRIVILEGES ON `weapons` . * TO 'arma'@'%';

-- Switch to database weapons
USE `weapons`;

-- Table structure for table `users`
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `ammo` text,
  `weapons` text,
  `backpackammo` text,
  `backpackweapons` text,
  `weapononback` text,
  `oabackpack` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;