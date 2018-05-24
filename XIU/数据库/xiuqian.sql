/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50615
Source Host           : localhost:3306
Source Database       : xiuqian

Target Server Type    : MYSQL
Target Server Version : 50615
File Encoding         : 65001

Date: 2018-05-23 10:35:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `action`
-- ----------------------------
DROP TABLE IF EXISTS `action`;
CREATE TABLE `action` (
  `actionId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `activityId` int(11) NOT NULL,
  `signInTime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`actionId`),
  KEY `userId_idx` (`userId`),
  KEY `activityIda_idx` (`activityId`),
  CONSTRAINT `activityIda` FOREIGN KEY (`activityId`) REFERENCES `activity` (`activityId`),
  CONSTRAINT `userIda` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of action
-- ----------------------------
INSERT INTO `action` VALUES ('1', '1', '1', '10');
INSERT INTO `action` VALUES ('2', '2', '1', '20');

-- ----------------------------
-- Table structure for `activity`
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity` (
  `activityId` int(11) NOT NULL AUTO_INCREMENT,
  `activityTitle` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `activityIntroduce` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '这个发起人很懒，啥也没有写。',
  `activityImageUrl` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `activityStartTime` date NOT NULL,
  `activityEndTime` date NOT NULL,
  `activityModel` int(11) NOT NULL DEFAULT '1',
  `activityUserNumber` int(11) NOT NULL,
  `activityStartUser` int(11) NOT NULL,
  `activityAttendNum` int(11) NOT NULL DEFAULT '0',
  `punishId` int(11) NOT NULL,
  PRIMARY KEY (`activityId`),
  KEY `activityStartUser_idx` (`activityStartUser`),
  KEY `punishId_idx` (`punishId`),
  CONSTRAINT `activityStartUser` FOREIGN KEY (`activityStartUser`) REFERENCES `user` (`userId`),
  CONSTRAINT `punishId` FOREIGN KEY (`punishId`) REFERENCES `punishtable` (`punishid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of activity
-- ----------------------------
INSERT INTO `activity` VALUES ('1', '跑步', '这个发起人很懒，啥也没有写。', '/Back/images/rng.png', '2018-05-15', '2018-05-25', '1', '50', '1', '30', '1');
INSERT INTO `activity` VALUES ('2', '上课', '这个发起人很懒，啥也没有写。', '/Back/images/rng.png', '2018-05-16', '2018-05-21', '1', '50', '2', '35', '1');

-- ----------------------------
-- Table structure for `admins`
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `adminId` int(11) NOT NULL AUTO_INCREMENT,
  `adminName` varchar(255) CHARACTER SET utf8 NOT NULL,
  `adminPassword` varchar(255) NOT NULL,
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES ('1', 'asd', '456');

-- ----------------------------
-- Table structure for `attention`
-- ----------------------------
DROP TABLE IF EXISTS `attention`;
CREATE TABLE `attention` (
  `attentionId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `attentionuserId` int(11) NOT NULL,
  PRIMARY KEY (`attentionId`),
  KEY `userId_idx` (`userId`),
  CONSTRAINT `attentionuserId` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`),
  CONSTRAINT `userId` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of attention
-- ----------------------------
INSERT INTO `attention` VALUES ('1', '1', '2');
INSERT INTO `attention` VALUES ('2', '2', '1');

