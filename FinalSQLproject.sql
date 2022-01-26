-- MySQL Script generated by MySQL Workbench
-- Sat Dec  4 10:19:04 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema airbnbseattledb1
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `airbnbseattledb1` ;

-- -----------------------------------------------------
-- Schema airbnbseattledb1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `airbnbseattledb1` DEFAULT CHARACTER SET utf8 ;

USE `airbnbseattledb1` ;

-- -----------------------------------------------------
-- Table `airbnbseattledb1`.`Reviewer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `airbnbseattledb1`.`Reviewer` ;


CREATE TABLE IF NOT EXISTS `airbnbseattledb1`.`Reviewer` (
  `reviewerID` INT(100) NOT NULL,
  `ReviewerName` VARCHAR(30) NULL,
  PRIMARY KEY (`reviewerID`))
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `airbnbseattledb1`.`Country`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `airbnbseattledb1`.`Country` ;


CREATE TABLE IF NOT EXISTS `airbnbseattledb1`.`Country` (
  `CountryCode` VARCHAR(3) NOT NULL,
  `CountryName` VARCHAR(100) NULL,
  PRIMARY KEY (`CountryCode`))
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `airbnbseattledb1`.`BedType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `airbnbseattledb1`.`BedType` ;


CREATE TABLE IF NOT EXISTS `airbnbseattledb1`.`BedType` (
  `BedTypeID` VARCHAR(10) NOT NULL,
  `BedType` VARCHAR(45) NULL,
  PRIMARY KEY (`BedTypeID`))
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `airbnbseattledb1`.`RoomType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `airbnbseattledb1`.`RoomType` ;


CREATE TABLE IF NOT EXISTS `airbnbseattledb1`.`RoomType` (
  `RoomTypeID` VARCHAR(10) NOT NULL,
  `room_type` VARCHAR(50) NULL,
  PRIMARY KEY (`RoomTypeID`))
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `airbnbseattledb1`.`PropertyType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `airbnbseattledb1`.`PropertyType` ;


CREATE TABLE IF NOT EXISTS `airbnbseattledb1`.`PropertyType` (
  `PropertyTypeID` VARCHAR(10) NOT NULL,
  `Property_type` VARCHAR(45) NULL,
  PRIMARY KEY (`PropertyTypeID`))
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `airbnbseattledb1`.`Listing`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `airbnbseattledb1`.`Listing` ;


