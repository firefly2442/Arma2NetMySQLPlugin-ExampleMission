

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
CREATE DEFINER=`arma`@`localhost` PROCEDURE `CreateNewLoadOut`(IN u INT(20), IN n VARCHAR(255), IN a TEXT, IN b TEXT, IN c TEXT, IN d TEXT, IN e TEXT, IN f TEXT)
BEGIN
		INSERT into users (uid, name, ammo, weapons, backpackammo, backpackweapons, weapononback, oabackpack)
		VALUES(
                       u,n,a,b,c,d,e,f
                       );
    END$$

CREATE DEFINER=`arma`@`localhost` PROCEDURE `DeleteLoadoutUsingUIDandName`(IN u INT(20), IN n VARCHAR(255))
BEGIN
		DELETE from users
                WHERE uid = u AND name = n LIMIT 1;
    END$$

CREATE DEFINER=`arma`@`localhost` PROCEDURE `GetLoadoutByUIDandName`(IN u INT(20), IN n VARCHAR(255))
BEGIN
		SELECT uid, name, ammo, weapons, backpackammo, backpackweapons, weapononback, oabackpack
		FROM users
		WHERE uid = u AND name = n;
    END$$

CREATE DEFINER=`arma`@`localhost` PROCEDURE `GetLoadoutNamesUsingUID`(IN u INT(20))
BEGIN
		SELECT name
		FROM users
		WHERE uid = u;
    END$$

CREATE DEFINER=`arma`@`localhost` PROCEDURE `UpdateLoadoutUsingUIDandName`(IN u INT(20), IN n VARCHAR(255), IN a TEXT, IN b TEXT, IN c TEXT, IN d TEXT, IN e TEXT, IN f TEXT)
BEGIN
		UPDATE users
		SET
                      ammo = a,
                      weapons = b,
                      backpackammo = c,
                      backpackweapons = d,
                      weapononback = e,
					  oabackpack = f
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
  `ammo` text NOT NULL,
  `weapons` text NOT NULL,
  `backpackammo` text NOT NULL,
  `backpackweapons` text NOT NULL,
  `weapononback` text NOT NULL,
  `oabackpack` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;