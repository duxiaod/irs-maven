/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50549
Source Host           : localhost:3306
Source Database       : irs1

Target Server Type    : MYSQL
Target Server Version : 50549
File Encoding         : 65001

Date: 2018-07-29 00:45:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_admin
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin`;
CREATE TABLE `tb_admin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `salt` varchar(5) DEFAULT '',
  `fullname` varchar(50) NOT NULL COMMENT '全名',
  `e_mail` varchar(100) DEFAULT NULL,
  `sex` varchar(1) NOT NULL COMMENT '性别：0女，1男,2保密',
  `birthday` date NOT NULL,
  `address` varchar(100) NOT NULL COMMENT '地址',
  `phone` varchar(20) NOT NULL COMMENT '手机号',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色编号',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `tb_admin_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `tb_roles` (`role_id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_admin
-- ----------------------------
INSERT INTO `tb_admin` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', null, 'arthur', 'isduxd@163.com', '1', '1994-11-08', '北京市通州区科创十四街', '17693109997', '1');
INSERT INTO `tb_admin` VALUES ('18', 'test', 'e10adc3949ba59abbe56e057f20f883e', null, 'test', 'test@test.com', '1', '2018-02-25', '甘肃省兰州市榆中县和平镇', '17601038192', null);

-- ----------------------------
-- Table structure for tb_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_log`;
CREATE TABLE `tb_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `operation` varchar(50) NOT NULL COMMENT '操作',
  `method` varchar(100) DEFAULT NULL COMMENT '执行方法',
  `params` varchar(500) DEFAULT NULL COMMENT '请求参数',
  `ip` varchar(64) DEFAULT NULL COMMENT 'ip',
  `create_time` datetime NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=495 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_log