-- ----------------------------
-- Table structure for `discuss`
-- ----------------------------
DROP TABLE IF EXISTS `discuss`;
CREATE TABLE `discuss` (
  `discussId` int(10) unsigned NOT NULL,
  `actionId` int(11) NOT NULL,
  `discussIntroduce` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `discussImageUrl` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `discussPraise` int(11) NOT NULL DEFAULT '0',
  `discussTime` date DEFAULT NULL,
  PRIMARY KEY (`discussId`),
  KEY `actionId_idx` (`actionId`),
  CONSTRAINT `actionId` FOREIGN KEY (`actionId`) REFERENCES `action` (`actionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of discuss
-- ----------------------------
INSERT INTO `discuss` VALUES ('1', '1', '每天跑步好', '/Back/images/rng.png', '30', '2018-05-16');
INSERT INTO `discuss` VALUES ('2', '1', '啊啊啊', '/Back/images/rng.png', '10', '2018-05-15');

-- ----------------------------
-- Table structure for `punishtable`
-- ----------------------------
DROP TABLE IF EXISTS `punishtable`;
CREATE TABLE `punishtable` (
  `punishId` int(11) NOT NULL AUTO_INCREMENT,
  `punishName` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `punishIntroduce` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`punishId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of punishtable
-- ----------------------------
INSERT INTO `punishtable` VALUES ('1', '淘汰', '一天淘汰一个');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userNum` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `userName` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `userPassword` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `userEmail` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userImageUrl` varchar(45) COLLATE utf8_unicode_ci DEFAULT '/Back/images/rng.png',
  `userIntroduce` varchar(45) COLLATE utf8_unicode_ci DEFAULT '一个小小萌新',
  PRIMARY KEY (`userId`),
  UNIQUE KEY `userId_UNIQUE` (`userId`),
  UNIQUE KEY `userNum_UNIQUE` (`userNum`)
) ENGINE=InnoDB AUTO_INCREMENT=341 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '2015015444', 'aaa', '123', '123', '/Back/images/rng.png', '123');
INSERT INTO `user` VALUES ('2', '2015015777', 'bbb', '123', '123', '/Back/images/rng.png', '123');
INSERT INTO `user` VALUES ('3', '2015015159', '赵雅欣', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('4', '2015015167', '申晓苗', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('5', '2015015194', '许磊', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('6', '2015015188', '王朝辉', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('7', '2015015200', '王珺', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('8', '2015015163', '张瑶', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('9', '2015015153', '刘薇', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('10', '2015015173', '唐喆', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('11', '2015015162', '底梦泽', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('12', '2015015189', '张珊珊', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('13', '2015015192', '陈燕博', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('14', '2015015183', '王攀', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('15', '2015015180', '吴亚苹', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('16', '2015015166', '何磊', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('17', '2015015179', '王伟健', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('18', '2015015171', '汤珺', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('19', '2015015154', '刘永佳', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('20', '2015015187', '张大鹏', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('21', '2015015195', '刘壑川', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('22', '2015015185', '杨思琪', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('23', '2015015193', '修乔琦', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('24', '2015015158', '苏悦', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('25', '2015015196', '黄纯浩', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('26', '2015015190', '邢旭东', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('27', '2015015157', '吉俊卿', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('28', '2015015170', '魏小明', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('29', '2015015199', '肖波', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('30', '2015015161', '王贯懿', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('31', '2015015186', '米仕壮', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('32', '2015015191', '单继东', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('33', '2015015152', '曹倩', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('34', '2015015168', '张弛', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('35', '2015015172', '樊卫宽', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('36', '2015015156', '李华伟', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('37', '2015015164', '杨子轩', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('38', '2015015155', '李朝亮', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('39', '2015015169', '于文治', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('40', '2015015175', '杨晨星', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('41', '2015015178', '刘鹏鹏', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('42', '2015015160', '王余柠', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('43', '2015015184', '邵晓阡', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('44', '2015015182', '方浩', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('45', '2015015151', '刘通', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('46', '2015015181', '董玥', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('47', '2015015174', '庞旭东', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('48', '2015015165', '赵峻仟', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('49', '2015015198', '补双彦', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('50', '2015015177', '张紫航', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('51', '2015015211', '李思豪', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('52', '2015015247', '郑鹏', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('53', '2015015238', '张萌', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('54', '2015015205', '柳泽光', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('55', '2014011615', '李静敏', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('56', '2015015230', '屈晓茹', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('57', '2015015218', '张有朋', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('58', '2015015201', '王颖', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('59', '2015015228', '孟喆', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('60', '2015015229', '魏巍', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('61', '2015015213', '冯露露', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('62', '2015015242', '王晓晗', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('63', '2015015220', '张娜', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('64', '2015015217', '马佩琪', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('65', '2015015240', '汪小钦', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('66', '2015015226', '武云坤', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('67', '2015015244', '王玉波', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('68', '2015015231', '邢佳蕾', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('69', '2015015208', '田赛', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('70', '2015015241', '陈世艺', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('71', '2015015222', '孙立常', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('72', '2015015209', '杨文邈', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('73', '2015015236', '温达一', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('74', '2015015202', '黄浦', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('75', '2015015206', '闫政斌', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('76', '2015015234', '陈冲', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('77', '2015015235', '游然', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('78', '2015015224', '王钊', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('79', '2015015207', '窦昕茹', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('80', '2015015214', '张兵', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('81', '2015015246', '刘雨晴', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('82', '2015015203', '冯海晴', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('83', '2015015248', '郭龙', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('84', '2015015221', '高燕昭', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('85', '2015015237', '李响', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('86', '2015015227', '张梦飞', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('87', '2015015233', '李坤', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('88', '2015015250', '李易娟', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('89', '2015015249', '陈鸿宇', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('90', '2015015210', '宋泽琨', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('91', '2015015232', '孙柏', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('92', '2015015223', '王子冰', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('93', '2015015215', '张意诚', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('94', '2015015239', '李笑宇', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('95', '2015015245', '肖舒翔', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('96', '2015015243', '王洪章', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('97', '2015015225', '张寒崧', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('98', '2015015297', '杨子昂', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('99', '2015015287', '杜凯玲', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('100', '2015015278', '荣艳莎', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('101', '2015015251', '王玉苗', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('102', '2015015285', '陈亚楠', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('103', '2015015261', '孙业亨', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('105', '2015015254', '吴桐', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('106', '2015015255', '孙志鹏', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('107', '2015015269', '丁庭宇', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('108', '2015015300', '高明健', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('109', '2015015271', '秦晓宇', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('110', '2015015262', '魏铭潇', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('111', '2015015299', '刘雨帆', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('112', '2015015264', '田梦伟', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('113', '2015015284', '刘硕', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('114', '2015015286', '王炜', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('115', '2015015291', '孙慧喆', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('116', '2015015272', '郑子温', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('117', '2015015263', '方昱程', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('118', '2015015270', '赵凯艳', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('119', '2015015260', '张伟晓', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('120', '2015015274', '张晗', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('121', '2015015268', '王孜润', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('122', '2015015292', '齐紫荆', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('123', '2015015282', '李子旋', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('124', '2015015281', '陈兵', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('125', '2015015266', '王中禹', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('126', '2015015253', '刘云飞', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('127', '2015015298', '陈立风', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('128', '2015015279', '王晟宇', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('129', '2015015288', '崔庆伟', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('130', '2015015280', '王永康', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('131', '2015015294', '佐鑫', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('132', '2015015293', '张梦洲', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('133', '2015015273', '张学钊', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('134', '2015015256', '崔允松', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('135', '2015015267', '肖明臣', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('136', '2015015252', '冯芝金', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('137', '2015015295', '刘增璐', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('138', '2015015296', '岳重阳', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('139', '2015015259', '霍彦儒', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('140', '2015015283', '韩竞锐', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('141', '2015015289', '郭佳兴', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('142', '2015015277', '石崇', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('143', '2015015290', '冀康鑫', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('144', '2015015275', '贠智群', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('145', '2015015276', '张壮壮', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('146', '2015015258', '孙杨天一', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('147', '2015015328', '赵丽荣', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('148', '2015015336', '王静楠', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('149', '2015015307', '张晴', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('150', '2015015335', '田松岩', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('151', '2015015332', '丁雪怡', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('152', '2015015326', '孙雨佳', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('153', '2015015341', '郝蒙蒙', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('154', '2015015347', '刘宇佳', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('155', '2015015314', '董隽妍', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('156', '2015015301', '赵洋洋', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('157', '2015015316', '张天鑫', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('158', '2015015315', '宋荣淯', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('159', '2015015313', '刘瀛', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('160', '2015015322', '王寅达', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('161', '2015015319', '赵蕾', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('162', '2015015311', '刘林微', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('163', '2015015344', '石鑫哲', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('164', '2015015302', '王辉', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('165', '2015015310', '于淑新', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('166', '2015015333', '张驰', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('167', '2015015340', '郭彭', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('168', '201401168', '田野', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('169', '2015015330', '杨永昊', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('170', '2015015312', '张少凯', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('171', '2015015303', '董瑞', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('172', '2015015305', '曹国鸿', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('174', '2015015329', '马嘉田', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('175', '2015015343', '李鑫松', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('176', '2015015323', '孟秋建', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('178', '2015015345', '贾漠菲', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('179', '2015015321', '刘振宙', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('187', '2015015309', '高思雨', '123', 'null', '/Back/images/rng.png', 'null');
INSERT INTO `user` VALUES ('188', '2015015325', '田云鹏', '123', 'null', '/Back/images/rng.png', 'null');
