# ************************************************************
# Sequel Pro SQL dump
# Version 3408
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: localhost (MySQL 5.5.9)
# Database: zephyr
# Generation Time: 2012-10-23 01:04:53 +0000
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
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(30) NOT NULL DEFAULT '',
  `message` text,
  `priority` int(11) DEFAULT NULL,
  `priorityName` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `datetime` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;

INSERT INTO `log` (`id`, `timestamp`, `ip`, `message`, `priority`, `priorityName`)
VALUES
	(1,'2012-07-16 07:28:15','','Tg_Site_Route->match /',7,'DEBUG'),
	(2,'2012-07-16 07:28:15','','Tg_Site_Route->match /home',7,'DEBUG'),
	(3,'2012-07-16 07:28:21','','Tg_Site_Route->match /',7,'DEBUG'),
	(4,'2012-07-16 07:28:21','','Tg_Site_Route->match /home',7,'DEBUG'),
	(5,'2012-07-16 07:28:25','','Tg_Site_Route->match /admin',7,'DEBUG'),
	(6,'2012-07-16 07:28:26','','Tg_Site_Route->match /themes/default/css/global.css',7,'DEBUG'),
	(7,'2012-07-16 07:28:27','','Tg_Site_Route->match /login',7,'DEBUG'),
	(8,'2012-07-16 07:28:27','','Tg_Site_Route->match /admin',7,'DEBUG'),
	(9,'2012-07-16 07:28:27','','Tg_Site_Route->match /themes/backend/css/admin.css',7,'DEBUG'),
	(10,'2012-07-16 07:28:29','','Tg_Site_Route->match /admin/site',7,'DEBUG'),
	(11,'2012-07-16 07:28:30','','Tg_Site_Route->match /themes/backend/css/admin.css',7,'DEBUG'),
	(12,'2012-07-16 07:29:38','','Tg_Site_Route->match /admin/site/templates',7,'DEBUG'),
	(13,'2012-07-16 07:29:38','','Tg_Site_Route->match /themes/backend/css/admin.css',7,'DEBUG'),
	(14,'2012-07-16 07:29:39','','Tg_Site_Route->match /extjs/images/gray/panel/white-top-bottom.gif',7,'DEBUG'),
	(15,'2012-07-16 07:29:42','','Tg_Site_Route->match /admin/site/template-delete',7,'DEBUG'),
	(16,'2012-07-16 07:29:42','','Tg_Site_Route->match /themes/backend/css/admin.css',7,'DEBUG'),
	(17,'2012-07-16 07:29:48','','Tg_Site_Route->match /admin/site/pages',7,'DEBUG'),
	(18,'2012-07-16 07:29:48','','Tg_Site_Route->match /themes/backend/css/admin.css',7,'DEBUG'),
	(19,'2012-07-16 07:30:00','','Tg_Site_Route->match /admin/site-page-save',7,'DEBUG'),
	(20,'2012-07-16 07:30:12','','Tg_Site_Route->match /admin/site-page-save',7,'DEBUG'),
	(21,'2012-07-16 07:30:17','','Tg_Site_Route->match /admin/site-page-save',7,'DEBUG'),
	(22,'2012-07-16 07:30:21','','Tg_Site_Route->match /admin/site-page-save',7,'DEBUG'),
	(23,'2012-07-16 07:30:31','','Tg_Site_Route->match /admin/site/templates',7,'DEBUG'),
	(24,'2012-07-16 07:30:31','','Tg_Site_Route->match /themes/backend/css/admin.css',7,'DEBUG'),
	(25,'2012-07-16 07:30:33','','Tg_Site_Route->match /admin/site/template-delete',7,'DEBUG'),
	(26,'2012-07-16 07:30:33','','Tg_Site_Route->match /themes/backend/css/admin.css',7,'DEBUG'),
	(27,'2012-07-16 07:30:37','','Tg_Site_Route->match /admin/site/templates',7,'DEBUG'),
	(28,'2012-07-16 07:30:41','','Tg_Site_Route->match /admin/site/template-delete',7,'DEBUG'),
	(29,'2012-07-16 07:30:43','','Tg_Site_Route->match /admin/site/template-delete',7,'DEBUG'),
	(30,'2012-07-16 07:30:45','','Tg_Site_Route->match /admin/site/template-delete',7,'DEBUG'),
	(31,'2012-07-16 07:30:49','','Tg_Site_Route->match /admin/site/templates',7,'DEBUG'),
	(32,'2012-07-16 07:30:49','','Tg_Site_Route->match /themes/backend/css/admin.css',7,'DEBUG');

