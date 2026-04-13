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
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `beam_fit_params`
--

LOCK TABLES `beam_fit_params` WRITE;
/*!40000 ALTER TABLE `beam_fit_params` DISABLE KEYS */;
INSERT INTO `beam_fit_params` VALUES
(1,2.6,4000000,0.155,0.413,10,1,1),
(2,3.16,100000,0.013,0.028,316,1,9),
(3,200,1000000,0.094,0.15,10000,2,1),
(4,61,20000000,0.107,0.298,10000,3,1),
(5,56.2,112000,0.047,0.2,75,3,3),
(6,40,460000,0.095,0.262,1000,4,1),
(7,23.7,91100,0.036,0.088,1000,4,14),
(8,1000,10000000,0.02,0.043,400000,5,1),
(9,1000,300000,0.09,0.21,3000,5,7),
(10,2.3,17000000,0.072,0.166,71,6,1),
(11,2.37,50000,0.064,0.21,10100,6,12),
(12,3.2,10,0.002,0.003,7.1,7,1),
(13,3000,20000000,0.063,0.124,36000,7,1),
(14,5.62,99000,0.022,0.041,133,7,5),
(15,4000,200000,0.003,0.006,20000,8,1),
(16,2600,100000,0.009,0.013,20000,9,1),
(17,4,200000,0.038,0.071,160000,10,1),
(18,0.1,120000,0.021,0.072,3320,10,13),
(19,5100,100000,0.007,0.012,30000,11,1),
(20,300000,1200000,0,0,810000,11,1),
(21,178,99500,0.048,0.098,7500,11,3),
(22,5100,100000,0.025,0.044,14000,12,1),
(23,42.1,99000,0.034,0.081,75,13,11),
(24,2600,100000,0.006,0.012,14000,14,1),
(25,17.8,100000,0.028,0.092,31.6,14,11),
(26,120,1800000,0.034,0.053,2100,15,1),
(27,14.8,115000,0.18,0.6,14.8,15,4),
(28,4500,1800000,0.018,0.029,1200000,16,1),
(29,54,119000,0.059,0.14,54,16,4),
(30,330,1800000,0.024,0.041,1200000,17,1),
(31,54,117000,0.1,0.22,246,17,4),
(32,91,1800000,0.041,0.065,300000,18,1),
(33,54,118000,0.039,0.13,198,18,4),
(34,4800,110000,0.003,0.005,30000,19,1),
(35,54,100000,0.041,0.14,198,19,4);
/*!40000 ALTER TABLE `beam_fit_params` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `beam_processes`
--

LOCK TABLES `beam_processes` WRITE;
/*!40000 ALTER TABLE `beam_processes` DISABLE KEYS */;
INSERT INTO `beam_processes` VALUES
(1,2,6,3,1),
(2,2,6,4,1),
(3,3,6,2,1),
(4,3,6,4,1),
(5,4,6,2,1),
(6,4,6,3,1),
(7,5,6,2,1),
(8,5,6,3,1),
(9,5,6,5,1),
(10,5,6,6,1),
(11,6,6,2,1),
(12,6,6,3,1),
(13,6,6,5,1),
(14,6,6,6,1),
(15,7,6,2,1),
(16,7,6,3,1),
(17,7,6,5,1),
(18,7,6,6,1),
(19,7,6,7,1);
/*!40000 ALTER TABLE `beam_processes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `coefficients`
--

LOCK TABLES `coefficients` WRITE;
/*!40000 ALTER TABLE `coefficients` DISABLE KEYS */;
INSERT INTO `coefficients` VALUES
(1,'beam_fit_params',1,0,-82.5164),
(2,'beam_fit_params',1,1,-6.70755),
(3,'beam_fit_params',1,2,-6.10977),
(4,'beam_fit_params',1,3,-2.6281),
(5,'beam_fit_params',1,4,0.709759),
(6,'beam_fit_params',1,5,0.639033),
(7,'beam_fit_params',1,6,0.10298),
(8,'beam_fit_params',1,7,0.26124),
(9,'beam_fit_params',1,8,-0.263817),
(10,'beam_fit_params',2,0,2.5),
(11,'beam_fit_params',2,1,212),
(12,'beam_fit_params',2,2,1.721),
(13,'beam_fit_params',2,3,0.00067),
(14,'beam_fit_params',2,4,0.3239),
(15,'beam_fit_params',2,5,0.00434),
(16,'beam_fit_params',2,6,1.296),
(17,'beam_fit_params',2,7,0.142),
(18,'beam_fit_params',2,8,9.34),
(19,'beam_fit_params',2,9,2.997),
(20,'beam_fit_params',3,0,-95.8165),
(21,'beam_fit_params',3,1,-7.17049),
(22,'beam_fit_params',3,2,-7.48288),
(23,'beam_fit_params',3,3,-1.93034),
(24,'beam_fit_params',3,4,0.761153),
(25,'beam_fit_params',3,5,0.556689),
(26,'beam_fit_params',3,6,-0.0542859),
(27,'beam_fit_params',3,7,-0.270184),
(28,'beam_fit_params',3,8,-0.0147551),
(29,'beam_fit_params',4,0,-79.0892),
(30,'beam_fit_params',4,1,0.346403),
(31,'beam_fit_params',4,2,-3.04496),
(32,'beam_fit_params',4,3,0.50849),
(33,'beam_fit_params',4,4,-0.0758661),
(34,'beam_fit_params',4,5,0.108006),
(35,'beam_fit_params',4,6,0.0059345),
(36,'beam_fit_params',5,0,20),
(37,'beam_fit_params',5,1,0.000253),
(38,'beam_fit_params',5,2,1.728),
(39,'beam_fit_params',5,3,2.164),
(40,'beam_fit_params',5,4,0.774),
(41,'beam_fit_params',5,5,1.639),
(42,'beam_fit_params',5,6,14.3),
(43,'beam_fit_params',6,0,-82.8333),
(44,'beam_fit_params',6,1,-1.65457),
(45,'beam_fit_params',6,2,-2.60408),
(46,'beam_fit_params',6,3,-1.5387),
(47,'beam_fit_params',6,4,-0.368649),
(48,'beam_fit_params',6,5,0.41362),
(49,'beam_fit_params',6,6,-0.165702),
(50,'beam_fit_params',6,7,-0.127116),
(51,'beam_fit_params',6,8,0.256041),
(52,'beam_fit_params',7,0,21),
(53,'beam_fit_params',7,1,0.00973),
(54,'beam_fit_params',7,2,2.38),
(55,'beam_fit_params',7,3,0.0139),
(56,'beam_fit_params',7,4,-0.551),
(57,'beam_fit_params',7,5,0.077),
(58,'beam_fit_params',7,6,2.12),
(59,'beam_fit_params',7,7,0.00000197),
(60,'beam_fit_params',7,8,2.051),
(61,'beam_fit_params',7,9,5.5),
(62,'beam_fit_params',7,10,0.662),
(63,'beam_fit_params',7,11,20.2),
(64,'beam_fit_params',7,12,3.62),
(65,'beam_fit_params',8,0,-79.0159),
(66,'beam_fit_params',8,1,-2.10252),
(67,'beam_fit_params',8,2,-1.24073),
(68,'beam_fit_params',8,3,0.174799),
(69,'beam_fit_params',8,4,0.106249),
(70,'beam_fit_params',8,5,-0.000434273),
(71,'beam_fit_params',8,6,-0.0465674),
(72,'beam_fit_params',9,0,0),
(73,'beam_fit_params',9,1,0.0000000175),
(74,'beam_fit_params',9,2,3.88),
(75,'beam_fit_params',9,3,0.906),
(76,'beam_fit_params',9,4,-0.274),
(77,'beam_fit_params',9,5,3.19),
(78,'beam_fit_params',9,6,1.19),
(79,'beam_fit_params',10,0,-73.1506),
(80,'beam_fit_params',10,1,-1.75695),
(81,'beam_fit_params',10,2,-2.00168),
(82,'beam_fit_params',10,3,-0.19028),
(83,'beam_fit_params',10,4,0.0171353),
(84,'beam_fit_params',10,5,0.127083),
(85,'beam_fit_params',10,6,-0.152313),
(86,'beam_fit_params',11,0,2.25),
(87,'beam_fit_params',11,1,0.0419),
(88,'beam_fit_params',11,2,1.89),
(89,'beam_fit_params',11,3,0.178),
(90,'beam_fit_params',11,4,-0.23),
(91,'beam_fit_params',11,5,1.04),
(92,'beam_fit_params',11,6,0.87),
(93,'beam_fit_params',11,7,16.5),
(94,'beam_fit_params',11,8,1.088),
(95,'beam_fit_params',11,9,0.00533),
(96,'beam_fit_params',11,10,0.166),
(97,'beam_fit_params',12,0,-74.4493),
(98,'beam_fit_params',12,1,0.351878),
(99,'beam_fit_params',12,2,-0.249279),
(100,'beam_fit_params',12,3,0.0781924),
(101,'beam_fit_params',12,4,-0.0295527),
(102,'beam_fit_params',12,5,0.00853617),
(103,'beam_fit_params',12,6,-0.0049033),
(104,'beam_fit_params',13,0,-74.9261),
(105,'beam_fit_params',13,1,-2.19443),
(106,'beam_fit_params',13,2,-0.855834),
(107,'beam_fit_params',13,3,0.0421307),
(108,'beam_fit_params',13,4,0.216227),
(109,'beam_fit_params',13,5,0.0921147),
(110,'beam_fit_params',13,6,-0.0893079),
(111,'beam_fit_params',14,0,5),
(112,'beam_fit_params',14,1,63.4),
(113,'beam_fit_params',14,2,1.78),
(114,'beam_fit_params',14,3,0.00138),
(115,'beam_fit_params',14,4,0.406),
(116,'beam_fit_params',14,5,0.163),
(117,'beam_fit_params',14,6,0.327),
(118,'beam_fit_params',14,7,15.54),
(119,'beam_fit_params',14,8,3.903),
(120,'beam_fit_params',14,9,1.735),
(121,'beam_fit_params',14,10,10.2),
(122,'beam_fit_params',15,0,-70.6702),
(123,'beam_fit_params',15,1,-0.632612),
(124,'beam_fit_params',15,2,-0.606521),
(125,'beam_fit_params',15,3,-0.0915143),
(126,'beam_fit_params',15,4,-0.012171),
(127,'beam_fit_params',15,5,0.0168179),
(128,'beam_fit_params',15,6,0.0104797),
(129,'beam_fit_params',16,0,-69.7995),
(130,'beam_fit_params',16,1,-0.288081),
(131,'beam_fit_params',16,2,-0.216489),
(132,'beam_fit_params',16,3,-0.102343),
(133,'beam_fit_params',16,4,-0.0344599),
(134,'beam_fit_params',16,5,0.015529),
(135,'beam_fit_params',16,6,0.0223268),
(136,'beam_fit_params',17,0,-71.4572),
(137,'beam_fit_params',17,1,-1.88878),
(138,'beam_fit_params',17,2,-0.90695),
(139,'beam_fit_params',17,3,-0.676593),
(140,'beam_fit_params',17,4,-0.388666),
(141,'beam_fit_params',17,5,-0.0528444),
(142,'beam_fit_params',17,6,0.0283239),
(143,'beam_fit_params',17,7,-0.0386419),
(144,'beam_fit_params',17,8,0.00767518),
(145,'beam_fit_params',18,0,0),
(146,'beam_fit_params',18,1,229),
(147,'beam_fit_params',18,2,2.78),
(148,'beam_fit_params',18,3,0.00475),
(149,'beam_fit_params',18,4,0.1248),
(150,'beam_fit_params',18,5,0.214),
(151,'beam_fit_params',18,6,2.33),
(152,'beam_fit_params',18,7,7.96),
(153,'beam_fit_params',18,8,0.682),
(154,'beam_fit_params',18,9,0.00659),
(155,'beam_fit_params',18,10,4.51),
(156,'beam_fit_params',18,11,0.167),
(157,'beam_fit_params',18,12,11640),
(158,'beam_fit_params',19,0,-75.7161),
(159,'beam_fit_params',19,1,0.371301),
(160,'beam_fit_params',19,2,-0.373363),
(161,'beam_fit_params',19,3,-0.209805),
(162,'beam_fit_params',19,4,-0.0677263),
(163,'beam_fit_params',19,5,-0.00389719),
(164,'beam_fit_params',19,6,0.0259767),
(165,'beam_fit_params',20,0,-75.8616),
(166,'beam_fit_params',20,1,-0.542987),
(167,'beam_fit_params',20,2,0.0642733),
(168,'beam_fit_params',20,3,0.0118753),
(169,'beam_fit_params',20,4,-0.00148111),
(170,'beam_fit_params',20,5,0.000221649),
(171,'beam_fit_params',20,6,0.00636358),
(172,'beam_fit_params',21,0,20),
(173,'beam_fit_params',21,1,0.00001307),
(174,'beam_fit_params',21,2,1.586),
(175,'beam_fit_params',21,3,10.66),
(176,'beam_fit_params',21,4,2.03),
(177,'beam_fit_params',21,5,2.73),
(178,'beam_fit_params',21,6,4.71),
(179,'beam_fit_params',22,0,-71.7329),
(180,'beam_fit_params',22,1,-0.200109),
(181,'beam_fit_params',22,2,-0.223241),
(182,'beam_fit_params',22,3,-0.0773361),
(183,'beam_fit_params',22,4,-0.0140887),
(184,'beam_fit_params',22,5,0.0563185),
(185,'beam_fit_params',22,6,-0.00955263),
(186,'beam_fit_params',23,0,32),
(187,'beam_fit_params',23,1,0.001879),
(188,'beam_fit_params',23,2,2.497),
(189,'beam_fit_params',23,3,0.0662),
(190,'beam_fit_params',23,4,-0.467),
(191,'beam_fit_params',23,5,0.358),
(192,'beam_fit_params',23,6,0.5),
(193,'beam_fit_params',23,7,7.67),
(194,'beam_fit_params',23,8,201),
(195,'beam_fit_params',24,0,-71.8671),
(196,'beam_fit_params',24,1,0.3807),
(197,'beam_fit_params',24,2,-0.13763),
(198,'beam_fit_params',24,3,-0.0886297),
(199,'beam_fit_params',24,4,-0.00459765),
(200,'beam_fit_params',24,5,0.0134628),
(201,'beam_fit_params',24,6,0.00197498),
(202,'beam_fit_params',25,0,11),
(203,'beam_fit_params',25,1,0.00469),
(204,'beam_fit_params',25,2,2.946),
(205,'beam_fit_params',25,3,0.0436),
(206,'beam_fit_params',25,4,-0.901),
(207,'beam_fit_params',25,5,0.152),
(208,'beam_fit_params',25,6,0.501),
(209,'beam_fit_params',25,7,2.6),
(210,'beam_fit_params',25,8,32.29),
(211,'beam_fit_params',26,0,-75.3369),
(212,'beam_fit_params',26,1,1.74367),
(213,'beam_fit_params',26,2,-0.759749),
(214,'beam_fit_params',26,3,-0.559135),
(215,'beam_fit_params',26,4,0.0918355),
(216,'beam_fit_params',26,5,0.0438106),
(217,'beam_fit_params',26,6,-0.0940811),
(218,'beam_fit_params',27,0,11),
(219,'beam_fit_params',27,1,0.667),
(220,'beam_fit_params',27,2,1.35),
(221,'beam_fit_params',27,3,0.0442),
(222,'beam_fit_params',27,4,0.71),
(223,'beam_fit_params',27,5,0.000067),
(224,'beam_fit_params',27,6,1.54),
(225,'beam_fit_params',27,7,11),
(226,'beam_fit_params',27,8,-0.1),
(227,'beam_fit_params',28,0,-71.5391),
(228,'beam_fit_params',28,1,-1.05347),
(229,'beam_fit_params',28,2,-0.826342),
(230,'beam_fit_params',28,3,0.203507),
(231,'beam_fit_params',28,4,0.053614),
(232,'beam_fit_params',28,5,-0.0425785),
(233,'beam_fit_params',28,6,-0.0185315),
(234,'beam_fit_params',29,0,15.5),
(235,'beam_fit_params',29,1,0.589),
(236,'beam_fit_params',29,2,1),
(237,'beam_fit_params',29,3,0.025),
(238,'beam_fit_params',29,4,1.5),
(239,'beam_fit_params',29,5,0.0405),
(240,'beam_fit_params',29,6,0.759),
(241,'beam_fit_params',29,7,46.4),
(242,'beam_fit_params',29,8,1.1),
(243,'beam_fit_params',30,0,-75.4231),
(244,'beam_fit_params',30,1,0.295854),
(245,'beam_fit_params',30,2,-0.985779),
(246,'beam_fit_params',30,3,-0.076236),
(247,'beam_fit_params',30,4,0.0980699),
(248,'beam_fit_params',30,5,-0.0248092),
(249,'beam_fit_params',30,6,-0.0512818),
(250,'beam_fit_params',31,0,15.5),
(251,'beam_fit_params',31,1,0.503),
(252,'beam_fit_params',31,2,1),
(253,'beam_fit_params',31,3,0.025),
(254,'beam_fit_params',31,4,2),
(255,'beam_fit_params',31,5,0.117),
(256,'beam_fit_params',31,6,0.318),
(257,'beam_fit_params',31,7,94),
(258,'beam_fit_params',31,8,1.35),
(259,'beam_fit_params',32,0,-74.8168),
(260,'beam_fit_params',32,1,-0.899995),
(261,'beam_fit_params',32,2,-1.57067),
(262,'beam_fit_params',32,3,-0.379862),
(263,'beam_fit_params',32,4,0.384429),
(264,'beam_fit_params',32,5,0.264557),
(265,'beam_fit_params',32,6,0.0263143),
(266,'beam_fit_params',33,0,0),
(267,'beam_fit_params',33,1,37.8),
(268,'beam_fit_params',33,2,1),
(269,'beam_fit_params',33,3,0.002),
(270,'beam_fit_params',33,4,0.25),
(271,'beam_fit_params',33,5,0.0414),
(272,'beam_fit_params',33,6,0.625),
(273,'beam_fit_params',33,7,48.9),
(274,'beam_fit_params',33,8,1.69),
(275,'beam_fit_params',34,0,-70.3701),
(276,'beam_fit_params',34,1,0.284601),
(277,'beam_fit_params',34,2,-0.184305),
(278,'beam_fit_params',34,3,-0.042567),
(279,'beam_fit_params',34,4,-0.00921848),
(280,'beam_fit_params',34,5,0.00698594),
(281,'beam_fit_params',34,6,0.00725332),
(282,'beam_fit_params',35,0,15.5),
(283,'beam_fit_params',35,1,320),
(284,'beam_fit_params',35,2,1),
(285,'beam_fit_params',35,3,0.00037),
(286,'beam_fit_params',35,4,0.25),
(287,'beam_fit_params',35,5,0.117),
(288,'beam_fit_params',35,6,0.537),
(289,'beam_fit_params',35,7,76.8),
(290,'beam_fit_params',35,8,1.59);
/*!40000 ALTER TABLE `coefficients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `fit_templates`
--

LOCK TABLES `fit_templates` WRITE;
/*!40000 ALTER TABLE `fit_templates` DISABLE KEYS */;
INSERT INTO `fit_templates` VALUES
(1,'CHEB','Barnett uses eV/amu as the units of measurements of energy of the projectile. In this database we report energy data already converted to eV',1),
(2,'TAB2_1_1','Tabata uses keV as the units of measurements of energy, In this database we report energy data converted to eV',2),
(3,'TAB2_1_2','Tabata uses keV as the units of measurements of energy, In this database we report energy data converted to eV',2),
(4,'TAB2_1_3','Tabata uses keV as the units of measurements of energy, In this database we report energy data converted to eV',2),
(5,'TAB2_1_4','Tabata uses keV as the units of measurements of energy, In this database we report energy data converted to eV',2),
(6,'TAB2_1_5','Tabata uses keV as the units of measurements of energy, In this database we report energy data converted to eV',2),
(7,'TAB2_1_6','Tabata uses keV as the units of measurements of energy, In this database we report energy data converted to eV',2),
(8,'TAB2_1_7','Tabata uses keV as the units of measurements of energy, In this database we report energy data converted to eV',2),
(9,'TAB2_1_8','Tabata uses keV as the units of measurements of energy, In this database we report energy data converted to eV',2),
(10,'TAB2_1_9','Tabata uses keV as the units of measurements of energy, In this database we report energy data converted to eV',2),
(11,'TAB2_1_10','Tabata uses keV as the units of measurements of energy, In this database we report energy data converted to eV',2),
(12,'TAB2_1_11','Tabata uses keV as the units of measurements of energy, In this database we report energy data converted to eV',2),
(13,'TAB2_1_12','Tabata uses keV as the units of measurements of energy, In this database we report energy data converted to eV',2),
(14,'TAB2_1_13','Tabata uses keV as the units of measurements of energy, In this database we report energy data converted to eV',2),
(15,'TAB2_1_14','Tabata uses keV as the units of measurements of energy, In this database we report energy data converted to eV',2);
/*!40000 ALTER TABLE `fit_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sources`
--

LOCK TABLES `sources` WRITE;
/*!40000 ALTER TABLE `sources` DISABLE KEYS */;
INSERT INTO `sources` VALUES
(1,'C. F. Barnett',0,'Atomic Data for Fusion Volume 1: Collisions of H, H2, He and Li Atoms and Ions with Atoms and Molecules',1990,'Controlled Fusion Atomic Data Center'),
(2,'T. Tabata',0,'The Collected Works of Tatsuo Tabata Volume 17: Atomic and Molecular Collision Cross Sections (2)',2018,'IDEA');
/*!40000 ALTER TABLE `sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `species`
--

LOCK TABLES `species` WRITE;
/*!40000 ALTER TABLE `species` DISABLE KEYS */;
INSERT INTO `species` VALUES
(1,'e-',0.000549,-1,NULL,NULL,'2026-03-18 00:49:07','2026-03-18 00:49:07'),
(2,'H+',1.01,1,NULL,NULL,'2026-03-18 00:49:07','2026-03-18 00:49:07'),
(3,'H',1.01,0,NULL,NULL,'2026-03-18 00:49:07','2026-03-18 00:49:07'),
(4,'H-',1.01,-1,NULL,NULL,'2026-03-18 00:49:07','2026-03-18 00:49:07'),
(5,'H2+',2.02,1,NULL,NULL,'2026-03-18 00:49:07','2026-03-18 00:49:07'),
(6,'H2',2.02,0,NULL,NULL,'2026-03-18 00:49:07','2026-03-18 00:49:07'),
(7,'H3+',3.02,1,NULL,NULL,'2026-03-18 00:49:07','2026-03-18 00:49:07'),
(8,'He',4,0,NULL,NULL,'2026-03-18 00:49:07','2026-03-18 00:49:07');
/*!40000 ALTER TABLE `species` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-18 14:55:29
