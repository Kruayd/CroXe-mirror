-- MariaDB dump 10.19-11.1.2-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: CroXe
-- ------------------------------------------------------
-- Server version	11.1.2-MariaDB-debug

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `CroXe`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `CroXe` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci */;

USE `CroXe`;

--
-- Table structure for table `beam_fit_coefficients`
--

DROP TABLE IF EXISTS `beam_fit_coefficients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `beam_fit_coefficients` (
  `projectile` varchar(10) NOT NULL,
  `target` varchar(10) NOT NULL,
  `product` varchar(10) NOT NULL,
  `product_frame` enum('projectile','target') NOT NULL DEFAULT 'projectile',
  `source_tag` varchar(20) NOT NULL,
  `fit_index` int(11) NOT NULL,
  `coeff_order` int(11) NOT NULL COMMENT 'Position of the coefficient in the fit function (0-indexed)',
  `coeff_value` double NOT NULL COMMENT 'Value of the coefficient',
  PRIMARY KEY (`projectile`,`target`,`product`,`product_frame`,`source_tag`,`fit_index`,`coeff_order`),
  CONSTRAINT `bfc_fit_fk` FOREIGN KEY (`projectile`, `target`, `product`, `product_frame`, `source_tag`, `fit_index`) REFERENCES `beam_fit_params` (`projectile`, `target`, `product`, `product_frame`, `source_tag`, `fit_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Fit coefficients for beam-on-target process cross-sections';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `beam_fit_params`
--

