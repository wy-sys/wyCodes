/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : production_ssm

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2019-09-27 19:23:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `oid` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `o_cname` varchar(255) DEFAULT NULL COMMENT '订购客户',
  `o_pname` varchar(255) DEFAULT NULL COMMENT '订购产品',
  `onum` int(11) DEFAULT NULL COMMENT '订购数量',
  `oprice` double DEFAULT NULL COMMENT '税前单价',
  `ounit` varchar(255) DEFAULT NULL COMMENT '单位',
  `ostate` varchar(255) DEFAULT NULL COMMENT '订单状态',
  `ocreatetime` datetime DEFAULT NULL COMMENT '订购日期',
  `ofinishtime` datetime DEFAULT NULL COMMENT '要求日期',
  `ops` varchar(255) DEFAULT '未开始' COMMENT '订单要求',
  `oimg` varchar(255) DEFAULT NULL COMMENT '相关图片虚拟路径',
  `orealimg` varchar(255) DEFAULT NULL COMMENT '相关图片绝对路径',
  `oacr` varchar(255) DEFAULT NULL COMMENT '订单附件虚拟路径',
  `orealacr` varchar(255) DEFAULT NULL COMMENT '订单附件绝对路径',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('124', 'aere', 'erg', '34', '45', 'set', '订单取消', '2019-09-27 00:00:00', '2019-09-27 00:00:00', 'ergqe', '', '', null, null);
INSERT INTO `orders` VALUES ('125', 'earg', 'erge', '324', '44', 'steh', '订单取消', '2019-09-27 00:00:00', '2019-09-27 00:00:00', 'rthrew', '', '', null, null);
INSERT INTO `orders` VALUES ('136', '', '', null, null, '', '', null, null, '', '/upload/1569566451310.jpg', 'D:\\upload\\1569566451310.jpg', null, null);
INSERT INTO `orders` VALUES ('138', '', '', null, null, '', '', null, null, '', '/upload/1569566901627.jpg', 'D:\\upload\\1569566901627.jpg', null, null);
INSERT INTO `orders` VALUES ('144', '1', '', null, null, '', '', null, null, '', '/upload/1569568415558.jpg', 'D:\\upload\\1569568415558.jpg', null, null);
INSERT INTO `orders` VALUES ('145', '2', 'trfds', '345', '89', 'gfx', '订单取消', '2019-09-27 00:00:00', '2019-09-27 00:00:00', 'iuytr', '/upload/1569568655744.jpg', 'D:\\upload\\1569568655744.jpg', null, null);
INSERT INTO `orders` VALUES ('100001', '阿里', '壁挂音箱', '222', '24', '美元', '订单取消', '2019-09-27 00:00:00', '2019-09-27 00:00:00', '订单要求', '', '', null, null);
INSERT INTO `orders` VALUES ('100002', '网易', '椅子', '32', '32', '元', '已完成', '2019-09-18 14:45:16', '2019-09-18 14:45:18', '订单要求', '/upload/1569501372144.jpg', 'D:upload1569501372144.jpg', '附件', null);
INSERT INTO `orders` VALUES ('100003', '京东', '电脑', '121', '3313', '元', '已开始', '2019-09-18 14:46:31', '2019-09-18 14:46:33', '订单要求', '/upload/1569501372144.jpg', 'D:upload1569501372144.jpg', '附件', null);
INSERT INTO `orders` VALUES ('100004', '网易', '投影机', '111', '888', '元', '未开始', '2019-09-18 14:47:10', '2019-09-18 14:47:13', '订单要求', '/upload/1569501372144.jpg', 'D:upload1569501372144.jpg', '附件', null);
INSERT INTO `orders` VALUES ('100008', '网易', '椅子', '235', '34', '元', '未开始', '2019-09-27 00:00:00', '2019-09-27 00:00:00', 'ergw', '', '', null, null);
INSERT INTO `orders` VALUES ('100009', '阿里', '椅子', '132', '11', '元', '未开始', '2019-09-18 14:48:07', '2019-09-18 14:48:09', '订单要求', '/upload/1569501372144.jpg', 'D:upload1569501372144.jpg', '附件', null);
INSERT INTO `orders` VALUES ('100011', 'erg', 'ryt', '35', '56', 'sth', '订单取消', '2019-09-27 00:00:00', '2019-09-27 00:00:00', 'seth', '/upload/1569554180794.jpg', 'D:\\upload\\1569554180794.jpg', null, null);
INSERT INTO `orders` VALUES ('100015', '京东', '桌子', '23', '23', '元', '未开始', '2019-09-18 14:48:41', '2019-09-18 14:48:44', '订单要求', '/upload/1569501372144.jpg', 'D:upload1569501372144.jpg', '附件', null);
INSERT INTO `orders` VALUES ('100022', 'erg', 'erg', '23', '23', 'ewrgf', '未开始', '2019-09-19 00:00:00', '2019-09-25 00:00:00', 'erg', '', '', null, null);