-- ----------------------------
INSERT INTO `tb_log` VALUES ('371', 'admin', '添加角色信息', '/irs/sys/insRole', 'TbRoles [roleId=null, roleName=ettet, roleRemark=ete];1,1;', '0:0:0:0:0:0:0:1', '2018-06-29 15:09:56');
INSERT INTO `tb_log` VALUES ('372', 'admin', '添加角色信息', '/irs/sys/insRole', 'TbRoles [roleId=null, roleName=ewtet, roleRemark=wet];1,1;', '0:0:0:0:0:0:0:1', '2018-06-29 15:10:05');
INSERT INTO `tb_log` VALUES ('373', 'admin', '添加角色信息', '/irs/sys/insRole', 'TbRoles [roleId=null, roleName=wetewt, roleRemark=wetwet];1,1;', '0:0:0:0:0:0:0:1', '2018-06-29 15:10:12');
INSERT INTO `tb_log` VALUES ('374', 'admin', '添加角色信息', '/irs/sys/insRole', 'TbRoles [roleId=null, roleName=te, roleRemark=test];1,1;', '0:0:0:0:0:0:0:1', '2018-06-29 16:38:29');
INSERT INTO `tb_log` VALUES ('375', 'admin', '添加角色信息', '/irs/sys/insRole', 'TbRoles [roleId=null, roleName=fsadf, roleRemark=safd];1,1;', '0:0:0:0:0:0:0:1', '2018-06-29 16:39:50');
INSERT INTO `tb_log` VALUES ('376', 'admin', '添加角色信息', '/irs/sys/insRole', 'TbRoles [roleId=null, roleName=fsdf, roleRemark=sdf];1,1;', '0:0:0:0:0:0:0:1', '2018-06-29 16:41:08');
INSERT INTO `tb_log` VALUES ('377', 'admin', '添加角色信息', '/irs/sys/insRole', 'TbRoles [roleId=null, roleName=fsdf、, roleRemark=dfsf];1,1;', '0:0:0:0:0:0:0:1', '2018-06-29 16:42:00');
INSERT INTO `tb_log` VALUES ('378', 'admin', '批量删除指定角色信息', '/irs/sys/delRoles/54,55,56,57,58,59,60', '54,55,56,57,58,59,60;', '0:0:0:0:0:0:0:1', '2018-07-01 21:23:36');
INSERT INTO `tb_log` VALUES ('379', 'admin', '更新管理员信息', '/irs/sys/updAdmin', 'TbAdmin [id=18, username=test, password=null, salt=null, fullname=test, eMail=test@test.com, sex=1, birthday=2018-02-25, address=甘肃省兰州市榆中县和平镇, phone=17601038192, roleId=1, roleName=null];', '0:0:0:0:0:0:0:1', '2018-07-01 21:24:49');
INSERT INTO `tb_log` VALUES ('380', 'admin', '更新管理员信息', '/irs/sys/updAdmin', 'TbAdmin [id=18, username=test, password=null, salt=null, fullname=test, eMail=test@test.com, sex=1, birthday=2018-02-25, address=甘肃省兰州市榆中县和平镇, phone=17601038192, roleId=53, roleName=null];', '0:0:0:0:0:0:0:1', '2018-07-01 21:24:56');
INSERT INTO `tb_log` VALUES ('381', 'admin', '添加角色信息', '/irs/sys/insRole', 'TbRoles [roleId=null, roleName=etst, roleRemark=test];1,1;', '0:0:0:0:0:0:0:1', '2018-07-01 22:01:17');
INSERT INTO `tb_log` VALUES ('382', 'admin', '添加角色信息', '/irs/sys/insRole', 'TbRoles [roleId=null, roleName=te, roleRemark=tet];1,1;', '0:0:0:0:0:0:0:1', '2018-07-01 22:03:05');
INSERT INTO `tb_log` VALUES ('383', 'admin', '添加角色信息', '/irs/sys/insRole', 'TbRoles [roleId=null, roleName=tet, roleRemark=ewtwet];1,1;', '0:0:0:0:0:0:0:1', '2018-07-01 22:13:01');
INSERT INTO `tb_log` VALUES ('384', 'admin', '添加角色信息', '/irs/sys/insRole', 'TbRoles [roleId=null, roleName=tette, roleRemark=ewtte];1,1;', '0:0:0:0:0:0:0:1', '2018-07-01 22:16:39');
INSERT INTO `tb_log` VALUES ('385', 'admin', '批量删除指定角色信息', '/irs/sys/delRoles/61,62,63,64', '61,62,63,64;', '0:0:0:0:0:0:0:1', '2018-07-01 22:18:17');
INSERT INTO `tb_log` VALUES ('386', 'admin', '添加角色信息', '/irs/sys/insRole', 'TbRoles [roleId=null, roleName=te, roleRemark=ewt];1,1;', '0:0:0:0:0:0:0:1', '2018-07-01 22:20:18');
INSERT INTO `tb_log` VALUES ('387', 'admin', '批量删除指定角色信息', '/irs/sys/delRoles/65', '65;', '0:0:0:0:0:0:0:1', '2018-07-01 22:20:26');
INSERT INTO `tb_log` VALUES ('388', 'admin', '添加角色信息', '/irs/sys/insRole', 'TbRoles [roleId=null, roleName=tewt, roleRemark=ewte];1,1;', '0:0:0:0:0:0:0:1', '2018-07-01 22:22:26');
INSERT INTO `tb_log` VALUES ('389', 'admin', '批量删除指定角色信息', '/irs/sys/delRoles/66', '66;', '0:0:0:0:0:0:0:1', '2018-07-01 22:22:31');
INSERT INTO `tb_log` VALUES ('390', 'admin', '添加角色信息', '/irs/sys/insRole', 'TbRoles [roleId=null, roleName=tewt, roleRemark=ewtewt];1,1;', '0:0:0:0:0:0:0:1', '2018-07-01 22:25:02');
INSERT INTO `tb_log` VALUES ('391', 'admin', '批量删除指定角色信息', '/irs/sys/delRoles/67', '67;', '0:0:0:0:0:0:0:1', '2018-07-01 22:25:08');
INSERT INTO `tb_log` VALUES ('392', 'admin', '添加角色信息', '/irs/sys/insRole', 'TbRoles [roleId=null, roleName=sfdsf, roleRemark=sdf];1,1;', '0:0:0:0:0:0:0:1', '2018-07-01 22:28:51');
INSERT INTO `tb_log` VALUES ('393', 'admin', '添加角色信息', '/irs/sys/insRole', 'TbRoles [roleId=null, roleName=sdf, roleRemark=sfsd];1,1;', '0:0:0:0:0:0:0:1', '2018-07-01 22:28:58');
INSERT INTO `tb_log` VALUES ('394', 'admin', '批量删除指定角色信息', '/irs/sys/delRoles/68,69', '68,69;', '0:0:0:0:0:0:0:1', '2018-07-01 22:29:06');
INSERT INTO `tb_log` VALUES ('395', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=53, roleName=test, roleRemark=test];1,1;', '0:0:0:0:0:0:0:1', '2018-07-05 09:34:33');
INSERT INTO `tb_log` VALUES ('396', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=53, roleName=test, roleRemark=test];1,1,16,3,2,53,52,51;', '0:0:0:0:0:0:0:1', '2018-07-05 09:34:42');
INSERT INTO `tb_log` VALUES ('397', 'admin', '更新管理员信息', '/irs/sys/updAdmin', 'TbAdmin [id=18, username=test, password=null, salt=null, fullname=test, eMail=test@test.com, sex=1, birthday=2018-02-25, address=甘肃省兰州市榆中县和平镇, phone=17601038192, roleId=53, roleName=null];', '0:0:0:0:0:0:0:1', '2018-07-07 21:02:50');
INSERT INTO `tb_log` VALUES ('398', 'admin', '更新用户信息', '/irs/user/updUser', 'TbUsers [uid=27, eMail=isduxd@qq.com, nickname=test, sex=0, birthday=2018-03-25, address=北京通州科创十四街区, phone=17693109923, eCode=null, status=1, createTime=null];', '0:0:0:0:0:0:0:1', '2018-07-07 21:05:23');
INSERT INTO `tb_log` VALUES ('399', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=53, roleName=test, roleRemark=test];1,1,16,3,2,53,52,51,59,58,57;', '0:0:0:0:0:0:0:1', '2018-07-14 12:57:22');
INSERT INTO `tb_log` VALUES ('400', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=53, roleName=test, roleRemark=test];1,1,16,3,2,53,52,51,56,55,54,59,58,57;', '0:0:0:0:0:0:0:1', '2018-07-14 12:57:38');
INSERT INTO `tb_log` VALUES ('401', 'admin', '删除菜单信息', '/irs/sys/delMenuById/59', '59;', '0:0:0:0:0:0:0:1', '2018-07-14 12:58:09');
INSERT INTO `tb_log` VALUES ('402', 'admin', '删除菜单信息', '/irs/sys/delMenuById/58', '58;', '0:0:0:0:0:0:0:1', '2018-07-14 12:58:16');
INSERT INTO `tb_log` VALUES ('403', 'admin', '删除菜单信息', '/irs/sys/delMenuById/57', '57;', '0:0:0:0:0:0:0:1', '2018-07-14 12:58:24');
INSERT INTO `tb_log` VALUES ('404', 'admin', '更新管理员信息', '/irs/sys/updAdmin', 'TbAdmin [id=18, username=test, password=null, salt=null, fullname=test, eMail=test@test.com, sex=1, birthday=2018-02-25, address=甘肃省兰州市榆中县和平镇, phone=17601038192, roleId=1, roleName=null];', '0:0:0:0:0:0:0:1', '2018-07-14 12:58:34');
INSERT INTO `tb_log` VALUES ('405', 'admin', '更新管理员信息', '/irs/sys/updAdmin', 'TbAdmin [id=18, username=test, password=null, salt=null, fullname=test, eMail=test@test.com, sex=1, birthday=2018-02-25, address=甘肃省兰州市榆中县和平镇, phone=17601038192, roleId=53, roleName=null];', '0:0:0:0:0:0:0:1', '2018-07-14 12:58:42');
INSERT INTO `tb_log` VALUES ('406', 'admin', '添加角色信息', '/irs/sys/insRole', 'TbRoles [roleId=null, roleName=werw, roleRemark=werwer];1,1,45,44,43,62,61,60;', '0:0:0:0:0:0:0:1', '2018-07-14 12:59:57');
INSERT INTO `tb_log` VALUES ('407', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=54, roleName=werw, roleRemark=werwer];1,1,45,44,43,53,52,51,62,61,60;', '0:0:0:0:0:0:0:1', '2018-07-14 13:00:11');
INSERT INTO `tb_log` VALUES ('408', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=54, roleName=werw, roleRemark=werwer];1,1,45,44,43,62,61,60;', '0:0:0:0:0:0:0:1', '2018-07-14 13:00:19');
INSERT INTO `tb_log` VALUES ('409', 'admin', '添加角色信息', '/irs/sys/insRole', 'TbRoles [roleId=null, roleName=fsdf, roleRemark=sfdf];1,1,66,65,63,68,67,64;', '0:0:0:0:0:0:0:1', '2018-07-17 11:11:57');
INSERT INTO `tb_log` VALUES ('410', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=55, roleName=fsdf, roleRemark=sfdf];1,1,66,65,63,68,67,64,69,67,64;', '0:0:0:0:0:0:0:1', '2018-07-17 11:12:09');
INSERT INTO `tb_log` VALUES ('411', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=55, roleName=fsdf, roleRemark=sfdf];1,1,66,65,63,68,67,64,69,67,64,71,70,64;', '0:0:0:0:0:0:0:1', '2018-07-17 11:12:52');
INSERT INTO `tb_log` VALUES ('412', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=55, roleName=fsdf, roleRemark=sfdf];1,1,66,65,63,68,67,64,69,67,64;', '0:0:0:0:0:0:0:1', '2018-07-17 11:12:59');
INSERT INTO `tb_log` VALUES ('413', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=55, roleName=fsdf, roleRemark=sfdf];1,1,66,65,63,68,67,64,69,67,64,71,70,64;', '0:0:0:0:0:0:0:1', '2018-07-17 11:13:05');
INSERT INTO `tb_log` VALUES ('414', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=55, roleName=fsdf, roleRemark=sfdf];1,1,66,65,63,68,67,64,69,67,64,71,70,64,75,74,64;', '0:0:0:0:0:0:0:1', '2018-07-17 11:14:09');
INSERT INTO `tb_log` VALUES ('415', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=55, roleName=fsdf, roleRemark=sfdf];1,1,66,65,63,68,67,64,69,67,64,71,70,64,73,72,64;', '0:0:0:0:0:0:0:1', '2018-07-17 11:14:17');
INSERT INTO `tb_log` VALUES ('416', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=55, roleName=fsdf, roleRemark=sfdf];1,1,37,11,9,66,65,63,68,67,64,69,67,64,71,70,64,73,72,64,75,74,64;', '0:0:0:0:0:0:0:1', '2018-07-17 11:14:32');
INSERT INTO `tb_log` VALUES ('417', 'admin', '添加角色信息', '/irs/sys/insRole', 'TbRoles [roleId=null, roleName=xdf, roleRemark=fdsf];1,1,71,70,64,73,72,64,77,76,64,81,80;', '0:0:0:0:0:0:0:1', '2018-07-17 11:17:44');
INSERT INTO `tb_log` VALUES ('418', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=56, roleName=xdf, roleRemark=fdsf];1,1,71,70,64,73,72,64,77,76,64,82,64;', '0:0:0:0:0:0:0:1', '2018-07-17 11:17:54');
INSERT INTO `tb_log` VALUES ('419', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=56, roleName=xdf, roleRemark=fdsf];1,1,71,70,64,73,72,64,77,76,64,81,80;', '0:0:0:0:0:0:0:1', '2018-07-17 11:18:01');
INSERT INTO `tb_log` VALUES ('420', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=56, roleName=xdf, roleRemark=fdsf];1,1,71,70,64,73,72,64,77,76,64,85,84,83;', '0:0:0:0:0:0:0:1', '2018-07-17 11:22:21');
INSERT INTO `tb_log` VALUES ('421', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=56, roleName=xdf, roleRemark=fdsf];1,1,71,70,64,73,72,64,77,76,64;', '0:0:0:0:0:0:0:1', '2018-07-17 11:22:29');
INSERT INTO `tb_log` VALUES ('422', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=56, roleName=xdf, roleRemark=fdsf];1,1,71,70,64,73,72,64,77,76,64,81,80;', '0:0:0:0:0:0:0:1', '2018-07-17 11:22:37');
INSERT INTO `tb_log` VALUES ('423', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=56, roleName=xdf, roleRemark=fdsf];1,1,71,70,64,73,72,64,77,76,64,85,84,83;', '0:0:0:0:0:0:0:1', '2018-07-17 11:22:47');
INSERT INTO `tb_log` VALUES ('424', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=56, roleName=xdf, roleRemark=fdsf];1,1,71,70,64,73,72,64,77,76,64,86,81,80,85,84,83;', '0:0:0:0:0:0:0:1', '2018-07-17 11:28:56');
INSERT INTO `tb_log` VALUES ('425', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=56, roleName=xdf, roleRemark=fdsf];1,1,71,70,64,73,72,64,77,76,64,82,64,86,81,80,85,84,83;', '0:0:0:0:0:0:0:1', '2018-07-17 11:29:08');
INSERT INTO `tb_log` VALUES ('426', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=56, roleName=xdf, roleRemark=fdsf];1,1,71,70,64,73,72,64,77,76,64,87,82,64,86,81,80,85,84,83;', '0:0:0:0:0:0:0:1', '2018-07-17 11:29:48');
INSERT INTO `tb_log` VALUES ('427', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=56, roleName=xdf, roleRemark=fdsf];1,1,71,70,64,73,72,64,77,76,64,87,82,64,89,88,64,86,81,80,85,84,83;', '0:0:0:0:0:0:0:1', '2018-07-17 11:32:22');
INSERT INTO `tb_log` VALUES ('428', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=56, roleName=xdf, roleRemark=fdsf];1,1,16,3,2,17,3,2,18,3,2,19,3,2,20,4,2,21,4,2,22,4,2,23,4,2,47,46,2,48,46,2,49,46,2,50,46,2,33,10,9,34,11,9,35,11,9,36,11,9,37,11,9,42,15,14,45,44,43,53,52,51,56,55,54,62,61,60,66,65,63,68,67,64,69,67,64,71,70,64,73,72,64,75,74,64,77,76,64,79,78,64,87,82,64,89,88,64,86,81,80,85,84,83;', '0:0:0:0:0:0:0:1', '2018-07-17 11:32:37');
INSERT INTO `tb_log` VALUES ('429', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=1, roleName=超级管理员, roleRemark=超级管理员];1,1,16,3,2,17,3,2,18,3,2,19,3,2,20,4,2,21,4,2,22,4,2,23,4,2,47,46,2,48,46,2,49,46,2,50,46,2,33,10,9,34,11,9,35,11,9,36,11,9,37,11,9,42,15,14,45,44,43,53,52,51,56,55,54,62,61,60,66,65,63,68,67,64,69,67,64,71,70,64,73,72,64,75,74,64,77,76,64,79,78,64,87,82,64,89,88,64,86,81,80,85,84,83;', '0:0:0:0:0:0:0:1', '2018-07-17 11:34:15');
INSERT INTO `tb_log` VALUES ('430', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=56, roleName=xdf, roleRemark=fdsf];1,1,16,3,2,17,3,2,18,3,2,19,3,2,20,4,2,21,4,2,22,4,2,23,4,2,47,46,2,48,46,2,49,46,2,50,46,2,33,10,9,34,11,9,35,11,9,36,11,9,37,11,9,42,15,14,45,44,43,53,52,51,56,55,54,62,61,60,66,65,63,68,67,64,69,67,64,71,70,64,73,72,64,75,74,64,77,76,64,79,78,64,87,82,64,89,88,64,86,81,80,85,84,83,91,90;', '0:0:0:0:0:0:0:1', '2018-07-27 09:21:58');
INSERT INTO `tb_log` VALUES ('431', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=56, roleName=xdf, roleRemark=fdsf];1,1,16,3,2,17,3,2,18,3,2,19,3,2,20,4,2,21,4,2,22,4,2,23,4,2,47,46,2,48,46,2,49,46,2,50,46,2,33,10,9,34,11,9,35,11,9,36,11,9,37,11,9,42,15,14,45,44,43,53,52,51,56,55,54,62,61,60,66,65,63,68,67,64,69,67,64,71,70,64,73,72,64,75,74,64,77,76,64,79,78,64,87,82,64,89,88,64,86,81,80,85,84,83;', '0:0:0:0:0:0:0:1', '2018-07-27 09:22:06');
INSERT INTO `tb_log` VALUES ('432', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=56, roleName=xdf, roleRemark=fdsf];1,1,16,3,2,20,4,2,47,46,2,48,46,2,49,46,2,50,46,2,33,10,9,34,11,9,35,11,9,36,11,9,42,15,14,45,44,43,53,52,51,56,55,54,62,61,60,66,65,63,68,67,64,69,67,64,71,70,64,73,72,64,75,74,64,77,76,64,79,78,64,87,82,64,89,88,64,86,81,80,85,84,83;', '0:0:0:0:0:0:0:1', '2018-07-27 09:22:26');
INSERT INTO `tb_log` VALUES ('433', 'admin', '添加角色信息', '/irs/sys/insRole', 'TbRoles [roleId=null, roleName=123, roleRemark=3123];1,1,16,3,2,17,3,2,56,55,54,62,61,60,85,84,83,91,90;', '0:0:0:0:0:0:0:1', '2018-07-27 09:25:02');
INSERT INTO `tb_log` VALUES ('434', 'admin', '添加角色信息', '/irs/sys/insRole', 'TbRoles [roleId=null, roleName=213, roleRemark=333];1,1,18,3,2,19,3,2,87,82,64,91,90,92,92;', '0:0:0:0:0:0:0:1', '2018-07-27 09:25:42');
INSERT INTO `tb_log` VALUES ('435', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=1, roleName=超级管理员, roleRemark=超级管理员];1,1,16,3,2,17,3,2,18,3,2,19,3,2,20,4,2,21,4,2,22,4,2,23,4,2,47,46,2,48,46,2,49,46,2,50,46,2,33,10,9,34,11,9,35,11,9,36,11,9,37,11,9,42,15,14,45,44,43,53,52,51,56,55,54,62,61,60,66,65,63,68,67,64,69,67,64,71,70,64,73,72,64,75,74,64,77,76,64,79,78,64,87,82,64,89,88,64,86,81,80,85,84,83,91,90,92,92;', '0:0:0:0:0:0:0:1', '2018-07-27 09:26:07');
INSERT INTO `tb_log` VALUES ('436', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=58, roleName=213, roleRemark=333];1,1,18,3,2,19,3,2,87,82,64,85,84,83,91,90,92,92;', '0:0:0:0:0:0:0:1', '2018-07-27 09:33:07');
INSERT INTO `tb_log` VALUES ('437', 'admin', '添加角色信息', '/irs/sys/insRole', 'TbRoles [roleId=null, roleName=fdsf, roleRemark=fdf];1,1,16,3,2,17,3,2,33,10,9,34,11,9,69,67,64,79,78,64,87,82,64,89,88,64,86,81,80,85,84,83,91,90,92,92;', '0:0:0:0:0:0:0:1', '2018-07-27 09:34:00');
INSERT INTO `tb_log` VALUES ('438', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=59, roleName=fdsf, roleRemark=fdf];1,1,16,3,2,17,3,2,33,10,9,34,11,9,69,67,64,79,78,64,87,82,64,89,88,64,86,81,80,85,84,83,91,90;', '0:0:0:0:0:0:0:1', '2018-07-27 09:34:10');
INSERT INTO `tb_log` VALUES ('439', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=59, roleName=fdsf, roleRemark=fdf];1,1,16,3,2,17,3,2,33,10,9,34,11,9,69,67,64,79,78,64,87,82,64,89,88,64,86,81,80,85,84,83,91,90,92,92;', '0:0:0:0:0:0:0:1', '2018-07-27 09:44:45');
INSERT INTO `tb_log` VALUES ('440', 'admin', '批量删除指定角色信息', '/irs/sys/delRoles/54,55,56,57,58,59', '54,55,56,57,58,59;', '0:0:0:0:0:0:0:1', '2018-07-27 09:45:27');
INSERT INTO `tb_log` VALUES ('441', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=53, roleName=test, roleRemark=test];1,1,16,3,2,17,3,2,18,3,2,19,3,2,20,4,2,21,4,2,22,4,2,23,4,2,47,46,2,48,46,2,49,46,2,50,46,2,33,10,9,34,11,9,35,11,9,36,11,9,37,11,9,42,15,14,45,44,43,53,52,51,56,55,54,62,61,60,66,65,63,68,67,64,69,67,64,71,70,64,73,72,64,75,74,64,77,76,64,79,78,64,87,82,64,89,88,64,86,81,80,85,84,83,91,90,92,92;', '0:0:0:0:0:0:0:1', '2018-07-27 09:45:40');
INSERT INTO `tb_log` VALUES ('442', 'admin', '添加用户', '/irs/user/insUser', 'TbUsers [uid=null, eMail=123@qq.com, nickname=fsd, sex=1, birthday=2018-07-27, address=123123, phone=17693109997, eCode=null, status=null, createTime=null];', '0:0:0:0:0:0:0:1', '2018-07-27 09:49:41');
INSERT INTO `tb_log` VALUES ('443', 'admin', '添加用户', '/irs/user/insUser', 'TbUsers [uid=null, eMail=123@qq.com, nickname=2113, sex=1, birthday=2018-07-26, address=123123, phone=17693109997, eCode=null, status=null, createTime=null];', '0:0:0:0:0:0:0:1', '2018-07-27 09:59:16');
INSERT INTO `tb_log` VALUES ('445', 'admin', '删除菜单信息', '/irs/sys/delMenuById/62', '62;', '0:0:0:0:0:0:0:1', '2018-07-27 14:13:32');
INSERT INTO `tb_log` VALUES ('446', 'admin', '删除菜单信息', '/irs/sys/delMenuById/61', '61;', '0:0:0:0:0:0:0:1', '2018-07-27 14:13:49');
INSERT INTO `tb_log` VALUES ('447', 'admin', '删除菜单信息', '/irs/sys/delMenuById/79', '79;', '0:0:0:0:0:0:0:1', '2018-07-27 14:13:57');
INSERT INTO `tb_log` VALUES ('448', 'admin', '删除菜单信息', '/irs/sys/delMenuById/89', '89;', '0:0:0:0:0:0:0:1', '2018-07-27 14:14:06');
INSERT INTO `tb_log` VALUES ('449', 'admin', '删除菜单信息', '/irs/sys/delMenuById/86', '86;', '0:0:0:0:0:0:0:1', '2018-07-27 14:14:16');
INSERT INTO `tb_log` VALUES ('450', 'admin', '删除菜单信息', '/irs/sys/delMenuById/87', '87;', '0:0:0:0:0:0:0:1', '2018-07-27 14:14:25');
INSERT INTO `tb_log` VALUES ('451', 'admin', '删除菜单信息', '/irs/sys/delMenuById/81', '81;', '0:0:0:0:0:0:0:1', '2018-07-27 14:14:34');
INSERT INTO `tb_log` VALUES ('452', 'admin', '删除菜单信息', '/irs/sys/delMenuById/82', '82;', '0:0:0:0:0:0:0:1', '2018-07-27 14:14:42');
INSERT INTO `tb_log` VALUES ('453', 'admin', '删除菜单信息', '/irs/sys/delMenuById/88', '88;', '0:0:0:0:0:0:0:1', '2018-07-27 14:14:50');
INSERT INTO `tb_log` VALUES ('454', 'admin', '删除菜单信息', '/irs/sys/delMenuById/78', '78;', '0:0:0:0:0:0:0:1', '2018-07-27 14:14:58');
INSERT INTO `tb_log` VALUES ('455', 'admin', '删除菜单信息', '/irs/sys/delMenuById/80', '80;', '0:0:0:0:0:0:0:1', '2018-07-27 14:15:07');
INSERT INTO `tb_log` VALUES ('456', 'admin', '删除菜单信息', '/irs/sys/delMenuById/85', '85;', '0:0:0:0:0:0:0:1', '2018-07-27 14:15:18');
INSERT INTO `tb_log` VALUES ('457', 'admin', '删除菜单信息', '/irs/sys/delMenuById/77', '77;', '0:0:0:0:0:0:0:1', '2018-07-27 14:15:26');
INSERT INTO `tb_log` VALUES ('458', 'admin', '删除菜单信息', '/irs/sys/delMenuById/75', '75;', '0:0:0:0:0:0:0:1', '2018-07-27 14:15:33');
INSERT INTO `tb_log` VALUES ('459', 'admin', '删除菜单信息', '/irs/sys/delMenuById/60', '60;', '0:0:0:0:0:0:0:1', '2018-07-27 14:15:47');
INSERT INTO `tb_log` VALUES ('460', 'admin', '删除菜单信息', '/irs/sys/delMenuById/71', '71;', '0:0:0:0:0:0:0:1', '2018-07-27 14:15:54');
INSERT INTO `tb_log` VALUES ('461', 'admin', '删除菜单信息', '/irs/sys/delMenuById/70', '70;', '0:0:0:0:0:0:0:1', '2018-07-27 14:16:01');
INSERT INTO `tb_log` VALUES ('462', 'admin', '删除菜单信息', '/irs/sys/delMenuById/76', '76;', '0:0:0:0:0:0:0:1', '2018-07-27 14:16:14');
INSERT INTO `tb_log` VALUES ('463', 'admin', '删除菜单信息', '/irs/sys/delMenuById/74', '74;', '0:0:0:0:0:0:0:1', '2018-07-27 14:16:22');
INSERT INTO `tb_log` VALUES ('464', 'admin', '删除菜单信息', '/irs/sys/delMenuById/73', '73;', '0:0:0:0:0:0:0:1', '2018-07-27 14:16:30');
INSERT INTO `tb_log` VALUES ('465', 'admin', '删除菜单信息', '/irs/sys/delMenuById/84', '84;', '0:0:0:0:0:0:0:1', '2018-07-27 14:16:39');
INSERT INTO `tb_log` VALUES ('466', 'admin', '删除菜单信息', '/irs/sys/delMenuById/56', '56;', '0:0:0:0:0:0:0:1', '2018-07-27 14:16:50');
INSERT INTO `tb_log` VALUES ('467', 'admin', '删除菜单信息', '/irs/sys/delMenuById/55', '55;', '0:0:0:0:0:0:0:1', '2018-07-27 14:16:58');
INSERT INTO `tb_log` VALUES ('468', 'admin', '删除菜单信息', '/irs/sys/delMenuById/72', '72;', '0:0:0:0:0:0:0:1', '2018-07-27 14:17:08');
INSERT INTO `tb_log` VALUES ('469', 'admin', '删除菜单信息', '/irs/sys/delMenuById/69', '69;', '0:0:0:0:0:0:0:1', '2018-07-27 14:17:16');
INSERT INTO `tb_log` VALUES ('470', 'admin', '删除菜单信息', '/irs/sys/delMenuById/83', '83;', '0:0:0:0:0:0:0:1', '2018-07-27 14:17:24');
INSERT INTO `tb_log` VALUES ('471', 'admin', '删除菜单信息', '/irs/sys/delMenuById/54', '54;', '0:0:0:0:0:0:0:1', '2018-07-27 14:17:33');
INSERT INTO `tb_log` VALUES ('472', 'admin', '删除菜单信息', '/irs/sys/delMenuById/68', '68;', '0:0:0:0:0:0:0:1', '2018-07-27 14:17:48');
INSERT INTO `tb_log` VALUES ('473', 'admin', '删除菜单信息', '/irs/sys/delMenuById/91', '91;', '0:0:0:0:0:0:0:1', '2018-07-27 14:18:11');
INSERT INTO `tb_log` VALUES ('474', 'admin', '删除菜单信息', '/irs/sys/delMenuById/90', '90;', '0:0:0:0:0:0:0:1', '2018-07-27 14:18:22');
INSERT INTO `tb_log` VALUES ('475', 'admin', '更新管理员信息', '/irs/sys/updAdmin', 'TbAdmin [id=18, username=test, password=null, salt=null, fullname=test, eMail=test@test.com, sex=1, birthday=2018-02-25, address=甘肃省兰州市榆中县和平镇, phone=17601038192, roleId=1, roleName=null];', '0:0:0:0:0:0:0:1', '2018-07-27 14:18:46');
INSERT INTO `tb_log` VALUES ('476', 'admin', '更新管理员信息', '/irs/sys/updAdmin', 'TbAdmin [id=18, username=test, password=null, salt=null, fullname=test, eMail=test@test.com, sex=1, birthday=2018-02-25, address=甘肃省兰州市榆中县和平镇, phone=17601038192, roleId=53, roleName=null];', '0:0:0:0:0:0:0:1', '2018-07-27 14:18:52');
INSERT INTO `tb_log` VALUES ('477', 'admin', '添加角色信息', '/irs/sys/insRole', 'TbRoles [roleId=null, roleName=rewr, roleRemark=rewr];1,1,48,46,2,49,46,2,33,10,9,37,11,9,67,64,92,92;', '0:0:0:0:0:0:0:1', '2018-07-27 14:19:19');
INSERT INTO `tb_log` VALUES ('478', 'admin', '批量删除指定角色信息', '/irs/sys/delRoles/60', '60;', '0:0:0:0:0:0:0:1', '2018-07-27 14:19:38');
INSERT INTO `tb_log` VALUES ('479', 'admin', '添加用户', '/irs/user/insUser', 'TbUsers [uid=null, eMail=sdf@163.com, nickname=123123, sex=1, birthday=2018-07-27, address=123123, phone=17111111111, eCode=null, status=null, createTime=null];', '0:0:0:0:0:0:0:1', '2018-07-27 14:23:55');
INSERT INTO `tb_log` VALUES ('480', 'admin', '更新用户信息', '/irs/user/updUser', 'TbUsers [uid=29, eMail=sdf@163.com, nickname=123123, sex=2, birthday=2018-07-27, address=123123, phone=17111111111, eCode=null, status=1, createTime=null];', '0:0:0:0:0:0:0:1', '2018-07-27 14:24:12');
INSERT INTO `tb_log` VALUES ('481', 'admin', '删除菜单信息', '/irs/sys/delMenuById/66', '66;', '0:0:0:0:0:0:0:1', '2018-07-27 14:30:18');
INSERT INTO `tb_log` VALUES ('482', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=53, roleName=test, roleRemark=test];1,1,16,3,2,17,3,2,18,3,2,19,3,2,20,4,2,21,4,2,22,4,2,23,4,2,47,46,2,48,46,2,49,46,2,50,46,2,33,10,9,34,11,9,35,11,9,36,11,9,37,11,9,42,15,14,65,63,92,92;', '0:0:0:0:0:0:0:1', '2018-07-27 17:47:05');
INSERT INTO `tb_log` VALUES ('483', 'admin', '更新管理员信息', '/irs/sys/updAdmin', 'TbAdmin [id=1, username=admin, password=null, salt=null, fullname=arthur, eMail=admin@outaa.com, sex=1, birthday=1994-11-08, address=北京市通州区科创十四街, phone=17693109997, roleId=1, roleName=null];', '0:0:0:0:0:0:0:1', '2018-07-27 17:48:24');
INSERT INTO `tb_log` VALUES ('484', 'admin', '更新管理员信息', '/irs/sys/updAdmin', 'TbAdmin [id=1, username=admin, password=null, salt=null, fullname=arthur, eMail=isduxd@163.com, sex=1, birthday=1994-11-08, address=北京市通州区科创十四街, phone=17693109997, roleId=1, roleName=null];', '0:0:0:0:0:0:0:1', '2018-07-27 17:48:50');
INSERT INTO `tb_log` VALUES ('485', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=1, roleName=超级管理员, roleRemark=超级管理员];1,1,16,3,2,20,4,2,21,4,2,22,4,2,23,4,2,47,46,2,48,46,2,49,46,2,50,46,2,33,10,9,34,11,9,35,11,9,36,11,9,37,11,9,42,15,14,45,44,43,53,52,51,65,63,67,64,92,92;', '0:0:0:0:0:0:0:1', '2018-07-27 17:49:34');
INSERT INTO `tb_log` VALUES ('486', 'admin', '批量删除指定角色信息', '/irs/sys/delRoles/53', '53;', '0:0:0:0:0:0:0:1', '2018-07-27 17:49:48');
INSERT INTO `tb_log` VALUES ('487', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=1, roleName=超级管理员, roleRemark=超级管理员];1,1,16,3,2,17,3,2,18,3,2,19,3,2,20,4,2,21,4,2,22,4,2,23,4,2,47,46,2,48,46,2,49,46,2,50,46,2,33,10,9,34,11,9,35,11,9,36,11,9,37,11,9,42,15,14,45,44,43,53,52,51,65,63,67,64,92,92;', '0:0:0:0:0:0:0:1', '2018-07-27 17:50:28');
INSERT INTO `tb_log` VALUES ('488', 'admin', '更新管理员信息', '/irs/sys/updAdmin', 'TbAdmin [id=1, username=admin, password=null, salt=null, fullname=arthur, eMail=isduxd@163.com, sex=3, birthday=1994-11-08, address=北京市通州区科创十四街, phone=17693109997, roleId=1, roleName=null];', '0:0:0:0:0:0:0:1', '2018-07-27 17:52:16');
INSERT INTO `tb_log` VALUES ('489', 'admin', '维护菜单信息', '/irs/sys/menuForm', 'com.irs.pojo.TbMenus@1ee6e12;1;', '0:0:0:0:0:0:0:1', '2018-07-28 22:32:55');
INSERT INTO `tb_log` VALUES ('490', 'admin', '维护菜单信息', '/irs/sys/menuForm', 'com.irs.pojo.TbMenus@172b8bb;1;', '0:0:0:0:0:0:0:1', '2018-07-28 23:57:32');
INSERT INTO `tb_log` VALUES ('491', 'admin', '删除菜单信息', '/irs/sys/delMenuById/94', '94;', '0:0:0:0:0:0:0:1', '2018-07-28 23:57:41');
INSERT INTO `tb_log` VALUES ('492', '系统自动任务', '定时删除日志：1条', '', '', '', '2018-06-29 00:00:00');
INSERT INTO `tb_log` VALUES ('493', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=1, roleName=超级管理员, roleRemark=超级管理员];93,93,1,1,16,3,2,17,3,2,18,3,2,19,3,2,20,4,2,21,4,2,22,4,2,23,4,2,47,46,2,48,46,2,49,46,2,50,46,2,33,10,9,34,11,9,35,11,9,36,11,9,37,11,9,42,15,14,45,44,43,53,52,51,65,63,67,64,92,92;', '0:0:0:0:0:0:0:1', '2018-07-29 00:10:55');
INSERT INTO `tb_log` VALUES ('494', 'admin', '维护菜单信息', '/irs/sys/menuForm', 'com.irs.pojo.TbMenus@1ffdbe8;;', '0:0:0:0:0:0:0:1', '2018-07-29 00:44:02');