CREATE TABLE IF NOT EXISTS `airbnbseattledb1`.`Listing` (
  `ListingID` INT NOT NULL,
  `ListingName` VARCHAR(50) NULL,
  `Street` VARCHAR(100) NULL,
  `neighbourhood` VARCHAR(100) NULL,
  `neighbourhood_cleansed` VARCHAR(100) NULL,
  `neighbourhood_group_cleansed` VARCHAR(100) NULL,
  `City` VARCHAR(45) NULL,
  `State` VARCHAR(45) NULL,
  `Zipcode` VARCHAR(10) NULL,
  `Country_CountryCode` VARCHAR(3) NOT NULL,
  `Lattitude` VARCHAR(45) NULL,
  `Longitude` VARCHAR(45) NULL,
  `is_location_exact` VARCHAR(5) NULL,
  `accommodates` INT NULL,
  `bathrooms` DECIMAL(10,2) NULL,
  `bedrooms` DECIMAL(10,2) NULL,
  `beds` DECIMAL(10,2) NULL,
  `SquareFeet` VARCHAR(10) NULL,
  `requires_license` CHAR(2) NULL,
  `instant_bookable` CHAR(2) NULL,
  `listingUrl` LONGTEXT NULL,
  `thumbnail_url` LONGTEXT NULL,
  `medium_url` LONGTEXT NULL,
  `picture_url` LONGTEXT NULL,
  `xl_picture_url` LONGTEXT NULL,
  `jurisdiction_names` VARCHAR(45) NULL,
  `BedTypeID` VARCHAR(10) NOT NULL,
  `RoomTypeID` VARCHAR(10) NOT NULL,
  `PropertyTypeID` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`ListingID`, `Country_CountryCode`, `BedTypeID`, `RoomTypeID`, `PropertyTypeID`),
  INDEX `fk_Listing_Country1_idx` (`Country_CountryCode` ASC),
  INDEX `fk_Listing_Bed Type1_idx` (`BedTypeID` ASC) ,
  INDEX `fk_Listing_Room Type1_idx` (`RoomTypeID` ASC) ,
  INDEX `fk_Listing_Property Type1_idx` (`PropertyTypeID` ASC) ,
  CONSTRAINT `fk_Listing_Country1`
    FOREIGN KEY (`Country_CountryCode`)
    REFERENCES `airbnbseattledb1`.`Country` (`CountryCode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Listing_Bed Type1`
    FOREIGN KEY (`BedTypeID`)
    REFERENCES `airbnbseattledb1`.`BedType` (`BedTypeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Listing_Room Type1`
    FOREIGN KEY (`RoomTypeID`)
    REFERENCES `airbnbseattledb1`.`RoomType` (`RoomTypeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Listing_Property Type1`
    FOREIGN KEY (`PropertyTypeID`)
    REFERENCES `airbnbseattledb1`.`PropertyType` (`PropertyTypeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `airbnbseattledb1`.`Reviews`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `airbnbseattledb1`.`Reviews` ;


CREATE TABLE IF NOT EXISTS `airbnbseattledb1`.`Reviews` (
  `ReviewID` INT NOT NULL,
  `Date` DATETIME NULL,
  `ListingID` INT NOT NULL,
  `ReviewerID` INT NOT NULL,
  PRIMARY KEY (`ReviewID`, `ListingID`, `ReviewerID`),
  INDEX `fk_Reviews_Reviewer1_idx` (`ReviewerID` ASC),
  INDEX `fk_Reviews_Listing1_idx` (`ListingID` ASC),
  CONSTRAINT `fk_Reviews_Reviewer1`
    FOREIGN KEY (`ReviewerID`)
    REFERENCES `airbnbseattledb1`.`Reviewer` (`reviewerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reviews_Listing1`
    FOREIGN KEY (`ListingID`)
    REFERENCES `airbnbseattledb1`.`Listing` (`ListingID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `airbnbseattledb1`.`Booking`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `airbnbseattledb1`.`Booking` ;


CREATE TABLE IF NOT EXISTS `airbnbseattledb1`.`Booking` (
  `ListingID` INT NOT NULL,
  `BookingDate` DATETIME NOT NULL,
  `AvailablilityStatus` CHAR(1) NOT NULL,
  `Price` VARCHAR(45) NULL,
  PRIMARY KEY (`ListingID`),
  CONSTRAINT `fk_Booking_Listing1`
    FOREIGN KEY (`ListingID`)
    REFERENCES `airbnbseattledb1`.`Listing` (`ListingID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `airbnbseattledb1`.`Amenities`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `airbnbseattledb1`.`Amenities` ;


CREATE TABLE IF NOT EXISTS `airbnbseattledb1`.`Amenities` (
  `AmenitiyID` VARCHAR(10) NOT NULL,
  `AmenityDescription` VARCHAR(45) NULL,
  PRIMARY KEY (`AmenitiyID`))
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `airbnbseattledb1`.`HostResponse`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `airbnbseattledb1`.`HostResponse` ;


CREATE TABLE IF NOT EXISTS `airbnbseattledb1`.`HostResponse` (
  `HostResponseTimeID` VARCHAR(10) NOT NULL,
  `HostResponseCategory` VARCHAR(45) NULL,
  PRIMARY KEY (`HostResponseTimeID`))
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `airbnbseattledb1`.`Host`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `airbnbseattledb1`.`Host` ;


CREATE TABLE IF NOT EXISTS `airbnbseattledb1`.`Host` (
  `HostID` INT NOT NULL,
  `HostUrl` LONGTEXT NULL,
  `HostName` VARCHAR(45) NULL,
  `HostSince` DATETIME NULL,
  `HostCity` VARCHAR(45) NULL,
  `HostState` VARCHAR(45) NULL,
  `HostCountry` VARCHAR(45) NULL,
  `HostResponseRate` DECIMAL(10,2) NULL,
  `HostAcceptanceRate` DECIMAL(10,2) NULL,
  `SuperHost` CHAR(1) NULL,
  `HostThumbnailURL` LONGTEXT NULL,
  `HostPictureURL` LONGTEXT NULL,
  `HostNeighbourhood` VARCHAR(100) NULL,
  `HostTotalListingsCount` DECIMAL(10,2) NULL,
  `HostLocation` VARCHAR(50) NULL,
  `HostProfilePicPresent` CHAR(1) NULL,
  `HostIdentityVerified` CHAR(1) NULL,
  `HostResponseTimeID` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`HostID`, `HostResponseTimeID`),
  INDEX `fk_Host_HostResponse1_idx` (`HostResponseTimeID` ASC),
  CONSTRAINT `fk_Host_HostResponse1`
    FOREIGN KEY (`HostResponseTimeID`)
    REFERENCES `airbnbseattledb1`.`HostResponse` (`HostResponseTimeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `airbnbseattledb1`.`VerficationMedium`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `airbnbseattledb1`.`VerficationMedium` ;


CREATE TABLE IF NOT EXISTS `airbnbseattledb1`.`VerficationMedium` (
  `VerficationMediumID` VARCHAR(10) NOT NULL,
  `VerificationMedium` VARCHAR(45) NULL,
  PRIMARY KEY (`VerficationMediumID`))
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `airbnbseattledb1`.`CancellationPolicy`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `airbnbseattledb1`.`CancellationPolicy` ;


CREATE TABLE IF NOT EXISTS `airbnbseattledb1`.`CancellationPolicy` (
  `CancellationPolicyID` VARCHAR(10) NOT NULL,
  `CancellationPolicy` VARCHAR(45) NULL,
  PRIMARY KEY (`CancellationPolicyID`))
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `airbnbseattledb1`.`ScrapedData`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `airbnbseattledb1`.`ScrapedData` ;


CREATE TABLE IF NOT EXISTS `airbnbseattledb1`.`ScrapedData` (
  `Scrape_ID` DOUBLE NOT NULL,
  `last_scraped` DATETIME NULL,
  PRIMARY KEY (`Scrape_ID`))
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `airbnbseattledb1`.`Host_has_Listing`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `airbnbseattledb1`.`Host_has_Listing` ;
CREATE TABLE IF NOT EXISTS `airbnbseattledb1`.`Host_has_Listing` (
  `ListingID` INT NOT NULL,
  `HostID` INT NOT NULL,
  `host_total_listings_count` INT NULL,
  `daily_price` INT NULL,
  `weekly_price` INT NULL,
  `monthly_price` INT NULL,
  `security_deposit` INT NULL,
  `cleaning_fee` INT NULL,
  `guests_included` INT NULL,
  `extra_people` INT NULL,
  `number_of_reviews` INT NULL,
  `firstReview` DATETIME NULL,
  `lastReview` DATETIME NULL,
  `review_scores_rating` INT NULL,
  `review_scores_accuracy` INT NULL,
  `review_scores_cleanliness` INT NULL,
  `review_scores_checkin` INT NULL,
  `review_scores_communication` INT NULL,
  `review_scores_location` INT NULL,
  `review_scores_value` INT NULL,
  `reviews_per_month` DECIMAL(10,2) NULL,
  `Scrape_ID` DOUBLE NOT NULL,
  `minimum_nights` INT NULL,
  `maximum_nights` INT NULL,
  `calendar_updated` VARCHAR(45) NULL,
  `has_availability` CHAR(1) NULL,
  `availability_30` INT NULL,
  `availability_60` INT NULL DEFAULT NULL,
  `availability_90` INT NULL,
  `availability_365` INT NULL,
  `require_guest_profile_picture` VARCHAR(45) NULL,
  `require_guest_phone_verification` VARCHAR(45) NULL,
  `CancellationPolicyID` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`ListingID`, `HostID`, `Scrape_ID`, `CancellationPolicyID`),
  INDEX `fk_Host_has_Listing_ScrapedData1_idx` (`Scrape_ID` ASC) VISIBLE,
  INDEX `fk_Host_has_Listing_Cancellation Policy1_idx` (`CancellationPolicyID` ASC) VISIBLE,
  INDEX `fk_Host_has_Listing_Host1_idx` (`HostID` ASC) VISIBLE,
  INDEX `fk_Host_has_Listing_Listing1_idx` (`ListingID` ASC) VISIBLE,
  CONSTRAINT `fk_Host_has_Listing_ScrapedData1`
    FOREIGN KEY (`Scrape_ID`)
    REFERENCES `airbnbseattledb1`.`ScrapedData` (`Scrape_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Host_has_Listing_Cancellation Policy1`
    FOREIGN KEY (`CancellationPolicyID`)
    REFERENCES `airbnbseattledb1`.`CancellationPolicy` (`CancellationPolicyID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Host_has_Listing_Host1`
    FOREIGN KEY (`HostID`)
    REFERENCES `airbnbseattledb1`.`Host` (`HostID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Host_has_Listing_Listing1`
    FOREIGN KEY (`ListingID`)
    REFERENCES `airbnbseattledb1`.`Listing` (`ListingID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `airbnbseattledb1`.`Host_uses_VerficationMedium`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `airbnbseattledb1`.`Host_uses_VerficationMedium` ;


CREATE TABLE IF NOT EXISTS `airbnbseattledb1`.`Host_uses_VerficationMedium` (
  `HostID` INT NOT NULL,
  `VerficationMediumID` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`HostID`, `VerficationMediumID`),
  INDEX `fk_Host_has_VerficationMedium_VerficationMedium1_idx` (`VerficationMediumID` ASC) ,
  INDEX `fk_Host_has_VerficationMedium_Host1_idx` (`HostID` ASC) ,
  CONSTRAINT `fk_Host_has_VerficationMedium_Host1`
    FOREIGN KEY (`HostID`)
    REFERENCES `airbnbseattledb1`.`Host` (`HostID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Host_has_VerficationMedium_VerficationMedium1`
    FOREIGN KEY (`VerficationMediumID`)
    REFERENCES `airbnbseattledb1`.`VerficationMedium` (`VerficationMediumID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `airbnbseattledb1`.`Listing_has_Amenities`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `airbnbseattledb1`.`Listing_has_Amenities` ;


CREATE TABLE IF NOT EXISTS `airbnbseattledb1`.`Listing_has_Amenities` (
  `ListingID` INT NOT NULL,
  `AmenitiyID` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`ListingID`, `AmenitiyID`),
  INDEX `fk_Listing_has_Amenities_Amenities1_idx` (`AmenitiyID` ASC) ,
  INDEX `fk_Listing_has_Amenities_Listing1_idx` (`ListingID` ASC) ,
  CONSTRAINT `fk_Listing_has_Amenities_Listing1`
    FOREIGN KEY (`ListingID`)
    REFERENCES `airbnbseattledb1`.`Listing` (`ListingID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Listing_has_Amenities_Amenities1`
    FOREIGN KEY (`AmenitiyID`)
    REFERENCES `airbnbseattledb1`.`Amenities` (`AmenitiyID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