/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;


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
  `action` varchar(55) DEFAULT '',
  `locked` int(11) NOT NULL DEFAULT '0',
  `visible` int(11) NOT NULL DEFAULT '1',
  `title` varchar(50) NOT NULL DEFAULT '',
  `themeId` int(11) NOT NULL DEFAULT '1',
  `metaTitle` varchar(255) NOT NULL DEFAULT '',
  `metaDescription` varchar(255) NOT NULL DEFAULT '',
  `metaKeywords` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `site_page` WRITE;
/*!40000 ALTER TABLE `site_page` DISABLE KEYS */;

INSERT INTO `site_page` (`id`, `left`, `right`, `name`, `templateId`, `action`, `locked`, `visible`, `title`, `themeId`, `metaTitle`, `metaDescription`, `metaKeywords`)
VALUES
	(1,1,36,'root',21,'',1,1,'Home',1,'','',''),
	(2,10,35,'admin',5,'',1,0,'Admin',2,'','',''),
	(3,11,18,'site',6,'',1,1,'Site',2,'','',''),
	(4,12,13,'pages',6,'pages',1,1,'Pages',2,'','',''),
	(5,14,15,'templates',6,'templates',1,1,'Templates',2,'','',''),
	(21,2,3,'about',2,'',0,1,'About',1,'','',''),
	(8,6,7,'login',3,'',0,0,'Login',2,'','',''),
	(9,8,9,'register',4,'',0,0,'Register',2,'','',''),
	(10,19,20,'content',7,'',1,1,'Content',2,'','',''),
	(11,25,30,'user',8,'',0,1,'Users',2,'','',''),
	(12,31,34,'system',9,'',0,1,'System',2,'','',''),
	(13,26,27,'user',8,'users',0,1,'Users',2,'','',''),
	(14,28,29,'roles',8,'roles',0,1,'Roles',2,'','',''),
	(15,16,17,'themes',6,'layouts',0,1,'Themes',2,'','',''),
	(16,32,33,'modules',9,'modules',0,1,'Modules / Plugins',2,'','',''),
	(17,21,22,'files',12,'',0,1,'Files',2,'','',''),
	(18,23,24,'reports',16,'',0,1,'Reports',2,'','',''),
	(22,4,5,'work',2,'',0,1,'Work',1,'','','');

/*!40000 ALTER TABLE `site_page` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table site_page_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `site_page_role`;

CREATE TABLE `site_page_role` (
  `pageId` int(11) NOT NULL DEFAULT '0',
  `roleId` int(11) NOT NULL DEFAULT '0',
  `privilege` varchar(25) NOT NULL DEFAULT 'read',
  PRIMARY KEY (`pageId`,`roleId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `site_page_role` WRITE;
/*!40000 ALTER TABLE `site_page_role` DISABLE KEYS */;

INSERT INTO `site_page_role` (`pageId`, `roleId`, `privilege`)
VALUES
	(2,2,'read'),
	(2,3,'read,write'),
	(3,2,'read,write'),
	(3,3,'read,write'),
	(4,3,'read,write'),
	(5,3,'read,write'),
	(16,3,'read,write'),
	(17,3,'read,write');

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
	(11,'Core - File','core','file',NULL,NULL,'no',0),
	(7,'Admin - Content','core_admin','content','','','no',0),
	(8,'Admin - Users','core_admin','user',NULL,'','yes',0),
	(9,'Admin - System','core_admin','system',NULL,'','yes',0),
	(10,'Core - Error','core','error',NULL,NULL,'no',0),
	(12,'Admin - Files','core_admin','files',NULL,NULL,'yes',0),
	(14,'Default - Abstract','default','abstract',NULL,NULL,'no',0),
	(15,'Default - Home','default','home',NULL,'home.xml','yes',0),
	(16,'Default - General','default','general',NULL,'general.xml','yes',0),
	(17,'Admin - Reports','core_admin','reports',NULL,NULL,'yes',0),
	(21,'Easycut - Index','easycut','index',NULL,NULL,'yes',0),
	(22,'Core - Assets','core','assets',NULL,NULL,'yes',0);

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
	(1,'Default','default'),
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
