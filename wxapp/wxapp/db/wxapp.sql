/*
 Navicat Premium Data Transfer

 Source Server         : wechat
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : wxapp

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 12/03/2019 16:29:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for access
-- ----------------------------
DROP TABLE IF EXISTS `access`;
CREATE TABLE `access`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `token` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'access_token',
  `expires` int(11) NOT NULL COMMENT '过期时间，单位(s)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of access
-- ----------------------------
INSERT INTO `access` VALUES (5, '19_0kX1ImER0wulWwDuE1BmFX7k3PcNXsy2NAJNEA4sm10T9BjGqoD_VlMsgz5qpbJCgbCiuXZJtbGL-mgJ5h7ENktfnWQUpzMpt0QlEqLTfiIFpmWmo3E6cnroAB8JLDjACADFX', 7200);

-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books`  (
  `bkid` int(16) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '书籍id',
  `bkclass` int(11) NULL DEFAULT NULL COMMENT '书籍类别',
  `bkname` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '书籍名称',
  `bkauthor` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '书籍作者',
  `bkpublisher` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '书籍出版社',
  `bkfile` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '书籍文件地址',
  `bkcover` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '书籍封面',
  `bkprice` int(11) NULL DEFAULT 1 COMMENT '书籍积分',
  PRIMARY KEY (`bkid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1000000005 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES (1000000001, 3, '深入浅出Node.js', '朴灵', '人民邮电出版社', '******** book file ********', 'https://img3.doubanio.com/lpic/s27269296.jpg', 1);
INSERT INTO `books` VALUES (1000000002, 3, '红宝书', 'Nicholas C.Zakas', '人民邮电出版社', '******** book file ********', 'https://img3.doubanio.com/lpic/s8958650.jpg', 1);
INSERT INTO `books` VALUES (1000000003, 1, '解忧杂货店', '东野奎吾', '南海出版公司', '******** book file ********', 'https://img3.doubanio.com/lpic/s27264181.jpg', 1);
INSERT INTO `books` VALUES (1000000004, 2, '红楼梦', '曹雪芹', '人民文学出版社', '******** book file ********', 'https://img1.doubanio.com/lpic/s1070959.jpg', 1);
INSERT INTO `books` VALUES (1000000005, 1, '安徒生童话故事集', '汉斯·克里斯蒂安·安徒生 ', '人民文学出版社', '******** book file ********', 'https://img3.doubanio.com/lpic/s1034062.jpg', 1);

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `cmid` int(16) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `uid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户openid',
  `uname` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名称',
  `ccontent` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '评论内容',
  `bkname` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '书籍名称',
  `bkid` int(16) NOT NULL COMMENT '书籍ID',
  `uavatar` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户头像',
  `ctime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评论时间',
  PRIMARY KEY (`cmid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, 'oh1bX5XmjuoURSVGJTpvBR3EyWKc', 'Khirbet', 'adasd', '解忧杂货店', 1000000003, 'https://wx.qlogo.cn/mmopen/vi_32/8Rxr6hibshL63eXzCmCPhHGVNt5tLvrEILH8Wj5icjW5Euc9DgEpJyWtLFmXicYMmqya7XhJe37fCK4uUK8936uQQ/132', '2019-03-07 17:18:41');
INSERT INTO `comment` VALUES (2, 'oh1bX5XmjuoURSVGJTpvBR3EyWKc', 'Khirbet', 'ada', '解忧杂货店', 1000000003, 'https://wx.qlogo.cn/mmopen/vi_32/8Rxr6hibshL63eXzCmCPhHGVNt5tLvrEILH8Wj5icjW5Euc9DgEpJyWtLFmXicYMmqya7XhJe37fCK4uUK8936uQQ/132', '2019-03-07 17:18:48');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `oid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `uid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户openid',
  `oprice` int(11) NULL DEFAULT 0 COMMENT '书籍价格',
  `otime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '订单创建时间',
  `bkid` int(16) NOT NULL COMMENT '书籍ID',
  PRIMARY KEY (`oid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, 'oh1bX5XmjuoURSVGJTpvBR3EyWKc', 1, '2019-03-07 17:18:36', 1000000003);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(64) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户openid',
  `uname` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '用户微信名',
  `ugender` int(1) NULL DEFAULT NULL COMMENT '用户性别',
  `uaddress` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户地址',
  `ubalance` int(11) NULL DEFAULT NULL COMMENT '用户积分余额',
  `uavatar` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户头像',
  `skey` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户登录态标识',
  `sessionkey` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '微信登录态标识',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '账号注册时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '用户最近登录时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'oh1bX5XmjuoURSVGJTpvBR3EyWKc', 'Khirbet', 0, ',', 29, 'https://wx.qlogo.cn/mmopen/vi_32/8Rxr6hibshL63eXzCmCPhHGVNt5tLvrEILH8Wj5icjW5Euc9DgEpJyWtLFmXicYMmqya7XhJe37fCK4uUK8936uQQ/132', '18bb29e942aa11319db3ed2d40a3f00a3704310d', 'KJU5Q9KcWpQmCBBEAuqKTg==', '2019-03-07 17:18:22', '2019-03-08 16:35:07');

SET FOREIGN_KEY_CHECKS = 1;
