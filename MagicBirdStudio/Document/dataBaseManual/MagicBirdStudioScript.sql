-- MySQL Script generated by MySQL Workbench
-- 2016年10月19日 星期三 22时35分20秒
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema MagicBirdStudio_RBAC
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MagicBirdStudio_RBAC
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MagicBirdStudio_RBAC` DEFAULT CHARACTER SET utf8 ;
USE `MagicBirdStudio_RBAC` ;

-- -----------------------------------------------------
-- Table `MagicBirdStudio_RBAC`.`AccountInfo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MagicBirdStudio_RBAC`.`AccountInfo` (
  `UserID` VARCHAR(16) NOT NULL COMMENT '用户ＩＤ(工号)',
  `UserName` VARCHAR(45) NOT NULL COMMENT '员工姓名',
  `Birthday` DATETIME NULL,
  `Telephone` VARCHAR(20) NOT NULL,
  `E-Mail` VARCHAR(45) NULL,
  `JobLevel` VARCHAR(45) NOT NULL COMMENT '记录员工职务\n如： \nXXX 部门  XXX 班组 XX(职务)\nXXX 部门 XX(职务)',
  `EntryTime` DATETIME NOT NULL COMMENT '入职时间',
  `isService` TINYINT(1) NOT NULL COMMENT '是否在职',
  PRIMARY KEY (`UserID`))
ENGINE = InnoDB
COMMENT = '员工基本信息登记表';


-- -----------------------------------------------------
-- Table `MagicBirdStudio_RBAC`.`GroupManager`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MagicBirdStudio_RBAC`.`GroupManager` (
  `GroupID` INT NOT NULL COMMENT '用户组ＩＤ',
  `GroupName` VARCHAR(45) NOT NULL,
  `GroupDescription` TEXT NULL COMMENT '用户组功能描述',
  PRIMARY KEY (`GroupID`))
ENGINE = InnoDB
COMMENT = '用户组管理';


-- -----------------------------------------------------
-- Table `MagicBirdStudio_RBAC`.`UserGroupMapping`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MagicBirdStudio_RBAC`.`UserGroupMapping` (
  `UserID` VARCHAR(16) NOT NULL,
  `GroupID` INT NOT NULL,
  PRIMARY KEY (`UserID`),
  INDEX `fk_UserGroupMapping_1_idx` (`GroupID` ASC),
  CONSTRAINT `fk_UserGroupMapping_Account`
    FOREIGN KEY (`UserID`)
    REFERENCES `MagicBirdStudio_RBAC`.`AccountInfo` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_UserGroupMapping_Group`
    FOREIGN KEY (`GroupID`)
    REFERENCES `MagicBirdStudio_RBAC`.`GroupManager` (`GroupID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '用户与用户组映射';


-- -----------------------------------------------------
-- Table `MagicBirdStudio_RBAC`.`RoleInfo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MagicBirdStudio_RBAC`.`RoleInfo` (
  `RoleID` INT NOT NULL COMMENT '角色ID',
  `RoleName` VARCHAR(45) NOT NULL COMMENT '角色名称',
  `RoleDescription` TEXT NULL COMMENT 'RoleDescription',
  PRIMARY KEY (`RoleID`))
ENGINE = InnoDB
COMMENT = '角色信息';


-- -----------------------------------------------------
-- Table `MagicBirdStudio_RBAC`.`GroupRoleMapping`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MagicBirdStudio_RBAC`.`GroupRoleMapping` (
  `GroupID` INT NOT NULL,
  `RoleID` INT NOT NULL,
  PRIMARY KEY (`GroupID`),
  INDEX `fk_GroupRoleMapping_1_idx` (`RoleID` ASC),
  CONSTRAINT `fk_GroupRoleMapping_Group`
    FOREIGN KEY (`GroupID`)
    REFERENCES `MagicBirdStudio_RBAC`.`GroupManager` (`GroupID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_GroupRoleMapping_Role`
    FOREIGN KEY (`RoleID`)
    REFERENCES `MagicBirdStudio_RBAC`.`RoleInfo` (`RoleID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '用户角色映射';


-- -----------------------------------------------------
-- Table `MagicBirdStudio_RBAC`.`PermissionInfo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MagicBirdStudio_RBAC`.`PermissionInfo` (
  `PermissionID` INT NOT NULL,
  `PermissionName` VARCHAR(45) NOT NULL COMMENT '权限名称',
  `Description` TEXT NULL COMMENT '权限描述',
  PRIMARY KEY (`PermissionID`))
ENGINE = InnoDB
COMMENT = '权限信息';


-- -----------------------------------------------------
-- Table `MagicBirdStudio_RBAC`.`RolePermissionMapping`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MagicBirdStudio_RBAC`.`RolePermissionMapping` (
  `RoleID` INT NOT NULL,
  `PermissionID` INT NOT NULL,
  PRIMARY KEY (`RoleID`),
  INDEX `fk_RolePermissionMapping_1_idx` (`PermissionID` ASC),
  CONSTRAINT `fk_RolePermissionMapping_Role`
    FOREIGN KEY (`RoleID`)
    REFERENCES `MagicBirdStudio_RBAC`.`RoleInfo` (`RoleID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_RolePermissionMapping_Permission`
    FOREIGN KEY (`PermissionID`)
    REFERENCES `MagicBirdStudio_RBAC`.`PermissionInfo` (`PermissionID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '角色权限映射';


-- -----------------------------------------------------
-- Table `MagicBirdStudio_RBAC`.`MenuInfo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MagicBirdStudio_RBAC`.`MenuInfo` (
  `MenuID` INT NOT NULL,
  `MenuName` VARCHAR(45) NOT NULL,
  `WebPath` VARCHAR(200) NULL,
  `MenuICON` VARCHAR(200) NOT NULL,
  `Description` TEXT NULL,
  `ParentMenu` INT NULL,
  `MenuSort` INT NOT NULL,
  `isEffective` TINYINT(1) NOT NULL,
  PRIMARY KEY (`MenuID`))
ENGINE = InnoDB
COMMENT = '功能菜单信息';


-- -----------------------------------------------------
-- Table `MagicBirdStudio_RBAC`.`PermissionMenuMapping`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MagicBirdStudio_RBAC`.`PermissionMenuMapping` (
  `MenuID` INT NOT NULL,
  `PermissionID` INT NOT NULL,
  PRIMARY KEY (`MenuID`),
  INDEX `fk_PermissionMenuMapping_1_idx` (`PermissionID` ASC),
  CONSTRAINT `fk_PermissionMenuMapping_Menu`
    FOREIGN KEY (`MenuID`)
    REFERENCES `MagicBirdStudio_RBAC`.`MenuInfo` (`MenuID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PermissionMenuMapping_Permission`
    FOREIGN KEY (`PermissionID`)
    REFERENCES `MagicBirdStudio_RBAC`.`PermissionInfo` (`PermissionID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '权限菜单映射';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
