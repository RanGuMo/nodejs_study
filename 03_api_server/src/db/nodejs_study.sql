/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : nodejs_study

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 24/10/2023 10:20:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ev_article_cate
-- ----------------------------
DROP TABLE IF EXISTS `ev_article_cate`;
CREATE TABLE `ev_article_cate`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类别名',
  `is_delete` int(11) NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ev_article_cate
-- ----------------------------
INSERT INTO `ev_article_cate` VALUES (1, '历史类', '历史', 0);
INSERT INTO `ev_article_cate` VALUES (2, '数学类', '数学', 0);

-- ----------------------------
-- Table structure for ev_articles
-- ----------------------------
DROP TABLE IF EXISTS `ev_articles`;
CREATE TABLE `ev_articles`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cover_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pub_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_delete` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cate_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ev_users
-- ----------------------------
DROP TABLE IF EXISTS `ev_users`;
CREATE TABLE `ev_users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_pic` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ev_users
-- ----------------------------
INSERT INTO `ev_users` VALUES (1, 'admin', '$2a$10$K8nuk3smR2C3Q/dZZu5EeuH4iLsWgUwPsHX0EN9OhlotAwHSUn4YO', NULL, NULL, NULL);
INSERT INTO `ev_users` VALUES (2, 'root', '$2a$10$dndNOhjj8I8i5abSwKFjJehrFf6ZYizGcIXQEMnAIE14MrUlj0ilC', NULL, NULL, NULL);
INSERT INTO `ev_users` VALUES (3, 'admin123', '$2a$10$rDLC9.tHRgglEBZteXRA1uERKs2aXzVml.fq2We.Y0pAM/Bujx9d2', 'admin123456', 'admin123@qq.com', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAEkklEQVRYR8WXa2wUVRTH/2d2WyCk\njxla4gcQCztbKG8wkZhoNLGJGokxKt8gQSDITEWFkPiKlBBfETEBdloQxUci4SFGUIEYJcQgIDEh\nSgU7fUCA8BDnloIU2937N1NaYkvLbrsY7rfJnHP+v3vOmXPvCG7zktusj74BVNIoHFr3mIDzQBkh\nQDGFQwCcBuQowBrRsi2osPdnurGMAQq8uqkG9FaB3AXwDCk/AzwLkUAIG8AECmwBhMRvAF5Vrr0j\nHUhGAGbCny6CzSAuUrBcJbEeC+1/ugfPW/tHUVQbT0NjgQjGE6hS52MLUSnJ3kDSAhRW+ZNFYz8E\nu1O5A2c3zx0epNsVVp4cZA1o+Qoi5SCWBa5d2T+AShrm0LpGAG2qqLUMM8a2phXvNFjLHCvp7yNk\nKrQxST03KizLDeumGSisqnvCILeB8kjgxnZlLN5hWLD6eEkk0vY7gS3KsWf1GcD0ar8GZZxyYiUQ\nYV8BQnszUVsNwWw1QBdhzuhL3WP0noH29PstQlQHbvz5/oiHPoXVDRMNnTqsBbOaFtifZQxgrfHH\nwsARTc5ucuMf9xcg9LM8/xyBDcqxX8oYwEz420U4BUmZFiy0T2UDYHr+tyDKVHFrvHsj91gCa5U/\nDFGcBDAvcOz12YiHvh3N2ABgRuDYW/4br0eAzrpBY1xQYddkC9BehoR/FpB3Azf2XlqAgqraJyOU\nrYDMD5zYuqwBNtfkmhdyLguNmYEb23RTgHDyGcRPBA5IEjOzrX+nmOX5u0BGAzf+UK8A+etPWtHW\nq0dJHlPFbeV9mnxp0mSurh8vEf2rBh5vcuztneZdesD0ajeCuEcN1BN7GhrZlsJM1H4OYIxy45Nv\nACjwakdGIPUUOGqBXZWtWE/+nVlIak5rrogfDG2uZ8Cq8peSWJqM6KGX5pde+D8AOr6GM4B8ELix\n17sAmJ7/pZClgRsvszx/UQq5Gy46I9StAhmcaLzjb7fkrJnwd0KYVE58eneAPSANGvKJQXxI4C3l\n2K/cCgDTa7gPSO0Ryv0UviZgTuDEy7uWwPPfBziHxCAINIBmdXXQnVg0vCVbCNPz9wjwAIAD4Uim\ncJ1y4ku6AOR5DaU5TP4AwXda4yPDkL0k3lau/XI2AFai7mEIdwL8ApRHCVwWyNTAjYWjvvdbseX5\nywCEjbI4cOyV/YEwvYYJgtR+Ag2qKDYp7/zpwksVw/5KO4rzq+vtSErvE0ExyUb1px2/2cWyN7iC\n6vq7I6nUpxAZQyChzsde6B6nx8PI9Pw3BXiRMJ5Szqhv+rP76z6r/AFmFIsFeAOUJYEbW5E2A4UJ\nf4UI5mpwykUnHh6jN64NjQOtK23vUMQCUUNGNjZVjDzR3TA82nUOHhRitVCWZ3Qa5q05NSRqtBwE\nOByU3WLgF2g5pg2eExqDAX2vAHNJ5Mq1n5PRoTCJExAcb4dof4exEORfe8ReFYmVY760pc1AaHAN\n4sozoLgiGNHhdBXAYZLfp4gdzRfsQ6gUba3y8xFFmYaUghxvCMZ1wJ0AjCNJw/ix+dmSQz1dbNP+\nmGRV/wycbzvAv83Y6zAnaiqpAAAAAElFTkSuQmCC');

SET FOREIGN_KEY_CHECKS = 1;
