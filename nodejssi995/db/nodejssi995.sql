-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: localhost    Database: nodejssi995
-- ------------------------------------------------------
-- Server version	5.7.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='配置文件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'picture1','http://localhost:8080/nodejssi995/upload/picture1.jpg'),(2,'picture2','http://localhost:8080/nodejssi995/upload/picture2.jpg'),(3,'picture3','http://localhost:8080/nodejssi995/upload/picture3.jpg'),(6,'homepage',NULL);
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discusskechengxinxi`
--

DROP TABLE IF EXISTS `discusskechengxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discusskechengxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint(20) NOT NULL COMMENT '关联表id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `content` longtext NOT NULL COMMENT '评论内容',
  `reply` longtext COMMENT '回复内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8 COMMENT='课程信息评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discusskechengxinxi`
--

LOCK TABLES `discusskechengxinxi` WRITE;
/*!40000 ALTER TABLE `discusskechengxinxi` DISABLE KEYS */;
INSERT INTO `discusskechengxinxi` VALUES (151,'2021-02-26 15:03:11',1,1,'评论内容1','回复内容1'),(152,'2021-02-26 15:03:11',2,2,'评论内容2','回复内容2'),(153,'2021-02-26 15:03:11',3,3,'评论内容3','回复内容3'),(154,'2021-02-26 15:03:11',4,4,'评论内容4','回复内容4'),(155,'2021-02-26 15:03:11',5,5,'评论内容5','回复内容5'),(156,'2021-02-26 15:03:11',6,6,'评论内容6','回复内容6');
/*!40000 ALTER TABLE `discusskechengxinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussmingshi`
--

DROP TABLE IF EXISTS `discussmingshi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discussmingshi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint(20) NOT NULL COMMENT '关联表id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `content` longtext NOT NULL COMMENT '评论内容',
  `reply` longtext COMMENT '回复内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8 COMMENT='名师评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussmingshi`
--

LOCK TABLES `discussmingshi` WRITE;
/*!40000 ALTER TABLE `discussmingshi` DISABLE KEYS */;
INSERT INTO `discussmingshi` VALUES (141,'2021-02-26 15:03:11',1,1,'评论内容1','回复内容1'),(142,'2021-02-26 15:03:11',2,2,'评论内容2','回复内容2'),(143,'2021-02-26 15:03:11',3,3,'评论内容3','回复内容3'),(144,'2021-02-26 15:03:11',4,4,'评论内容4','回复内容4'),(145,'2021-02-26 15:03:11',5,5,'评论内容5','回复内容5'),(146,'2021-02-26 15:03:11',6,6,'评论内容6','回复内容6');
/*!40000 ALTER TABLE `discussmingshi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exampaper`
--

DROP TABLE IF EXISTS `exampaper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exampaper` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name` varchar(200) NOT NULL COMMENT '试卷名称',
  `time` int(11) NOT NULL COMMENT '考试时长(分钟)',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '试卷状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='试卷表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exampaper`
--

LOCK TABLES `exampaper` WRITE;
/*!40000 ALTER TABLE `exampaper` DISABLE KEYS */;
/*!40000 ALTER TABLE `exampaper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examquestion`
--

DROP TABLE IF EXISTS `examquestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examquestion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `paperid` bigint(20) NOT NULL COMMENT '所属试卷id（外键）',
  `papername` varchar(200) NOT NULL COMMENT '试卷名称',
  `questionname` varchar(200) NOT NULL COMMENT '试题名称',
  `options` longtext COMMENT '选项，json字符串',
  `score` bigint(20) DEFAULT '0' COMMENT '分值',
  `answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext COMMENT '答案解析',
  `type` bigint(20) DEFAULT '0' COMMENT '试题类型，0：单选题 1：多选题 2：判断题 3：填空题（暂不考虑多项填空）',
  `sequence` bigint(20) DEFAULT '100' COMMENT '试题排序，值越大排越前面',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='试题表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examquestion`
--

