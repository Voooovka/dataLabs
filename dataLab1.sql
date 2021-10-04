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
CREATE TABLE IF NOT EXISTS `Vysochanskyi`.`subject` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Vysochanskyi`.`student_group`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Vysochanskyi`.`student_group` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `entry_year` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Vysochanskyi`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Vysochanskyi`.`student` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `surname` VARCHAR(30) NOT NULL,
  `name` VARCHAR(45) NULL,
  `student_group_id` INT NULL,
  PRIMARY KEY (`id`),
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
CREATE TABLE IF NOT EXISTS `Vysochanskyi`.`response` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data` DATETIME NOT NULL,
  `text` VARCHAR(200) NOT NULL,
  `rating` INT(5) NOT NULL,
  `student_id` INT NOT NULL,
  PRIMARY KEY (`id`),
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
CREATE TABLE IF NOT EXISTS `Vysochanskyi`.`cluster_program` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `time_of_event` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Vysochanskyi`.`lecturer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Vysochanskyi`.`lecturer` (
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
-- Table `Vysochanskyi`.`speakers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Vysochanskyi`.`speakers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `surname` VARCHAR(45) NOT NULL,
  `firm` VARCHAR(45) NOT NULL,
  `subject_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_speakers_subject1_idx` (`subject_id` ASC) VISIBLE,
  CONSTRAINT `fk_speakers_subject1`
    FOREIGN KEY (`subject_id`)
    REFERENCES `Vysochanskyi`.`subject` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Vysochanskyi`.`cluster_program_has_subject`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Vysochanskyi`.`cluster_program_has_subject` (
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
CREATE TABLE IF NOT EXISTS `Vysochanskyi`.`student_has_subject` (
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


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
