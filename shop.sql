/*
 Navicat Premium Data Transfer

 Source Server         : 123
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : shop

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 14/05/2019 15:14:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for activity
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity`  (
  `activityId` int(12) NOT NULL AUTO_INCREMENT,
  `activityName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `activityDes` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `discount` float NULL DEFAULT 1,
  `fullPrice` int(12) NULL DEFAULT NULL,
  `reducePrice` int(12) NULL DEFAULT NULL,
  `fullNum` int(12) NULL DEFAULT NULL,
  `reduceNum` int(12) NULL DEFAULT NULL,
  PRIMARY KEY (`activityId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of activity
-- ----------------------------
INSERT INTO `activity` VALUES (1, 'default', 'default activity', 1, NULL, NULL, NULL, NULL);
INSERT INTO `activity` VALUES (6, '满减', '', 0.9, 800, 80, NULL, NULL);
INSERT INTO `activity` VALUES (7, '100-10', '', 1, 100, 10, NULL, NULL);

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `addressID` int(12) NOT NULL AUTO_INCREMENT COMMENT '地址id',
  `userId` int(12) NOT NULL COMMENT '用户id',
  `province` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '省',
  `city` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '市',
  `county` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区',
  `detailAddr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '具体地址',
  `conName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人',
  `conTel` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人手机号',
  PRIMARY KEY (`addressID`) USING BTREE,
  INDEX `addressID`(`addressID`) USING BTREE,
  INDEX `userId`(`userId`) USING BTREE,
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address
-- ----------------------------


-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `adminId` int(12) NOT NULL AUTO_INCREMENT,
  `adminName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`adminId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', 'admin');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `cateId` int(12) NOT NULL AUTO_INCREMENT COMMENT '服装类别id，主键',
  `cateName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类别名称',
  PRIMARY KEY (`cateId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '女装');
INSERT INTO `category` VALUES (2, '男装');
INSERT INTO `category` VALUES (3, '童装');
INSERT INTO `category` VALUES (4, '婴儿装');

-- ----------------------------
-- Table structure for chat
-- ----------------------------
DROP TABLE IF EXISTS `chat`;
CREATE TABLE `chat`  (
  `chatId` int(20) NOT NULL AUTO_INCREMENT,
  `sendUser` int(12) NOT NULL,
  `receiveUser` int(12) NOT NULL,
  `MsgContent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `MsgTime` datetime(0) NOT NULL,
  PRIMARY KEY (`chatId`) USING BTREE,
  INDEX `sendUser`(`sendUser`) USING BTREE,
  INDEX `receiveUser`(`receiveUser`) USING BTREE,
  CONSTRAINT `chat_ibfk_1` FOREIGN KEY (`sendUser`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chat_ibfk_2` FOREIGN KEY (`receiveUser`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection`  (
  `userId` int(12) NOT NULL,
  `goodsId` int(12) NOT NULL,
  `collectTime` datetime(0) NOT NULL,
  PRIMARY KEY (`userId`, `goodsId`) USING BTREE,
  INDEX `collection_ibfk_2`(`goodsId`) USING BTREE,
  CONSTRAINT `collection_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `collection_ibfk_2` FOREIGN KEY (`goodsId`) REFERENCES `goods` (`goodsId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of collection
-- ----------------------------
INSERT INTO `collection` VALUES (11, 71, '2019-04-28 23:21:12');
INSERT INTO `collection` VALUES (11, 72, '2019-05-04 16:05:45');
INSERT INTO `collection` VALUES (11, 73, '2019-04-28 23:21:13');
INSERT INTO `collection` VALUES (11, 81, '2019-05-04 16:05:46');
INSERT INTO `collection` VALUES (11, 82, '2019-05-04 16:05:47');
INSERT INTO `collection` VALUES (11, 83, '2019-05-04 16:05:48');
INSERT INTO `collection` VALUES (12, 73, '2019-04-29 13:47:29');
INSERT INTO `collection` VALUES (13, 71, '2019-05-08 20:31:56');
INSERT INTO `collection` VALUES (13, 72, '2019-04-29 15:23:22');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `commentId` int(12) NOT NULL AUTO_INCREMENT,
  `userId` int(12) NOT NULL,
  `goodsId` int(12) NOT NULL,
  `point` int(8) NOT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `commentTime` datetime(0) NOT NULL,
  PRIMARY KEY (`commentId`) USING BTREE,
  INDEX `userId`(`userId`) USING BTREE,
  INDEX `goodsId`(`goodsId`) USING BTREE,
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`goodsId`) REFERENCES `goods` (`goodsId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, 11, 71, 5, '好', '2019-04-30 13:53:31');

-- ----------------------------
-- Table structure for deliver
-- ----------------------------
DROP TABLE IF EXISTS `deliver`;
CREATE TABLE `deliver`  (
  `deliverId` int(12) NOT NULL AUTO_INCREMENT,
  `orderId` int(12) NOT NULL,
  `sendId` int(12) NOT NULL,
  PRIMARY KEY (`deliverId`) USING BTREE,
  INDEX `orderId`(`orderId`) USING BTREE,
  CONSTRAINT `deliver_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `indent` (`orderId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `goodsId` int(12) NOT NULL AUTO_INCREMENT COMMENT '服装id，主键',
  `goodsName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '服装名称',
  `price` int(12) NOT NULL COMMENT '服装价格',
  `num` int(12) NOT NULL COMMENT '服装数量',
  `upTime` datetime(0) NOT NULL COMMENT '上架时间',
  `category` int(12) NOT NULL COMMENT '服装类别',
  `detailCate` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详细类别',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '服装描述',
  `activityId` int(12) NOT NULL DEFAULT 1 COMMENT '活动id',
  PRIMARY KEY (`goodsId`) USING BTREE,
  INDEX `activityId`(`activityId`) USING BTREE,
  INDEX `category`(`category`) USING BTREE,
  CONSTRAINT `goods_ibfk_1` FOREIGN KEY (`activityId`) REFERENCES `activity` (`activityId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `goods_ibfk_2` FOREIGN KEY (`category`) REFERENCES `category` (`cateId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 84 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (71, '麻混纺长衬衫(短袖)', 129, 99, '2019-04-28 23:09:45', 1, '衬衫', '质地优美，穿着感舒爽，适合打造休闲造型。\r\n·采用亚麻与粘纤混纺而成的面料制成。\r\n·不易起皱，有助于呈现柔美外观。\r\n·洋溢着休闲气息。\r\n·下摆稍长，采用侧边开衩的设计。\r\n·纽扣的设计考究，自然轻薄。\r\n·适合与T恤、吊带衫、牛仔裤、短裤等单品搭配穿着。\r\n\r\n\r\n【面料组成】[00 白色、09 黑色、31 米色、56 橄榄色]亚麻55％,粘纤45％。\r\n【洗涤信息】机洗·使用洗衣网袋', 6);
INSERT INTO `goods` VALUES (72, '运动连帽开衫(长袖)', 149, 99, '2019-04-28 23:12:45', 1, '外套', '质地厚实、不会过于展现身形的剪裁，呈现出一款时尚有型的开衫！\n·表面的面料具有柔滑、优美的质感。\n·质地厚实，较不易展现身形，适合多个年龄层穿搭。\n·直筒的款式，当下流行。\n·结实的质感与具有立体感的兜帽，凸显细节考究。\n\n\n【面料组成】大身：棉76％,聚酯纤维24％。罗纹部分：棉82％,聚酯纤维18％。帽里部分：棉100％。\n【洗涤信息】机洗', 1);
INSERT INTO `goods` VALUES (73, '麻棉拉链连帽外套', 229, 99, '2019-04-28 23:15:45', 2, '外套', '采用质地柔软、肌肤触感舒爽的麻棉混纺面料制成。\r\n·采用质感自然的麻棉混纺面料制成。\r\n·这款单品的面料结合了亚麻的舒爽与棉的柔软感，具有轻爽的肌肤触感。\r\n·款型具有适度宽松感。\r\n·无内衬的设计，具有轻盈穿着感。\r\n·打结的兜帽抽绳可作为造型亮点。\r\n·适合与短裤搭配穿着，打造清新造型。\r\n\r\n\r\n【面料组成】[56 橄榄色、68 深蓝色]亚麻52％,棉48％。[32深米色、35浅褐色]亚麻50％,棉50％。\r\n【洗涤信息】手洗', 6);
INSERT INTO `goods` VALUES (81, '休闲圆领针织衫(短袖)', 249, 99, '2019-05-04 10:47:36', 1, '针织衫', '采用无针脚的立体编织工艺，呈现出优美的款型。珠地网眼编织有助于带来轻爽的肌肤触感。\n·质地轻薄的棉质面料，具有舒爽穿着感。\n·采用表面具有适度凹凸感、肌肤触感轻盈的珠地网眼面料制成。\n·弧线形设计的茧型剪裁，富有女性魅力。\n·采用被称为全成型技术的立体编织工艺制成。\n·新颖的圆领款型，有助于展现优美的颈部线条。\n\n\n【面料组成】棉100％。\n【洗涤信息】手洗', 1);
INSERT INTO `goods` VALUES (82, '3D全棉针织衫(五分袖)', 249, 99, '2019-05-04 10:50:28', 1, '针织衫', '采用无针脚的立体编织工艺，呈现出优美的款型！质地轻薄的棉质面料，具有舒爽穿着感。\r\n·采用质地优美、穿着感轻盈的棉质针织面料制成。\r\n·采用被称为全成型技术的立体编织工艺制成。\r\n·双针筒编织工艺呈现出的优美纹样是其魅力所在。\r\n·兼具舒适穿着感与斯文优雅气息。\r\n·设计考究的V领款式，有助于展现优美的颈部线条。\r\n·时尚的茧型剪裁，有助于增添女性魅力。\r\n\r\n\r\n【面料组成】[01 乳白色、07 青灰色、09 黑色、12 桃红色、31 米色、67 海蓝色、71 浅蓝紫色]棉100％。\r\n【洗涤信息】手洗', 1);
INSERT INTO `goods` VALUES (83, '罗纹U领T恤(五分袖)', 79, 99, '2019-05-04 10:52:22', 1, 'T恤', '设计利落的罗纹编织工艺，自然贴身。U领的款式，有助于展现柔美的颈部线条。\r\n·稍宽的罗纹设计，具有伸展性，舒适贴身。\r\n·款型利落有型。\r\n·罗纹面料具有贴身感，有助于舒适包裹胸部，即使是U领的设计亦具有令人安心的穿着感受。\r\n\r\n\r\n【面料组成】大身：棉95％,氨纶5％。\r\n【洗涤信息】机洗', 1);

-- ----------------------------
-- Table structure for imagepath
-- ----------------------------
DROP TABLE IF EXISTS `imagepath`;
CREATE TABLE `imagepath`  (
  `pathId` int(12) NOT NULL AUTO_INCREMENT COMMENT '图片id，主键',
  `goodId` int(12) NOT NULL COMMENT '服装id',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片名称',
  PRIMARY KEY (`pathId`) USING BTREE,
  INDEX `goodid`(`goodId`) USING BTREE,
  CONSTRAINT `imagepath_ibfk_1` FOREIGN KEY (`goodId`) REFERENCES `goods` (`goodsId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of imagepath
-- ----------------------------
INSERT INTO `imagepath` VALUES (93, 71, '0e0979b700314e16936bc157e32d5e4c3.jpg');
INSERT INTO `imagepath` VALUES (94, 72, 'fed166d443494177aa7748f5848b5f772.jpg');
INSERT INTO `imagepath` VALUES (95, 73, 'bb2797e2236b40e9bc62c9fc9597c72d4.jpg');
INSERT INTO `imagepath` VALUES (100, 81, 'fe4c0cb64e80432c82f6baae11ce3545.jpg');
INSERT INTO `imagepath` VALUES (101, 82, 'cc7b14746fa0471e8f4387b7c05ab4ab.jpg');
INSERT INTO `imagepath` VALUES (102, 83, 'ffa5deb212bc4279ae1a41020dabe3df.jpg');

-- ----------------------------
-- Table structure for indent
-- ----------------------------
DROP TABLE IF EXISTS `indent`;
CREATE TABLE `indent`  (
  `orderId` int(12) NOT NULL AUTO_INCREMENT COMMENT '订单id，主键',
  `userId` int(12) NOT NULL COMMENT '用户id',
  `orderTime` datetime(0) NOT NULL COMMENT '下单时间',
  `oldPrice` float NOT NULL COMMENT '原价格',
  `newPrice` float NOT NULL COMMENT '活动价格',
  `isPay` tinyint(1) NOT NULL COMMENT '是否试穿',
  `isSend` tinyint(1) NOT NULL COMMENT '是否发货',
  `isReceive` tinyint(1) NOT NULL COMMENT '是否收货',
  `isComplete` tinyint(1) NOT NULL COMMENT '订单是否完成',
  `addressId` int(12) NOT NULL COMMENT '地址id',
  PRIMARY KEY (`orderId`) USING BTREE,
  INDEX `userId`(`userId`) USING BTREE,
  INDEX `orderGoods`(`orderTime`) USING BTREE,
  INDEX `addressId`(`addressId`) USING BTREE,
  CONSTRAINT `indent_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `indent_ibfk_2` FOREIGN KEY (`addressId`) REFERENCES `address` (`addressID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of indent
-- ----------------------------
INSERT INTO `indent` VALUES (18, 11, '2019-04-28 23:24:49', 129, 116.1, 1, 1, 1, 1, 6);
INSERT INTO `indent` VALUES (19, 11, '2019-04-28 23:25:12', 149, 149, 1, 1, 1, 1, 6);
INSERT INTO `indent` VALUES (20, 11, '2019-04-29 00:06:24', 358, 322.2, 1, 1, 1, 1, 6);
INSERT INTO `indent` VALUES (21, 12, '2019-04-29 00:44:39', 129, 116.1, 1, 1, 1, 1, 7);
INSERT INTO `indent` VALUES (22, 12, '2019-04-29 14:10:01', 149, 149, 1, 1, 0, 0, 7);
INSERT INTO `indent` VALUES (23, 13, '2019-04-29 15:24:26', 149, 149, 1, 1, 0, 0, 8);
INSERT INTO `indent` VALUES (24, 11, '2019-05-04 23:50:35', 129, 116.1, 1, 1, 1, 1, 6);
INSERT INTO `indent` VALUES (25, 11, '2019-05-04 23:50:48', 129, 116.1, 1, 1, 1, 1, 6);
INSERT INTO `indent` VALUES (26, 15, '2019-05-04 23:54:55', 1290, 1161, 1, 1, 0, 0, 9);
INSERT INTO `indent` VALUES (27, 11, '2019-05-05 14:52:45', 1161, 1044.9, 1, 1, 1, 1, 6);
INSERT INTO `indent` VALUES (28, 11, '2019-05-05 14:54:07', 1290, 1161, 1, 1, 1, 1, 6);
INSERT INTO `indent` VALUES (29, 11, '2019-05-05 14:55:03', 1490, 1490, 1, 1, 1, 1, 6);
INSERT INTO `indent` VALUES (30, 11, '2019-05-05 15:26:37', 129, 116.1, 1, 1, 1, 1, 6);
INSERT INTO `indent` VALUES (31, 11, '2019-05-05 15:26:45', 129, 116.1, 1, 1, 1, 1, 6);
INSERT INTO `indent` VALUES (34, 11, '2019-05-06 11:17:56', 278, 265.1, 1, 1, 1, 1, 6);
INSERT INTO `indent` VALUES (35, 11, '2019-05-06 13:04:45', 129, 116.1, 1, 1, 1, 1, 6);
INSERT INTO `indent` VALUES (36, 11, '2019-05-08 13:28:52', 358, 322.2, 1, 1, 1, 1, 6);
INSERT INTO `indent` VALUES (37, 11, '2019-05-08 13:30:07', 129, 116.1, 1, 1, 1, 1, 6);
INSERT INTO `indent` VALUES (38, 11, '2019-05-08 13:34:39', 149, 149, 1, 1, 1, 1, 6);
INSERT INTO `indent` VALUES (39, 11, '2019-05-08 13:34:46', 149, 149, 1, 1, 1, 1, 6);
INSERT INTO `indent` VALUES (40, 11, '2019-05-08 13:47:29', 149, 149, 1, 1, 1, 1, 6);
INSERT INTO `indent` VALUES (41, 11, '2019-05-08 13:54:15', 149, 149, 1, 1, 1, 1, 6);
INSERT INTO `indent` VALUES (42, 11, '2019-05-08 14:03:50', 149, 149, 1, 1, 1, 1, 6);
INSERT INTO `indent` VALUES (43, 11, '2019-05-08 14:03:56', 129, 116.1, 1, 1, 1, 1, 6);
INSERT INTO `indent` VALUES (44, 11, '2019-05-08 14:04:02', 129, 116.1, 1, 1, 1, 1, 6);
INSERT INTO `indent` VALUES (45, 11, '2019-05-08 14:04:08', 129, 116.1, 1, 1, 1, 1, 6);
INSERT INTO `indent` VALUES (46, 11, '2019-05-08 14:04:14', 129, 116.1, 1, 1, 1, 1, 6);
INSERT INTO `indent` VALUES (47, 11, '2019-05-08 14:04:20', 129, 116.1, 1, 1, 1, 1, 6);
INSERT INTO `indent` VALUES (48, 11, '2019-05-08 14:27:36', 149, 149, 1, 1, 1, 1, 6);
INSERT INTO `indent` VALUES (49, 11, '2019-05-08 14:35:36', 129, 116.1, 1, 1, 1, 1, 6);
INSERT INTO `indent` VALUES (50, 11, '2019-05-08 14:36:00', 129, 116.1, 1, 1, 1, 1, 6);
INSERT INTO `indent` VALUES (51, 11, '2019-05-08 16:05:44', 129, 116.1, 1, 1, 1, 1, 6);
INSERT INTO `indent` VALUES (52, 11, '2019-05-08 17:26:56', 129, 116.1, 0, 1, 1, 1, 6);
INSERT INTO `indent` VALUES (53, 11, '2019-05-08 18:53:04', 129, 116.1, 1, 1, 1, 1, 6);
INSERT INTO `indent` VALUES (54, 13, '2019-05-08 20:32:18', 149, 149, 1, 1, 0, 0, 8);
INSERT INTO `indent` VALUES (55, 13, '2019-05-08 20:33:10', 903, 812.7, 1, 1, 0, 0, 8);
INSERT INTO `indent` VALUES (56, 13, '2019-05-08 20:33:39', 149, 149, 0, 1, 0, 0, 8);

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem`  (
  `itemId` int(12) NOT NULL AUTO_INCREMENT COMMENT '项id',
  `orderId` int(12) NOT NULL COMMENT '订单id',
  `goodsId` int(12) NOT NULL COMMENT '服装id',
  `num` int(12) NOT NULL COMMENT '数量',
  PRIMARY KEY (`itemId`) USING BTREE,
  INDEX `orderId`(`orderId`) USING BTREE,
  INDEX `goodsId`(`goodsId`) USING BTREE,
  CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `indent` (`orderId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`goodsId`) REFERENCES `goods` (`goodsId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES (18, 18, 71, 1);
INSERT INTO `orderitem` VALUES (19, 19, 72, 1);
INSERT INTO `orderitem` VALUES (20, 20, 71, 1);
INSERT INTO `orderitem` VALUES (21, 20, 73, 1);
INSERT INTO `orderitem` VALUES (22, 21, 71, 1);
INSERT INTO `orderitem` VALUES (23, 22, 72, 1);
INSERT INTO `orderitem` VALUES (24, 23, 72, 1);
INSERT INTO `orderitem` VALUES (25, 24, 71, 1);
INSERT INTO `orderitem` VALUES (26, 25, 71, 1);
INSERT INTO `orderitem` VALUES (27, 26, 71, 10);
INSERT INTO `orderitem` VALUES (28, 27, 71, 9);
INSERT INTO `orderitem` VALUES (29, 28, 71, 10);
INSERT INTO `orderitem` VALUES (30, 29, 72, 10);
INSERT INTO `orderitem` VALUES (31, 30, 71, 1);
INSERT INTO `orderitem` VALUES (32, 31, 71, 1);
INSERT INTO `orderitem` VALUES (35, 34, 71, 1);
INSERT INTO `orderitem` VALUES (36, 34, 72, 1);
INSERT INTO `orderitem` VALUES (37, 35, 71, 1);
INSERT INTO `orderitem` VALUES (38, 36, 71, 1);
INSERT INTO `orderitem` VALUES (39, 36, 73, 1);
INSERT INTO `orderitem` VALUES (40, 37, 71, 1);
INSERT INTO `orderitem` VALUES (41, 38, 72, 1);
INSERT INTO `orderitem` VALUES (42, 39, 72, 1);
INSERT INTO `orderitem` VALUES (43, 40, 72, 1);
INSERT INTO `orderitem` VALUES (44, 41, 72, 1);
INSERT INTO `orderitem` VALUES (45, 42, 72, 1);
INSERT INTO `orderitem` VALUES (46, 43, 71, 1);
INSERT INTO `orderitem` VALUES (47, 44, 71, 1);
INSERT INTO `orderitem` VALUES (48, 45, 71, 1);
INSERT INTO `orderitem` VALUES (49, 46, 71, 1);
INSERT INTO `orderitem` VALUES (50, 47, 71, 1);
INSERT INTO `orderitem` VALUES (51, 48, 72, 1);
INSERT INTO `orderitem` VALUES (52, 49, 71, 1);
INSERT INTO `orderitem` VALUES (53, 50, 71, 1);
INSERT INTO `orderitem` VALUES (54, 51, 71, 1);
INSERT INTO `orderitem` VALUES (55, 52, 71, 1);
INSERT INTO `orderitem` VALUES (56, 53, 71, 1);
INSERT INTO `orderitem` VALUES (57, 54, 72, 1);
INSERT INTO `orderitem` VALUES (58, 55, 71, 7);
INSERT INTO `orderitem` VALUES (59, 56, 72, 1);

-- ----------------------------
-- Table structure for shopcart
-- ----------------------------
DROP TABLE IF EXISTS `shopcart`;
CREATE TABLE `shopcart`  (
  `userId` int(12) NOT NULL,
  `goodsid` int(12) NOT NULL,
  `cateDate` datetime(0) NOT NULL,
  `goodsNum` int(12) NOT NULL,
  PRIMARY KEY (`userId`, `goodsid`) USING BTREE,
  INDEX `userId`(`userId`) USING BTREE,
  INDEX `goodsid`(`goodsid`) USING BTREE,
  CONSTRAINT `shopcart_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `shopcart_ibfk_2` FOREIGN KEY (`goodsid`) REFERENCES `goods` (`goodsId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shopcart
-- ----------------------------
INSERT INTO `shopcart` VALUES (11, 71, '2019-05-10 13:57:00', 1);
INSERT INTO `shopcart` VALUES (11, 72, '2019-05-09 21:18:00', 1);
INSERT INTO `shopcart` VALUES (12, 72, '2019-04-29 15:25:14', 1);
INSERT INTO `shopcart` VALUES (14, 71, '2019-05-04 23:52:41', 1);
INSERT INTO `shopcart` VALUES (15, 71, '2019-05-04 23:55:09', 1);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `userId` int(12) NOT NULL AUTO_INCREMENT COMMENT '用户id，作为主键',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码',
  `regTime` datetime(0) NOT NULL COMMENT '注册时间',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱',
  `telephone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号',
  `level` tinyint(12) NOT NULL COMMENT '等级',
  PRIMARY KEY (`userId`) USING BTREE,
  INDEX `userId`(`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------


SET FOREIGN_KEY_CHECKS = 1;
