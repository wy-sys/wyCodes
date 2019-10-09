/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : production_ssm

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2019-09-27 19:25:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for role_function
-- ----------------------------
DROP TABLE IF EXISTS `role_function`;
CREATE TABLE `role_function` (
  `role_fun_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色权限id',
  `role_id` int(11) DEFAULT NULL COMMENT '角色id',
  `function_id` int(11) DEFAULT NULL COMMENT '权限id',
  `status` varchar(1) DEFAULT NULL COMMENT '角色权限状态',
  PRIMARY KEY (`role_fun_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_function
-- ----------------------------
INSERT INTO `role_function` VALUES ('1', '1001', '1', null);
INSERT INTO `role_function` VALUES ('2', '1001', '2', null);
INSERT INTO `role_function` VALUES ('3', '1001', '3', null);
INSERT INTO `role_function` VALUES ('4', '1002', '1', null);
