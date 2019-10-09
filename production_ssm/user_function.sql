/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : production_ssm

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2019-09-27 19:25:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for user_function
-- ----------------------------
DROP TABLE IF EXISTS `user_function`;
CREATE TABLE `user_function` (
  `fun_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `fun_name` varchar(255) DEFAULT NULL COMMENT '权限名称',
  `url` varchar(255) DEFAULT NULL COMMENT '权限路径',
  `status` varchar(1) DEFAULT NULL COMMENT '权限状态',
  `create_user` varchar(255) DEFAULT NULL COMMENT '权限创建人',
  `create_time` datetime DEFAULT NULL COMMENT '权限创建时间',
  `pid` int(11) DEFAULT NULL COMMENT '父权限',
  PRIMARY KEY (`fun_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_function
-- ----------------------------
INSERT INTO `user_function` VALUES ('1', '订单管理', null, '1', null, null, null);
INSERT INTO `user_function` VALUES ('2', '系统管理', null, '1', null, null, null);
INSERT INTO `user_function` VALUES ('3', '客户管理', null, null, null, null, null);