-- ----------------------------
-- Table structure for tb_menus
-- ----------------------------
DROP TABLE IF EXISTS `tb_menus`;
CREATE TABLE `tb_menus` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL COMMENT '菜单名',
  `icon` varchar(20) DEFAULT NULL COMMENT '图标',
  `href` varchar(100) DEFAULT NULL COMMENT '资源地址',
  `perms` varchar(500) DEFAULT NULL COMMENT '权限',
  `spread` varchar(10) NOT NULL COMMENT 'true：展开，false：不展开',
  `parent_id` bigint(20) NOT NULL COMMENT '父节点',
  `sorting` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_menus
-- ----------------------------
INSERT INTO `tb_menus` VALUES ('1', '后台首页', '', 'page/main.html', '', 'false', '0', '9999');
INSERT INTO `tb_menus` VALUES ('2', '管理员管理', '', '', '', 'false', '0', null);
INSERT INTO `tb_menus` VALUES ('3', '角色管理', '&#xe613;', 'sys/roleList', null, 'false', '2', null);
INSERT INTO `tb_menus` VALUES ('4', '管理员列表', '&#xe613;', 'sys/adminList', null, 'false', '2', null);
INSERT INTO `tb_menus` VALUES ('9', '用户管理', '&#xe61d;', null, null, 'false', '0', null);
INSERT INTO `tb_menus` VALUES ('10', '添加用户', '&#xe608;', 'user/addUser', null, 'false', '9', null);
INSERT INTO `tb_menus` VALUES ('11', '管理用户', '&#xe60e;', 'user/userList', null, 'false', '9', null);
INSERT INTO `tb_menus` VALUES ('14', '系统日志', '&#xe61d;', null, null, 'false', '0', null);
INSERT INTO `tb_menus` VALUES ('15', '日志管理', '&#xe642;', 'log/logList', null, 'false', '14', null);
INSERT INTO `tb_menus` VALUES ('16', '查看', '', '', 'sys:role:list', 'false', '3', null);
INSERT INTO `tb_menus` VALUES ('17', '新增', null, null, 'sys:role:save', 'false', '3', null);
INSERT INTO `tb_menus` VALUES ('18', '修改', null, null, 'sys:role:update', 'false', '3', null);
INSERT INTO `tb_menus` VALUES ('19', '删除', null, null, 'sys:role:delete', 'false', '3', null);
INSERT INTO `tb_menus` VALUES ('20', '查看', null, null, 'sys:admin:list', 'false', '4', null);
INSERT INTO `tb_menus` VALUES ('21', '新增', null, null, 'sys:admin:save', 'false', '4', null);
INSERT INTO `tb_menus` VALUES ('22', '修改', null, null, 'sys:admin:update', 'false', '4', null);
INSERT INTO `tb_menus` VALUES ('23', '删除', null, null, 'sys:admin:delete', 'false', '4', null);
INSERT INTO `tb_menus` VALUES ('33', '新增', null, null, 'user:user:save', 'false', '10', null);
INSERT INTO `tb_menus` VALUES ('34', '查看', null, null, 'user:user:list', 'false', '11', null);
INSERT INTO `tb_menus` VALUES ('35', '新增', null, null, 'user:user:save', 'false', '11', null);
INSERT INTO `tb_menus` VALUES ('36', '修改', null, null, 'user:user:update', 'false', '11', null);
INSERT INTO `tb_menus` VALUES ('37', '删除', null, null, 'user:user:delete', 'false', '11', null);
INSERT INTO `tb_menus` VALUES ('42', '查看', '', '', 'log:log:list', 'false', '15', null);
INSERT INTO `tb_menus` VALUES ('43', 'SQL监控', '&#xe642;', null, null, 'false', '0', null);
INSERT INTO `tb_menus` VALUES ('44', 'SQL监控', '&#xe642;', 'sys/druid', null, 'false', '43', null);
INSERT INTO `tb_menus` VALUES ('45', '查看', null, null, 'sys:druid:list', 'false', '44', null);
INSERT INTO `tb_menus` VALUES ('46', '菜单管理', '&#xe642;', 'sys/menuList', null, 'false', '2', null);
INSERT INTO `tb_menus` VALUES ('47', '查看', null, null, 'sys:menu:list', 'false', '46', null);
INSERT INTO `tb_menus` VALUES ('48', '新增', null, null, 'sys:menu:save', 'false', '46', null);
INSERT INTO `tb_menus` VALUES ('49', '修改', null, null, 'sys:menu:update', 'false', '46', null);
INSERT INTO `tb_menus` VALUES ('50', '删除', null, null, 'sys:menu:delete', 'false', '46', null);
INSERT INTO `tb_menus` VALUES ('51', 'test', '', '', '', 'false', '0', null);
INSERT INTO `tb_menus` VALUES ('52', 'test1', '', '', '', 'false', '51', null);
INSERT INTO `tb_menus` VALUES ('53', '查看', '', '', '', 'false', '52', null);
INSERT INTO `tb_menus` VALUES ('63', 'rr', '', '', '', 'false', '0', null);
INSERT INTO `tb_menus` VALUES ('64', 'rr1', '', '', '', 'false', '0', null);
INSERT INTO `tb_menus` VALUES ('65', 'rerw', '', '', '', 'false', '63', null);
INSERT INTO `tb_menus` VALUES ('67', 'sdfsf', '', '', '', 'false', '64', null);
INSERT INTO `tb_menus` VALUES ('92', 'r3', '', '', '', 'false', '0', null);
INSERT INTO `tb_menus` VALUES ('93', 'wqeq', '', '', '', 'false', '0', '231');

