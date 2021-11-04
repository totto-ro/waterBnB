-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema water_bnb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `water_bnb` ;

-- -----------------------------------------------------
-- Schema water_bnb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `water_bnb` DEFAULT CHARACTER SET utf8 ;
USE `water_bnb` ;

-- -----------------------------------------------------
-- Table `water_bnb`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `water_bnb`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `email` VARCHAR(255) NULL,
  `password` VARCHAR(255) NULL,
  `type_user` INT NULL,
  `created_at` DATETIME NULL DEFAULT NOW(),
  `updated_at` DATETIME NULL DEFAULT NOW(),
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `water_bnb`.`places`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `water_bnb`.`places` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(255) NULL,
  `description` TEXT NULL,
  `cost` INT NULL,
  `pool_size` VARCHAR(45) NULL,
  `created_at` DATETIME NULL DEFAULT NOW(),
  `updated_at` DATETIME NULL DEFAULT NOW(),
  `host_id` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `water_bnb`.`reviews`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `water_bnb`.`reviews` (
  `user_id` INT NOT NULL,
  `place_id` INT NOT NULL,
  `rating` INT NULL,
  `commet` TEXT NULL,
  `created_at` DATETIME NULL DEFAULT NOW(),
  `updated_at` DATETIME NULL DEFAULT NOW(),
  PRIMARY KEY (`user_id`, `place_id`),
  INDEX `fk_users_has_places_places1_idx` (`place_id` ASC) VISIBLE,
  INDEX `fk_users_has_places_users1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_users_has_places_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `water_bnb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_has_places_places1`
    FOREIGN KEY (`place_id`)
    REFERENCES `water_bnb`.`places` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