LOCK TABLES `examquestion` WRITE;
/*!40000 ALTER TABLE `examquestion` DISABLE KEYS */;
/*!40000 ALTER TABLE `examquestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examrecord`
--

DROP TABLE IF EXISTS `examrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examrecord` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(200) DEFAULT NULL COMMENT '用户名',
  `paperid` bigint(20) NOT NULL COMMENT '试卷id（外键）',
  `papername` varchar(200) NOT NULL COMMENT '试卷名称',
  `questionid` bigint(20) NOT NULL COMMENT '试题id（外键）',
  `questionname` varchar(200) NOT NULL COMMENT '试题名称',
  `options` longtext COMMENT '选项，json字符串',
  `score` bigint(20) DEFAULT '0' COMMENT '分值',
  `answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext COMMENT '答案解析',
  `myscore` bigint(20) NOT NULL DEFAULT '0' COMMENT '试题得分',
  `myanswer` varchar(200) DEFAULT NULL COMMENT '考生答案',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='考试记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examrecord`
--

LOCK TABLES `examrecord` WRITE;
/*!40000 ALTER TABLE `examrecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `examrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum`
--

DROP TABLE IF EXISTS `forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) DEFAULT NULL COMMENT '帖子标题',
  `content` longtext NOT NULL COMMENT '帖子内容',
  `parentid` bigint(20) DEFAULT NULL COMMENT '父节点id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(200) DEFAULT NULL COMMENT '用户名',
  `isdone` varchar(200) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8 COMMENT='论坛表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum`
--

LOCK TABLES `forum` WRITE;
/*!40000 ALTER TABLE `forum` DISABLE KEYS */;
INSERT INTO `forum` VALUES (81,'2021-02-26 15:03:11','帖子标题1','帖子内容1',1,1,'用户名1','开放'),(82,'2021-02-26 15:03:11','帖子标题2','帖子内容2',2,2,'用户名2','开放'),(83,'2021-02-26 15:03:11','帖子标题3','帖子内容3',3,3,'用户名3','开放'),(84,'2021-02-26 15:03:11','帖子标题4','帖子内容4',4,4,'用户名4','开放'),(85,'2021-02-26 15:03:11','帖子标题5','帖子内容5',5,5,'用户名5','开放'),(86,'2021-02-26 15:03:11','帖子标题6','帖子内容6',6,6,'用户名6','开放');
/*!40000 ALTER TABLE `forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jisuanjixueyuan`
--

DROP TABLE IF EXISTS `jisuanjixueyuan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jisuanjixueyuan` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `biaoti` varchar(200) NOT NULL COMMENT '标题',
  `fengmian` varchar(200) DEFAULT NULL COMMENT '封面',
  `neirong` longtext COMMENT '内容',
  `xiangqing` longtext COMMENT '详情',
  `riqi` date DEFAULT NULL COMMENT '日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='计算机学院';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jisuanjixueyuan`
--

LOCK TABLES `jisuanjixueyuan` WRITE;
/*!40000 ALTER TABLE `jisuanjixueyuan` DISABLE KEYS */;
INSERT INTO `jisuanjixueyuan` VALUES (41,'2021-02-26 15:03:10','标题1','http://localhost:8080/nodejssi995/upload/jisuanjixueyuan_fengmian1.jpg','内容1','详情1','2021-02-26'),(42,'2021-02-26 15:03:10','标题2','http://localhost:8080/nodejssi995/upload/jisuanjixueyuan_fengmian2.jpg','内容2','详情2','2021-02-26'),(43,'2021-02-26 15:03:10','标题3','http://localhost:8080/nodejssi995/upload/jisuanjixueyuan_fengmian3.jpg','内容3','详情3','2021-02-26'),(44,'2021-02-26 15:03:10','标题4','http://localhost:8080/nodejssi995/upload/jisuanjixueyuan_fengmian4.jpg','内容4','详情4','2021-02-26'),(45,'2021-02-26 15:03:10','标题5','http://localhost:8080/nodejssi995/upload/jisuanjixueyuan_fengmian5.jpg','内容5','详情5','2021-02-26'),(46,'2021-02-26 15:03:11','标题6','http://localhost:8080/nodejssi995/upload/jisuanjixueyuan_fengmian6.jpg','内容6','详情6','2021-02-26');
/*!40000 ALTER TABLE `jisuanjixueyuan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kechenggoumai`
--

DROP TABLE IF EXISTS `kechenggoumai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kechenggoumai` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `dingdanbianhao` varchar(200) DEFAULT NULL COMMENT '订单编号',
  `kechengmingcheng` varchar(200) DEFAULT NULL COMMENT '课程名称',
  `kechengleixing` varchar(200) DEFAULT NULL COMMENT '课程类型',
  `gonghao` varchar(200) DEFAULT NULL COMMENT '工号',
  `jiage` varchar(200) DEFAULT NULL COMMENT '价格',
  `goumairiqi` date DEFAULT NULL COMMENT '购买日期',
  `beizhu` longtext COMMENT '备注',
  `xuehao` varchar(200) DEFAULT NULL COMMENT '学号',
  `xueshengxingming` varchar(200) DEFAULT NULL COMMENT '学生姓名',
  `ispay` varchar(200) DEFAULT '未支付' COMMENT '是否支付',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `dingdanbianhao` (`dingdanbianhao`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COMMENT='课程购买';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kechenggoumai`
--

LOCK TABLES `kechenggoumai` WRITE;
/*!40000 ALTER TABLE `kechenggoumai` DISABLE KEYS */;
INSERT INTO `kechenggoumai` VALUES (61,'2021-02-26 15:03:11','订单编号1','课程名称1','课程类型1','工号1','价格1','2021-02-26','备注1','学号1','学生姓名1','未支付',1),(62,'2021-02-26 15:03:11','订单编号2','课程名称2','课程类型2','工号2','价格2','2021-02-26','备注2','学号2','学生姓名2','未支付',2),(63,'2021-02-26 15:03:11','订单编号3','课程名称3','课程类型3','工号3','价格3','2021-02-26','备注3','学号3','学生姓名3','未支付',3),(64,'2021-02-26 15:03:11','订单编号4','课程名称4','课程类型4','工号4','价格4','2021-02-26','备注4','学号4','学生姓名4','未支付',4),(65,'2021-02-26 15:03:11','订单编号5','课程名称5','课程类型5','工号5','价格5','2021-02-26','备注5','学号5','学生姓名5','未支付',5),(66,'2021-02-26 15:03:11','订单编号6','课程名称6','课程类型6','工号6','价格6','2021-02-26','备注6','学号6','学生姓名6','未支付',6);
/*!40000 ALTER TABLE `kechenggoumai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kechengwenjian`
--

DROP TABLE IF EXISTS `kechengwenjian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kechengwenjian` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `dingdanbianhao` varchar(200) DEFAULT NULL COMMENT '订单编号',
  `kechengmingcheng` varchar(200) DEFAULT NULL COMMENT '课程名称',
  `kechengleixing` varchar(200) DEFAULT NULL COMMENT '课程类型',
  `xuehao` varchar(200) DEFAULT NULL COMMENT '学号',
  `xueshengxingming` varchar(200) DEFAULT NULL COMMENT '学生姓名',
  `kechengwenjian` varchar(200) DEFAULT NULL COMMENT '课程文件',
  `faburiqi` date DEFAULT NULL COMMENT '发布日期',
  `gonghao` varchar(200) DEFAULT NULL COMMENT '工号',
  `jiaoshixingming` varchar(200) DEFAULT NULL COMMENT '教师姓名',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COMMENT='课程文件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kechengwenjian`
--

LOCK TABLES `kechengwenjian` WRITE;
/*!40000 ALTER TABLE `kechengwenjian` DISABLE KEYS */;
INSERT INTO `kechengwenjian` VALUES (71,'2021-02-26 15:03:11','订单编号1','课程名称1','课程类型1','学号1','学生姓名1','','2021-02-26','工号1','教师姓名1',1),(72,'2021-02-26 15:03:11','订单编号2','课程名称2','课程类型2','学号2','学生姓名2','','2021-02-26','工号2','教师姓名2',2),(73,'2021-02-26 15:03:11','订单编号3','课程名称3','课程类型3','学号3','学生姓名3','','2021-02-26','工号3','教师姓名3',3),(74,'2021-02-26 15:03:11','订单编号4','课程名称4','课程类型4','学号4','学生姓名4','','2021-02-26','工号4','教师姓名4',4),(75,'2021-02-26 15:03:11','订单编号5','课程名称5','课程类型5','学号5','学生姓名5','','2021-02-26','工号5','教师姓名5',5),(76,'2021-02-26 15:03:11','订单编号6','课程名称6','课程类型6','学号6','学生姓名6','','2021-02-26','工号6','教师姓名6',6);
/*!40000 ALTER TABLE `kechengwenjian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kechengxinxi`
--

DROP TABLE IF EXISTS `kechengxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kechengxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `kechengmingcheng` varchar(200) DEFAULT NULL COMMENT '课程名称',
  `kechengleixing` varchar(200) DEFAULT NULL COMMENT '课程类型',
  `kechengfengmian` varchar(200) DEFAULT NULL COMMENT '课程封面',
  `zaixiankecheng` varchar(200) DEFAULT NULL COMMENT '在线课程',
  `jiage` int(11) NOT NULL COMMENT '价格',
  `kechengxiangqing` longtext COMMENT '课程详情',
  `gonghao` varchar(200) DEFAULT NULL COMMENT '工号',
  `jiaoshixingming` varchar(200) DEFAULT NULL COMMENT '教师姓名',
  `thumbsupnum` int(11) DEFAULT '0' COMMENT '赞',
  `crazilynum` int(11) DEFAULT '0' COMMENT '踩',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='课程信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kechengxinxi`
--

LOCK TABLES `kechengxinxi` WRITE;
/*!40000 ALTER TABLE `kechengxinxi` DISABLE KEYS */;
INSERT INTO `kechengxinxi` VALUES (31,'2021-02-26 15:03:10','课程名称1','课程类型1','http://localhost:8080/nodejssi995/upload/kechengxinxi_kechengfengmian1.jpg','',1,'课程详情1','工号1','教师姓名1',1,1),(32,'2021-02-26 15:03:10','课程名称2','课程类型2','http://localhost:8080/nodejssi995/upload/kechengxinxi_kechengfengmian2.jpg','',2,'课程详情2','工号2','教师姓名2',2,2),(33,'2021-02-26 15:03:10','课程名称3','课程类型3','http://localhost:8080/nodejssi995/upload/kechengxinxi_kechengfengmian3.jpg','',3,'课程详情3','工号3','教师姓名3',3,3),(34,'2021-02-26 15:03:10','课程名称4','课程类型4','http://localhost:8080/nodejssi995/upload/kechengxinxi_kechengfengmian4.jpg','',4,'课程详情4','工号4','教师姓名4',4,4),(35,'2021-02-26 15:03:10','课程名称5','课程类型5','http://localhost:8080/nodejssi995/upload/kechengxinxi_kechengfengmian5.jpg','',5,'课程详情5','工号5','教师姓名5',5,5),(36,'2021-02-26 15:03:10','课程名称6','课程类型6','http://localhost:8080/nodejssi995/upload/kechengxinxi_kechengfengmian6.jpg','',6,'课程详情6','工号6','教师姓名6',6,6);
/*!40000 ALTER TABLE `kechengxinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '留言人id',
  `username` varchar(200) DEFAULT NULL COMMENT '用户名',
  `content` longtext NOT NULL COMMENT '留言内容',
  `reply` longtext COMMENT '回复内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8 COMMENT='留言板';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (131,'2021-02-26 15:03:11',1,'用户名1','留言内容1','回复内容1'),(132,'2021-02-26 15:03:11',2,'用户名2','留言内容2','回复内容2'),(133,'2021-02-26 15:03:11',3,'用户名3','留言内容3','回复内容3'),(134,'2021-02-26 15:03:11',4,'用户名4','留言内容4','回复内容4'),(135,'2021-02-26 15:03:11',5,'用户名5','留言内容5','回复内容5'),(136,'2021-02-26 15:03:11',6,'用户名6','留言内容6','回复内容6');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mingshi`
--

DROP TABLE IF EXISTS `mingshi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mingshi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gonghao` varchar(200) NOT NULL COMMENT '工号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `jiaoshixingming` varchar(200) DEFAULT NULL COMMENT '教师姓名',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `touxiang` varchar(200) DEFAULT NULL COMMENT '头像',
  `zhicheng` varchar(200) DEFAULT NULL COMMENT '职称',
  `jiaoshishouji` varchar(200) DEFAULT NULL COMMENT '教师手机',
  `beizhu` longtext COMMENT '备注',
  `thumbsupnum` int(11) DEFAULT '0' COMMENT '赞',
  `crazilynum` int(11) DEFAULT '0' COMMENT '踩',
  PRIMARY KEY (`id`),
  UNIQUE KEY `gonghao` (`gonghao`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='名师';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mingshi`
--

LOCK TABLES `mingshi` WRITE;
/*!40000 ALTER TABLE `mingshi` DISABLE KEYS */;
INSERT INTO `mingshi` VALUES (21,'2021-02-26 15:03:10','001','001','教师姓名1','男','http://localhost:8080/nodejssi995/upload/mingshi_touxiang1.jpg','职称1','13823888881','备注1',1,1),(22,'2021-02-26 15:03:10','名师2','123456','教师姓名2','男','http://localhost:8080/nodejssi995/upload/mingshi_touxiang2.jpg','职称2','13823888882','备注2',2,2),(23,'2021-02-26 15:03:10','名师3','123456','教师姓名3','男','http://localhost:8080/nodejssi995/upload/mingshi_touxiang3.jpg','职称3','13823888883','备注3',3,3),(24,'2021-02-26 15:03:10','名师4','123456','教师姓名4','男','http://localhost:8080/nodejssi995/upload/mingshi_touxiang4.jpg','职称4','13823888884','备注4',4,4),(25,'2021-02-26 15:03:10','名师5','123456','教师姓名5','男','http://localhost:8080/nodejssi995/upload/mingshi_touxiang5.jpg','职称5','13823888885','备注5',5,5),(26,'2021-02-26 15:03:10','名师6','123456','教师姓名6','男','http://localhost:8080/nodejssi995/upload/mingshi_touxiang6.jpg','职称6','13823888886','备注6',6,6);
/*!40000 ALTER TABLE `mingshi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shejixueyuan`
--

DROP TABLE IF EXISTS `shejixueyuan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shejixueyuan` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `biaoti` varchar(200) NOT NULL COMMENT '标题',
  `fengmian` varchar(200) DEFAULT NULL COMMENT '封面',
  `neirong` longtext COMMENT '内容',
  `xiangqing` longtext COMMENT '详情',
  `riqi` date DEFAULT NULL COMMENT '日期',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='设计学院';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shejixueyuan`
--

LOCK TABLES `shejixueyuan` WRITE;
/*!40000 ALTER TABLE `shejixueyuan` DISABLE KEYS */;
INSERT INTO `shejixueyuan` VALUES (51,'2021-02-26 15:03:11','标题1','http://localhost:8080/nodejssi995/upload/shejixueyuan_fengmian1.jpg','内容1','详情1','2021-02-26',1),(52,'2021-02-26 15:03:11','标题2','http://localhost:8080/nodejssi995/upload/shejixueyuan_fengmian2.jpg','内容2','详情2','2021-02-26',2),(53,'2021-02-26 15:03:11','标题3','http://localhost:8080/nodejssi995/upload/shejixueyuan_fengmian3.jpg','内容3','详情3','2021-02-26',3),(54,'2021-02-26 15:03:11','标题4','http://localhost:8080/nodejssi995/upload/shejixueyuan_fengmian4.jpg','内容4','详情4','2021-02-26',4),(55,'2021-02-26 15:03:11','标题5','http://localhost:8080/nodejssi995/upload/shejixueyuan_fengmian5.jpg','内容5','详情5','2021-02-26',5),(56,'2021-02-26 15:03:11','标题6','http://localhost:8080/nodejssi995/upload/shejixueyuan_fengmian6.jpg','内容6','详情6','2021-02-26',6);
/*!40000 ALTER TABLE `shejixueyuan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storeup`
--

DROP TABLE IF EXISTS `storeup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storeup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `refid` bigint(20) DEFAULT NULL COMMENT '收藏id',
  `tablename` varchar(200) DEFAULT NULL COMMENT '表名',
  `name` varchar(200) NOT NULL COMMENT '收藏名称',
  `picture` varchar(200) NOT NULL COMMENT '收藏图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收藏表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storeup`
--

LOCK TABLES `storeup` WRITE;
/*!40000 ALTER TABLE `storeup` DISABLE KEYS */;
/*!40000 ALTER TABLE `storeup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'abo','abo','管理员','2021-02-26 15:03:11');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xuesheng`
--

DROP TABLE IF EXISTS `xuesheng`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xuesheng` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `xuehao` varchar(200) NOT NULL COMMENT '学号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `xueshengxingming` varchar(200) DEFAULT NULL COMMENT '学生姓名',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `touxiang` varchar(200) DEFAULT NULL COMMENT '头像',
  `shouji` varchar(200) DEFAULT NULL COMMENT '手机',
  PRIMARY KEY (`id`),
  UNIQUE KEY `xuehao` (`xuehao`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='学生';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xuesheng`
--

LOCK TABLES `xuesheng` WRITE;
/*!40000 ALTER TABLE `xuesheng` DISABLE KEYS */;
INSERT INTO `xuesheng` VALUES (11,'2021-02-26 15:03:10','001','001','学生姓名1','男','http://localhost:8080/nodejssi995/upload/xuesheng_touxiang1.jpg','13823888881'),(12,'2021-02-26 15:03:10','学生2','123456','学生姓名2','男','http://localhost:8080/nodejssi995/upload/xuesheng_touxiang2.jpg','13823888882'),(13,'2021-02-26 15:03:10','学生3','123456','学生姓名3','男','http://localhost:8080/nodejssi995/upload/xuesheng_touxiang3.jpg','13823888883'),(14,'2021-02-26 15:03:10','学生4','123456','学生姓名4','男','http://localhost:8080/nodejssi995/upload/xuesheng_touxiang4.jpg','13823888884'),(15,'2021-02-26 15:03:10','学生5','123456','学生姓名5','男','http://localhost:8080/nodejssi995/upload/xuesheng_touxiang5.jpg','13823888885'),(16,'2021-02-26 15:03:10','学生6','123456','学生姓名6','男','http://localhost:8080/nodejssi995/upload/xuesheng_touxiang6.jpg','13823888886');
/*!40000 ALTER TABLE `xuesheng` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-02  9:49:32
