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
-- Table structure for table `beam_fit_params`
--

DROP TABLE IF EXISTS `beam_fit_params`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `beam_fit_params` (
  `parameters_id` int(11) NOT NULL AUTO_INCREMENT,
  `e_min` float NOT NULL COMMENT 'Min energy (eV)',
  `e_max` float NOT NULL COMMENT 'Max energy (eV)',
  `rms` float DEFAULT NULL COMMENT 'Relative RMS deviation',
  `max_deviation` float DEFAULT NULL COMMENT 'Max relative deviation',
  `e_at_max_deviation` float DEFAULT NULL COMMENT 'Energy at max deviation (eV)',
  `process_id` int(11) NOT NULL,
  `template_id` int(11) NOT NULL,
  PRIMARY KEY (`parameters_id`),
  KEY `idx_process` (`process_id`),
  KEY `idx_template` (`template_id`),
  CONSTRAINT `beam_fit_params_ibfk_1` FOREIGN KEY (`process_id`) REFERENCES `beam_processes` (`process_id`),
  CONSTRAINT `beam_fit_params_ibfk_2` FOREIGN KEY (`template_id`) REFERENCES `fit_templates` (`template_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Table of fit parameters for beam-on-target processes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `beam_on_target_processes_list`
--

DROP TABLE IF EXISTS `beam_on_target_processes_list`;
/*!50001 DROP VIEW IF EXISTS `beam_on_target_processes_list`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `beam_on_target_processes_list` AS SELECT
 1 AS `parameters set ID`,
  1 AS `projectile`,
  1 AS `target`,
  1 AS `product`,
  1 AS `fit function template`,
  1 AS `E lower boundary (eV)`,
  1 AS `E upper boundary (eV)`,
  1 AS `coefficients`,
  1 AS `relative RMS`,
  1 AS `author`,
  1 AS `title`,
  1 AS `year` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `beam_processes`
--

DROP TABLE IF EXISTS `beam_processes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `beam_processes` (
  `process_id` int(11) NOT NULL AUTO_INCREMENT,
  `projectile_id` int(11) NOT NULL COMMENT 'ID of the projectile species',
  `target_id` int(11) NOT NULL COMMENT 'ID of the target species',
  `product_id` int(11) NOT NULL COMMENT 'ID of the product species',
  `product_velocity` float DEFAULT 1 COMMENT 'Relative velocity of the product (1 = same as projectile, 0 = same as target)',
  PRIMARY KEY (`process_id`),
  UNIQUE KEY `idx_process` (`projectile_id`,`target_id`,`product_id`),
  KEY `idx_projectile` (`projectile_id`),
  KEY `idx_target` (`target_id`),
  KEY `idx_product` (`product_id`),
  CONSTRAINT `beam_processes_ibfk_1` FOREIGN KEY (`projectile_id`) REFERENCES `species` (`species_id`),
  CONSTRAINT `beam_processes_ibfk_2` FOREIGN KEY (`target_id`) REFERENCES `species` (`species_id`),
  CONSTRAINT `beam_processes_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `species` (`species_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Table of beam-on-target collision processes (e.g., H + H2 → H-)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coefficients`
--

DROP TABLE IF EXISTS `coefficients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coefficients` (
  `coefficient_id` int(11) NOT NULL AUTO_INCREMENT,
  `fit_params_table` enum('beam_fit_params') NOT NULL COMMENT 'Name of the fit parameters table to refer (e.g. beam_fit_params, etc.)',
  `parameters_id` int(11) NOT NULL COMMENT 'ID of the parameters set in the corresponding fit parameters table',
  `coeff_order` int(11) NOT NULL COMMENT 'Order of the coefficient in the fit function (0 = first coefficient)',
  `coeff_value` float NOT NULL COMMENT 'Value of the coefficient',
  PRIMARY KEY (`coefficient_id`),
  UNIQUE KEY `idx_coeff` (`fit_params_table`,`parameters_id`,`coeff_order`),
  KEY `idx_fit` (`fit_params_table`,`parameters_id`)
) ENGINE=InnoDB AUTO_INCREMENT=512 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Table storing fit coefficients for all fit parameters tables (e.g. beam_fit_params)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fit_templates`
--

DROP TABLE IF EXISTS `fit_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fit_templates` (
  `template_id` int(11) NOT NULL AUTO_INCREMENT,
  `function_name` varchar(10) NOT NULL COMMENT 'Short code for the fit function (e.g., CHEB, TAB2_1_5)',
  `notes` text DEFAULT NULL COMMENT 'Notes about the fit function template (e.g., units conversion)',
  `source_id` int(11) DEFAULT NULL COMMENT 'Reference to the source (NULL if generic)',
  PRIMARY KEY (`template_id`),
  UNIQUE KEY `idx_function_name` (`function_name`),
  KEY `source_id` (`source_id`),
  CONSTRAINT `fit_templates_ibfk_1` FOREIGN KEY (`source_id`) REFERENCES `sources` (`source_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Table of reusable fit function templates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sources`
--

DROP TABLE IF EXISTS `sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sources` (
  `source_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_author` varchar(100) NOT NULL,
  `et_al` tinyint(1) DEFAULT 0 COMMENT 'TRUE if there are additional authors',
  `title` text NOT NULL,
  `year` year(4) DEFAULT NULL,
  `publisher` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`source_id`),
  UNIQUE KEY `title` (`title`) USING HASH,
  UNIQUE KEY `idx_title` (`title`) USING HASH,
  UNIQUE KEY `idx_author_title` (`first_author`,`title`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Table of bibliographic sources for cross-section data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `species`
--

DROP TABLE IF EXISTS `species`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `species` (
  `species_id` int(11) NOT NULL AUTO_INCREMENT,
  `symbol` varchar(50) NOT NULL,
  `mass` float NOT NULL COMMENT 'Atomic/molecular mass in amu (rounded to 3 significant digits)',
  `charge` int(11) NOT NULL COMMENT 'Electric charge in units of the elementary charge (e.g. 0, +1, -1)',
  `isotope_of` int(11) DEFAULT NULL COMMENT 'ID of the parent species (NULL if not an isotope)',
  `excited_state_of` int(11) DEFAULT NULL COMMENT 'ID of the species in the ground state (NULL if not excited)',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`species_id`),
  UNIQUE KEY `symbol` (`symbol`),
  UNIQUE KEY `idx_symbol` (`symbol`),
  KEY `idx_isotope` (`isotope_of`),
  KEY `idx_excited_state` (`excited_state_of`),
  CONSTRAINT `species_ibfk_1` FOREIGN KEY (`isotope_of`) REFERENCES `species` (`species_id`),
  CONSTRAINT `species_ibfk_2` FOREIGN KEY (`excited_state_of`) REFERENCES `species` (`species_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Table of atomic/molecular species, isotopes, and excited states';
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
/*!50013 DEFINER=`kruayd`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `beam_on_target_processes_list` AS select `bfp`.`parameters_id` AS `parameters set ID`,`s1`.`symbol` AS `projectile`,`s2`.`symbol` AS `target`,`s3`.`symbol` AS `product`,`ft`.`function_name` AS `fit function template`,`bfp`.`e_min` AS `E lower boundary (eV)`,`bfp`.`e_max` AS `E upper boundary (eV)`,group_concat(`c`.`coeff_value` order by `c`.`coeff_order` ASC separator ', ') AS `coefficients`,`bfp`.`rms` AS `relative RMS`,`sr`.`first_author` AS `author`,`sr`.`title` AS `title`,`sr`.`year` AS `year` from (((((((`beam_fit_params` `bfp` join `beam_processes` `bp` on(`bfp`.`process_id` = `bp`.`process_id`)) join `species` `s1` on(`bp`.`projectile_id` = `s1`.`species_id`)) join `species` `s2` on(`bp`.`target_id` = `s2`.`species_id`)) join `species` `s3` on(`bp`.`product_id` = `s3`.`species_id`)) join `fit_templates` `ft` on(`bfp`.`template_id` = `ft`.`template_id`)) join `sources` `sr` on(`ft`.`source_id` = `sr`.`source_id`)) left join `coefficients` `c` on(`c`.`fit_params_table` = 'beam_fit_params' and `c`.`parameters_id` = `bfp`.`parameters_id`)) group by `bfp`.`parameters_id` */;
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

-- Dump completed on 2026-03-18 14:53:14
