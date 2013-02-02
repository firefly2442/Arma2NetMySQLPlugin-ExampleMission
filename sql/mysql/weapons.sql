
--
-- Database: `weapons`
--
CREATE DATABASE `weapons` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `weapons`;



--
-- Table structure for table `users`
--

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