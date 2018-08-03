CREATE TABLE `Monstros` (
	`idMonstro` int(10) NOT NULL AUTO_INCREMENT,
	`Nome` varchar(25),
	`Atributo` int(10) NOT NULL,
	`Observacao` varchar(250),
	PRIMARY KEY (`idMonstro`)
);

CREATE TABLE `AtribMonstros` (
	`idAtributo` int(10) NOT NULL AUTO_INCREMENT,
	`Atributo` varchar(25),
	PRIMARY KEY (`idAtributo`)
);

CREATE TABLE `Runas` (
	`idRuna` int(10) NOT NULL AUTO_INCREMENT,
	`Tipo` int(10) NOT NULL,
	`Monstro` int(10),
	`Slot` int(1),
	`AtribPrincipal` int(10) NOT NULL,
	`AtribSecundario` int(10),
	`SubAtrib1` int(10) NOT NULL,
	`SubAtrib2` int(10),
	`SubAtrib3` int(10),
	`SubAtrib4` int(10),
	PRIMARY KEY (`idRuna`)
);

CREATE TABLE `TiposRuna` (
	`idTipo` int(10) NOT NULL AUTO_INCREMENT,
	`Tipo` varchar(20),
	`Efeito` varchar(250),
	PRIMARY KEY (`idTipo`)
);

CREATE TABLE `AtribRunas` (
	`idAtributo` int(10) NOT NULL AUTO_INCREMENT,
	`Atributo` varchar(5),
	`Flat` char,
	PRIMARY KEY (`idAtributo`)
);

CREATE TABLE `TimesChefes` (
	`idTime` int(10) NOT NULL AUTO_INCREMENT,
	`Chefe` int(10) NOT NULL,
	`Mob1` int(10) NOT NULL,
	`Mob2` int(10) NOT NULL,
	`Mob3` int(10) NOT NULL,
	`Mob4` int(10) NOT NULL,
	`Mob5` int(10) NOT NULL,
	PRIMARY KEY (`idTime`)
);

CREATE TABLE `Chefes` (
	`idChefe` int(10) NOT NULL AUTO_INCREMENT,
	`Nome` varchar(25),
	`Regiao` int(10) NOT NULL,
	PRIMARY KEY (`idChefe`)
);

CREATE TABLE `Regioes` (
	`idRegiao` int(10) NOT NULL AUTO_INCREMENT,
	`Regiao` varchar(25),
	PRIMARY KEY (`idRegiao`)
);

ALTER TABLE `Monstros` ADD CONSTRAINT `Monstros_fk0` FOREIGN KEY (`Atributo`) REFERENCES `AtribMonstros`(`idAtributo`);

ALTER TABLE `Runas` ADD CONSTRAINT `Runas_fk0` FOREIGN KEY (`Tipo`) REFERENCES `TiposRuna`(`idTipo`);

ALTER TABLE `Runas` ADD CONSTRAINT `Runas_fk1` FOREIGN KEY (`Monstro`) REFERENCES `Monstros`(`idMonstro`);

ALTER TABLE `Runas` ADD CONSTRAINT `Runas_fk2` FOREIGN KEY (`AtribPrincipal`) REFERENCES `AtribRunas`(`idAtributo`);

ALTER TABLE `Runas` ADD CONSTRAINT `Runas_fk3` FOREIGN KEY (`AtribSecundario`) REFERENCES `AtribRunas`(`idAtributo`);

ALTER TABLE `Runas` ADD CONSTRAINT `Runas_fk4` FOREIGN KEY (`SubAtrib1`) REFERENCES `AtribRunas`(`idAtributo`);

ALTER TABLE `Runas` ADD CONSTRAINT `Runas_fk5` FOREIGN KEY (`SubAtrib2`) REFERENCES `AtribRunas`(`idAtributo`);

ALTER TABLE `Runas` ADD CONSTRAINT `Runas_fk6` FOREIGN KEY (`SubAtrib3`) REFERENCES `AtribRunas`(`idAtributo`);

ALTER TABLE `Runas` ADD CONSTRAINT `Runas_fk7` FOREIGN KEY (`SubAtrib4`) REFERENCES `AtribRunas`(`idAtributo`);

ALTER TABLE `TimesChefes` ADD CONSTRAINT `TimesChefes_fk0` FOREIGN KEY (`Chefe`) REFERENCES `Chefes`(`idChefe`);

ALTER TABLE `TimesChefes` ADD CONSTRAINT `TimesChefes_fk1` FOREIGN KEY (`Mob1`) REFERENCES `Monstros`(`idMonstro`);

ALTER TABLE `TimesChefes` ADD CONSTRAINT `TimesChefes_fk2` FOREIGN KEY (`Mob2`) REFERENCES `Monstros`(`idMonstro`);

ALTER TABLE `TimesChefes` ADD CONSTRAINT `TimesChefes_fk3` FOREIGN KEY (`Mob3`) REFERENCES `Monstros`(`idMonstro`);

ALTER TABLE `TimesChefes` ADD CONSTRAINT `TimesChefes_fk4` FOREIGN KEY (`Mob4`) REFERENCES `Monstros`(`idMonstro`);

ALTER TABLE `TimesChefes` ADD CONSTRAINT `TimesChefes_fk5` FOREIGN KEY (`Mob5`) REFERENCES `Monstros`(`idMonstro`);

ALTER TABLE `Chefes` ADD CONSTRAINT `Chefes_fk0` FOREIGN KEY (`Regiao`) REFERENCES `Regioes`(`idRegiao`);

