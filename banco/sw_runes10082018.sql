/*
SQLyog Professional v12.09 (64 bit)
MySQL - 10.1.25-MariaDB : Database - sw_runes
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
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
  `Flat` char(1) DEFAULT NULL,
  PRIMARY KEY (`idAtributo`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `atribrunas` */

insert  into `atribrunas`(`idAtributo`,`Atributo`,`Flat`) values (1,'HP',NULL),(2,'HP','%'),(3,'DEF',NULL),(4,'DEF','%'),(5,'ATK',''),(6,'ATK','%'),(7,'SPD',NULL),(8,'TAX','%'),(9,'DAN','%'),(10,'RES','%'),(11,'PRE','%');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `monstros` */

insert  into `monstros`(`idMonstro`,`Nome`,`Atributo`,`Observacao`) values (1,'Veromos',4,'Ifrit Dark'),(2,'Chasun',3,'Sky dancer wind');

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
  `Monstro` int(10) DEFAULT NULL,
  `Slot` int(1) DEFAULT NULL,
  `AtribPrincipal` int(10) NOT NULL,
  `AtribSecundario` int(10) DEFAULT NULL,
  `SubAtrib1` int(10) NOT NULL,
  `SubAtrib2` int(10) DEFAULT NULL,
  `SubAtrib3` int(10) DEFAULT NULL,
  `SubAtrib4` int(10) DEFAULT NULL,
  PRIMARY KEY (`idRuna`),
  KEY `Runas_fk0` (`Tipo`),
  KEY `Runas_fk1` (`Monstro`),
  KEY `Runas_fk2` (`AtribPrincipal`),
  KEY `Runas_fk4` (`SubAtrib1`),
  KEY `Runas_fk3` (`AtribSecundario`),
  KEY `Runas_fk5` (`SubAtrib2`),
  KEY `Runas_fk6` (`SubAtrib3`),
  KEY `Runas_fk7` (`SubAtrib4`),
  CONSTRAINT `Runas_fk0` FOREIGN KEY (`Tipo`) REFERENCES `tiposruna` (`idTipo`),
  CONSTRAINT `Runas_fk1` FOREIGN KEY (`Monstro`) REFERENCES `monstros` (`idMonstro`),
  CONSTRAINT `Runas_fk2` FOREIGN KEY (`AtribPrincipal`) REFERENCES `atribrunas` (`idAtributo`),
  CONSTRAINT `Runas_fk3` FOREIGN KEY (`AtribSecundario`) REFERENCES `atribrunas` (`idAtributo`),
  CONSTRAINT `Runas_fk4` FOREIGN KEY (`SubAtrib1`) REFERENCES `atribrunas` (`idAtributo`),
  CONSTRAINT `Runas_fk5` FOREIGN KEY (`SubAtrib2`) REFERENCES `atribrunas` (`idAtributo`),
  CONSTRAINT `Runas_fk6` FOREIGN KEY (`SubAtrib3`) REFERENCES `atribrunas` (`idAtributo`),
  CONSTRAINT `Runas_fk7` FOREIGN KEY (`SubAtrib4`) REFERENCES `atribrunas` (`idAtributo`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `runas` */

insert  into `runas`(`idRuna`,`Tipo`,`Monstro`,`Slot`,`AtribPrincipal`,`AtribSecundario`,`SubAtrib1`,`SubAtrib2`,`SubAtrib3`,`SubAtrib4`) values (7,2,1,1,1,4,5,1,11,1),(11,2,2,1,4,10,1,1,1,1);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `tiposruna` */

insert  into `tiposruna`(`idTipo`,`Tipo`,`Efeito`) values (1,'Violent','Dá uma rodada extra'),(2,'Revenge','Contra ataca');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
