-- MySQL Script generated by MySQL Workbench
-- 12/04/16 23:56:51
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema bd_loja
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bd_loja
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bd_loja` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema new_schema1
-- -----------------------------------------------------
USE `bd_loja` ;

-- -----------------------------------------------------
-- Table `bd_loja`.`produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_loja`.`produto` (
  `id_produto` INT NOT NULL,
  `codigo_produto` VARCHAR(45) NULL,
  `nome_produto` VARCHAR(45) NULL,
  `preco_produto` DOUBLE NULL,
  PRIMARY KEY (`id_produto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_loja`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_loja`.`cliente` (
  `id_cliente` INT NOT NULL,
  `nome_cliente` VARCHAR(45) NULL,
  `sobrenome_cliente` VARCHAR(45) NULL,
  PRIMARY KEY (`id_cliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_loja`.`venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_loja`.`venda` (
  `data_venda` DATE NULL,
  `id_cliente` INT NOT NULL,
  `cliente_id_cliente` INT NOT NULL,
  PRIMARY KEY (`id_cliente`),
  INDEX `fk_venda_cliente1_idx` (`cliente_id_cliente` ASC),
  CONSTRAINT `fk_venda_cliente1`
    FOREIGN KEY (`cliente_id_cliente`)
    REFERENCES `bd_loja`.`cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_loja`.`venda_produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_loja`.`venda_produto` (
  `quantidade` INT NULL,
  `preco_venda` DOUBLE NULL,
  `produto_id_produto` INT NOT NULL,
  `venda_id_venda` INT NOT NULL,
  `venda_id_cliente` INT NOT NULL,
  PRIMARY KEY (`produto_id_produto`, `venda_id_venda`, `venda_id_cliente`),
  INDEX `fk_venda_produto_produto_idx` (`produto_id_produto` ASC),
  INDEX `fk_venda_produto_venda1_idx` (`venda_id_venda` ASC, `venda_id_cliente` ASC),
  CONSTRAINT `fk_venda_produto_produto`
    FOREIGN KEY (`produto_id_produto`)
    REFERENCES `bd_loja`.`produto` (`id_produto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_venda_produto_venda1`
    FOREIGN KEY (`venda_id_cliente`)
    REFERENCES `bd_loja`.`venda` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;