

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


--
-- Database: `weapons`
--
CREATE DATABASE `weapons` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `weapons`;

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`arma`@`localhost` PROCEDURE `CreateNewLoadOut`(IN u INT(20), IN n VARCHAR(255), IN a VARCHAR(4096), IN b VARCHAR(4096), IN c VARCHAR(4096), IN d VARCHAR(4096), IN e VARCHAR(4096))
BEGIN
		INSERT into users (uid, name, ammo, weapons, backpackammo, backpackweapons, weapononback)
		VALUES(
                       u,n,a,b,c,d,e
                       );
    END$$

CREATE DEFINER=`arma`@`localhost` PROCEDURE `DeleteLoadoutUsingUIDandName`(IN u INT(20), IN n VARCHAR(255))
BEGIN
		DELETE from users
                WHERE uid = u AND name = n;
    END$$

CREATE DEFINER=`arma`@`localhost` PROCEDURE `GetLoadoutByUIDandName`(IN u INT(20), IN n VARCHAR(255))
BEGIN
		SELECT uid, name, ammo, weapons, backpackammo, backpackweapons, weapononback
		FROM users
		WHERE uid = u AND name = n;
    END$$

CREATE DEFINER=`arma`@`localhost` PROCEDURE `GetLoadoutNamesUsingUID`(IN u INT(20))
BEGIN
		SELECT name
		FROM users
		WHERE uid = u;
    END$$

CREATE DEFINER=`arma`@`localhost` PROCEDURE `UpdateLoadoutUsingUIDandName`(IN u INT(20), IN n VARCHAR(255), IN a VARCHAR(4096), IN b VARCHAR(4096), IN c VARCHAR(4096), IN d VARCHAR(4096), IN e VARCHAR(4096))
BEGIN
		UPDATE users
		SET
                      ammo = a,
                      weapons = b,
                      backpackammo = c,
                      backpackweapons = d,
                      weapononback = e
                 WHERE uid = u AND name = n;
    END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `ammo` varchar(4096) NOT NULL,
  `weapons` varchar(4096) NOT NULL,
  `backpackammo` varchar(4096) NOT NULL,
  `backpackweapons` varchar(4096) NOT NULL,
  `weapononback` varchar(4096) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;