DROP DATABASE IF EXISTS nodejssi995;

CREATE DATABASE nodejssi995 default character set utf8mb4 collate utf8mb4_general_ci;

USE nodejssi995;

DROP TABLE IF EXISTS `xuesheng`;

CREATE TABLE `xuesheng` (
	`id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '创建时间',
	`xuehao` varchar(200) NOT NULL UNIQUE   COMMENT '学号',
	`mima` varchar(200) NOT NULL   COMMENT '密码',
	`xueshengxingming` varchar(200)    COMMENT '学生姓名',
	`xingbie` varchar(200)    COMMENT '性别',
	`touxiang` varchar(200)    COMMENT '头像',
	`shouji` varchar(200)    COMMENT '手机',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生';

INSERT INTO xuesheng(id,xuehao,mima,xueshengxingming,xingbie,touxiang,shouji) VALUES(11,'学生1','123456','学生姓名1','男','http://localhost:8080/nodejssi995/upload/xuesheng_touxiang1.jpg','13823888881');
INSERT INTO xuesheng(id,xuehao,mima,xueshengxingming,xingbie,touxiang,shouji) VALUES(12,'学生2','123456','学生姓名2','男','http://localhost:8080/nodejssi995/upload/xuesheng_touxiang2.jpg','13823888882');
INSERT INTO xuesheng(id,xuehao,mima,xueshengxingming,xingbie,touxiang,shouji) VALUES(13,'学生3','123456','学生姓名3','男','http://localhost:8080/nodejssi995/upload/xuesheng_touxiang3.jpg','13823888883');
INSERT INTO xuesheng(id,xuehao,mima,xueshengxingming,xingbie,touxiang,shouji) VALUES(14,'学生4','123456','学生姓名4','男','http://localhost:8080/nodejssi995/upload/xuesheng_touxiang4.jpg','13823888884');
INSERT INTO xuesheng(id,xuehao,mima,xueshengxingming,xingbie,touxiang,shouji) VALUES(15,'学生5','123456','学生姓名5','男','http://localhost:8080/nodejssi995/upload/xuesheng_touxiang5.jpg','13823888885');
INSERT INTO xuesheng(id,xuehao,mima,xueshengxingming,xingbie,touxiang,shouji) VALUES(16,'学生6','123456','学生姓名6','男','http://localhost:8080/nodejssi995/upload/xuesheng_touxiang6.jpg','13823888886');

DROP TABLE IF EXISTS `mingshi`;

CREATE TABLE `mingshi` (
	`id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '创建时间',
	`gonghao` varchar(200) NOT NULL UNIQUE   COMMENT '工号',
	`mima` varchar(200) NOT NULL   COMMENT '密码',
	`jiaoshixingming` varchar(200)    COMMENT '教师姓名',
	`xingbie` varchar(200)    COMMENT '性别',
	`touxiang` varchar(200)    COMMENT '头像',
	`zhicheng` varchar(200)    COMMENT '职称',
	`jiaoshishouji` varchar(200)    COMMENT '教师手机',
	`beizhu` longtext    COMMENT '备注',
	`thumbsupnum` int   default '0' COMMENT '赞',
	`crazilynum` int   default '0' COMMENT '踩',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='名师';

INSERT INTO mingshi(id,gonghao,mima,jiaoshixingming,xingbie,touxiang,zhicheng,jiaoshishouji,beizhu,thumbsupnum,crazilynum) VALUES(21,'名师1','123456','教师姓名1','男','http://localhost:8080/nodejssi995/upload/mingshi_touxiang1.jpg','职称1','13823888881','备注1',1,1);
INSERT INTO mingshi(id,gonghao,mima,jiaoshixingming,xingbie,touxiang,zhicheng,jiaoshishouji,beizhu,thumbsupnum,crazilynum) VALUES(22,'名师2','123456','教师姓名2','男','http://localhost:8080/nodejssi995/upload/mingshi_touxiang2.jpg','职称2','13823888882','备注2',2,2);
INSERT INTO mingshi(id,gonghao,mima,jiaoshixingming,xingbie,touxiang,zhicheng,jiaoshishouji,beizhu,thumbsupnum,crazilynum) VALUES(23,'名师3','123456','教师姓名3','男','http://localhost:8080/nodejssi995/upload/mingshi_touxiang3.jpg','职称3','13823888883','备注3',3,3);
INSERT INTO mingshi(id,gonghao,mima,jiaoshixingming,xingbie,touxiang,zhicheng,jiaoshishouji,beizhu,thumbsupnum,crazilynum) VALUES(24,'名师4','123456','教师姓名4','男','http://localhost:8080/nodejssi995/upload/mingshi_touxiang4.jpg','职称4','13823888884','备注4',4,4);
INSERT INTO mingshi(id,gonghao,mima,jiaoshixingming,xingbie,touxiang,zhicheng,jiaoshishouji,beizhu,thumbsupnum,crazilynum) VALUES(25,'名师5','123456','教师姓名5','男','http://localhost:8080/nodejssi995/upload/mingshi_touxiang5.jpg','职称5','13823888885','备注5',5,5);
INSERT INTO mingshi(id,gonghao,mima,jiaoshixingming,xingbie,touxiang,zhicheng,jiaoshishouji,beizhu,thumbsupnum,crazilynum) VALUES(26,'名师6','123456','教师姓名6','男','http://localhost:8080/nodejssi995/upload/mingshi_touxiang6.jpg','职称6','13823888886','备注6',6,6);

DROP TABLE IF EXISTS `kechengxinxi`;

CREATE TABLE `kechengxinxi` (
	`id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '创建时间',
	`kechengmingcheng` varchar(200)    COMMENT '课程名称',
	`kechengleixing` varchar(200)    COMMENT '课程类型',
	`kechengfengmian` varchar(200)    COMMENT '课程封面',
	`zaixiankecheng` varchar(200)    COMMENT '在线课程',
	`jiage` int NOT NULL   COMMENT '价格',
	`kechengxiangqing` longtext    COMMENT '课程详情',
	`gonghao` varchar(200)    COMMENT '工号',
	`jiaoshixingming` varchar(200)    COMMENT '教师姓名',
	`thumbsupnum` int   default '0' COMMENT '赞',
	`crazilynum` int   default '0' COMMENT '踩',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='课程信息';

INSERT INTO kechengxinxi(id,kechengmingcheng,kechengleixing,kechengfengmian,zaixiankecheng,jiage,kechengxiangqing,gonghao,jiaoshixingming,thumbsupnum,crazilynum) VALUES(31,'课程名称1','课程类型1','http://localhost:8080/nodejssi995/upload/kechengxinxi_kechengfengmian1.jpg','',1,'课程详情1','工号1','教师姓名1',1,1);
INSERT INTO kechengxinxi(id,kechengmingcheng,kechengleixing,kechengfengmian,zaixiankecheng,jiage,kechengxiangqing,gonghao,jiaoshixingming,thumbsupnum,crazilynum) VALUES(32,'课程名称2','课程类型2','http://localhost:8080/nodejssi995/upload/kechengxinxi_kechengfengmian2.jpg','',2,'课程详情2','工号2','教师姓名2',2,2);
INSERT INTO kechengxinxi(id,kechengmingcheng,kechengleixing,kechengfengmian,zaixiankecheng,jiage,kechengxiangqing,gonghao,jiaoshixingming,thumbsupnum,crazilynum) VALUES(33,'课程名称3','课程类型3','http://localhost:8080/nodejssi995/upload/kechengxinxi_kechengfengmian3.jpg','',3,'课程详情3','工号3','教师姓名3',3,3);
INSERT INTO kechengxinxi(id,kechengmingcheng,kechengleixing,kechengfengmian,zaixiankecheng,jiage,kechengxiangqing,gonghao,jiaoshixingming,thumbsupnum,crazilynum) VALUES(34,'课程名称4','课程类型4','http://localhost:8080/nodejssi995/upload/kechengxinxi_kechengfengmian4.jpg','',4,'课程详情4','工号4','教师姓名4',4,4);
INSERT INTO kechengxinxi(id,kechengmingcheng,kechengleixing,kechengfengmian,zaixiankecheng,jiage,kechengxiangqing,gonghao,jiaoshixingming,thumbsupnum,crazilynum) VALUES(35,'课程名称5','课程类型5','http://localhost:8080/nodejssi995/upload/kechengxinxi_kechengfengmian5.jpg','',5,'课程详情5','工号5','教师姓名5',5,5);
INSERT INTO kechengxinxi(id,kechengmingcheng,kechengleixing,kechengfengmian,zaixiankecheng,jiage,kechengxiangqing,gonghao,jiaoshixingming,thumbsupnum,crazilynum) VALUES(36,'课程名称6','课程类型6','http://localhost:8080/nodejssi995/upload/kechengxinxi_kechengfengmian6.jpg','',6,'课程详情6','工号6','教师姓名6',6,6);

DROP TABLE IF EXISTS `jisuanjixueyuan`;

CREATE TABLE `jisuanjixueyuan` (
	`id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '创建时间',
	`biaoti` varchar(200) NOT NULL   COMMENT '标题',
	`fengmian` varchar(200)    COMMENT '封面',
	`neirong` longtext    COMMENT '内容',
	`xiangqing` longtext    COMMENT '详情',
	`riqi` date    COMMENT '日期',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='计算机学院';

INSERT INTO jisuanjixueyuan(id,biaoti,fengmian,neirong,xiangqing,riqi) VALUES(41,'标题1','http://localhost:8080/nodejssi995/upload/jisuanjixueyuan_fengmian1.jpg','内容1','详情1',CURRENT_TIMESTAMP);
INSERT INTO jisuanjixueyuan(id,biaoti,fengmian,neirong,xiangqing,riqi) VALUES(42,'标题2','http://localhost:8080/nodejssi995/upload/jisuanjixueyuan_fengmian2.jpg','内容2','详情2',CURRENT_TIMESTAMP);
INSERT INTO jisuanjixueyuan(id,biaoti,fengmian,neirong,xiangqing,riqi) VALUES(43,'标题3','http://localhost:8080/nodejssi995/upload/jisuanjixueyuan_fengmian3.jpg','内容3','详情3',CURRENT_TIMESTAMP);
INSERT INTO jisuanjixueyuan(id,biaoti,fengmian,neirong,xiangqing,riqi) VALUES(44,'标题4','http://localhost:8080/nodejssi995/upload/jisuanjixueyuan_fengmian4.jpg','内容4','详情4',CURRENT_TIMESTAMP);
INSERT INTO jisuanjixueyuan(id,biaoti,fengmian,neirong,xiangqing,riqi) VALUES(45,'标题5','http://localhost:8080/nodejssi995/upload/jisuanjixueyuan_fengmian5.jpg','内容5','详情5',CURRENT_TIMESTAMP);
INSERT INTO jisuanjixueyuan(id,biaoti,fengmian,neirong,xiangqing,riqi) VALUES(46,'标题6','http://localhost:8080/nodejssi995/upload/jisuanjixueyuan_fengmian6.jpg','内容6','详情6',CURRENT_TIMESTAMP);

DROP TABLE IF EXISTS `shejixueyuan`;

CREATE TABLE `shejixueyuan` (
	`id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '创建时间',
	`biaoti` varchar(200) NOT NULL   COMMENT '标题',
	`fengmian` varchar(200)    COMMENT '封面',
	`neirong` longtext    COMMENT '内容',
	`xiangqing` longtext    COMMENT '详情',
	`riqi` date    COMMENT '日期',
	`userid` bigint NOT NULL   COMMENT '用户id',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设计学院';

INSERT INTO shejixueyuan(id,biaoti,fengmian,neirong,xiangqing,riqi,userid) VALUES(51,'标题1','http://localhost:8080/nodejssi995/upload/shejixueyuan_fengmian1.jpg','内容1','详情1',CURRENT_TIMESTAMP,1);
INSERT INTO shejixueyuan(id,biaoti,fengmian,neirong,xiangqing,riqi,userid) VALUES(52,'标题2','http://localhost:8080/nodejssi995/upload/shejixueyuan_fengmian2.jpg','内容2','详情2',CURRENT_TIMESTAMP,2);
INSERT INTO shejixueyuan(id,biaoti,fengmian,neirong,xiangqing,riqi,userid) VALUES(53,'标题3','http://localhost:8080/nodejssi995/upload/shejixueyuan_fengmian3.jpg','内容3','详情3',CURRENT_TIMESTAMP,3);
INSERT INTO shejixueyuan(id,biaoti,fengmian,neirong,xiangqing,riqi,userid) VALUES(54,'标题4','http://localhost:8080/nodejssi995/upload/shejixueyuan_fengmian4.jpg','内容4','详情4',CURRENT_TIMESTAMP,4);
INSERT INTO shejixueyuan(id,biaoti,fengmian,neirong,xiangqing,riqi,userid) VALUES(55,'标题5','http://localhost:8080/nodejssi995/upload/shejixueyuan_fengmian5.jpg','内容5','详情5',CURRENT_TIMESTAMP,5);
INSERT INTO shejixueyuan(id,biaoti,fengmian,neirong,xiangqing,riqi,userid) VALUES(56,'标题6','http://localhost:8080/nodejssi995/upload/shejixueyuan_fengmian6.jpg','内容6','详情6',CURRENT_TIMESTAMP,6);

DROP TABLE IF EXISTS `kechenggoumai`;

CREATE TABLE `kechenggoumai` (
	`id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '创建时间',
	`dingdanbianhao` varchar(200)  UNIQUE   COMMENT '订单编号',
	`kechengmingcheng` varchar(200)    COMMENT '课程名称',
	`kechengleixing` varchar(200)    COMMENT '课程类型',
	`gonghao` varchar(200)    COMMENT '工号',
	`jiage` varchar(200)    COMMENT '价格',
	`goumairiqi` date    COMMENT '购买日期',
	`beizhu` longtext    COMMENT '备注',
	`xuehao` varchar(200)    COMMENT '学号',
	`xueshengxingming` varchar(200)    COMMENT '学生姓名',
	`ispay` varchar(200)   default '未支付' COMMENT '是否支付',
	`userid` bigint NOT NULL   COMMENT '用户id',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='课程购买';

INSERT INTO kechenggoumai(id,dingdanbianhao,kechengmingcheng,kechengleixing,gonghao,jiage,goumairiqi,beizhu,xuehao,xueshengxingming,ispay,userid) VALUES(61,'订单编号1','课程名称1','课程类型1','工号1','价格1',CURRENT_TIMESTAMP,'备注1','学号1','学生姓名1','未支付',1);
INSERT INTO kechenggoumai(id,dingdanbianhao,kechengmingcheng,kechengleixing,gonghao,jiage,goumairiqi,beizhu,xuehao,xueshengxingming,ispay,userid) VALUES(62,'订单编号2','课程名称2','课程类型2','工号2','价格2',CURRENT_TIMESTAMP,'备注2','学号2','学生姓名2','未支付',2);
INSERT INTO kechenggoumai(id,dingdanbianhao,kechengmingcheng,kechengleixing,gonghao,jiage,goumairiqi,beizhu,xuehao,xueshengxingming,ispay,userid) VALUES(63,'订单编号3','课程名称3','课程类型3','工号3','价格3',CURRENT_TIMESTAMP,'备注3','学号3','学生姓名3','未支付',3);
INSERT INTO kechenggoumai(id,dingdanbianhao,kechengmingcheng,kechengleixing,gonghao,jiage,goumairiqi,beizhu,xuehao,xueshengxingming,ispay,userid) VALUES(64,'订单编号4','课程名称4','课程类型4','工号4','价格4',CURRENT_TIMESTAMP,'备注4','学号4','学生姓名4','未支付',4);
INSERT INTO kechenggoumai(id,dingdanbianhao,kechengmingcheng,kechengleixing,gonghao,jiage,goumairiqi,beizhu,xuehao,xueshengxingming,ispay,userid) VALUES(65,'订单编号5','课程名称5','课程类型5','工号5','价格5',CURRENT_TIMESTAMP,'备注5','学号5','学生姓名5','未支付',5);
INSERT INTO kechenggoumai(id,dingdanbianhao,kechengmingcheng,kechengleixing,gonghao,jiage,goumairiqi,beizhu,xuehao,xueshengxingming,ispay,userid) VALUES(66,'订单编号6','课程名称6','课程类型6','工号6','价格6',CURRENT_TIMESTAMP,'备注6','学号6','学生姓名6','未支付',6);

DROP TABLE IF EXISTS `kechengwenjian`;

CREATE TABLE `kechengwenjian` (
	`id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '创建时间',
	`dingdanbianhao` varchar(200)    COMMENT '订单编号',
	`kechengmingcheng` varchar(200)    COMMENT '课程名称',
	`kechengleixing` varchar(200)    COMMENT '课程类型',
	`xuehao` varchar(200)    COMMENT '学号',
	`xueshengxingming` varchar(200)    COMMENT '学生姓名',
	`kechengwenjian` varchar(200)    COMMENT '课程文件',
	`faburiqi` date    COMMENT '发布日期',
	`gonghao` varchar(200)    COMMENT '工号',
	`jiaoshixingming` varchar(200)    COMMENT '教师姓名',
	`userid` bigint NOT NULL   COMMENT '用户id',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='课程文件';

INSERT INTO kechengwenjian(id,dingdanbianhao,kechengmingcheng,kechengleixing,xuehao,xueshengxingming,kechengwenjian,faburiqi,gonghao,jiaoshixingming,userid) VALUES(71,'订单编号1','课程名称1','课程类型1','学号1','学生姓名1','',CURRENT_TIMESTAMP,'工号1','教师姓名1',1);
INSERT INTO kechengwenjian(id,dingdanbianhao,kechengmingcheng,kechengleixing,xuehao,xueshengxingming,kechengwenjian,faburiqi,gonghao,jiaoshixingming,userid) VALUES(72,'订单编号2','课程名称2','课程类型2','学号2','学生姓名2','',CURRENT_TIMESTAMP,'工号2','教师姓名2',2);
INSERT INTO kechengwenjian(id,dingdanbianhao,kechengmingcheng,kechengleixing,xuehao,xueshengxingming,kechengwenjian,faburiqi,gonghao,jiaoshixingming,userid) VALUES(73,'订单编号3','课程名称3','课程类型3','学号3','学生姓名3','',CURRENT_TIMESTAMP,'工号3','教师姓名3',3);
INSERT INTO kechengwenjian(id,dingdanbianhao,kechengmingcheng,kechengleixing,xuehao,xueshengxingming,kechengwenjian,faburiqi,gonghao,jiaoshixingming,userid) VALUES(74,'订单编号4','课程名称4','课程类型4','学号4','学生姓名4','',CURRENT_TIMESTAMP,'工号4','教师姓名4',4);
INSERT INTO kechengwenjian(id,dingdanbianhao,kechengmingcheng,kechengleixing,xuehao,xueshengxingming,kechengwenjian,faburiqi,gonghao,jiaoshixingming,userid) VALUES(75,'订单编号5','课程名称5','课程类型5','学号5','学生姓名5','',CURRENT_TIMESTAMP,'工号5','教师姓名5',5);
INSERT INTO kechengwenjian(id,dingdanbianhao,kechengmingcheng,kechengleixing,xuehao,xueshengxingming,kechengwenjian,faburiqi,gonghao,jiaoshixingming,userid) VALUES(76,'订单编号6','课程名称6','课程类型6','学号6','学生姓名6','',CURRENT_TIMESTAMP,'工号6','教师姓名6',6);

DROP TABLE IF EXISTS `forum`;

CREATE TABLE `forum` (
	`id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '创建时间',
	`title` varchar(200)    COMMENT '帖子标题',
	`content` longtext NOT NULL   COMMENT '帖子内容',
	`parentid` bigint    COMMENT '父节点id',
	`userid` bigint NOT NULL   COMMENT '用户id',
	`username` varchar(200)    COMMENT '用户名',
	`isdone` varchar(200)    COMMENT '状态',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='论坛表';

INSERT INTO forum(id,title,content,parentid,userid,username,isdone) VALUES(81,'帖子标题1','帖子内容1',1,1,'用户名1','开放');
INSERT INTO forum(id,title,content,parentid,userid,username,isdone) VALUES(82,'帖子标题2','帖子内容2',2,2,'用户名2','开放');
INSERT INTO forum(id,title,content,parentid,userid,username,isdone) VALUES(83,'帖子标题3','帖子内容3',3,3,'用户名3','开放');
INSERT INTO forum(id,title,content,parentid,userid,username,isdone) VALUES(84,'帖子标题4','帖子内容4',4,4,'用户名4','开放');
INSERT INTO forum(id,title,content,parentid,userid,username,isdone) VALUES(85,'帖子标题5','帖子内容5',5,5,'用户名5','开放');
INSERT INTO forum(id,title,content,parentid,userid,username,isdone) VALUES(86,'帖子标题6','帖子内容6',6,6,'用户名6','开放');

DROP TABLE IF EXISTS `exampaper`;

CREATE TABLE `exampaper` (
	`id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '创建时间',
	`name` varchar(200) NOT NULL   COMMENT '试卷名称',
	`time` int NOT NULL   COMMENT '考试时长(分钟)',
	`status` int NOT NULL  default '0' COMMENT '试卷状态',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='试卷表';


DROP TABLE IF EXISTS `examquestion`;

CREATE TABLE `examquestion` (
	`id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '创建时间',
	`paperid` bigint NOT NULL   COMMENT '所属试卷id（外键）',
	`papername` varchar(200) NOT NULL   COMMENT '试卷名称',
	`questionname` varchar(200) NOT NULL   COMMENT '试题名称',
	`options` longtext    COMMENT '选项，json字符串',
	`score` bigint   default '0' COMMENT '分值',
	`answer` varchar(200)    COMMENT '正确答案',
	`analysis` longtext    COMMENT '答案解析',
	`type` bigint   default '0' COMMENT '试题类型，0：单选题 1：多选题 2：判断题 3：填空题（暂不考虑多项填空）',
	`sequence` bigint   default '100' COMMENT '试题排序，值越大排越前面',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='试题表';


DROP TABLE IF EXISTS `examrecord`;

CREATE TABLE `examrecord` (
	`id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '创建时间',
	`userid` bigint NOT NULL   COMMENT '用户id',
	`username` varchar(200)    COMMENT '用户名',
	`paperid` bigint NOT NULL   COMMENT '试卷id（外键）',
	`papername` varchar(200) NOT NULL   COMMENT '试卷名称',
	`questionid` bigint NOT NULL   COMMENT '试题id（外键）',
	`questionname` varchar(200) NOT NULL   COMMENT '试题名称',
	`options` longtext    COMMENT '选项，json字符串',
	`score` bigint   default '0' COMMENT '分值',
	`answer` varchar(200)    COMMENT '正确答案',
	`analysis` longtext    COMMENT '答案解析',
	`myscore` bigint NOT NULL  default '0' COMMENT '试题得分',
	`myanswer` varchar(200)    COMMENT '考生答案',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='考试记录表';


DROP TABLE IF EXISTS `storeup`;

CREATE TABLE `storeup` (
	`id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '创建时间',
	`userid` bigint NOT NULL   COMMENT '用户id',
	`refid` bigint    COMMENT '收藏id',
	`tablename` varchar(200)    COMMENT '表名',
	`name` varchar(200) NOT NULL   COMMENT '收藏名称',
	`picture` varchar(200) NOT NULL   COMMENT '收藏图片',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收藏表';


DROP TABLE IF EXISTS `messages`;

CREATE TABLE `messages` (
	`id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '创建时间',
	`userid` bigint NOT NULL   COMMENT '留言人id',
	`username` varchar(200)    COMMENT '用户名',
	`content` longtext NOT NULL   COMMENT '留言内容',
	`reply` longtext    COMMENT '回复内容',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='留言板';

INSERT INTO messages(id,userid,username,content,reply) VALUES(131,1,'用户名1','留言内容1','回复内容1');
INSERT INTO messages(id,userid,username,content,reply) VALUES(132,2,'用户名2','留言内容2','回复内容2');
INSERT INTO messages(id,userid,username,content,reply) VALUES(133,3,'用户名3','留言内容3','回复内容3');
INSERT INTO messages(id,userid,username,content,reply) VALUES(134,4,'用户名4','留言内容4','回复内容4');
INSERT INTO messages(id,userid,username,content,reply) VALUES(135,5,'用户名5','留言内容5','回复内容5');
INSERT INTO messages(id,userid,username,content,reply) VALUES(136,6,'用户名6','留言内容6','回复内容6');

DROP TABLE IF EXISTS `discussmingshi`;

CREATE TABLE `discussmingshi` (
	`id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '创建时间',
	`refid` bigint NOT NULL   COMMENT '关联表id',
	`userid` bigint NOT NULL   COMMENT '用户id',
	`content` longtext NOT NULL   COMMENT '评论内容',
	`reply` longtext    COMMENT '回复内容',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='名师评论表';

INSERT INTO discussmingshi(id,refid,userid,content,reply) VALUES(141,1,1,'评论内容1','回复内容1');
INSERT INTO discussmingshi(id,refid,userid,content,reply) VALUES(142,2,2,'评论内容2','回复内容2');
INSERT INTO discussmingshi(id,refid,userid,content,reply) VALUES(143,3,3,'评论内容3','回复内容3');
INSERT INTO discussmingshi(id,refid,userid,content,reply) VALUES(144,4,4,'评论内容4','回复内容4');
INSERT INTO discussmingshi(id,refid,userid,content,reply) VALUES(145,5,5,'评论内容5','回复内容5');
INSERT INTO discussmingshi(id,refid,userid,content,reply) VALUES(146,6,6,'评论内容6','回复内容6');

DROP TABLE IF EXISTS `discusskechengxinxi`;

CREATE TABLE `discusskechengxinxi` (
	`id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '创建时间',
	`refid` bigint NOT NULL   COMMENT '关联表id',
	`userid` bigint NOT NULL   COMMENT '用户id',
	`content` longtext NOT NULL   COMMENT '评论内容',
	`reply` longtext    COMMENT '回复内容',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='课程信息评论表';

INSERT INTO discusskechengxinxi(id,refid,userid,content,reply) VALUES(151,1,1,'评论内容1','回复内容1');
INSERT INTO discusskechengxinxi(id,refid,userid,content,reply) VALUES(152,2,2,'评论内容2','回复内容2');
INSERT INTO discusskechengxinxi(id,refid,userid,content,reply) VALUES(153,3,3,'评论内容3','回复内容3');
INSERT INTO discusskechengxinxi(id,refid,userid,content,reply) VALUES(154,4,4,'评论内容4','回复内容4');
INSERT INTO discusskechengxinxi(id,refid,userid,content,reply) VALUES(155,5,5,'评论内容5','回复内容5');
INSERT INTO discusskechengxinxi(id,refid,userid,content,reply) VALUES(156,6,6,'评论内容6','回复内容6');


DROP TABLE IF EXISTS `config`;

CREATE TABLE `config`(
	`id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
	`name` varchar(100) NOT NULL COMMENT '配置参数名称',
	`value` varchar(100) COMMENT '配置参数值',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配置文件';

insert into config(id,name,value) values(1,'picture1','http://localhost:8080/nodejssi995/upload/picture1.jpg');
insert into config(id,name,value) values(2,'picture2','http://localhost:8080/nodejssi995/upload/picture2.jpg');
insert into config(id,name,value) values(3,'picture3','http://localhost:8080/nodejssi995/upload/picture3.jpg');
insert into config(id,name) values(6,'homepage');


DROP TABLE IF EXISTS `users`;

CREATE TABLE `users`(
	`id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
	`username` varchar(100) NOT NULL COMMENT '用户名',
	`password` varchar(100) NOT NULL COMMENT '密码',
	`role` varchar(100) default '管理员' COMMENT '角色',
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '新增时间',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

insert into users(id,username, password) values(1,'abo','abo');


