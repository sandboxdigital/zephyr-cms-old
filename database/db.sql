# ************************************************************
# Sequel Pro SQL dump
# Version 3408
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: localhost (MySQL 5.5.9)
# Database: zephyr
# Generation Time: 2011-11-11 09:21:37 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table content
# ------------------------------------------------------------

DROP TABLE IF EXISTS `content`;

CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(25) NOT NULL,
  `data` text NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table file
# ------------------------------------------------------------

DROP TABLE IF EXISTS `file`;

CREATE TABLE `file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `identifier` varchar(32) NOT NULL DEFAULT '',
  `fullname` varchar(132) NOT NULL DEFAULT '',
  `type` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `identifier` (`identifier`),
  KEY `fullname` (`fullname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table file_folder
# ------------------------------------------------------------

DROP TABLE IF EXISTS `file_folder`;

CREATE TABLE `file_folder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `left` int(11) DEFAULT NULL,
  `right` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `file_folder` WRITE;
/*!40000 ALTER TABLE `file_folder` DISABLE KEYS */;

INSERT INTO `file_folder` (`id`, `left`, `right`, `name`, `title`)
VALUES
	(1,1,2,'root','Categories');

/*!40000 ALTER TABLE `file_folder` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table file_folder_file
# ------------------------------------------------------------

DROP TABLE IF EXISTS `file_folder_file`;

CREATE TABLE `file_folder_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `folder_id` int(11) NOT NULL DEFAULT '0',
  `file_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log`;

CREATE TABLE `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) DEFAULT '0',
  `info` text,
  PRIMARY KEY (`id`),
  KEY `datetime` (`datetime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `aclId` varchar(10) DEFAULT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `parentRole` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;

INSERT INTO `role` (`id`, `aclId`, `name`, `description`, `parentRole`)
VALUES
	(1,'USER','User','Normal (logged in) user',NULL),
	(2,'ADMIN','Admin','Admin User',NULL),
	(3,'SUPERUSER','Superuser','Super user',NULL);

/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table site_page
# ------------------------------------------------------------

DROP TABLE IF EXISTS `site_page`;

CREATE TABLE `site_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `left` int(11) NOT NULL,
  `right` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `templateId` int(11) NOT NULL,
  `action` varchar(55) DEFAULT '""',
  `locked` int(11) NOT NULL DEFAULT '0',
  `visible` int(11) NOT NULL DEFAULT '1',
  `title` varchar(50) NOT NULL DEFAULT '""',
  `themeId` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `site_page` WRITE;
/*!40000 ALTER TABLE `site_page` DISABLE KEYS */;

INSERT INTO `site_page` (`id`, `left`, `right`, `name`, `templateId`, `action`, `locked`, `visible`, `title`, `themeId`)
VALUES
	(1,1,56,'root',19,'',1,1,'Home',35),
	(2,24,51,'admin',5,'',1,0,'Admin',3),
	(3,27,34,'site',6,'',1,1,'Site',3),
	(4,28,29,'pages',6,'pages',1,1,'Pages',3),
	(5,30,31,'templates',6,'templates',1,1,'Templates',3),
	(6,2,3,'activity',25,'',0,1,'Activity',36),
	(8,16,17,'login',3,'',0,0,'Login',4),
	(9,18,19,'register',4,'',0,0,'Register',2),
	(10,35,36,'content',8,'',1,1,'Content',3),
	(11,20,23,'info',2,'',0,0,'Footer',2),
	(12,21,22,'tandc',2,'',0,1,'Terms and Conditions',2),
	(16,41,46,'user',9,'',0,1,'Users',3),
	(17,47,50,'system',10,'',0,1,'System',3),
	(18,42,43,'user',9,'users',0,1,'Users',3),
	(19,44,45,'roles',9,'roles',0,1,'Roles',3),
	(20,32,33,'themes',6,'layouts',0,1,'Themes',3),
	(23,48,49,'modules',10,'modules',0,1,'Modules / Plugins',3),
	(60,8,9,'social',25,'social',0,0,'Social',36),
	(59,4,5,'project',25,'projects',0,0,'Projects',36),
	(30,10,15,'information',30,'',0,1,'Information',37),
	(29,37,38,'files',16,'',0,1,'Files',3),
	(61,52,53,'subscribe',29,'',0,0,'subscribe',36),
	(41,11,12,'about',20,'',0,1,'About',37),
	(62,54,55,'search',31,'',0,0,'search',36),
	(52,39,40,'reports',26,'',0,1,'Reports',3),
	(51,25,26,'blog',23,'',0,1,'News',3),
	(58,6,7,'news',25,'news',0,0,'News',36),
	(57,13,14,'contact',20,'',0,1,'Contact',37);

/*!40000 ALTER TABLE `site_page` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table site_page_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `site_page_role`;

CREATE TABLE `site_page_role` (
  `pageId` int(11) NOT NULL DEFAULT '0',
  `roleId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pageId`,`roleId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `site_page_role` WRITE;
