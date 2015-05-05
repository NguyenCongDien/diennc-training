-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema project_training
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema project_training
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `project_training` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `project_training` ;

-- -----------------------------------------------------
-- Table `project_training`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project_training`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(60) NULL,
  `password` VARCHAR(50) NULL,
  `email` VARCHAR(120) NULL,
  `created_date` DATETIME NULL,
  `modifed_date` DATETIME NULL,
  `default_wallet` INT(7) NULL,
  `default_current` INT(7) NULL,
  `phone` VARCHAR(25) NULL,
  `delete_flag` TINYINT(1) NULL,
  `wallets_id` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project_training`.`currencies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project_training`.`currencies` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `comment` VARCHAR(255) NULL,
  `delete_flag` TINYINT(1) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project_training`.`wallets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project_training`.`wallets` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  `value` DECIMAL(10,2) NULL,
  `created_date` DATETIME NULL,
  `modifed_date` DATETIME NULL,
  `deleted_flag` TINYINT(1) NULL,
  `currency_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_wallets_currencies_idx` (`currency_id` ASC),
  INDEX `fk_wallets_users1_idx` (`user_id` ASC),
  CONSTRAINT `fk_wallets_currencies`
    FOREIGN KEY (`currency_id`)
    REFERENCES `project_training`.`currencies` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_wallets_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `project_training`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project_training`.`specials`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project_training`.`specials` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `comment` VARCHAR(255) NULL,
  `delete_flag` TINYINT(1) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project_training`.`types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project_training`.`types` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `comment` VARCHAR(255) NULL,
  `delete_flag` TINYINT(1) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project_training`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project_training`.`categories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  `created_date` DATETIME NULL,
  `modifed_date` DATETIME NULL,
  `delete_flag` TINYINT(1) NULL,
  `wallet_id` INT NOT NULL,
  `special_id` INT NOT NULL,
  `type_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_categories_wallets1_idx` (`wallet_id` ASC),
  INDEX `fk_categories_specials1_idx` (`special_id` ASC),
  INDEX `fk_categories_types1_idx` (`type_id` ASC),
  CONSTRAINT `fk_categories_wallets1`
    FOREIGN KEY (`wallet_id`)
    REFERENCES `project_training`.`wallets` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_categories_specials1`
    FOREIGN KEY (`special_id`)
    REFERENCES `project_training`.`specials` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_categories_types1`
    FOREIGN KEY (`type_id`)
    REFERENCES `project_training`.`types` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project_training`.`transactions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project_training`.`transactions` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(250) NULL,
  `value` DECIMAL(10,2) NULL,
  `created_date` DATETIME NULL,
  `modifed_date` DATETIME NULL,
  `date_execution` DATETIME NULL,
  `comment` VARCHAR(255) NULL,
  `category_id` VARCHAR(45) NULL,
  `parent_id` INT NULL,
  `delete_flag` TINYINT(1) NULL,
  `categories_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_transactions_categories1_idx` (`categories_id` ASC),
  CONSTRAINT `fk_transactions_categories1`
    FOREIGN KEY (`categories_id`)
    REFERENCES `project_training`.`categories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `project_training` ;

-- -----------------------------------------------------
-- Placeholder table for view `project_training`.`view1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project_training`.`view1` (`id` INT);

-- -----------------------------------------------------
-- View `project_training`.`view1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project_training`.`view1`;
USE `project_training`;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
