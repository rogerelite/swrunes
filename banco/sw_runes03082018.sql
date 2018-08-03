/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 10.1.24-MariaDB : Database - sw_runes
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`sw_runes` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `sw_runes`;

/*Table structure for table `atribmonstros` */

DROP TABLE IF EXISTS `atribmonstros`;

CREATE TABLE `atribmonstros` (
  `idAtributo` int(10) NOT NULL AUTO_INCREMENT,
  `Atributo` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`idAtributo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `atribmonstros` */

insert  into `atribmonstros`(`idAtributo`,`Atributo`) values (1,'Fogo'),(2,'Água'),(3,'Vento'),(4,'Escuridão'),(5,'Luz');

/*Table structure for table `atribrunas` */

DROP TABLE IF EXISTS `atribrunas`;

CREATE TABLE `atribrunas` (
  `idAtributo` int(10) NOT NULL AUTO_INCREMENT,
  `Atributo` varchar(5) DEFAULT NULL,
  `Flat` char(5) DEFAULT NULL,
  PRIMARY KEY (`idAtributo`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `atribrunas` */

insert  into `atribrunas`(`idAtributo`,`Atributo`,`Flat`) values (1,'',''),(2,'HP',''),(3,'HP','%'),(4,'DEF',''),(5,'DEF','%'),(6,'ATK',''),(7,'ATK','%'),(8,'TAX','%'),(9,'DAN','%'),(10,'SPD',''),(11,'RES','%'),(12,'PRE','%');

/*Table structure for table `chefes` */

DROP TABLE IF EXISTS `chefes`;

CREATE TABLE `chefes` (
  `idChefe` int(10) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(25) DEFAULT NULL,
  `Regiao` int(10) NOT NULL,
  PRIMARY KEY (`idChefe`),
  KEY `Chefes_fk0` (`Regiao`),
  CONSTRAINT `Chefes_fk0` FOREIGN KEY (`Regiao`) REFERENCES `regioes` (`idRegiao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `chefes` */

/*Table structure for table `conjrunas` */

DROP TABLE IF EXISTS `conjrunas`;

CREATE TABLE `conjrunas` (
  `idConjunto` int(10) NOT NULL AUTO_INCREMENT,
  `Slot1` int(10) NOT NULL,
  `Slot2` int(10) NOT NULL,
  `Slot3` int(10) NOT NULL,
  `Slot4` int(10) NOT NULL,
  `Slot5` int(10) NOT NULL,
  PRIMARY KEY (`idConjunto`),
  KEY `ConjRunas_fk0` (`Slot1`),
  KEY `ConjRunas_fk1` (`Slot2`),
  KEY `ConjRunas_fk2` (`Slot3`),
  KEY `ConjRunas_fk3` (`Slot4`),
  KEY `ConjRunas_fk4` (`Slot5`),
  CONSTRAINT `ConjRunas_fk0` FOREIGN KEY (`Slot1`) REFERENCES `runas` (`idRuna`),
  CONSTRAINT `ConjRunas_fk1` FOREIGN KEY (`Slot2`) REFERENCES `runas` (`idRuna`),
  CONSTRAINT `ConjRunas_fk2` FOREIGN KEY (`Slot3`) REFERENCES `runas` (`idRuna`),
  CONSTRAINT `ConjRunas_fk3` FOREIGN KEY (`Slot4`) REFERENCES `runas` (`idRuna`),
  CONSTRAINT `ConjRunas_fk4` FOREIGN KEY (`Slot5`) REFERENCES `runas` (`idRuna`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `conjrunas` */

/*Table structure for table `monstros` */

DROP TABLE IF EXISTS `monstros`;

CREATE TABLE `monstros` (
  `idMonstro` int(10) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(25) DEFAULT NULL,
  `Atributo` int(10) NOT NULL,
  `Observacao` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`idMonstro`),
  KEY `Monstros_fk0` (`Atributo`),
  CONSTRAINT `Monstros_fk0` FOREIGN KEY (`Atributo`) REFERENCES `atribmonstros` (`idAtributo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `monstros` */

/*Table structure for table `monstrosrunas` */

DROP TABLE IF EXISTS `monstrosrunas`;

CREATE TABLE `monstrosrunas` (
  `idMonstroRuna` int(10) NOT NULL AUTO_INCREMENT,
  `Monstro` int(10) NOT NULL,
  `ConjuntoRuna` int(10) NOT NULL,
  PRIMARY KEY (`idMonstroRuna`),
  KEY `MonstrosRunas_fk0` (`Monstro`),
  KEY `MonstrosRunas_fk1` (`ConjuntoRuna`),
  CONSTRAINT `MonstrosRunas_fk0` FOREIGN KEY (`Monstro`) REFERENCES `monstros` (`idMonstro`),
  CONSTRAINT `MonstrosRunas_fk1` FOREIGN KEY (`ConjuntoRuna`) REFERENCES `conjrunas` (`idConjunto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `monstrosrunas` */

/*Table structure for table `regioes` */

DROP TABLE IF EXISTS `regioes`;

CREATE TABLE `regioes` (
  `idRegiao` int(10) NOT NULL AUTO_INCREMENT,
  `Regiao` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`idRegiao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `regioes` */

/*Table structure for table `runas` */

DROP TABLE IF EXISTS `runas`;

CREATE TABLE `runas` (
  `idRuna` int(10) NOT NULL AUTO_INCREMENT,
  `Tipo` int(10) NOT NULL,
  `AtribPrincipal` int(10) NOT NULL,
  `AtribSecundario` int(10) NOT NULL,
  `SubAtrib1` int(10) NOT NULL,
  `SubAtrib2` int(10) NOT NULL,
  `SubAtrib3` int(10) NOT NULL,
  `SubAtrib4` int(10) NOT NULL,
  PRIMARY KEY (`idRuna`),
  KEY `Runas_fk0` (`Tipo`),
  KEY `Runas_fk1` (`AtribPrincipal`),
  KEY `Runas_fk2` (`AtribSecundario`),
  KEY `Runas_fk3` (`SubAtrib1`),
  KEY `Runas_fk4` (`SubAtrib2`),
  KEY `Runas_fk5` (`SubAtrib3`),
  KEY `Runas_fk6` (`SubAtrib4`),
  CONSTRAINT `Runas_fk0` FOREIGN KEY (`Tipo`) REFERENCES `tiposruna` (`idTipo`),
  CONSTRAINT `Runas_fk1` FOREIGN KEY (`AtribPrincipal`) REFERENCES `atribrunas` (`idAtributo`),
  CONSTRAINT `Runas_fk2` FOREIGN KEY (`AtribSecundario`) REFERENCES `atribrunas` (`idAtributo`),
  CONSTRAINT `Runas_fk3` FOREIGN KEY (`SubAtrib1`) REFERENCES `atribrunas` (`idAtributo`),
  CONSTRAINT `Runas_fk4` FOREIGN KEY (`SubAtrib2`) REFERENCES `atribrunas` (`idAtributo`),
  CONSTRAINT `Runas_fk5` FOREIGN KEY (`SubAtrib3`) REFERENCES `atribrunas` (`idAtributo`),
  CONSTRAINT `Runas_fk6` FOREIGN KEY (`SubAtrib4`) REFERENCES `atribrunas` (`idAtributo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `runas` */

/*Table structure for table `timeschefes` */

DROP TABLE IF EXISTS `timeschefes`;

CREATE TABLE `timeschefes` (
  `idTime` int(10) NOT NULL AUTO_INCREMENT,
  `Chefe` int(10) NOT NULL,
  `Mob1` int(10) NOT NULL,
  `Mob2` int(10) NOT NULL,
  `Mob3` int(10) NOT NULL,
  `Mob4` int(10) NOT NULL,
  `Mob5` int(10) NOT NULL,
  PRIMARY KEY (`idTime`),
  KEY `TimesChefes_fk0` (`Chefe`),
  KEY `TimesChefes_fk1` (`Mob1`),
  KEY `TimesChefes_fk2` (`Mob2`),
  KEY `TimesChefes_fk3` (`Mob3`),
  KEY `TimesChefes_fk4` (`Mob4`),
  KEY `TimesChefes_fk5` (`Mob5`),
  CONSTRAINT `TimesChefes_fk0` FOREIGN KEY (`Chefe`) REFERENCES `chefes` (`idChefe`),
  CONSTRAINT `TimesChefes_fk1` FOREIGN KEY (`Mob1`) REFERENCES `monstros` (`idMonstro`),
  CONSTRAINT `TimesChefes_fk2` FOREIGN KEY (`Mob2`) REFERENCES `monstros` (`idMonstro`),
  CONSTRAINT `TimesChefes_fk3` FOREIGN KEY (`Mob3`) REFERENCES `monstros` (`idMonstro`),
  CONSTRAINT `TimesChefes_fk4` FOREIGN KEY (`Mob4`) REFERENCES `monstros` (`idMonstro`),
  CONSTRAINT `TimesChefes_fk5` FOREIGN KEY (`Mob5`) REFERENCES `monstros` (`idMonstro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `timeschefes` */

/*Table structure for table `tiposruna` */

DROP TABLE IF EXISTS `tiposruna`;

CREATE TABLE `tiposruna` (
  `idTipo` int(10) NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(20) DEFAULT NULL,
  `Efeito` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`idTipo`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `tiposruna` */

insert  into `tiposruna`(`idTipo`,`Tipo`,`Efeito`) values (1,'',NULL),(2,'Revenge',NULL),(3,'Despair',NULL),(4,'Focus',NULL),(5,'Guard',NULL),(6,'Blade',NULL),(7,'Will',NULL),(8,'Swift',NULL),(9,'Rage',NULL),(10,'Vampire',NULL),(11,'Destroy',NULL),(12,'Nêmesis',NULL),(13,'Energy',NULL),(14,'Fatal',NULL),(15,'Endure',NULL),(16,'Shield',NULL),(17,'Violent',NULL),(18,'Determination',NULL),(19,'Enhance',NULL),(20,'Accuracy',NULL),(21,'Tolerance',NULL),(22,'Fight',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
