-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Vysochanskyi
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Vysochanskyi
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Vysochanskyi` DEFAULT CHARACTER SET utf8 ;
USE `Vysochanskyi` ;

-- -----------------------------------------------------
-- Table `Vysochanskyi`.`subject`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Vysochanskyi`.`subject`;
CREATE TABLE `Vysochanskyi`.`subject` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Vysochanskyi`.`student_group`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Vysochanskyi`.`student_group`;
CREATE TABLE `Vysochanskyi`.`student_group` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `entry_year` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Vysochanskyi`.`student`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Vysochanskyi`.`student`;
CREATE TABLE `Vysochanskyi`.`student` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `surname` VARCHAR(30) NOT NULL,
  `name` VARCHAR(45) NULL,
  `student_group_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `surname` (`surname` ASC),
  INDEX `fk_student_student_group1_idx` (`student_group_id` ASC) VISIBLE,
  CONSTRAINT `fk_student_student_group1`
    FOREIGN KEY (`student_group_id`)
    REFERENCES `Vysochanskyi`.`student_group` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Vysochanskyi`.`response`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Vysochanskyi`.`response`;
CREATE TABLE `Vysochanskyi`.`response` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data` DATETIME NOT NULL,
  `text` VARCHAR(200) NOT NULL,
  `rating` INT NOT NULL,
  `student_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `rating` (`rating` ASC),
  INDEX `fk_response_student1_idx` (`student_id` ASC) VISIBLE,
  CONSTRAINT `fk_response_student1`
    FOREIGN KEY (`student_id`)
    REFERENCES `Vysochanskyi`.`student` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Vysochanskyi`.`cluster_program`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Vysochanskyi`.`cluster_program`;
CREATE TABLE `Vysochanskyi`.`cluster_program` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `time_of_event` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Vysochanskyi`.`lecturer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Vysochanskyi`.`lecturer`;
CREATE TABLE `Vysochanskyi`.`lecturer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `surname` VARCHAR(45) NOT NULL,
  `subject_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_lecturer_subject_idx` (`subject_id` ASC) VISIBLE,
  CONSTRAINT `fk_lecturer_subject`
    FOREIGN KEY (`subject_id`)
    REFERENCES `Vysochanskyi`.`subject` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Vysochanskyi`.`speaker`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Vysochanskyi`.`speaker`;
CREATE TABLE `Vysochanskyi`.`speaker` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `surname` VARCHAR(45) NOT NULL,
  `firm` VARCHAR(45) NOT NULL,
  `subject_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `surname` (`surname` ASC),
  INDEX `fk_speaker_subject1_idx` (`subject_id` ASC) VISIBLE,
  CONSTRAINT `fk_speaker_subject1`
    FOREIGN KEY (`subject_id`)
    REFERENCES `Vysochanskyi`.`subject` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Vysochanskyi`.`cluster_program_has_subject`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Vysochanskyi`.`cluster_program_has_subject`;
