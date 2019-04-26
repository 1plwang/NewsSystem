/*
Navicat MySQL Data Transfer

Source Server         : 本机MySQL
Source Server Version : 50149
Source Host           : 127.0.0.1:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50149
File Encoding         : 65001

Date: 2018-10-29 10:49:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for lms_logs
-- ----------------------------
DROP TABLE IF EXISTS `lms_logs`;
CREATE TABLE `lms_logs` (
  `logID` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `freeType` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `percentage` varchar(255) DEFAULT NULL,
  `startTime` datetime DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `ManagerID` bigint(20) DEFAULT NULL,
  `TaskID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`logID`),
  KEY `FK531A52FC3CBD4138` (`ManagerID`),
  KEY `FK531A52FC52847731` (`TaskID`),
  CONSTRAINT `FK531A52FC52847731` FOREIGN KEY (`TaskID`) REFERENCES `lms_tasks` (`taskID`),
  CONSTRAINT `FK531A52FC3CBD4138` FOREIGN KEY (`ManagerID`) REFERENCES `lms_staffs` (`staffID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lms_logs
-- ----------------------------
INSERT INTO `lms_logs` VALUES ('1', '1', '2018-10-10 16:36:50', '1', '1', '1', '2018-10-27 16:37:06', '1', '1', '1');

-- ----------------------------
-- Table structure for lms_projects
-- ----------------------------
DROP TABLE IF EXISTS `lms_projects`;
CREATE TABLE `lms_projects` (
  `projectID` bigint(20) NOT NULL AUTO_INCREMENT,
  `endDate` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `planEndDate` datetime DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `ManagerID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`projectID`),
  KEY `FK130F37473CBD4138` (`ManagerID`),
  CONSTRAINT `FK130F37473CBD4138` FOREIGN KEY (`ManagerID`) REFERENCES `lms_staffs` (`staffID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lms_projects
-- ----------------------------
INSERT INTO `lms_projects` VALUES ('1', '2018-10-09 16:37:37', '1', '2018-10-27 16:37:44', '1', '2018-10-24 16:37:55', '1');
INSERT INTO `lms_projects` VALUES ('2', '2018-10-11 00:00:00', '123', '2018-11-28 00:00:00', '654654465', '2018-10-02 00:00:00', '1');
INSERT INTO `lms_projects` VALUES ('3', '2018-10-18 00:00:00', '23231', '2018-10-28 00:00:00', '654654', '2018-10-02 00:00:00', '1');
INSERT INTO `lms_projects` VALUES ('4', null, '5221', '2018-10-04 00:00:00', '54546', '2018-10-03 00:00:00', '1');

-- ----------------------------
-- Table structure for lms_roles
-- ----------------------------
DROP TABLE IF EXISTS `lms_roles`;
CREATE TABLE `lms_roles` (
  `roleID` bigint(20) NOT NULL AUTO_INCREMENT,
  `authors` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lms_roles
-- ----------------------------
INSERT INTO `lms_roles` VALUES ('1', '1;2;3;4;5', '项目管理');
INSERT INTO `lms_roles` VALUES ('2', '1;2', '日志管理');
INSERT INTO `lms_roles` VALUES ('3', '1;2;3', '员工管理');
INSERT INTO `lms_roles` VALUES ('4', '1;2;3;4', '角色管理');
INSERT INTO `lms_roles` VALUES ('5', '1;2', '回报管理');

-- ----------------------------
-- Table structure for lms_sections
-- ----------------------------
DROP TABLE IF EXISTS `lms_sections`;
CREATE TABLE `lms_sections` (
  `sectionID` bigint(20) NOT NULL AUTO_INCREMENT,
  `endDate` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `planEndDate` datetime DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `AcceptorID` bigint(20) DEFAULT NULL,
  `CreatorID` bigint(20) DEFAULT NULL,
  `ManagerID` bigint(20) DEFAULT NULL,
  `ProjectID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`sectionID`),
  KEY `FK87167CFB7CA88DF7` (`CreatorID`),
  KEY `FK87167CFB3CBD4138` (`ManagerID`),
  KEY `FK87167CFBFE37AF6` (`AcceptorID`),
  KEY `FK87167CFB4166BD4B` (`ProjectID`),
  CONSTRAINT `FK87167CFB4166BD4B` FOREIGN KEY (`ProjectID`) REFERENCES `lms_projects` (`projectID`),
  CONSTRAINT `FK87167CFB3CBD4138` FOREIGN KEY (`ManagerID`) REFERENCES `lms_staffs` (`staffID`),
  CONSTRAINT `FK87167CFB7CA88DF7` FOREIGN KEY (`CreatorID`) REFERENCES `lms_staffs` (`staffID`),
  CONSTRAINT `FK87167CFBFE37AF6` FOREIGN KEY (`AcceptorID`) REFERENCES `lms_staffs` (`staffID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lms_sections
-- ----------------------------
INSERT INTO `lms_sections` VALUES ('1', '2018-10-27 16:47:48', '123456', '2018-10-27 16:47:54', '1', '2018-10-27 16:48:02', '1', '1', '1', '1', '1');
INSERT INTO `lms_sections` VALUES ('2', '2018-11-02 00:00:00', '654546654', '2018-11-02 00:00:00', '', '2018-10-20 00:00:00', '0', '1', '1', '1', '2');

-- ----------------------------
-- Table structure for lms_staffs
-- ----------------------------
DROP TABLE IF EXISTS `lms_staffs`;
CREATE TABLE `lms_staffs` (
  `staffID` bigint(20) NOT NULL AUTO_INCREMENT,
  `contactAddress` varchar(255) DEFAULT NULL,
  `crashTel` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `idCard` varchar(255) DEFAULT NULL,
  `loginName` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `passWord` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `RoleID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`staffID`),
  KEY `FK20707A04FC6DD11` (`RoleID`),
  CONSTRAINT `FK20707A04FC6DD11` FOREIGN KEY (`RoleID`) REFERENCES `lms_roles` (`roleID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lms_staffs
-- ----------------------------
INSERT INTO `lms_staffs` VALUES ('1', '1', '1', '1', '1', '123456', '123456', 'UISmEsE/Z/M=', '1', '1');

-- ----------------------------
-- Table structure for lms_tasks
-- ----------------------------
DROP TABLE IF EXISTS `lms_tasks`;
CREATE TABLE `lms_tasks` (
  `taskID` bigint(20) NOT NULL AUTO_INCREMENT,
  `endDate` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `planEndDate` datetime DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `taskLevel` int(11) DEFAULT NULL,
  `AcceptorID` bigint(20) DEFAULT NULL,
  `CreatorID` bigint(20) DEFAULT NULL,
  `ManagerID` bigint(20) DEFAULT NULL,
  `ParentID` bigint(20) DEFAULT NULL,
  `SectionID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`taskID`),
  KEY `FK109A97E17CA88DF7` (`CreatorID`),
  KEY `FK109A97E13CBD4138` (`ManagerID`),
  KEY `FK109A97E1C24F73CB` (`SectionID`),
  KEY `FK109A97E1FE37AF6` (`AcceptorID`),
  KEY `FK109A97E1CD111516` (`ParentID`),
  CONSTRAINT `FK109A97E1CD111516` FOREIGN KEY (`ParentID`) REFERENCES `lms_tasks` (`taskID`),
  CONSTRAINT `FK109A97E13CBD4138` FOREIGN KEY (`ManagerID`) REFERENCES `lms_staffs` (`staffID`),
  CONSTRAINT `FK109A97E17CA88DF7` FOREIGN KEY (`CreatorID`) REFERENCES `lms_staffs` (`staffID`),
  CONSTRAINT `FK109A97E1C24F73CB` FOREIGN KEY (`SectionID`) REFERENCES `lms_sections` (`sectionID`),
  CONSTRAINT `FK109A97E1FE37AF6` FOREIGN KEY (`AcceptorID`) REFERENCES `lms_staffs` (`staffID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lms_tasks
-- ----------------------------
INSERT INTO `lms_tasks` VALUES ('1', '2018-10-27 16:40:43', '1', '2018-10-09 16:41:31', '1', '2018-10-17 16:41:39', '1', '1', '1', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for lms_workreports
-- ----------------------------
DROP TABLE IF EXISTS `lms_workreports`;
CREATE TABLE `lms_workreports` (
  `reportID` bigint(20) NOT NULL AUTO_INCREMENT,
  `bossEvalu` varchar(255) DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `leaderRemind` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `reportTime` datetime DEFAULT NULL,
  `selfEvalu` varchar(255) DEFAULT NULL,
  `staffRemind` int(11) DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `LeaderID` bigint(20) DEFAULT NULL,
  `ReporterID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`reportID`),
  KEY `FK67DF8F81CC1F996C` (`ReporterID`),
  KEY `FK67DF8F81B6048F94` (`LeaderID`),
  CONSTRAINT `FK67DF8F81B6048F94` FOREIGN KEY (`LeaderID`) REFERENCES `lms_staffs` (`staffID`),
  CONSTRAINT `FK67DF8F81CC1F996C` FOREIGN KEY (`ReporterID`) REFERENCES `lms_staffs` (`staffID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lms_workreports
-- ----------------------------
INSERT INTO `lms_workreports` VALUES ('1', '4545645', '2018-10-27 16:48:33', '1', '123456', '2018-10-27 16:48:43', '1', '1', '2018-10-27 16:48:52', '1', '1', '1', '1');
