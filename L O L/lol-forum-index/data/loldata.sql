/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50087
Source Host           : localhost:3306
Source Database       : loldata

Target Server Type    : MYSQL
Target Server Version : 50087
File Encoding         : 65001

Date: 2016-08-08 17:07:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for activity
-- ----------------------------
set names UTF8;
drop database if exists LOLData;
create database LOLData charset=UTF8;
use LOLData;

DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity` (
  `imgsrc` varchar(30) default NULL,
  `url` varchar(20) default NULL,
  `sdate` varchar(5) default NULL,
  `edate` varchar(5) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity
-- ----------------------------

-- ----------------------------
-- Table structure for ccenter
-- ----------------------------
DROP TABLE IF EXISTS `ccenter`;
CREATE TABLE `ccenter` (
  `ctitleid` int(11) NOT NULL auto_increment,
  `ctypeid` int(11) default NULL,
  `ctype` varchar(20) default NULL,
  `ctitle` varchar(20) default NULL,
  `cstime` bigint(20) default NULL,
  `cetime` bigint(20) default NULL,
  `caddress` varchar(20) default NULL,
  `cimgsrc` varchar(20) default NULL,
  `curl` varchar(20) default NULL,
  `caudience` int(11) default NULL,
  PRIMARY KEY  (`ctitleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ccenter
-- ----------------------------

