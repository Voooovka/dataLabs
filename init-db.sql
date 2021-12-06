-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0;
SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0;
SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE =
        'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema lab7
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lab7
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `lab7`;
CREATE SCHEMA IF NOT EXISTS `lab7` DEFAULT CHARACTER SET utf8;
USE `lab7`;

-- -----------------------------------------------------
-- Table `lab7`.`coworker`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab7`.`coworker`
(
    `id`                 INT          NOT NULL AUTO_INCREMENT,
    `surname`            VARCHAR(45)  NOT NULL,
    `name`               VARCHAR(45)  NOT NULL,
    `seniority`          INT          NOT NULL,
    `dob`                DATE         NOT NULL,
    `passport_number`    VARCHAR(100) NOT NULL,
    `position_id`        INT          NOT NULL,
    `academic_status_id` INT          NOT NULL,
    `degree_id`          INT          NOT NULL,
    PRIMARY KEY (`id`)
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab7`.`discipline`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab7`.`discipline`
(
    `id`              INT          NOT NULL AUTO_INCREMENT,
    `name`            VARCHAR(45)  NOT NULL,
    `semester_number` INT          NOT NULL,
    `code`            VARCHAR(100) NOT NULL,
    `assessment_id`   INT          NOT NULL,
    PRIMARY KEY (`id`)
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab7`.`position`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab7`.`position`
(
    `id`   INT         NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`id`)
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab7`.`academic_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab7`.`academic_status`
(
    `id`   INT         NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`id`)
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab7`.`degree`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab7`.`degree`
(
    `id`   INT         NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`id`)
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab7`.`coworker_discipline`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab7`.`coworker_discipline`
(
    `coworker_id`   INT NOT NULL,
    `discipline_id` INT NOT NULL,
    PRIMARY KEY (`coworker_id`, `discipline_id`)
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab7`.`assessment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab7`.`assessment`
(
    `id`   INT         NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`id`)
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab7`.`position_logs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab7`.`position_logs`
(
    `id`           INT         NOT NULL AUTO_INCREMENT,
    `time_deleted` TIMESTAMP   NOT NULL,
    `name`         VARCHAR(45) NOT NULL,
    PRIMARY KEY (`id`)
)
    ENGINE = InnoDB;


-- FILL TABLES
-- POSITION
INSERT INTO `lab7`.`position` (`name`)
VALUES ('Doctor');
INSERT INTO `lab7`.`position` (`name`)
VALUES ('IT-specialist');
INSERT INTO `lab7`.`position` (`name`)
VALUES ('Lawyer');


-- ACADEMIC_STATUS
INSERT INTO `lab7`.`academic_status` (`name`)
VALUES ('docent');
INSERT INTO `lab7`.`academic_status` (`name`)
VALUES ('professor');
INSERT INTO `lab7`.`academic_status` (`name`)
VALUES ('none');


-- DEGREE
INSERT INTO `lab7`.`degree` (`name`)
VALUES ('KTN');
INSERT INTO `lab7`.`degree` (`name`)
VALUES ('DTN');
INSERT INTO `lab7`.`degree` (`name`)
VALUES ('None');


-- COWORKER
INSERT INTO `lab7`.`coworker` (`surname`, `name`, `seniority`, `dob`, `passport_number`, `position_id`,
                               `academic_status_id`, `degree_id`)
VALUES ('Johnson', 'Mike', '4', '2003-12-23', 'DF-345648', '1', '1', '1');
INSERT INTO `lab7`.`coworker` (`surname`, `name`, `seniority`, `dob`, `passport_number`, `position_id`,
                               `academic_status_id`, `degree_id`)
VALUES ('Cale', 'Mark', '5', '1997-05-30', 'DG-345678', '2', '1', '3');
INSERT INTO `lab7`.`coworker` (`surname`, `name`, `seniority`, `dob`, `passport_number`, `position_id`,
                               `academic_status_id`, `degree_id`)
VALUES ('Yakk', 'Tak', '0', '1923-11-11', 'DA-345678', '3', '2', '2');


-- ASSESSMENT
INSERT INTO `lab7`.`assessment` (`name`)
VALUES ('examination');
INSERT INTO `lab7`.`assessment` (`name`)
VALUES ('test');


-- DISCIPLINE
INSERT INTO `lab7`.`discipline` (`name`, `semester_number`, `code`, `assessment_id`)
VALUES ('Medicine', '1', '3453', '1');
INSERT INTO `lab7`.`discipline` (`name`, `semester_number`, `code`, `assessment_id`)
VALUES ('IT', '1', '9877', '2');
INSERT INTO `lab7`.`discipline` (`name`, `semester_number`, `code`, `assessment_id`)
VALUES ('Juridical', '1', '2343', '1');


-- COWORKER_DISCIPLINE
INSERT INTO `lab7`.`coworker_discipline` (`coworker_id`, `discipline_id`)
VALUES ('1', '1');
INSERT INTO `lab7`.`coworker_discipline` (`coworker_id`, `discipline_id`)
VALUES ('2', '2');
INSERT INTO `lab7`.`coworker_discipline` (`coworker_id`, `discipline_id`)
VALUES ('3', '3');


SET SQL_MODE = @OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS;