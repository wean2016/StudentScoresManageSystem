/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : db_studentscoremanagesystem

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2017-05-05 02:28:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_class
-- ----------------------------
DROP TABLE IF EXISTS `t_class`;
CREATE TABLE `t_class` (
  `stuClass` varchar(255) NOT NULL,
  PRIMARY KEY (`stuClass`),
  KEY `class` (`stuClass`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_class
-- ----------------------------
INSERT INTO `t_class` VALUES ('信安二班');
INSERT INTO `t_class` VALUES ('城市与地下空间一班');
INSERT INTO `t_class` VALUES ('翻译一班');
INSERT INTO `t_class` VALUES ('自动化五班');
INSERT INTO `t_class` VALUES ('计科一班');
INSERT INTO `t_class` VALUES ('软工八班');

-- ----------------------------
-- Table structure for t_course
-- ----------------------------
DROP TABLE IF EXISTS `t_course`;
CREATE TABLE `t_course` (
  `term` varchar(255) DEFAULT NULL,
  `CourseId` varchar(255) NOT NULL,
  `Cname` varchar(255) DEFAULT NULL,
  `TeacherId` varchar(255) DEFAULT NULL,
  `credit` double DEFAULT NULL,
  PRIMARY KEY (`CourseId`),
  KEY `term` (`term`),
  KEY `teacherid` (`TeacherId`),
  CONSTRAINT `teacherid` FOREIGN KEY (`TeacherId`) REFERENCES `t_teacher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `term` FOREIGN KEY (`term`) REFERENCES `t_term` (`term`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_course
-- ----------------------------
INSERT INTO `t_course` VALUES ('2017年春季', 'CRS250', '爱肝教学', 'tch123456', '10');
INSERT INTO `t_course` VALUES ('2016年春季', 'CRS255', 'C', 'tch123456', '1');
INSERT INTO `t_course` VALUES ('2016年春季', 'CRS256', 'Java', 'tch123266', '3');
INSERT INTO `t_course` VALUES ('2016年春季', 'CRS257', 'Mysql', 'tch123266', '2');
INSERT INTO `t_course` VALUES ('2017年秋季', 'CRS333', 'Html', 'tch456723', '1');
INSERT INTO `t_course` VALUES ('2016年春季', 'CRS454', '打猎', 'tch456723', '5.5');

-- ----------------------------
-- Table structure for t_defaultterm
-- ----------------------------
DROP TABLE IF EXISTS `t_defaultterm`;
CREATE TABLE `t_defaultterm` (
  `id` int(11) NOT NULL,
  `term` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `defaultexam` (`term`),
  CONSTRAINT `defaultexam` FOREIGN KEY (`term`) REFERENCES `t_term` (`term`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_defaultterm
-- ----------------------------
INSERT INTO `t_defaultterm` VALUES ('1', '2016年春季');

-- ----------------------------
-- Table structure for t_evaluate
-- ----------------------------
DROP TABLE IF EXISTS `t_evaluate`;
CREATE TABLE `t_evaluate` (
  `CourseId` varchar(255) NOT NULL,
  `term` varchar(255) DEFAULT NULL,
  `student_id` varchar(255) NOT NULL,
  `teacher_id` varchar(255) NOT NULL,
  `lesson` varchar(255) DEFAULT NULL,
  `homework` varchar(255) DEFAULT NULL,
  `evaluated` int(255) DEFAULT NULL,
  PRIMARY KEY (`CourseId`,`student_id`),
  KEY `evaluate_student` (`student_id`),
  KEY `evaluate_teacher` (`teacher_id`),
  KEY `evaluate_term` (`term`),
  CONSTRAINT `evaluate_course` FOREIGN KEY (`CourseId`) REFERENCES `t_scores` (`CourseId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `evaluate_student` FOREIGN KEY (`student_id`) REFERENCES `t_student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `evaluate_teacher` FOREIGN KEY (`teacher_id`) REFERENCES `t_teacher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `evaluate_term` FOREIGN KEY (`term`) REFERENCES `t_term` (`term`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_evaluate
-- ----------------------------
INSERT INTO `t_evaluate` VALUES ('CRS255', '2016年春季', '3111001111', 'tch123456', '非常满意', '非常满意', '1');
INSERT INTO `t_evaluate` VALUES ('CRS255', '2016年春季', '3111002222', 'tch123456', '非常满意', '一般', '1');
INSERT INTO `t_evaluate` VALUES ('CRS255', '2016年春季', '3111003333', 'tch123456', null, null, '0');
INSERT INTO `t_evaluate` VALUES ('CRS255', '2016年春季', '3111004444', 'tch123456', null, null, '0');
INSERT INTO `t_evaluate` VALUES ('CRS255', '2016年春季', '3111005555', 'tch123456', null, null, '0');
INSERT INTO `t_evaluate` VALUES ('CRS255', '2016年春季', '3116005189', 'tch123456', null, null, '0');

-- ----------------------------
-- Table structure for t_grade
-- ----------------------------
DROP TABLE IF EXISTS `t_grade`;
CREATE TABLE `t_grade` (
  `stuGrade` int(255) NOT NULL,
  PRIMARY KEY (`stuGrade`),
  KEY `grade` (`stuGrade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_grade
-- ----------------------------
INSERT INTO `t_grade` VALUES ('2011');
INSERT INTO `t_grade` VALUES ('2012');
INSERT INTO `t_grade` VALUES ('2013');
INSERT INTO `t_grade` VALUES ('2014');
INSERT INTO `t_grade` VALUES ('2015');
INSERT INTO `t_grade` VALUES ('2016');
INSERT INTO `t_grade` VALUES ('2017');

-- ----------------------------
-- Table structure for t_inform
-- ----------------------------
DROP TABLE IF EXISTS `t_inform`;
CREATE TABLE `t_inform` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `publisher` varchar(255) NOT NULL,
  `publishTime` datetime NOT NULL,
  `updateTime` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `attachmentName` varchar(255) DEFAULT NULL,
  `attachmentUrl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `publisher` (`publisher`),
  CONSTRAINT `publisher` FOREIGN KEY (`publisher`) REFERENCES `t_teacher` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_inform
-- ----------------------------
INSERT INTO `t_inform` VALUES ('5', '大大谢', '2017-04-20 23:25:07', '2017-04-24 11:55:52', '测试用', 'lalalalalal', null, null);
INSERT INTO `t_inform` VALUES ('6', '大大谢', '2017-04-21 00:38:18', '2017-04-21 00:38:18', '五一放假啦！！！', '放假放假放假放假放假！！！！', null, null);
INSERT INTO `t_inform` VALUES ('7', '大大谢', '2017-04-21 23:38:56', '2017-04-21 23:38:56', '龙哥带飞', '&lt;script&gt;\r\n  alert(\'lalalalalalal\');\r\n&lt;/script&gt;', null, null);
INSERT INTO `t_inform` VALUES ('8', '大大谢', '2017-04-21 23:42:08', '2017-04-21 23:42:08', '龙哥带飞', '&lt;script&gt;\r\nalert(\'&#36215;&#39134;~~~~\');\r\n&lt;/script&gt;', null, null);

-- ----------------------------
-- Table structure for t_manage
-- ----------------------------
DROP TABLE IF EXISTS `t_manage`;
CREATE TABLE `t_manage` (
  `wrongTimes` int(11) DEFAULT '0',
  `isLocking` int(11) DEFAULT '0',
  `id` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_manage
-- ----------------------------
INSERT INTO `t_manage` VALUES ('0', '0', '君不见黄河之水天上来', 'kCNPx0WYSeWYWZv4oS5mLRAavrVc8FI+');

-- ----------------------------
-- Table structure for t_scores
-- ----------------------------
DROP TABLE IF EXISTS `t_scores`;
CREATE TABLE `t_scores` (
  `term` varchar(255) DEFAULT NULL,
  `stuClass` varchar(255) DEFAULT NULL,
  `CourseId` varchar(255) NOT NULL,
  `StudentId` varchar(255) NOT NULL,
  `score` double(255,2) DEFAULT NULL,
  `GPA` double(255,2) DEFAULT NULL,
  PRIMARY KEY (`StudentId`,`CourseId`),
  KEY `term1` (`term`),
  KEY `course1` (`CourseId`),
  KEY `class1` (`stuClass`),
  CONSTRAINT `class1` FOREIGN KEY (`stuClass`) REFERENCES `t_class` (`stuClass`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `course1` FOREIGN KEY (`CourseId`) REFERENCES `t_course` (`CourseId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `studentid1` FOREIGN KEY (`StudentId`) REFERENCES `t_student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `term1` FOREIGN KEY (`term`) REFERENCES `t_term` (`term`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_scores
-- ----------------------------
INSERT INTO `t_scores` VALUES ('2016年春季', '软工八班', 'CRS255', '3111001111', '0.01', '0.00');
INSERT INTO `t_scores` VALUES ('2016年春季', '软工八班', 'CRS255', '3111002222', '55.00', '0.00');
INSERT INTO `t_scores` VALUES ('2016年春季', '软工八班', 'CRS255', '3111003333', '66.00', '1.60');
INSERT INTO `t_scores` VALUES ('2016年春季', '软工八班', 'CRS255', '3111004444', '77.00', '2.70');
INSERT INTO `t_scores` VALUES ('2016年春季', '软工八班', 'CRS255', '3111005555', '88.00', '3.80');
INSERT INTO `t_scores` VALUES ('2016年春季', '城市与地下空间一班', 'CRS255', '3116005189', '100.00', '5.00');

-- ----------------------------
-- Table structure for t_student
-- ----------------------------
DROP TABLE IF EXISTS `t_student`;
CREATE TABLE `t_student` (
  `wrongTimes` int(11) DEFAULT '0',
  `isLocking` int(11) DEFAULT '0',
  `id` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `e_mail` varchar(255) DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `stuGrade` int(255) DEFAULT NULL,
  `stuClass` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `grade` (`stuGrade`),
  KEY `class` (`stuClass`),
  CONSTRAINT `class` FOREIGN KEY (`stuClass`) REFERENCES `t_class` (`stuClass`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `grade` FOREIGN KEY (`stuGrade`) REFERENCES `t_grade` (`stuGrade`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_student
-- ----------------------------
INSERT INTO `t_student` VALUES ('0', '0', '3111001111', '+EqTSvi98fk=', '可乐', '女', null, null, null, null, '2011', '软工八班');
INSERT INTO `t_student` VALUES ('0', '0', '3111002222', 've0GTk00jLs=', '雪碧', '女', null, null, null, null, '2011', '软工八班');
INSERT INTO `t_student` VALUES ('0', '0', '3111003333', 'mGiEv+Fieio=', '橙汁', '女', null, null, null, null, '2011', '软工八班');
INSERT INTO `t_student` VALUES ('0', '0', '3111004444', 'dc/exvxqv+Q=', '豆浆', '女', null, null, null, null, '2011', '软工八班');
INSERT INTO `t_student` VALUES ('0', '0', '3111005555', 'heACIUOIlcQ=', '咖啡', '女', null, null, null, null, '2011', '软工八班');
INSERT INTO `t_student` VALUES ('0', '0', '3115556677', '6iCoVbzBsGM=', '刘跃群', '男', '', '', '', null, '2012', '城市与地下空间一班');
INSERT INTO `t_student` VALUES ('0', '0', '3116005189', 'z0EGnQ5POsg=', '跃群', '男', '13145794798', '你确定你有房吗', 'wean96@Gmail.com', '/pic/e029fa7e-d997-4d4f-9b77-933a1e5c1180_null.png', '2016', '城市与地下空间一班');
INSERT INTO `t_student` VALUES ('0', '0', '3334445555', 'wAvZe3Xjneo=', '刘跃群', '男', '', '', '', null, '2016', '信安二班');

-- ----------------------------
-- Table structure for t_teacher
-- ----------------------------
DROP TABLE IF EXISTS `t_teacher`;
CREATE TABLE `t_teacher` (
  `wrongTimes` int(11) DEFAULT '0',
  `isLocking` int(11) DEFAULT '0',
  `id` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `e_mail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`name`),
  KEY `name` (`name`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_teacher
-- ----------------------------
INSERT INTO `t_teacher` VALUES ('0', '0', 'tch123266', 'f72JavPDEdE=', 'hahahah', '人妖', '3724678274', 'eneneneen', '1283@abc.com');
INSERT INTO `t_teacher` VALUES ('0', '0', 'tch123345', '+YtH57+4Koc=', '小大谢', '男', '13145777777', '广工教师公寓', '77777@qq.com');
INSERT INTO `t_teacher` VALUES ('0', '0', 'tch123456', 'abL7p6yEABM=', '大大谢', '男', '13145799999', '广工教师公寓a栋101房aaa', '99899@Gmail.com');
INSERT INTO `t_teacher` VALUES ('0', '0', 'tch221100', '/HRtkZmjvqo=', '宝宝', '女', null, null, null);
INSERT INTO `t_teacher` VALUES ('1', '0', 'tch443322', '8ylfU29hNjc=', '小宝', '女', null, null, null);
INSERT INTO `t_teacher` VALUES ('0', '0', 'tch443355', '8ylfU29hNjc=', '王根基', '男', null, null, null);
INSERT INTO `t_teacher` VALUES ('1', '0', 'tch456123', 'vvMfSP1FoMQ=', '大小谢', '女', '13145755555', '自己租房', '22222@firefox.com');
INSERT INTO `t_teacher` VALUES ('0', '0', 'tch456723', 'OZZ+4s5AHtc=', '库洛姆', '女', null, null, null);
INSERT INTO `t_teacher` VALUES ('0', '0', 'tch567123', 'Khoro8eWh4U=', '小小谢', '男', '13145733333', '自己买房', '66666@2144.com');
INSERT INTO `t_teacher` VALUES ('0', '0', 'tch665544', 'B87wA5N8eFk=', '大宝', '女', null, null, null);

-- ----------------------------
-- Table structure for t_term
-- ----------------------------
DROP TABLE IF EXISTS `t_term`;
CREATE TABLE `t_term` (
  `term` varchar(255) NOT NULL,
  PRIMARY KEY (`term`),
  KEY `exam` (`term`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_term
-- ----------------------------
INSERT INTO `t_term` VALUES ('2016年春季');
INSERT INTO `t_term` VALUES ('2017年春季');
INSERT INTO `t_term` VALUES ('2017年秋季');
INSERT INTO `t_term` VALUES ('2018年冬季');
INSERT INTO `t_term` VALUES ('2018年春季');
