-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.15 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             9.4.0.5125
-- Updated : 16.05.2019 - raphael.favre
--                Add tables ?rents' and rents 'details' with datas
-- 
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


DROP DATABASE IF EXISTS `snows`;

-- Dumping database structure for snows
CREATE DATABASE IF NOT EXISTS `snows` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `snows`;

-- Dumping structure for table snows.snows
CREATE TABLE IF NOT EXISTS `snows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(4) NOT NULL,
  `brand` varchar(20) NOT NULL,
  `model` varchar(30) NOT NULL,
  `snowLength` int(4) unsigned NOT NULL,
  `qtyAvailable` smallint(6) NOT NULL DEFAULT '0',
  `description` varchar(200) NOT NULL DEFAULT '0',
  `dailyPrice` float unsigned NOT NULL,
  `photo` varchar(50) DEFAULT NULL,
  `active` tinyint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `snow_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Dumping data for table snows.snows: ~9 rows (approximately)
/*!40000 ALTER TABLE `snows` DISABLE KEYS */;
INSERT INTO `snows` (`id`, `code`, `brand`, `model`, `snowLength`, `qtyAvailable`, `description`, `dailyPrice`, `photo`, `active`) VALUES
	(1, 'B101', 'Burton', 'Custom', 160, 22, 'La board la plus fiable de tous les temps, la solution snowboard pour tous les terrains. (Homme)', 29, 'view/content/images/B101_small.jpg', 1),
	(2, 'B126', 'Burton', 'Free Thinker', 165, 2, 'Élargissez votre vision grâce son interprétation du ride tout terrain dynamique sur la poudreuse. (Homme)', 45, 'view/content/images/B126_small.jpg', 1),
	(3, 'B327', 'Burton', 'Day Trader', 155, 6, 'Flottabilité sans effort et un contrôle qui renforce la confiance en soi. (Femme)', 25, 'view/content/images/B327_small.jpg', 0),
	(4, 'K266', 'K2', 'Wildheart', 152, 2, 'Keeping in versatile style (Femme)', 29, 'view/content/images/K266_small.jpg', 1),
	(5, 'N100', 'Nidecker', 'Tracer', 164, 11, 'Une expérience de carve hors du commun. Idéal pour carver comme jamais (Homme et femme)', 39, 'view/content/images/N100_small.jpg', 1),
	(6, 'N754', 'Nidecker', 'Ultralight', 166, 26, 'A la pointe de la technologie. Idéal pour le freeride sur les faces engagées (Homme et femme)', 59, 'view/content/images/N754_small.jpg', 1),
	(7, 'P067', 'Prior', 'Brandwine 153', 154, 9, 'High performance, directional Freeride board, draws a smooth, stable and fast line through all snow conditions. (Femme)', 49, 'view/content/images/P067_small.jpg', 1),
	(8, 'P165', 'Prior', 'BC Split 161', 169, 1, 'Sa forme directionnelle Freeride offre une ride plutôt douce et stable dans une variété de conditions', 35, 'view/content/images/P165_small.jpg', 1),
	(9, 'K409', 'K2', 'Lime Lite', 149, 15, 'Best For Freestyle Evolution with a Focus on Fun (Femme)', 55, 'view/content/images/K409_small.jpg', 1);
/*!40000 ALTER TABLE `snows` ENABLE KEYS */;

-- Dumping structure for table snows.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userEmailAddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `userHashPsw` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `userType` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userEmailAddress` (`userEmailAddress`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO `users` (`id`, `userEmailAddress`, `userHashPsw`, `userType`) VALUES
(1, 'rfa@swiss.com', '$2y$10$lBiCFchQlKoUQMIrcLlfieurd5ykXRPy70OvLSP.Z0mVvVrMmwbsi', 1),
(2, 'admin@swiss.com', '0000-00-00', 2);


-- -----------------------------------------------------
-- Table `snows`.`rents`
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS `rents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(45) DEFAULT NULL,
  `dateStart` date NOT NULL,
  `idUser` int(10) unsigned NOT NULL,
  
  PRIMARY KEY (`id`),

    KEY `fk_tbllocation_tblClient1` (`idUser`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

-- Insertion des données de la table snows.rents

INSERT INTO `rents` (`id`, `status`, `dateStart`, `idUser`) VALUES
(25, 'ouvert', '0000-00-00', 1),
(26, 'ouvert', '0000-00-00', 1),
(32, 'ouvert', '2015-01-13', 1),
(33, 'ouvert', '2015-11-03', 1);


-- -----------------------------------------------------
-- Table `snows`.`rentsDetails`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `rentsDetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '	',
  `idSnow` int(10) NOT NULL,
  `idRent` int(11) NOT NULL,
  `nbDays` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'sorti',
  PRIMARY KEY (`id`),
  KEY `fk_tblLocationSurf_tblsurf` (`idSnow`),
  KEY `fk_tblLocationSurf_tbllocation1` (`idRent`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Contenu de la table `tbllocationsurf`
-- rents details content


INSERT INTO `rentsDetails` (`id`, `idSnow`, `idRent`, `nbDays`, `quantity`, `status`) VALUES

(15, 2, 25, 1, 14, 'retourne'),
(16, 6, 25, 2, 21, 'sorti'),
(17, 2, 26, 1, 14, 'sorti'),
(18, 6, 26, 2, 21, 'sorti'),
(22, 1, 32, 3, 3, 'sorti'),
(23, 6, 32, 7, 7, 'sorti'),
(24, 2, 32, 1, 2, 'ouvert'),
(25, 1, 32, 1, 11, 'ouvert'),
(26, 1, 33, 1, 10, 'ouvert');


-- Clés étrangères
-- Table rents: FK IdUser -> table users PK Id   
ALTER TABLE `rents`
	ADD CONSTRAINT `FK_rents_users` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`);


-- Table rentsdetails: FK IdSnow -> table snows PK Id
ALTER TABLE `rentsdetails`
	ADD CONSTRAINT `FK_rentsdetails_snows` FOREIGN KEY (`idSnow`) REFERENCES `snows` (`id`);

-- Table rentsdetails: FK IdRent -> table rents PK Id
ALTER TABLE `rentsdetails`
	ADD CONSTRAINT `FK_rentsdetails_rents` FOREIGN KEY (`idRent`) REFERENCES `rents` (`id`);	


/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