-- ----------------------------
-- Table structure for cnewslist
-- ----------------------------
DROP TABLE IF EXISTS `cnewslist`;
CREATE TABLE `cnewslist` (
  `ctitleid` int(11) default NULL,
  `cnewsid` int(11) NOT NULL auto_increment,
  `ctime` bigint(20) default NULL,
  `curl` varchar(20) default NULL,
  PRIMARY KEY  (`cnewsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cnewslist
-- ----------------------------

-- ----------------------------
-- Table structure for eyeskin
-- ----------------------------
DROP TABLE IF EXISTS `eyeskin`;
CREATE TABLE `eyeskin` (
  `esid` int(11) NOT NULL auto_increment,
  `esname` varchar(10) default NULL,
  `oprice` float(6,2) default NULL,
  `price` float(6,2) default NULL,
  `photosrc` varchar(20) default NULL,
  `imgsrc` varchar(30) default NULL,
  `imglarge` varchar(30) default NULL,
  `birthday` bigint(20) default NULL,
  `count` int(11) default NULL,
  `due` varchar(10) default NULL,
  `issupport` tinyint(1) default NULL,
  `isreturn` tinyint(1) default NULL,
  `intro` varchar(20) default NULL,
  `isonsale` tinyint(1) default NULL,
  PRIMARY KEY  (`esid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of eyeskin
-- ----------------------------

-- ----------------------------
-- Table structure for hero
-- ----------------------------
DROP TABLE IF EXISTS `hero`;
CREATE TABLE `hero` (
  `hid` int(11) NOT NULL auto_increment,
  `hname` varchar(10) default NULL,
  `oprice` float(6,2) default NULL,
  `price` float(6,2) default NULL,
  `photosrc` varchar(20) default NULL,
  `imgsrc` varchar(30) default NULL,
  `imglarge` varchar(30) default NULL,
  `birthday` bigint(20) default NULL,
  `count` int(11) default NULL,
  `due` varchar(10) default NULL,
  `issupport` tinyint(1) default NULL,
  `isreturn` tinyint(1) default NULL,
  `videourl` varchar(30) default NULL,
  `intro` varchar(30) default NULL,
  `isonsale` tinyint(1) default NULL,
  PRIMARY KEY  (`hid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hero
-- ----------------------------
INSERT INTO `hero` VALUES ('1', '影流之主', '45.00', '45.00', null, 'img/hero/1.jpg', 'img/hero/1_lg.jpg', null, null, '永久', '1', '0', '', '影流之主 劫 ', null);
INSERT INTO `hero` VALUES ('2', '披甲龙龟', '25.00', '25.00', null, 'img/hero/2.jpg', 'img/hero/2_lg.jpg', null, null, '永久', '0', '0', null, null, null);
INSERT INTO `hero` VALUES ('3', '暗黑元首', '45.00', '45.00', null, 'img/hero/1_134.jpg', 'img/hero/1_134_lg.jpg', null, null, '永久', '0', '0', null, '暗黑元首 辛德拉', null);
INSERT INTO `hero` VALUES ('4', '魂锁典狱长', '45.00', '45.00', null, 'img/hero/1_412.jpg', 'img/hero/1_412_lg.jpg', null, null, '永久', '0', '0', null, null, null);
INSERT INTO `hero` VALUES ('5', '荣耀行刑官', '45.00', '45.00', null, 'img/hero/1_119.jpg', 'img/hero/1_119_lg.jpg', null, null, '永久', '0', '0', null, null, null);
INSERT INTO `hero` VALUES ('6', '潮汐海灵', '45.00', '45.00', null, 'img/hero/1_105.jpg', 'img/hero/1_105_lg.jpg', null, null, '永久', '0', '0', null, null, null);
INSERT INTO `hero` VALUES ('7', null, null, null, null, null, null, null, null, null, null, null, null, '菲兹', null);

-- ----------------------------
-- Table structure for herotype
-- ----------------------------
DROP TABLE IF EXISTS `herotype`;
CREATE TABLE `herotype` (
  `typeid` int(1) NOT NULL,
  `hid` int(3) default NULL,
  KEY `hid` (`hid`),
  KEY `typeid` (`typeid`),
  CONSTRAINT `hid` FOREIGN KEY (`hid`) REFERENCES `hero` (`hid`),
  CONSTRAINT `typeid` FOREIGN KEY (`typeid`) REFERENCES `htypedetail` (`typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of herotype
-- ----------------------------
INSERT INTO `herotype` VALUES ('1', '1');
INSERT INTO `herotype` VALUES ('2', '2');
INSERT INTO `herotype` VALUES ('3', '3');
INSERT INTO `herotype` VALUES ('4', '4');
INSERT INTO `herotype` VALUES ('5', '5');
INSERT INTO `herotype` VALUES ('6', '6');

-- ----------------------------
-- Table structure for htypedetail
-- ----------------------------
DROP TABLE IF EXISTS `htypedetail`;
CREATE TABLE `htypedetail` (
  `typeid` int(1) NOT NULL,
  `typename` varchar(5) default NULL,
  PRIMARY KEY  (`typeid`),
  KEY `typeid` (`typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of htypedetail
-- ----------------------------
INSERT INTO `htypedetail` VALUES ('1', '刺客');
INSERT INTO `htypedetail` VALUES ('2', '坦克');
INSERT INTO `htypedetail` VALUES ('3', '法师');
INSERT INTO `htypedetail` VALUES ('4', '辅助');
INSERT INTO `htypedetail` VALUES ('5', '后期');
INSERT INTO `htypedetail` VALUES ('6', '战士');
INSERT INTO `htypedetail` VALUES ('7', '推进');

-- ----------------------------
-- Table structure for msgfollow
-- ----------------------------
DROP TABLE IF EXISTS `msgfollow`;
CREATE TABLE `msgfollow` (
  `fmid` varchar(40) NOT NULL,
  `fuid` varchar(30) default NULL,
  `mid` varchar(40) default NULL,
  `prevmid` varchar(20) default NULL,
  `ftime` bigint(20) default NULL,
  `fcontent` varchar(200) default NULL,
  PRIMARY KEY  (`fmid`),
  KEY `fuid` (`fuid`),
  KEY `mid` (`mid`),
  KEY `prevmid` (`prevmid`),
  CONSTRAINT `fuid` FOREIGN KEY (`fuid`) REFERENCES `userinfo` (`uid`),
  CONSTRAINT `mid` FOREIGN KEY (`mid`) REFERENCES `pub` (`mid`),
  CONSTRAINT `prevmid` FOREIGN KEY (`prevmid`) REFERENCES `msgfollow` (`fmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of msgfollow
-- ----------------------------
INSERT INTO `msgfollow` VALUES ('15757129530#1#1', '123@qq.com', '15757129530#1', null, '58665595615', '我一个战五渣排位只能选辅助');
INSERT INTO `msgfollow` VALUES ('15757129530#1#10', '125@qq.com', '15757129530#1', null, '6252425243543', '抱大腿');
INSERT INTO `msgfollow` VALUES ('15757129530#1#11', '18565498902', '15757129530#1', null, '6252425243543', '+1');
INSERT INTO `msgfollow` VALUES ('15757129530#1#12', '18565498959', '15757129530#1', null, '6252425243543', '哈哈');
INSERT INTO `msgfollow` VALUES ('15757129530#1#13', '18565498959', '15757129530#1', null, '6252425243543', '抱大腿');
INSERT INTO `msgfollow` VALUES ('15757129530#1#14', '543@qq.com', '15757129530#1', null, '6252425243543', '赢了');
INSERT INTO `msgfollow` VALUES ('15757129530#1#15', '124@qq.com', '15757129530#1', null, '6252425243543', '+1');
INSERT INTO `msgfollow` VALUES ('15757129530#1#16', '18565498959', '15757129530#1', null, '6252425243543', '哈哈');
INSERT INTO `msgfollow` VALUES ('15757129530#1#17', '5895@126.com', '15757129530#1', null, '6252425243543', '抱大腿');
INSERT INTO `msgfollow` VALUES ('15757129530#1#18', 'sdhsjh@126.com', '15757129530#1', '15757129530#1#12', '6252425243543', '赢了');
INSERT INTO `msgfollow` VALUES ('15757129530#1#19', '18565498905', '15757129530#1', null, '6252425243543', '嗯嗯');
INSERT INTO `msgfollow` VALUES ('15757129530#1#2', '124@qq.com', '15757129530#1', '15757129530#1#1', '54548654646', '呵呵');
INSERT INTO `msgfollow` VALUES ('15757129530#1#20', '18565498911', '15757129530#1', null, '6252425243543', '嗯哪');
INSERT INTO `msgfollow` VALUES ('15757129530#1#21', '18565498947', '15757129530#1', null, '6252425243543', '赢了');
INSERT INTO `msgfollow` VALUES ('15757129530#1#3', '124@qq.com', '15757129530#1', null, '5252425243543', '开心开心');
INSERT INTO `msgfollow` VALUES ('15757129530#1#4', '18565498901', '15757129530#1', null, '5252885243543', '楼上说的对');
INSERT INTO `msgfollow` VALUES ('15757129530#1#5', '18565498902', '15757129530#1', null, '6252425243543', '同意');
INSERT INTO `msgfollow` VALUES ('15757129530#1#6', '18565498903', '15757129530#1', null, '6252425243543', '同意');
INSERT INTO `msgfollow` VALUES ('15757129530#1#7', '18565498947', '15757129530#1', '15757129530#1#5', '6252425243543', '+1');
INSERT INTO `msgfollow` VALUES ('15757129530#1#8', '18565498907', '15757129530#1', null, '6252425243543', '哈哈');
INSERT INTO `msgfollow` VALUES ('15757129530#1#9', '18565498959', '15757129530#1', null, '6252425243543', '同意');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `nid` int(11) NOT NULL auto_increment,
  `url` varchar(30) default NULL,
  `text` varchar(20) default NULL,
  PRIMARY KEY  (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------

-- ----------------------------
-- Table structure for pub
-- ----------------------------
DROP TABLE IF EXISTS `pub`;
CREATE TABLE `pub` (
  `mid` varchar(40) NOT NULL,
  `uid` varchar(30) NOT NULL,
  `followsum` int(11) default NULL,
  `mtitle` varchar(40) default NULL,
  `abstract` varchar(200) default NULL,
  `msgContent` varchar(1000) default NULL,
  `msgTime` bigint(20) default NULL,
  `zan` int(5) default NULL,
  `theme` varchar(6) default NULL,
  PRIMARY KEY  (`mid`),
  KEY `uid` (`uid`),
  CONSTRAINT `uid` FOREIGN KEY (`uid`) REFERENCES `userinfo` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pub
-- ----------------------------
INSERT INTO `pub` VALUES ('123@qq.com#1', '123@qq.com', null, '这个EDG的队长，曾经的天才少年或许真的要复出了', null, '虽说现在EDG    Mouse比赛发挥不错\r\n不过相信大家还是更期待童无敌的上场吧\r\n再加上已经有过Pawn回归是先例，想必童队应该也会上场吧\r\n你期待童无敌的复出吗？\r\n众所周知，IG下路孱弱已是由来已久的了\r\n再加上最近频频更换AD，IG下路更是毫无默契\r\n在这个时间里，原IG AD 现IG打野KID却在排位里苦练AD\r\n这是否意味着小孩要回归下路呢？\r\n不过以前小孩AD经常有发挥不稳的情况\r\n是否真的回归AD，让我们拭目以待', null, '5', '互动');
INSERT INTO `pub` VALUES ('123@qq.com#2', '123@qq.com', null, '灵魂画师Rookie手绘Kid：上菜辣', null, 'rookie和kid这一对CP真的是让很多人都觉得异常温暖，尤其是之前rookie的一句“他打野让我很舒服”更是成为两人有“奸情”的铁证!虽然IG最近的状态不怎么好，但是这一对黄金CP的感情还真的是没话说呢!这不最近rookie在直播期间化身灵魂画师，实力复原了一波kid在赛场上的截图。\r\n别的不敢说，反正小编我是看的醉醉的，好啦废话不说先上图!#img/pub/1.jpg#呃。。虽然这时候rookie还没有画完，但是各位看官该是能够感觉到孩神在rookie笔下强大的气场了吧(心疼孩神被PS之后还要被画。。。)!接下来就是完成品啦，加上了耳机的孩神变得更传神了有木有!尤其是rookie的那个大大的农夫山泉瓶子以及对自己大作非常满意的眼神，简直是看醉了啊思密达!\r\n\r\n虽然最近IG的成绩并不是十分令人满意，但从这件事上看起来，对内成员们的感情应该还是不错的。#img/pub/2.png#也是希望IG能够早些找到自己队伍的不足，让粉丝们能够在赛场上看到更多队员们开心的笑容而不是只在网上。', null, '15', '活动');
INSERT INTO `pub` VALUES ('123@qq.com#3', '123@qq.com', null, 'Bjergsen：下周证明我们和IMT谁最强', null, '在经历了昨天的失利后，TSM在今天展开了与NV的对决，这一次，他们没有将胜利拱手让人，2-0赢下了比赛。由此，TSM也重返第一，与IMT并列。这两局比赛中，打野Svenskeren和中单Bjergsen分获MVP。赛后，Bjergsen接受了采访。\r\n#img/pub/3.jpg#\r\n\r\n“重回第一的感觉非常好，我和我的队友们知道我们能表现的很好，我们也做到了。”\r\n在经历了赛季首败后，心态的调整成了TSM的重中之重。“Weldon(教练)帮了我们许多，不过每支队伍都至少输过一次，我们也知道自己可能会输掉一场，不一定是P1，也可能是其他队伍。”\r\n下周的TSM与IMT的对决将是一号**的争夺。对此，Bjergsen表示，“IMT和我们就是现在最强的两支队伍，到时候就能知道谁才是真正的最强了。”', null, '2', '互动');
INSERT INTO `pub` VALUES ('124@qq.com#1', '124@qq.com', null, '关于海克斯科技符石', null, '是不是一个英雄得过海克斯科技符石碎片后就不能再获得了', null, '8', '讨论');
INSERT INTO `pub` VALUES ('124@qq.com#2', '124@qq.com', null, '草莓发博感叹，WE越发走向成熟', '', '在昨天LPL的一场焦点战役中，经过三盘苦战最终WE2-1战胜RNG算是爆出一个冷门，而前WE上单草莓也在密切关注着老东家的表现。在比赛结束之后，草莓发出了两条微博，第一条很短感叹“WE越来越成熟了”。#img/pub/4.png#第二条则是凌晨一点的一条较长的微博，在其中草莓说道，自己当年抗压并不是一件享受的事情，但为了队伍的利益，每一个人都可以做出这种牺牲；WE虽然穷，但也因此WE的青训很棒，WE无所畏惧；看到比自己年轻的队员们还在坚持梦想，草莓觉得很幸运，会一直为WE加油；不忘初心，keep your dreams！#img/5.png#触景生情，看到和自己当年一样抗压的957有这么好的表现，想必草莓的内心也是很高兴的吧。\r\n　　附上一张WE当年穷的只能让草莓等人睡客厅打地铺的图：#img/pub/6.jpg#', null, '4', '活动');
INSERT INTO `pub` VALUES ('124@qq.com#3', '124@qq.com', null, '关于海克斯科技符石', '', '是不是一个英雄得过海克斯科技符石碎片后就不能再获得了', null, '1', '活动');
INSERT INTO `pub` VALUES ('124@qq.com#4', '124@qq.com', null, ' lpl战队报价', '', '有谁知道lpl战队的报价情况啊？可以跟我说一下呗。急急急！！！！！', null, '4', '讨论');
INSERT INTO `pub` VALUES ('125@qq.com#1', '125@qq.com', '0', '觉醒挥舞的拳刃——EDG.Clearlove 打野 明凯', null, '姓名：明凯\r\n年龄：21\r\nID：EDG.Clearlove\r\n昵称：诺言\r\n外号：诺导、厂长\r\n生日：7月25日\r\n出生地：湖北武汉\r\n游戏ID：Clearlove\r\n曾经ID：养猪人的逆袭、Angel1ove、Cherlshall、WE.Troll、Clove\r\nMSI全球季中赛冠军打野\r\n\r\n比起厂长我还是更喜欢称他为诺导，高端大气上档次，他曾是一代王者WE的打野，从那时候开始就习惯了有诺导的WE，如今效力于EDG的诺言改了ID。对于这个WE时代的缔造者，我有一万个理由相信他的能力，入队一月随队连斩五个冠军，被国服玩家亲切的称为—厂长；在“WE离队门”发生之后，加入EDG战队担任打野位置。\r\n\r\n\r\n诺言擅长的英雄有卡兹克、潘森、盲僧。操作细腻、带动节奏的时机选择的恰到好处。对于诺导有一种特殊的感情，就像是一个走向胜利的希望，在那个带给我们无限可能的时代，诺导肩负的是一个时代的企盼。\r\n他曾辉煌，也曾落寞；\r\n昔日骄狂，如今沉静；\r\n        \r\n\r\n转会到EDG的那段时间，有人不理解，骂他叛徒；可是电竞就是如此残酷，他要的无非胜利而已。即使猪崽满天下，可是如果没有胜利，没有成绩，又能怎样呢？他也只是想赢而已。', '568795454654', '8', '互动');
INSERT INTO `pub` VALUES ('125@qq.com#2', '125@qq.com', null, '附体恶灵 肆魄（随便按两个键出来的）', null, '远程英雄\r\n被动\r\n附身：肆魄自我非常虚弱，必须找到宿主，按被动图标再选择一名友方可以与其绑定，可在宿主体内进行攻击和施法，肆魄会承担被绑定队友受到的30%伤害，你血量在5%以下时不可承担宿主获得**0%/35%/40%**', null, '4', '互动');
INSERT INTO `pub` VALUES ('125@qq.com#3', '125@qq.com', null, '我们大家都要无限火力 ', '', '无限火力是大家最爱的模式  多出几回  正好在暑假玩玩  希望官方能以一个好的答复！！！！！！！！！！！！！！', null, '7', '互动');
INSERT INTO `pub` VALUES ('15757129530#1', '15757129530', '2', '关于自选模式下辅助的问题', '摘要不知道写什么反正摘要不重要吧', '在自选模式下，现在没多少人愿意玩辅助位置。为了一个上单中单位置有的人能等上20来分钟，最后不得不选补位。一补位稳稳辅助。在这样的情况下报复世界的辅助多了去了。希望能够限制玩家排位每五把必须有一把辅助。这样才能够弥补辅助慌的问题。', '55465465489787', '8', '活动');
INSERT INTO `pub` VALUES ('15757129530#2', '15757129530', '2', '关于自选模式下辅助的问题', '摘要不知道写什么反正摘要不重要吧', '在自选模式下，现在没多少人愿意玩辅助位置。为了一个上单中单位置有的人能等上20来分钟，最后不得不选补位。一补位稳稳辅助。在这样的情况下报复世界的辅助多了去了。希望能够限制玩家排位每五把必须有一把辅助。这样才能够弥补辅助慌的问题。', '55465465489787', '11', '互动');
INSERT INTO `pub` VALUES ('15757129530#3', '15757129530', '2', '关于自选模式下辅助的问题', '摘要不知道写什么反正摘要不重要吧', '在自选模式下，现在没多少人愿意玩辅助位置。为了一个上单中单位置有的人能等上20来分钟，最后不得不选补位。一补位稳稳辅助。在这样的情况下报复世界的辅助多了去了。希望能够限制玩家排位每五把必须有一把辅助。这样才能够弥补辅助慌的问题。', '55465465489787', '14', '讨论');
INSERT INTO `pub` VALUES ('15757129530#4', '15757129530', '2', '关于自选模式下辅助的问题', '摘要不知道写什么反正摘要不重要吧', '在自选模式下，现在没多少人愿意玩辅助位置。为了一个上单中单位置有的人能等上20来分钟，最后不得不选补位。一补位稳稳辅助。在这样的情况下报复世界的辅助多了去了。希望能够限制玩家排位每五把必须有一把辅助。这样才能够弥补辅助慌的问题。', '55465465489787', '5', '活动');
INSERT INTO `pub` VALUES ('18565498901#1', '18565498901', null, '琴女晋升辅助一姐，下路恐无人能敌？', null, '#img/pub/7.jpg#今日话题\r\n\r\n随着版本的更新，不仅仅是大赛，排位也见证了各个英雄的兴起与衰落。比起局局都要稳扎稳打的职业联赛，排位在新套路的研究方面总要更先一步。排位中成绩卓越、可能性较高的英雄也会成为联赛中的核心。下面我们来看看国服和韩服胜率排行榜吧\r\n\r\n韩服英雄排位胜率#img/pub/8.png#国服辅助排行榜胜率#img/pub/9.png#从国服和韩服大家都能够看到琴瑟仙女的高胜率榜单，但是为什么琴女会突然这么热门了呢，最近琴女如此活跃是源于6.14版本对琴女的加强，虽然表面没什么变化，但技能得到了质的上升。归纳一下重点即是冷却时间的缩减，琴女大招的被动效果调整为减少基础技能冷却时间的20/30/40%，后期堪比技能机关枪。大招的被动效果可与正常的冷却缩减相叠加，随着可以更加频繁地释放技能，一直是琴女核心的被动效果也将得到提升，这才是琴女加强的重点。不管怎样大家也都从榜单上一眼就能看到琴女热门层度，这算是不是对妹子的福音呢？\r\n\r\n\r\n1.每天评选3个优秀回复，并展示于次日话题帖2楼。这3个回复发布用户将分别获得30论坛金钱。\r\n2.话题内容仅为版主团提供的讨论内容，不代表官方立场。所有内容以国服官网与现网客户端数据为准。\r\n3.灌水账号将被禁言处罚', null, '4', '活动');
INSERT INTO `pub` VALUES ('18565498901#2', '18565498901', null, '这符石碎片爆率真心笑了', '', '刚出活动的时候我和我朋友开黑拿了9个碎片，那时还有50%的爆率。\r\n等活动一过我艹~~~只有5%的爆率，当然可能更低。一天我就只能刷到1个，我朋友1个都没。#img/pub/10.png#最主要一开始我们不懂，只买了门没买符石。后来懂了，在买符石不合算了就直接买100的。\r\n18个传送门啊感觉要开到明年才能开完了#img/pub/11.png#', null, '1', '分享');
INSERT INTO `pub` VALUES ('18565498901#3', '18565498901', null, '黑色玫瑰大区网络波动公告', '', '亲爱的召唤师：\r\n        由于电信区“黑色玫瑰”大区出现网络异常波动，部分用户可能出现匹配时间过长、登录排队严重、掉线等异常问题，我们已经联系相关技术人员正在进行紧急排查、修复，建议您可以暂时选择其他大区进行游戏；具体恢复时间请关注官网公告。\r\n        由于服务端网络问题给您带来的不便还请您谅解，感谢您一直以来对《英雄联盟》的大力支持！', null, '1', '活动');
INSERT INTO `pub` VALUES ('18565498901#4', '18565498901', null, '关于使用外挂修改非法昵称的公告', '', '亲爱的召唤师：\r\n       近期我们发现，部分玩家使用非法插件（外挂），破坏游戏代码，将游戏角色昵称进行非法修改（包括但不限于非法字符、超过长度限制等），造成游戏存在潜在未知风险，因此，我们将进行严厉处罚，还请大家共同维护、保持游戏良好的环境，遵守游戏规则，对非法插件勇敢说不。\r\n       感谢你对《英雄联盟》的支持与厚爱！\r\nFAQ:\r\n问：昵称封号解封后我能继续进行游戏吗？\r\n答：能否继续游戏，是根据你对违规行为的改善为前提的，若你及时将昵称修改为正常，遵守游戏规则，你可以继续游戏，否则，处罚只会越来越严重；\r\n\r\n问：这种封号会影响2016赛季发奖吗？\r\n答：按照以往赛季奖励发放规则，如果到时存在封号超过某个规定时长的，必将影响赛季奖励发放的，同时，2015赛季奖励也会定期进行审核，在奖励发放后存在违规的，将收回2015赛季奖励；\r\n（13） 第三方插件换肤功能问题 \r\n插件白名单更新公告\r\nhttp://lol.qq.com/webplat/info/n ... 201604/450101.shtml\r\n\r\n\r\nCC皮肤预览器已从插件白名单中除名，还请广大玩家不要使用不在白名单内的第三方软件篡改游戏客户端、换肤等行为，以免导致帐号被封号。', null, '7', '互动');
INSERT INTO `pub` VALUES ('18565498902#1', '18565498902', null, 'WEF上单——柯昌宇', null, '比赛ID：957\r\n队内位置：上单\r\n擅长英雄：武器大师，鳄鱼，丽桑卓\r\n\r\n稳扎稳打是其一惯的风格。上单承担着前期在团队里十分重要的地位。957给大家展示的是其稳实的个人实力！', null, '77', '讨论');
INSERT INTO `pub` VALUES ('18565498902#2', '18565498902', null, null, null, null, null, '77', '活动');
INSERT INTO `pub` VALUES ('18565498902#3', '18565498902', null, null, null, null, null, '77', '活动');
INSERT INTO `pub` VALUES ('18565498902#4', '18565498902', null, null, null, null, null, '11', '讨论');
INSERT INTO `pub` VALUES ('18565498903#1', '18565498903', '0', '觉醒挥舞的拳刃——EDG.Clearlove 打野 明凯', null, null, null, '22', '公告');
INSERT INTO `pub` VALUES ('18565498903#2', '18565498903', '0', '觉醒挥舞的拳刃——EDG.Clearlove 打野 明凯', '', '', null, '14', '活动');
INSERT INTO `pub` VALUES ('18565498903#3', '18565498903', '0', '觉醒挥舞的拳刃——EDG.Clearlove 打野 明凯', '', '', null, '16', '活动');
INSERT INTO `pub` VALUES ('18565498904#1', '18565498904', null, '第三方插件换肤功能问题 ', null, '插件白名单更新公告\r\nhttp://lol.qq.com/webplat/info/n ... 201604/450101.shtml\r\nCC皮肤预览器已从插件白名单中除名，还请广大玩家不要使用不在白名单内的第三方软件篡改游戏客户端、换肤等行为，以免导致帐号被封号。', null, '17', '讨论');
INSERT INTO `pub` VALUES ('18565498904#2', '18565498904', null, '4月2号艾欧尼亚大区停机维护公告 ', null, '艾欧尼亚大区停机维护公告\r\n由于“艾欧尼亚”大区出现网络异常波动，部分用户可能出现匹配时间过长、登录排队严重、掉线等异常问题，我们已经联系相关技术人员正在进行紧急排查、修复，建议您可以暂时选择其他大区进行游戏；具体恢复时间请关注官网公告。\r\n        您可以登录服务器状态查询页面http://lol.qq.com/act/a20150326dqpd/index.htm来查询各个服务器的当前状态,我们推荐您选择正常状态的服务器来进行游戏。\r\n        由于服务端网络问题给您带来的不便还请您谅解，感谢您一直以来对《英雄联盟》的大力支持！', null, '14', '活动');
INSERT INTO `pub` VALUES ('18565498904#3', '18565498904', null, null, null, null, null, '14', '互动');
INSERT INTO `pub` VALUES ('18565498904#4', '18565498904', null, null, null, null, null, '14', '讨论');
INSERT INTO `pub` VALUES ('18565498905#1', '18565498905', null, null, null, null, null, '17', '活动');
INSERT INTO `pub` VALUES ('18565498905#2', '18565498905', null, null, null, null, null, '14', '分享');
INSERT INTO `pub` VALUES ('18565498905#3', '18565498905', null, null, null, null, null, '41', '公告');
INSERT INTO `pub` VALUES ('18565498906#1', '18565498906', null, null, null, null, null, '14', '公告');
INSERT INTO `pub` VALUES ('18565498906#2', '18565498906', null, '', '', '', null, '11', '活动');
INSERT INTO `pub` VALUES ('18565498906#3', '18565498906', null, '', '', '', null, '11', '公告');
INSERT INTO `pub` VALUES ('18565498907#1', '18565498907', null, null, null, null, null, '14', '公告');
INSERT INTO `pub` VALUES ('18565498907#2', '18565498907', null, null, null, null, null, '7', '活动');
INSERT INTO `pub` VALUES ('18565498907#3', '18565498907', null, null, null, null, null, '14', '活动');
INSERT INTO `pub` VALUES ('18565498908#1', '18565498908', null, null, null, null, null, '14', '公告');
INSERT INTO `pub` VALUES ('18565498908#2', '18565498908', null, null, null, null, null, '77', '活动');
INSERT INTO `pub` VALUES ('18565498908#3', '18565498908', null, null, null, null, null, '71', '分享');
INSERT INTO `pub` VALUES ('18565498911#1', '18565498911', '0', '觉醒挥舞的拳刃——EDG.Clearlove 打野 明凯', '', '', null, '14', '公告');
INSERT INTO `pub` VALUES ('18565498911#2', '18565498911', '0', '觉醒挥舞的拳刃——EDG.Clearlove 打野 明凯', '', '', null, '15', '活动');
INSERT INTO `pub` VALUES ('18565498947#1', '18565498947', null, null, null, null, null, '14', '公告');
INSERT INTO `pub` VALUES ('18565498947#2', '18565498947', null, null, null, null, null, '0', '活动');
INSERT INTO `pub` VALUES ('18565498959#1', '18565498959', null, null, null, null, null, '16', '公告');
INSERT INTO `pub` VALUES ('18565498959#2', '18565498959', null, null, null, null, null, '14', '分享');
INSERT INTO `pub` VALUES ('18565498959#3', '18565498959', null, null, null, null, null, '15', '活动');
INSERT INTO `pub` VALUES ('18565498959#4', '18565498959', null, '', '', '', null, '14', '分享');
INSERT INTO `pub` VALUES ('5895@126.com#1', '5895@126.com', null, null, null, null, null, '14', '活动');
INSERT INTO `pub` VALUES ('5895@126.com#2', '5895@126.com', null, '', '', '', null, '18', '活动');
INSERT INTO `pub` VALUES ('5895@126.com#3', '5895@126.com', null, '', '', '', null, '12', '活动');
INSERT INTO `pub` VALUES ('sdhsjh@126.com#1', 'sdhsjh@126.com', null, null, null, null, null, '14', '活动');
INSERT INTO `pub` VALUES ('sdhsjh@126.com#2', 'sdhsjh@126.com', null, null, null, null, null, '17', '分享');
INSERT INTO `pub` VALUES ('sdhsjh@126.com#3', 'sdhsjh@126.com', null, null, null, null, null, '10', '活动');

-- ----------------------------
-- Table structure for skill
-- ----------------------------
DROP TABLE IF EXISTS `skill`;
CREATE TABLE `skill` (
  `skid` int(11) NOT NULL auto_increment,
  `hid` int(11) default NULL,
  `url` varchar(30) default NULL,
  `imgsrc` varchar(20) default NULL,
  `text` varchar(400) default NULL,
  PRIMARY KEY  (`skid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of skill
-- ----------------------------

-- ----------------------------
-- Table structure for skin
-- ----------------------------
DROP TABLE IF EXISTS `skin`;
CREATE TABLE `skin` (
  `sid` int(11) NOT NULL auto_increment,
  `typeid` int(11) default NULL,
  `typename` varchar(10) default NULL,
  `sname` varchar(10) default NULL,
  `oprice` float(6,2) default NULL,
  `price` float(6,2) default NULL,
  `photosrc` varchar(20) default NULL,
  `imgsrc` varchar(30) default NULL,
  `imglarge` varchar(30) default NULL,
  `birthday` bigint(20) default NULL,
  `count` int(11) default NULL,
  `due` varchar(10) default NULL,
  `issupport` tinyint(1) default NULL,
  `isreturn` tinyint(1) default NULL,
  `intro` varchar(200) default NULL,
  `isonsale` tinyint(1) default NULL,
  PRIMARY KEY  (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of skin
-- ----------------------------

-- ----------------------------
-- Table structure for slider
-- ----------------------------
DROP TABLE IF EXISTS `slider`;
CREATE TABLE `slider` (
  `imgid` int(11) NOT NULL auto_increment,
  `imgname` varchar(10) NOT NULL,
  `imgsrc` varchar(30) NOT NULL,
  `imgurl` varchar(30) NOT NULL,
  PRIMARY KEY  (`imgid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of slider
-- ----------------------------

-- ----------------------------
-- Table structure for title_detail
-- ----------------------------
DROP TABLE IF EXISTS `title_detail`;
CREATE TABLE `title_detail` (
  `tid` int(11) NOT NULL auto_increment,
  `tname` varchar(20) NOT NULL,
  `turl` varchar(20) NOT NULL,
  `thorizon` float NOT NULL,
  `tvertical` float NOT NULL,
  PRIMARY KEY  (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of title_detail
-- ----------------------------
INSERT INTO `title_detail` VALUES ('1', '初学者', 'img/2.jpg', '3', '4');

-- ----------------------------
-- Table structure for title_list
-- ----------------------------
DROP TABLE IF EXISTS `title_list`;
CREATE TABLE `title_list` (
  `uid` varchar(30) NOT NULL,
  `tid` int(11) NOT NULL,
  KEY `tid` (`tid`),
  CONSTRAINT `tid` FOREIGN KEY (`tid`) REFERENCES `title_detail` (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of title_list
-- ----------------------------
INSERT INTO `title_list` VALUES ('15757129530', '1');

-- ----------------------------
-- Table structure for tool
-- ----------------------------
DROP TABLE IF EXISTS `tool`;
CREATE TABLE `tool` (
  `tid` int(11) NOT NULL auto_increment,
  `tname` varchar(10) default NULL,
  `oprice` float(6,2) default NULL,
  `price` float(6,2) default NULL,
  `photosrc` varchar(20) default NULL,
  `imgsrc` varchar(30) default NULL,
  `imglarge` varchar(30) default NULL,
  `birthday` bigint(20) default NULL,
  `count` int(11) default NULL,
  `due` varchar(10) default NULL,
  `issupport` tinyint(1) default NULL,
  `isreturn` tinyint(1) default NULL,
  `intro` varchar(20) default NULL,
  `isonsale` tinyint(1) default NULL,
  PRIMARY KEY  (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tool
-- ----------------------------

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `uid` varchar(30) NOT NULL,
  `uname` varchar(20) default NULL,
  `upwd` varchar(15) default NULL,
  `uphone` varchar(20) default NULL,
  `email` varchar(30) default NULL,
  `uphoto` varchar(50) default NULL,
  `ulevel` int(11) default NULL,
  PRIMARY KEY  (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('123@qq.com', 'mindy', 'werewre', '18885664565', '123@qq.com', 'img/photo/2.jpg', '4');
INSERT INTO `userinfo` VALUES ('124@qq.com', 'ross', 'fdvdfvfd', '15756465454', '124@qq.com', 'img/photo/3.jpg', '3');
INSERT INTO `userinfo` VALUES ('125@qq.com', 'joey', 'fd5gd45', '16595656562', '125@qq.com', 'img/photo/4.jpg', '9');
INSERT INTO `userinfo` VALUES ('15757129530', 'vivian', '123ahsd', '15757129530', 'doubleawake@126.com', 'img/photo/5.jpg', '2');
INSERT INTO `userinfo` VALUES ('18565498901', 'monica', '123abc', '18565498901', '54237jhjh8@qq.com', 'img/photo/7.jpg', '5');
INSERT INTO `userinfo` VALUES ('18565498902', 'barray', '123abc', '18565498902', '54hjhjk078@qq.com', 'img/photo/10.jpg', '5');
INSERT INTO `userinfo` VALUES ('18565498903', '全服第一', '123abc', '18565498903', 'fdgfgd@126.com', 'img/photo/11.jpg', '5');
INSERT INTO `userinfo` VALUES ('18565498904', '全服第二', '123abc', '18565498904', '5423fgh078@qq.com', 'img/photo/12.jpg', '22');
INSERT INTO `userinfo` VALUES ('18565498905', '全服第三', '123abc', '18565498905', '542376078@qq.com', 'img/photo/13.jpg', '22');
INSERT INTO `userinfo` VALUES ('18565498906', '我最厉害1', '123abc', '18565498906', '542dfd6078@qq.com', 'img/photo/16.jpg', '22');
INSERT INTO `userinfo` VALUES ('18565498907', '我最厉害2', '123abc', '18565498907', '541236078@qq.com', 'img/photo/17.jpg', '17');
INSERT INTO `userinfo` VALUES ('18565498908', '我最厉害3', '123abc', '18565498908', '542dfed078@qq.com', 'img/photo/18.jpg', '17');
INSERT INTO `userinfo` VALUES ('18565498911', 'cici', '123abc', '18565498911', '5423760ggh@qq.com', 'img/photo/9.jpg', '15');
INSERT INTO `userinfo` VALUES ('18565498947', 'cindy', '123abc', '18565498947', '5423dfs078@qq.com', 'img/photo/8.jpg', '57');
INSERT INTO `userinfo` VALUES ('18565498954', 'monica', '123abc', '18565498954', '5423760fg@qq.com', 'img/photo/6.jpg', '5');
INSERT INTO `userinfo` VALUES ('18565498959', 'lulu', '123abc', '18565498959', '5423fgfg@qq.com', 'img/photo/7.jpg', '5');
INSERT INTO `userinfo` VALUES ('543@qq.com', 'jessy', '123abc', '18746559845', '543@qq.com', 'img/photo/14.jpg', '11');
INSERT INTO `userinfo` VALUES ('5895@126.com', 'lily', '123abc', '18746559587', '5895@126.com', 'img/photo/15.jpg', '14');
INSERT INTO `userinfo` VALUES ('sdhsjh@126.com', 'sandy', '123abc', null, null, null, '9');

-- ----------------------------
-- Table structure for vcenter
-- ----------------------------
DROP TABLE IF EXISTS `vcenter`;
CREATE TABLE `vcenter` (
  `vimgurl` varchar(20) NOT NULL,
  `vtypeid` int(11) NOT NULL,
  `vtype` varchar(10) NOT NULL,
  `vtitle` varchar(30) NOT NULL,
  `vurl` varchar(30) NOT NULL,
  `vtime` bigint(20) NOT NULL,
  `vlength` varchar(8) NOT NULL,
  PRIMARY KEY  (`vimgurl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vcenter
-- ----------------------------

-- ----------------------------
-- Table structure for zdatalist
-- ----------------------------
DROP TABLE IF EXISTS `zdatalist`;
CREATE TABLE `zdatalist` (
  `zid` varchar(20) NOT NULL,
  `zcontent` varchar(20) default NULL,
  `cdate` bigint(20) default NULL,
  `zurl` varchar(20) default NULL,
  PRIMARY KEY  (`zid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zdatalist
-- ----------------------------

-- ----------------------------
-- Table structure for zonghe
-- ----------------------------
DROP TABLE IF EXISTS `zonghe`;
CREATE TABLE `zonghe` (
  `zid` int(11) NOT NULL,
  `zname` varchar(5) default NULL,
  `ztag` varchar(5) default NULL,
  `ztitle` varchar(20) default NULL,
  PRIMARY KEY  (`zid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zonghe
-- ----------------------------