DROP TABLE IF EXISTS `beam_fit_params`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `beam_fit_params` (
  `projectile` varchar(10) NOT NULL COMMENT 'Symbol of the projectile species',
  `target` varchar(10) NOT NULL COMMENT 'Symbol of the target species',
  `product` varchar(10) NOT NULL COMMENT 'Symbol of the product species',
  `product_frame` enum('projectile','target') NOT NULL DEFAULT 'projectile' COMMENT 'Reference frame of the product after the collision',
  `source_tag` varchar(20) NOT NULL COMMENT 'Source that provides this fit',
  `fit_index` int(11) NOT NULL DEFAULT 1 COMMENT 'Ordering index for multiple fits from the same source on the same process (starts at 1)',
  `function_name` varchar(15) NOT NULL COMMENT 'Fit function template used',
  `e_min` double NOT NULL COMMENT 'Lower energy boundary of fit validity (eV)',
  `e_max` double NOT NULL COMMENT 'Upper energy boundary of fit validity (eV)',
  `rms` double DEFAULT NULL COMMENT 'Relative RMS deviation of the fit',
  `max_deviation` double DEFAULT NULL COMMENT 'Maximum relative deviation of the fit',
  `e_at_max_deviation` double DEFAULT NULL COMMENT 'Energy at maximum relative deviation (eV)',
  PRIMARY KEY (`projectile`,`target`,`product`,`product_frame`,`source_tag`,`fit_index`),
  KEY `bfp_function_fk` (`function_name`),
  KEY `bfp_source_function_fk` (`source_tag`,`function_name`),
  CONSTRAINT `bfp_function_fk` FOREIGN KEY (`function_name`) REFERENCES `fit_templates` (`function_name`),
  CONSTRAINT `bfp_process_fk` FOREIGN KEY (`projectile`, `target`, `product`, `product_frame`) REFERENCES `beam_processes` (`projectile`, `target`, `product`, `product_frame`),
  CONSTRAINT `bfp_source_function_fk` FOREIGN KEY (`source_tag`, `function_name`) REFERENCES `fit_templates` (`source_tag`, `function_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Fit parameters for beam-on-target process cross-sections';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `beam_on_target_processes_list`
--

DROP TABLE IF EXISTS `beam_on_target_processes_list`;
/*!50001 DROP VIEW IF EXISTS `beam_on_target_processes_list`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `beam_on_target_processes_list` AS SELECT
 1 AS `projectile`,
  1 AS `target`,
  1 AS `product`,
  1 AS `product frame`,
  1 AS `interaction`,
  1 AS `source`,
  1 AS `fit index`,
  1 AS `fit function`,
  1 AS `E min (eV)`,
  1 AS `E max (eV)`,
  1 AS `coefficients`,
  1 AS `relative RMS`,
  1 AS `max deviation`,
  1 AS `author`,
  1 AS `title`,
  1 AS `year`,
  1 AS `doi` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `beam_processes`
--

DROP TABLE IF EXISTS `beam_processes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `beam_processes` (
  `projectile` varchar(10) NOT NULL COMMENT 'Symbol of the projectile species',
  `target` varchar(10) NOT NULL COMMENT 'Symbol of the target species',
  `product` varchar(10) NOT NULL COMMENT 'Symbol of the product species',
  `product_frame` enum('projectile','target') NOT NULL DEFAULT 'projectile' COMMENT 'Reference frame of the product after the collision (projectile = moves with projectile, target = moves with target)',
  `interaction` enum('electromagnetic','strong') NOT NULL COMMENT 'Fundamental interaction governing the process',
  PRIMARY KEY (`projectile`,`target`,`product`,`product_frame`),
  KEY `beam_processes_target_fk` (`target`),
  KEY `beam_processes_product_fk` (`product`),
  CONSTRAINT `beam_processes_product_fk` FOREIGN KEY (`product`) REFERENCES `species` (`symbol`),
  CONSTRAINT `beam_processes_projectile_fk` FOREIGN KEY (`projectile`) REFERENCES `species` (`symbol`),
  CONSTRAINT `beam_processes_target_fk` FOREIGN KEY (`target`) REFERENCES `species` (`symbol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Beam-on-target collision processes (e.g. H+ + H2 → H)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fit_templates`
--

DROP TABLE IF EXISTS `fit_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fit_templates` (
  `function_name` varchar(15) NOT NULL COMMENT 'Short unique code for the fit function (e.g. CHEB, TAB2_1_3)',
  `notes` text DEFAULT NULL COMMENT 'Notes about the template (e.g. unit conversions applied to stored data)',
  `source_tag` varchar(20) DEFAULT NULL COMMENT 'Source that defined this template (NULL if generic)',
  PRIMARY KEY (`function_name`),
  UNIQUE KEY `idx_source_function` (`source_tag`,`function_name`),
  CONSTRAINT `fit_templates_source_fk` FOREIGN KEY (`source_tag`) REFERENCES `sources` (`source_tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Reusable fit function templates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sources`
--

DROP TABLE IF EXISTS `sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sources` (
  `source_tag` varchar(20) NOT NULL COMMENT 'Short unique identifier for the source (e.g. Barnett1990)',
  `first_author` varchar(100) NOT NULL COMMENT 'First author of the source',
  `et_al` tinyint(1) DEFAULT 0 COMMENT 'TRUE if there are additional authors',
  `title` text NOT NULL COMMENT 'Full title of the source',
  `year` year(4) DEFAULT NULL,
  `publisher` varchar(100) DEFAULT NULL,
  `doi` varchar(200) DEFAULT NULL COMMENT 'Digital Object Identifier',
  PRIMARY KEY (`source_tag`),
  UNIQUE KEY `idx_title` (`title`(255)),
  UNIQUE KEY `idx_doi` (`doi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Bibliographic sources for cross-section data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `species`
--

DROP TABLE IF EXISTS `species`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `species` (
  `symbol` varchar(10) NOT NULL COMMENT 'Chemical symbol (e.g. H, H+, H2, e-)',
  `mass` double NOT NULL COMMENT 'Atomic/molecular mass in amu',
  `charge` int(11) NOT NULL COMMENT 'Electric charge in units of the elementary charge',
  `isotope_of` varchar(10) DEFAULT NULL COMMENT 'Symbol of the parent species if this is an isotope',
  `excited_state_of` varchar(10) DEFAULT NULL COMMENT 'Symbol of the ground state species if this is an excited state',
  `ion_of` varchar(10) DEFAULT NULL COMMENT 'Symbol of the neutral species this ion is derived from (NULL if neutral or no stable neutral counterpart exists)',
  PRIMARY KEY (`symbol`),
  KEY `species_isotope_fk` (`isotope_of`),
  KEY `species_excited_state_fk` (`excited_state_of`),
  KEY `species_ion_fk` (`ion_of`),
  CONSTRAINT `species_excited_state_fk` FOREIGN KEY (`excited_state_of`) REFERENCES `species` (`symbol`),
  CONSTRAINT `species_ion_fk` FOREIGN KEY (`ion_of`) REFERENCES `species` (`symbol`),
  CONSTRAINT `species_isotope_fk` FOREIGN KEY (`isotope_of`) REFERENCES `species` (`symbol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Atomic and molecular species, isotopes, and excited states';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `CroXe`
--

USE `CroXe`;

--
-- Final view structure for view `beam_on_target_processes_list`
--

/*!50001 DROP VIEW IF EXISTS `beam_on_target_processes_list`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `beam_on_target_processes_list` AS select `bfp`.`projectile` AS `projectile`,`bfp`.`target` AS `target`,`bfp`.`product` AS `product`,`bfp`.`product_frame` AS `product frame`,`bp`.`interaction` AS `interaction`,`bfp`.`source_tag` AS `source`,`bfp`.`fit_index` AS `fit index`,`bfp`.`function_name` AS `fit function`,`bfp`.`e_min` AS `E min (eV)`,`bfp`.`e_max` AS `E max (eV)`,group_concat(`c`.`coeff_value` order by `c`.`coeff_order` ASC separator ', ') AS `coefficients`,`bfp`.`rms` AS `relative RMS`,`bfp`.`max_deviation` AS `max deviation`,`s`.`first_author` AS `author`,`s`.`title` AS `title`,`s`.`year` AS `year`,`s`.`doi` AS `doi` from (((`beam_fit_params` `bfp` join `beam_processes` `bp` on(`bfp`.`projectile` = `bp`.`projectile` and `bfp`.`target` = `bp`.`target` and `bfp`.`product` = `bp`.`product` and `bfp`.`product_frame` = `bp`.`product_frame`)) join `sources` `s` on(`bfp`.`source_tag` = `s`.`source_tag`)) left join `beam_fit_coefficients` `c` on(`c`.`projectile` = `bfp`.`projectile` and `c`.`target` = `bfp`.`target` and `c`.`product` = `bfp`.`product` and `c`.`product_frame` = `bfp`.`product_frame` and `c`.`source_tag` = `bfp`.`source_tag` and `c`.`fit_index` = `bfp`.`fit_index`)) group by `bfp`.`projectile`,`bfp`.`target`,`bfp`.`product`,`bfp`.`product_frame`,`bfp`.`source_tag`,`bfp`.`fit_index` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-05 16:31:26