/*!40000 ALTER TABLE `site_page_role` DISABLE KEYS */;

INSERT INTO `site_page_role` (`pageId`, `roleId`)
VALUES
	(2,3),
	(2,4),
	(3,3),
	(3,4),
	(4,4),
	(5,4),
	(16,4),
	(17,4),
	(20,4);

/*!40000 ALTER TABLE `site_page_role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table site_page_template
# ------------------------------------------------------------

DROP TABLE IF EXISTS `site_page_template`;

CREATE TABLE `site_page_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `module` varchar(255) NOT NULL,
  `controller` varchar(255) NOT NULL,
  `action` varchar(255) DEFAULT NULL,
  `form` varchar(255) DEFAULT NULL,
  `visible` enum('yes','no') DEFAULT 'yes',
  `defaultSubPageTemplate` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `site_page_template` WRITE;
/*!40000 ALTER TABLE `site_page_template` DISABLE KEYS */;

INSERT INTO `site_page_template` (`id`, `name`, `module`, `controller`, `action`, `form`, `visible`, `defaultSubPageTemplate`)
VALUES
	(1,'Core - Home','core','index','','home.xml','yes',0),
	(2,'Core - CMS','core','cms','','cms.xml','yes',0),
	(3,'Core - Login','core','login','','','yes',0),
	(4,'Core - Register','core','register','','','yes',0),
	(5,'Admin - Home','core_admin','index','','','yes',0),
	(6,'Admin - Site','core_admin','site','','','yes',0),
	(15,'Core - File','core','file',NULL,NULL,'no',0),
	(8,'Admin - Content','core_admin','content','','','no',0),
	(9,'Admin - Users','core_admin','user',NULL,'','yes',0),
	(10,'Admin - System','core_admin','system',NULL,'','yes',0),
	(14,'Core - Error','core','error',NULL,NULL,'no',0),
	(16,'Admin - Files','core_admin','files',NULL,NULL,'yes',0),
	(17,'Core - Assets','core','assets',NULL,NULL,'yes',0),
	(18,'OnePartners - Abstract','qgc','abstract',NULL,NULL,'yes',0),
	(19,'OnePartners - Home','qgc','home',NULL,'home.xml','yes',0),
	(20,'OnePartners - Information','qgc','general',NULL,'general.xml','yes',0),
	(23,'OnePartners - Blogadmin','blog','blogadmin',NULL,NULL,'yes',0),
	(24,'Blog - Blog','blog','blog',NULL,NULL,'yes',0),
	(25,'OnePartners - News','qgc','news',NULL,'general.xml','yes',0),
	(26,'Admin - Reports','core_admin','reports',NULL,NULL,'yes',0),
	(29,'OnePartners - Signup','qgc','signup',NULL,NULL,'yes',0),
	(31,'Qgc - Search','qgc','search',NULL,NULL,'yes',0),
	(30,'OnePartners - Information Home','qgc','informationhome',NULL,'','yes',0);

/*!40000 ALTER TABLE `site_page_template` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table site_theme
# ------------------------------------------------------------

DROP TABLE IF EXISTS `site_theme`;

CREATE TABLE `site_theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `folder` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `site_theme` WRITE;
/*!40000 ALTER TABLE `site_theme` DISABLE KEYS */;

INSERT INTO `site_theme` (`id`, `name`, `folder`)
VALUES
	(1,'Mistral','mistral'),
	(3,'Default','default'),
	(2,'Backend','backend');

/*!40000 ALTER TABLE `site_theme` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table system_extensions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `system_extensions`;

CREATE TABLE `system_extensions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `path` varchar(100) NOT NULL,
  `locked` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `password` varchar(64) NOT NULL,
  `firstname` varchar(200) NOT NULL DEFAULT '',
  `lastname` varchar(64) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`id`, `email`, `password`, `firstname`, `lastname`, `created_at`, `updated_at`)
VALUES
	(3,'superuser@zephyrcms.com','5f4dcc3b5aa765d61d8327deb882cf99','Superuser','user',NULL,NULL),
	(2,'admin@zephyrcms.com','5f4dcc3b5aa765d61d8327deb882cf99','Admin','user',NULL,NULL),
	(1,'user@zephyrcms.com','5f4dcc3b5aa765d61d8327deb882cf99','Normal','user',NULL,NULL);

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_role`;

CREATE TABLE `user_role` (
  `user_id` int(11) NOT NULL DEFAULT '0',
  `role_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;

INSERT INTO `user_role` (`user_id`, `role_id`)
VALUES
	(1,1),
	(2,2),
	(2,3),
	(3,1),
	(3,2),
	(3,3);

/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