CREATE TABLE `Vysochanskyi`.`cluster_program_has_subject` (
  `cluster_program_id` INT NOT NULL,
  `subject_id` INT NOT NULL,
  `id` INT NOT NULL AUTO_INCREMENT,
  INDEX `fk_cluster_program_has_subject_subject1_idx` (`subject_id` ASC) VISIBLE,
  INDEX `fk_cluster_program_has_subject_cluster_program1_idx` (`cluster_program_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_cluster_program_has_subject_cluster_program1`
    FOREIGN KEY (`cluster_program_id`)
    REFERENCES `Vysochanskyi`.`cluster_program` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cluster_program_has_subject_subject1`
    FOREIGN KEY (`subject_id`)
    REFERENCES `Vysochanskyi`.`subject` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Vysochanskyi`.`student_has_subject`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Vysochanskyi`.`student_has_subject`;
CREATE TABLE `Vysochanskyi`.`student_has_subject` (
  `subject_id` INT NOT NULL,
  `student_id` INT NOT NULL,
  `id` INT NOT NULL AUTO_INCREMENT,
  INDEX `fk_subject_has_student_student1_idx` (`student_id` ASC) VISIBLE,
  INDEX `fk_subject_has_student_subject1_idx` (`subject_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_subject_has_student_subject1`
    FOREIGN KEY (`subject_id`)
    REFERENCES `Vysochanskyi`.`subject` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_subject_has_student_student1`
    FOREIGN KEY (`student_id`)
    REFERENCES `Vysochanskyi`.`student` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `Vysochanskyi` ;

-- subject
INSERT INTO `Vysochanskyi`.`subject`(`name`) VALUES ('Math');
INSERT INTO `Vysochanskyi`.`subject`(`name`) VALUES ('Web');
INSERT INTO `Vysochanskyi`.`subject`(`name`) VALUES ('Data');
INSERT INTO `Vysochanskyi`.`subject`(`name`) VALUES ('Algo');
INSERT INTO `Vysochanskyi`.`subject`(`name`) VALUES ('Eng');

-- speaker
INSERT INTO `Vysochanskyi`.`speaker`(`surname`, `firm`, `subject_id`) VALUES ('Kyba', 'SoftServe', 1);
INSERT INTO `Vysochanskyi`.`speaker`(`surname`, `firm`, `subject_id`) VALUES ('Veres', 'SoftServe', 4);
INSERT INTO `Vysochanskyi`.`speaker`(`surname`, `firm`, `subject_id`) VALUES ('Mask', 'SpaceX', 3);
INSERT INTO `Vysochanskyi`.`speaker`(`surname`, `firm`) VALUES ('Einstein', 'World');
INSERT INTO `Vysochanskyi`.`speaker`(`surname`, `firm`) VALUES ('Newton', 'World');

-- lecturer
INSERT INTO `Vysochanskyi`.`lecturer`(`surname`, `subject_id`) VALUES ('Rubak', '1');
INSERT INTO `Vysochanskyi`.`lecturer`(`surname`, `subject_id`) VALUES ('Ivanov', '1');
INSERT INTO `Vysochanskyi`.`lecturer`(`surname`, `subject_id`) VALUES ('Bek', '3');
INSERT INTO `Vysochanskyi`.`lecturer`(`surname`, `subject_id`) VALUES ('Marchyk', '4');
INSERT INTO `Vysochanskyi`.`lecturer`(`surname`, `subject_id`) VALUES ('Ivanyk', '5');

-- cluster_program 
INSERT INTO `Vysochanskyi`.`cluster_program`(`name`, `time_of_event`) VALUES ('IT', '100');
INSERT INTO `Vysochanskyi`.`cluster_program`(`name`, `time_of_event`) VALUES ('Languages', '10');
INSERT INTO `Vysochanskyi`.`cluster_program`(`name`, `time_of_event`) VALUES ('Frontent', '10');
INSERT INTO `Vysochanskyi`.`cluster_program`(`name`, `time_of_event`) VALUES ('Backend', '10');
INSERT INTO `Vysochanskyi`.`cluster_program`(`name`, `time_of_event`) VALUES ('BigData', '10');

-- cluster_program_has_subject
INSERT INTO `Vysochanskyi`.`cluster_program_has_subject`(`cluster_program_id`, `subject_id`) VALUES ('1', '2');
INSERT INTO `Vysochanskyi`.`cluster_program_has_subject`(`cluster_program_id`, `subject_id`) VALUES ('1', '3');
INSERT INTO `Vysochanskyi`.`cluster_program_has_subject`(`cluster_program_id`, `subject_id`) VALUES ('1', '4');
INSERT INTO `Vysochanskyi`.`cluster_program_has_subject`(`cluster_program_id`, `subject_id`) VALUES ('3', '5');
INSERT INTO `Vysochanskyi`.`cluster_program_has_subject`(`cluster_program_id`, `subject_id`) VALUES ('4', '5');

-- student
INSERT INTO `Vysochanskyi`.`student`(`surname`, `name`, `student_group_id`) VALUES ('Vysochanskyi', 'Vovka', '1');
INSERT INTO `Vysochanskyi`.`student`(`surname`) VALUES ('Vavrunchyk');
INSERT INTO `Vysochanskyi`.`student`(`surname`, `name`) VALUES ('Androsiyk', 'Maks');
INSERT INTO `Vysochanskyi`.`student`(`surname`, `student_group_id`) VALUES ('Dmytryshyn', '11');
INSERT INTO `Vysochanskyi`.`student`(`surname`, `name`, `student_group_id`) VALUES ('Deinecka', 'Bogdana', '1');

-- student_has_subject
INSERT INTO `Vysochanskyi`.`student_has_subject`(`subject_id`, `student_id`) VALUES ('1', '1');
INSERT INTO `Vysochanskyi`.`student_has_subject`(`subject_id`, `student_id`) VALUES ('1', '2');
INSERT INTO `Vysochanskyi`.`student_has_subject`(`subject_id`, `student_id`) VALUES ('1', '3');
INSERT INTO `Vysochanskyi`.`student_has_subject`(`subject_id`, `student_id`) VALUES ('2', '5');
INSERT INTO `Vysochanskyi`.`student_has_subject`(`subject_id`, `student_id`) VALUES ('3', '5');

-- student_group 
INSERT INTO `Vysochanskyi`.`student_group`(`name`, `entry_year`) VALUES ('IR-21', 2020);
INSERT INTO `Vysochanskyi`.`student_group`(`name`, `entry_year`) VALUES ('IR-11', 2021);
INSERT INTO `Vysochanskyi`.`student_group`(`name`, `entry_year`) VALUES ('IR-22', 2020);
INSERT INTO `Vysochanskyi`.`student_group`(`name`, `entry_year`) VALUES ('IR-23', 2020);
INSERT INTO `Vysochanskyi`.`student_group`(`name`, `entry_year`) VALUES ('IR-12', 2021);

-- response
INSERT INTO `Vysochanskyi`.`response`(`data`, `text`, `rating`, `student_id`) VALUES ('1205-04-19 00:00:00', 'really good performance', 5, 1);
INSERT INTO `Vysochanskyi`.`response`(`data`, `text`, `rating`, `student_id`) VALUES ('1734-03-01 00:00:00', 'really bad performance', 2, 5);
INSERT INTO `Vysochanskyi`.`response`(`data`, `text`, `rating`, `student_id`) VALUES ('3076-12-29 00:00:00', 'really ideal performance', 1, 1);
INSERT INTO `Vysochanskyi`.`response`(`data`, `text`, `rating`, `student_id`) VALUES ('1567-10-13 00:00:00', 'really perfect performance', 4, 1);
INSERT INTO `Vysochanskyi`.`response`(`data`, `text`, `rating`, `student_id`) VALUES ('1943-01-09 00:00:00', 'really terrible performance', 3, 2);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;