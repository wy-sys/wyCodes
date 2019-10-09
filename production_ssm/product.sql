/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : production_ssm

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2019-09-27 19:24:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `pid` int(11) DEFAULT NULL COMMENT '产品编号',
  `pname` varchar(255) NOT NULL COMMENT '产品名称',
  `ptype` varchar(255) DEFAULT NULL COMMENT '产品类型',
  `pstate` varchar(255) DEFAULT NULL COMMENT '产品状态',
  `pimg` varchar(255) DEFAULT NULL COMMENT '相关图片',
  PRIMARY KEY (`pname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
