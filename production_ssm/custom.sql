/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : production_ssm

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2019-09-27 19:22:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for custom
-- ----------------------------
DROP TABLE IF EXISTS `custom`;
CREATE TABLE `custom` (
  `cid` int(11) NOT NULL AUTO_INCREMENT COMMENT '客户编号',
  `cname` varchar(255) DEFAULT NULL COMMENT '客户名称',
  `crealname` varchar(255) DEFAULT NULL COMMENT '客户全称',
  `caddress` varchar(255) DEFAULT NULL COMMENT '地址',
  `cfax` varchar(255) DEFAULT NULL COMMENT '传真',
  `cemail` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `cadmin` varchar(255) DEFAULT NULL COMMENT '经理姓名',
  `cphone` varchar(255) DEFAULT NULL COMMENT '电话',
  `cstate` varchar(255) DEFAULT '未知状态' COMMENT '客户状态',
  `cps` varchar(255) DEFAULT '无' COMMENT '备注',
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=445685 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of custom
-- ----------------------------
INSERT INTO `custom` VALUES ('101001', '阿里', 'afew', '中国杭州', '15615616', 'alibaba@126.com', '马云', '1851561561', '无效客户', '客户介绍');
INSERT INTO `custom` VALUES ('101002', '网易', '杭州网易养猪公司', '杭州滨江区', '4214324', '242534513', '丁磊', '2353623', '未知状态', 'awefw');
INSERT INTO `custom` VALUES ('101003', '京东', '北京京东世纪贸易有限公司', '北京市朝阳区', '3432654', '326543354', '章泽天', '34654323', '有效客户', 'ewrgthj');
INSERT INTO `custom` VALUES ('101004', '新浪', '新浪网络技术股份有限公司', '北京市北四环', '3456787', '465433454', '曹国伟', '67876543', '有效客户', '客户介绍');
INSERT INTO `custom` VALUES ('101005', '美团', '北京三快在线科技有限公司', '北京市朝阳区', '45676543', '4567898', '王兴', '87654325432', '无效客户', 'wertyukl');
INSERT INTO `custom` VALUES ('101006', '蒙牛', '内蒙古蒙牛乳业集团', '呼和浩特', '678987654', '56787654', '3213', '3454', '有效客户', '客户介绍');
INSERT INTO `custom` VALUES ('101007', 'ertyui', 'uytr', 'frtyui', 'iuytr', '4567', 'ghyjkl', '7654543', '无效客户', 'ertyujk');
INSERT INTO `custom` VALUES ('445684', '阿里', 'ertyui', 'ytreds', 'dfghjk', 'iuytre', 'ghjk', '456789', '无效客户', 'iuytr');
