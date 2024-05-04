-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema proje_deneme
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema proje_deneme
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `proje_deneme` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
-- -----------------------------------------------------
-- Schema yeni_deneme
-- -----------------------------------------------------
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Kimlik`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Kimlik` (
  `TcNo` VARCHAR(50) NOT NULL,
  `Ad` VARCHAR(45) NOT NULL,
  `Soyad` VARCHAR(45) NOT NULL,
  `Kimlikcol` VARCHAR(45) NULL,
  `Cinsiyet` VARCHAR(45) NOT NULL,
  `Anne_Adi` VARCHAR(45) NOT NULL,
  `Baba_Adi` VARCHAR(45) NOT NULL,
  `Dogum_Yeri` VARCHAR(45) NOT NULL,
  `Dogum_tarihi` DATETIME NOT NULL,
  `Medeni_Hal` VARCHAR(45) NOT NULL,
  `Kimlik_Id` INT NOT NULL,
  UNIQUE INDEX `TcNo_UNIQUE` (`TcNo` ASC) VISIBLE,
  PRIMARY KEY (`Kimlik_Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Bagisci`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Bagisci` (
  `Boy` INT NOT NULL,
  `Kilo` INT NOT NULL,
  `Egitim_Durumu` VARCHAR(45) NOT NULL,
  `Kilo` INT NOT NULL,
  `Bsgis_Gecmisi` INT NOT NULL,
  `Bagisci_Id` INT NOT NULL,
  PRIMARY KEY (`Bagisci_Id`))
ENGINE = InnoDB;

USE `proje_deneme` ;

-- -----------------------------------------------------
-- Table `proje_deneme`.`kimlik`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proje_deneme`.`kimlik` (
  `TcNo` VARCHAR(11) NOT NULL,
  `Ad` VARCHAR(50) NOT NULL,
  `Soyad` VARCHAR(50) NOT NULL,
  `Cinsiyet` VARCHAR(10) NOT NULL,
  `Anne_Adi` VARCHAR(50) NOT NULL,
  `Baba_Adi` VARCHAR(50) NOT NULL,
  `Dogum_Yeri` VARCHAR(50) NOT NULL,
  `Dogum_Tarihi`  NOT NULL,
  `Medeni_Hal` VARCHAR(10) NULL DEFAULT NULL,
  `Kimlik_ID`  NOT NULL,
  PRIMARY KEY (`Kimlik_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `proje_deneme`.`adres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proje_deneme`.`adres` (
  `Adres_ID`  NOT NULL,
  `Il` VARCHAR(20) NOT NULL,
  `Ilce` VARCHAR(20) NOT NULL,
  `Sokak` VARCHAR(20) NOT NULL,
  `Apartman_NO`  NOT NULL,
  `Daire_NO`  NOT NULL,
  INDEX `Adres_ID` (`Adres_ID` ASC) VISIBLE,
  CONSTRAINT `adres_ibfk_1`
    FOREIGN KEY (`Adres_ID`)
    REFERENCES `proje_deneme`.`kimlik` (`Kimlik_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `proje_deneme`.`sube`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proje_deneme`.`sube` (
  `Sube_ID`  NOT NULL,
  `Ad` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Sube_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `proje_deneme`.`doktor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proje_deneme`.`doktor` (
  `Ad` VARCHAR(50) NOT NULL,
  `Soyad` VARCHAR(50) NOT NULL,
  `Sube_ID`  NOT NULL,
  `Doktor_ID` INT NOT NULL,
  INDEX `Sube_ID` (`Sube_ID` ASC) VISIBLE,
  PRIMARY KEY (`Doktor_ID`),
  CONSTRAINT `doktor_ibfk_3`
    FOREIGN KEY (`Sube_ID`)
    REFERENCES `proje_deneme`.`sube` (`Sube_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `proje_deneme`.`kan_bankasi`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proje_deneme`.`kan_bankasi` (
  `Kan_Stogu` VARCHAR(50) NOT NULL,
  `Kan_Id` INT NOT NULL,
  PRIMARY KEY (`Kan_Id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `proje_deneme`.`Kan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proje_deneme`.`Kan` (
  `Kan_Id`  NOT NULL,
  `Kan_Tipi` VARCHAR(45) NOT NULL,
  CONSTRAINT `Kan_Id`
    FOREIGN KEY ()
    REFERENCES `proje_deneme`.`kan_bankasi` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `proje_deneme`.`bagisci`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proje_deneme`.`bagisci` (
  `Boy`  NOT NULL,
  `Kilo`  NOT NULL,
  `Egitim_Durumu` VARCHAR(50) NOT NULL,
  `Bagis_Gecmisi` VARCHAR(50) NULL DEFAULT NULL,
  `Bagisci_ID`  NOT NULL,
  `Doktor_ID` INT NOT NULL,
  `Kan_Id` INT NOT NULL,
  INDEX `Bagisci_ID` (`Bagisci_ID` ASC) VISIBLE,
  INDEX `fk_bagisci_doktor1_idx` (`Doktor_ID` ASC) VISIBLE,
  CONSTRAINT `bagisci_ibfk_1`
    FOREIGN KEY (`Bagisci_ID`)
    REFERENCES `proje_deneme`.`kimlik` (`Kimlik_ID`),
  CONSTRAINT `fk_bagisci_doktor1`
    FOREIGN KEY (`Doktor_ID`)
    REFERENCES `proje_deneme`.`doktor` (`Doktor_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Kan_Id`
    FOREIGN KEY ()
    REFERENCES `proje_deneme`.`Kan` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `proje_deneme`.`bagis_islemi`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proje_deneme`.`bagis_islemi` (
  `Bagis_Tarihi`  NOT NULL,
  `Bagisci_ID`  NOT NULL,
  `Doktor_ID`  NOT NULL,
  `Bagis_Tipi` VARCHAR(50) NOT NULL,
  INDEX `Bagisci_ID` (`Bagisci_ID` ASC) VISIBLE,
  CONSTRAINT `bagis_islemi_ibfk_1`
    FOREIGN KEY (`Bagisci_ID`)
    REFERENCES `proje_deneme`.`bagisci` (`Bagisci_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `proje_deneme`.`iletisim`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proje_deneme`.`iletisim` (
  `Iletisim_ID`  NOT NULL,
  `cep_telefonu` VARCHAR(9) NULL DEFAULT NULL,
  `ev_telefonu` VARCHAR(10) NULL DEFAULT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  INDEX `Iletisim_ID` (`Iletisim_ID` ASC) VISIBLE,
  CONSTRAINT `iletisim_ibfk_1`
    FOREIGN KEY (`Iletisim_ID`)
    REFERENCES `proje_deneme`.`kimlik` (`Kimlik_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `proje_deneme`.`sube_adres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proje_deneme`.`sube_adres` (
  `Adres_ID`  NOT NULL,
  `Il` VARCHAR(20) NOT NULL,
  `Ilce` VARCHAR(20) NOT NULL,
  `Sokak` VARCHAR(20) NOT NULL,
  INDEX `Adres_ID` (`Adres_ID` ASC) VISIBLE,
  CONSTRAINT `sube_adres_ibfk_1`
    FOREIGN KEY (`Adres_ID`)
    REFERENCES `proje_deneme`.`sube` (`Sube_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `proje_deneme`.`sube_iletisim`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proje_deneme`.`sube_iletisim` (
  `Iletisim_ID`  NOT NULL,
  `Telefon` VARCHAR(50) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  INDEX `Iletisim_ID` (`Iletisim_ID` ASC) VISIBLE,
  CONSTRAINT `sube_iletisim_ibfk_1`
    FOREIGN KEY (`Iletisim_ID`)
    REFERENCES `proje_deneme`.`sube` (`Sube_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