-- ----------------------------
-- Table structure for tb_roles
-- ----------------------------
DROP TABLE IF EXISTS `tb_roles`;
CREATE TABLE `tb_roles` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色编号',
  `role_name` varchar(50) DEFAULT NULL COMMENT '角色名',
  `role_remark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_roles
-- ----------------------------
INSERT INTO `tb_roles` VALUES ('1', '超级管理员', '超级管理员');

-- ----------------------------
-- Table structure for tb_roles_menus
-- ----------------------------
DROP TABLE IF EXISTS `tb_roles_menus`;
CREATE TABLE `tb_roles_menus` (
  `menu_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`menu_id`,`role_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `tb_roles_menus_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `tb_menus` (`menu_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_roles_menus_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `tb_roles` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_roles_menus
-- ----------------------------
INSERT INTO `tb_roles_menus` VALUES ('1', '1');
INSERT INTO `tb_roles_menus` VALUES ('2', '1');
INSERT INTO `tb_roles_menus` VALUES ('3', '1');
INSERT INTO `tb_roles_menus` VALUES ('4', '1');
INSERT INTO `tb_roles_menus` VALUES ('9', '1');
INSERT INTO `tb_roles_menus` VALUES ('10', '1');
INSERT INTO `tb_roles_menus` VALUES ('11', '1');
INSERT INTO `tb_roles_menus` VALUES ('14', '1');
INSERT INTO `tb_roles_menus` VALUES ('15', '1');
INSERT INTO `tb_roles_menus` VALUES ('16', '1');
INSERT INTO `tb_roles_menus` VALUES ('17', '1');
INSERT INTO `tb_roles_menus` VALUES ('18', '1');
INSERT INTO `tb_roles_menus` VALUES ('19', '1');
INSERT INTO `tb_roles_menus` VALUES ('20', '1');
INSERT INTO `tb_roles_menus` VALUES ('21', '1');
INSERT INTO `tb_roles_menus` VALUES ('22', '1');
INSERT INTO `tb_roles_menus` VALUES ('23', '1');
INSERT INTO `tb_roles_menus` VALUES ('33', '1');
INSERT INTO `tb_roles_menus` VALUES ('34', '1');
INSERT INTO `tb_roles_menus` VALUES ('35', '1');
INSERT INTO `tb_roles_menus` VALUES ('36', '1');
INSERT INTO `tb_roles_menus` VALUES ('37', '1');
INSERT INTO `tb_roles_menus` VALUES ('42', '1');
INSERT INTO `tb_roles_menus` VALUES ('43', '1');
INSERT INTO `tb_roles_menus` VALUES ('44', '1');
INSERT INTO `tb_roles_menus` VALUES ('45', '1');
INSERT INTO `tb_roles_menus` VALUES ('46', '1');
INSERT INTO `tb_roles_menus` VALUES ('47', '1');
INSERT INTO `tb_roles_menus` VALUES ('48', '1');
INSERT INTO `tb_roles_menus` VALUES ('49', '1');
INSERT INTO `tb_roles_menus` VALUES ('50', '1');
INSERT INTO `tb_roles_menus` VALUES ('51', '1');
INSERT INTO `tb_roles_menus` VALUES ('52', '1');
INSERT INTO `tb_roles_menus` VALUES ('53', '1');
INSERT INTO `tb_roles_menus` VALUES ('63', '1');
INSERT INTO `tb_roles_menus` VALUES ('64', '1');
INSERT INTO `tb_roles_menus` VALUES ('65', '1');
INSERT INTO `tb_roles_menus` VALUES ('67', '1');
INSERT INTO `tb_roles_menus` VALUES ('92', '1');
INSERT INTO `tb_roles_menus` VALUES ('93', '1');

-- ----------------------------
-- Table structure for tb_users
-- ----------------------------
DROP TABLE IF EXISTS `tb_users`;
CREATE TABLE `tb_users` (
  `uid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `e_mail` varchar(50) NOT NULL,
  `nickname` varchar(50) NOT NULL COMMENT '昵称：唯一',
  `password` varchar(50) NOT NULL,
  `sex` varchar(1) NOT NULL COMMENT '0:女，1:男，2：保密',
  `birthday` date NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `e_code` varchar(50) NOT NULL,
  `status` varchar(1) DEFAULT NULL COMMENT '0:未激活，1，正常，2，禁用',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_users
-- ----------------------------
INSERT INTO `tb_users` VALUES ('27', 'isduxd@qq.com', 'test', '96e79218965eb72c92a549dd5a330112', '0', '2018-03-25', '北京通州科创十四街区', '17693109923', 'b3f28566dac54f86bd4f4c2ce36e23d8019', '1', '2018-03-25 14:48:48');
INSERT INTO `tb_users` VALUES ('28', '123@qq.com', '2113', '96e79218965eb72c92a549dd5a330112', '1', '2018-07-26', '123123', '17693109997', 'c6411671821c43ca926c032e51ded16a897', '1', '2018-07-27 09:59:16');
INSERT INTO `tb_users` VALUES ('29', 'sdf@163.com', '123123', '96e79218965eb72c92a549dd5a330112', '2', '2018-07-27', '123123', '17111111111', '92197e8f8a5647ae8be96fe2db555575147', '1', '2018-07-27 14:23:55');
