/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50527
 Source Host           : localhost:3306
 Source Schema         : pet

 Target Server Type    : MySQL
 Target Server Version : 50527
 File Encoding         : 65001

 Date: 12/04/2020 15:40:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for exper
-- ----------------------------
DROP TABLE IF EXISTS `exper`;
CREATE TABLE `exper`  (
  `exper_id` int(11) NOT NULL AUTO_INCREMENT,
  `exper_title` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `exper_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `user_id` int(50) NULL DEFAULT NULL,
  `exper_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`exper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of exper
-- ----------------------------
INSERT INTO `exper` VALUES (1, '养宠物的一些小常识1', '&lt;ol&gt;\n	&lt;li&gt;\n		&lt;div class=\"list-icon\"&gt;\n			定时给你的狗狗喂食。\n		&lt;/div&gt;\n	&lt;/li&gt;\n	&lt;li class=\"exp-content-list list-item-2\"&gt;\n		&lt;div class=\"content-list-text\"&gt;\n			&lt;p&gt;\n				定时带你的狗狗出去遛弯，确保它不在家里拉屎拉尿。\n			&lt;/p&gt;\n		&lt;/div&gt;\n	&lt;/li&gt;\n	&lt;li class=\"exp-content-list list-item-2\"&gt;\n		&lt;div class=\"content-list-text\"&gt;\n			&lt;p&gt;\n				注意你的狗狗的一些潜台词，比如说：突然呜呜 ，发出那种不正常的叫声的时候 ，可能是你的狗狗憋着啦 。。。\n			&lt;/p&gt;\n		&lt;/div&gt;\n	&lt;/li&gt;\n	&lt;li class=\"exp-content-list list-item-4\"&gt;\n		&lt;div class=\"list-icon\"&gt;\n			如果前几次在家没有养成良好的习惯，那么一定要注意，实时调整遛弯时间，确保在外出时间解决生理问题。\n		&lt;/div&gt;\n	&lt;/li&gt;\n	&lt;li class=\"exp-content-list list-item-5\"&gt;\n		&lt;div class=\"list-icon\"&gt;\n			如果你想让你的狗狗又乖听话的&nbsp;陪你做一些简单的游戏了。那么长时间有奖励措施的重复指导它做同一件事。那么就会在狗狗的潜意识里面，形成配合你的模式。这里要注意啦，不是每一条狗狗都会那么配合你的，在狗狗界也有一些奇葩。怎是那么神奇。比喻说&nbsp;哈士奇，这种狗狗的行为怎是那么怪异，喜欢模仿人类的动作。效果时常是相反的 。。。\n		&lt;/div&gt;\n	&lt;/li&gt;\n&lt;/ol&gt;', 2, '2020-04-08 22:15:35');
INSERT INTO `exper` VALUES (2, '养宠物的一些小常识2', '&lt;ol&gt;\n	&lt;li&gt;\n		&lt;div class=\"list-icon\"&gt;\n			定时给你的狗狗喂食。\n		&lt;/div&gt;\n	&lt;/li&gt;\n	&lt;li class=\"exp-content-list list-item-2\"&gt;\n		&lt;div class=\"content-list-text\"&gt;\n			&lt;p&gt;\n				定时带你的狗狗出去遛弯，确保它不在家里拉屎拉尿。\n			&lt;/p&gt;\n		&lt;/div&gt;\n	&lt;/li&gt;\n	&lt;li class=\"exp-content-list list-item-2\"&gt;\n		&lt;div class=\"content-list-text\"&gt;\n			&lt;p&gt;\n				注意你的狗狗的一些潜台词，比如说：突然呜呜 ，发出那种不正常的叫声的时候 ，可能是你的狗狗憋着啦 。。。\n			&lt;/p&gt;\n		&lt;/div&gt;\n	&lt;/li&gt;\n	&lt;li class=\"exp-content-list list-item-4\"&gt;\n		&lt;div class=\"list-icon\"&gt;\n			如果前几次在家没有养成良好的习惯，那么一定要注意，实时调整遛弯时间，确保在外出时间解决生理问题。\n		&lt;/div&gt;\n	&lt;/li&gt;\n	&lt;li class=\"exp-content-list list-item-5\"&gt;\n		&lt;div class=\"list-icon\"&gt;\n			如果你想让你的狗狗又乖听话的&nbsp;陪你做一些简单的游戏了。那么长时间有奖励措施的重复指导它做同一件事。那么就会在狗狗的潜意识里面，形成配合你的模式。这里要注意啦，不是每一条狗狗都会那么配合你的，在狗狗界也有一些奇葩。怎是那么神奇。比喻说&nbsp;哈士奇，这种狗狗的行为怎是那么怪异，喜欢模仿人类的动作。效果时常是相反的 。。。\n		&lt;/div&gt;\n	&lt;/li&gt;\n&lt;/ol&gt;', 2, '2020-04-08 22:15:35');
INSERT INTO `exper` VALUES (3, '养宠物的一些小常识3', '&lt;ol&gt;\n	&lt;li&gt;\n		&lt;div class=\"list-icon\"&gt;\n			定时给你的狗狗喂食。\n		&lt;/div&gt;\n	&lt;/li&gt;\n	&lt;li class=\"exp-content-list list-item-2\"&gt;\n		&lt;div class=\"content-list-text\"&gt;\n			&lt;p&gt;\n				定时带你的狗狗出去遛弯，确保它不在家里拉屎拉尿。\n			&lt;/p&gt;\n		&lt;/div&gt;\n	&lt;/li&gt;\n	&lt;li class=\"exp-content-list list-item-2\"&gt;\n		&lt;div class=\"content-list-text\"&gt;\n			&lt;p&gt;\n				注意你的狗狗的一些潜台词，比如说：突然呜呜 ，发出那种不正常的叫声的时候 ，可能是你的狗狗憋着啦 。。。\n			&lt;/p&gt;\n		&lt;/div&gt;\n	&lt;/li&gt;\n	&lt;li class=\"exp-content-list list-item-4\"&gt;\n		&lt;div class=\"list-icon\"&gt;\n			如果前几次在家没有养成良好的习惯，那么一定要注意，实时调整遛弯时间，确保在外出时间解决生理问题。\n		&lt;/div&gt;\n	&lt;/li&gt;\n	&lt;li class=\"exp-content-list list-item-5\"&gt;\n		&lt;div class=\"list-icon\"&gt;\n			如果你想让你的狗狗又乖听话的&nbsp;陪你做一些简单的游戏了。那么长时间有奖励措施的重复指导它做同一件事。那么就会在狗狗的潜意识里面，形成配合你的模式。这里要注意啦，不是每一条狗狗都会那么配合你的，在狗狗界也有一些奇葩。怎是那么神奇。比喻说&nbsp;哈士奇，这种狗狗的行为怎是那么怪异，喜欢模仿人类的动作。效果时常是相反的 。。。\n		&lt;/div&gt;\n	&lt;/li&gt;\n&lt;/ol&gt;', 2, '2020-04-08 22:15:35');
INSERT INTO `exper` VALUES (4, '养宠物的一些小常识4', '&lt;ol&gt;\n	&lt;li&gt;\n		&lt;div class=\"list-icon\"&gt;\n			定时给你的狗狗喂食。\n		&lt;/div&gt;\n	&lt;/li&gt;\n	&lt;li class=\"exp-content-list list-item-2\"&gt;\n		&lt;div class=\"content-list-text\"&gt;\n			&lt;p&gt;\n				定时带你的狗狗出去遛弯，确保它不在家里拉屎拉尿。\n			&lt;/p&gt;\n		&lt;/div&gt;\n	&lt;/li&gt;\n	&lt;li class=\"exp-content-list list-item-2\"&gt;\n		&lt;div class=\"content-list-text\"&gt;\n			&lt;p&gt;\n				注意你的狗狗的一些潜台词，比如说：突然呜呜 ，发出那种不正常的叫声的时候 ，可能是你的狗狗憋着啦 。。。\n			&lt;/p&gt;\n		&lt;/div&gt;\n	&lt;/li&gt;\n	&lt;li class=\"exp-content-list list-item-4\"&gt;\n		&lt;div class=\"list-icon\"&gt;\n			如果前几次在家没有养成良好的习惯，那么一定要注意，实时调整遛弯时间，确保在外出时间解决生理问题。\n		&lt;/div&gt;\n	&lt;/li&gt;\n	&lt;li class=\"exp-content-list list-item-5\"&gt;\n		&lt;div class=\"list-icon\"&gt;\n			如果你想让你的狗狗又乖听话的&nbsp;陪你做一些简单的游戏了。那么长时间有奖励措施的重复指导它做同一件事。那么就会在狗狗的潜意识里面，形成配合你的模式。这里要注意啦，不是每一条狗狗都会那么配合你的，在狗狗界也有一些奇葩。怎是那么神奇。比喻说&nbsp;哈士奇，这种狗狗的行为怎是那么怪异，喜欢模仿人类的动作。效果时常是相反的 。。。\n		&lt;/div&gt;\n	&lt;/li&gt;\n&lt;/ol&gt;', 2, '2020-04-08 22:15:35');
INSERT INTO `exper` VALUES (6, '养宠物的一些小常识5', '&lt;ol&gt;\n	&lt;li&gt;\n		&lt;div class=\"list-icon\"&gt;\n			定时给你的狗狗喂食。\n		&lt;/div&gt;\n	&lt;/li&gt;\n	&lt;li class=\"exp-content-list list-item-2\"&gt;\n		&lt;div class=\"content-list-text\"&gt;\n			&lt;p&gt;\n				定时带你的狗狗出去遛弯，确保它不在家里拉屎拉尿。\n			&lt;/p&gt;\n		&lt;/div&gt;\n	&lt;/li&gt;\n	&lt;li class=\"exp-content-list list-item-2\"&gt;\n		&lt;div class=\"content-list-text\"&gt;\n			&lt;p&gt;\n				注意你的狗狗的一些潜台词，比如说：突然呜呜 ，发出那种不正常的叫声的时候 ，可能是你的狗狗憋着啦 。。。\n			&lt;/p&gt;\n		&lt;/div&gt;\n	&lt;/li&gt;\n	&lt;li class=\"exp-content-list list-item-4\"&gt;\n		&lt;div class=\"list-icon\"&gt;\n			如果前几次在家没有养成良好的习惯，那么一定要注意，实时调整遛弯时间，确保在外出时间解决生理问题。\n		&lt;/div&gt;\n	&lt;/li&gt;\n	&lt;li class=\"exp-content-list list-item-5\"&gt;\n		&lt;div class=\"list-icon\"&gt;\n			如果你想让你的狗狗又乖听话的&nbsp;陪你做一些简单的游戏了。那么长时间有奖励措施的重复指导它做同一件事。那么就会在狗狗的潜意识里面，形成配合你的模式。这里要注意啦，不是每一条狗狗都会那么配合你的，在狗狗界也有一些奇葩。怎是那么神奇。比喻说&nbsp;哈士奇，这种狗狗的行为怎是那么怪异，喜欢模仿人类的动作。效果时常是相反的 。。。\n		&lt;/div&gt;\n	&lt;/li&gt;\n&lt;/ol&gt;', 2, '2020-04-08 22:15:35');
INSERT INTO `exper` VALUES (7, '养宠物的一些小常识6', '&lt;ol&gt;\n	&lt;li&gt;\n		&lt;div class=\"list-icon\"&gt;\n			定时给你的狗狗喂食。\n		&lt;/div&gt;\n	&lt;/li&gt;\n	&lt;li class=\"exp-content-list list-item-2\"&gt;\n		&lt;div class=\"content-list-text\"&gt;\n			&lt;p&gt;\n				定时带你的狗狗出去遛弯，确保它不在家里拉屎拉尿。\n			&lt;/p&gt;\n		&lt;/div&gt;\n	&lt;/li&gt;\n	&lt;li class=\"exp-content-list list-item-2\"&gt;\n		&lt;div class=\"content-list-text\"&gt;\n			&lt;p&gt;\n				注意你的狗狗的一些潜台词，比如说：突然呜呜 ，发出那种不正常的叫声的时候 ，可能是你的狗狗憋着啦 。。。\n			&lt;/p&gt;\n		&lt;/div&gt;\n	&lt;/li&gt;\n	&lt;li class=\"exp-content-list list-item-4\"&gt;\n		&lt;div class=\"list-icon\"&gt;\n			如果前几次在家没有养成良好的习惯，那么一定要注意，实时调整遛弯时间，确保在外出时间解决生理问题。\n		&lt;/div&gt;\n	&lt;/li&gt;\n	&lt;li class=\"exp-content-list list-item-5\"&gt;\n		&lt;div class=\"list-icon\"&gt;\n			如果你想让你的狗狗又乖听话的&nbsp;陪你做一些简单的游戏了。那么长时间有奖励措施的重复指导它做同一件事。那么就会在狗狗的潜意识里面，形成配合你的模式。这里要注意啦，不是每一条狗狗都会那么配合你的，在狗狗界也有一些奇葩。怎是那么神奇。比喻说&nbsp;哈士奇，这种狗狗的行为怎是那么怪异，喜欢模仿人类的动作。效果时常是相反的 。。。\n		&lt;/div&gt;\n	&lt;/li&gt;\n&lt;/ol&gt;', 2, '2020-04-08 22:15:35');
INSERT INTO `exper` VALUES (8, '养宠物的一些小常识7', '&lt;ol&gt;\n	&lt;li&gt;\n		&lt;div class=\"list-icon\"&gt;\n			定时给你的狗狗喂食。\n		&lt;/div&gt;\n	&lt;/li&gt;\n	&lt;li class=\"exp-content-list list-item-2\"&gt;\n		&lt;div class=\"content-list-text\"&gt;\n			&lt;p&gt;\n				定时带你的狗狗出去遛弯，确保它不在家里拉屎拉尿。\n			&lt;/p&gt;\n		&lt;/div&gt;\n	&lt;/li&gt;\n	&lt;li class=\"exp-content-list list-item-2\"&gt;\n		&lt;div class=\"content-list-text\"&gt;\n			&lt;p&gt;\n				注意你的狗狗的一些潜台词，比如说：突然呜呜 ，发出那种不正常的叫声的时候 ，可能是你的狗狗憋着啦 。。。\n			&lt;/p&gt;\n		&lt;/div&gt;\n	&lt;/li&gt;\n	&lt;li class=\"exp-content-list list-item-4\"&gt;\n		&lt;div class=\"list-icon\"&gt;\n			如果前几次在家没有养成良好的习惯，那么一定要注意，实时调整遛弯时间，确保在外出时间解决生理问题。\n		&lt;/div&gt;\n	&lt;/li&gt;\n	&lt;li class=\"exp-content-list list-item-5\"&gt;\n		&lt;div class=\"list-icon\"&gt;\n			如果你想让你的狗狗又乖听话的&nbsp;陪你做一些简单的游戏了。那么长时间有奖励措施的重复指导它做同一件事。那么就会在狗狗的潜意识里面，形成配合你的模式。这里要注意啦，不是每一条狗狗都会那么配合你的，在狗狗界也有一些奇葩。怎是那么神奇。比喻说&nbsp;哈士奇，这种狗狗的行为怎是那么怪异，喜欢模仿人类的动作。效果时常是相反的 。。。\n		&lt;/div&gt;\n	&lt;/li&gt;\n&lt;/ol&gt;', 2, '2020-04-08 22:15:35');
INSERT INTO `exper` VALUES (9, '养宠物的一些小常识8', '&lt;ol&gt;\n	&lt;li&gt;\n		&lt;div class=\"list-icon\"&gt;\n			定时给你的狗狗喂食。\n		&lt;/div&gt;\n	&lt;/li&gt;\n	&lt;li class=\"exp-content-list list-item-2\"&gt;\n		&lt;div class=\"content-list-text\"&gt;\n			&lt;p&gt;\n				定时带你的狗狗出去遛弯，确保它不在家里拉屎拉尿。\n			&lt;/p&gt;\n		&lt;/div&gt;\n	&lt;/li&gt;\n	&lt;li class=\"exp-content-list list-item-2\"&gt;\n		&lt;div class=\"content-list-text\"&gt;\n			&lt;p&gt;\n				注意你的狗狗的一些潜台词，比如说：突然呜呜 ，发出那种不正常的叫声的时候 ，可能是你的狗狗憋着啦 。。。\n			&lt;/p&gt;\n		&lt;/div&gt;\n	&lt;/li&gt;\n	&lt;li class=\"exp-content-list list-item-4\"&gt;\n		&lt;div class=\"list-icon\"&gt;\n			如果前几次在家没有养成良好的习惯，那么一定要注意，实时调整遛弯时间，确保在外出时间解决生理问题。\n		&lt;/div&gt;\n	&lt;/li&gt;\n	&lt;li class=\"exp-content-list list-item-5\"&gt;\n		&lt;div class=\"list-icon\"&gt;\n			如果你想让你的狗狗又乖听话的&nbsp;陪你做一些简单的游戏了。那么长时间有奖励措施的重复指导它做同一件事。那么就会在狗狗的潜意识里面，形成配合你的模式。这里要注意啦，不是每一条狗狗都会那么配合你的，在狗狗界也有一些奇葩。怎是那么神奇。比喻说&nbsp;哈士奇，这种狗狗的行为怎是那么怪异，喜欢模仿人类的动作。效果时常是相反的 。。。\n		&lt;/div&gt;\n	&lt;/li&gt;\n&lt;/ol&gt;', 2, '2020-04-08 22:15:35');
INSERT INTO `exper` VALUES (13, '养宠物的一些小常识9', '&lt;ol&gt;\n	&lt;li&gt;\n		&lt;div class=\"list-icon\"&gt;\n			定时给你的狗狗喂食。\n		&lt;/div&gt;\n	&lt;/li&gt;\n	&lt;li class=\"exp-content-list list-item-2\"&gt;\n		&lt;div class=\"content-list-text\"&gt;\n			&lt;p&gt;\n				定时带你的狗狗出去遛弯，确保它不在家里拉屎拉尿。\n			&lt;/p&gt;\n		&lt;/div&gt;\n	&lt;/li&gt;\n	&lt;li class=\"exp-content-list list-item-2\"&gt;\n		&lt;div class=\"content-list-text\"&gt;\n			&lt;p&gt;\n				注意你的狗狗的一些潜台词，比如说：突然呜呜 ，发出那种不正常的叫声的时候 ，可能是你的狗狗憋着啦 。。。\n			&lt;/p&gt;\n		&lt;/div&gt;\n	&lt;/li&gt;\n	&lt;li class=\"exp-content-list list-item-4\"&gt;\n		&lt;div class=\"list-icon\"&gt;\n			如果前几次在家没有养成良好的习惯，那么一定要注意，实时调整遛弯时间，确保在外出时间解决生理问题。\n		&lt;/div&gt;\n	&lt;/li&gt;\n	&lt;li class=\"exp-content-list list-item-5\"&gt;\n		&lt;div class=\"list-icon\"&gt;\n			如果你想让你的狗狗又乖听话的&nbsp;陪你做一些简单的游戏了。那么长时间有奖励措施的重复指导它做同一件事。那么就会在狗狗的潜意识里面，形成配合你的模式。这里要注意啦，不是每一条狗狗都会那么配合你的，在狗狗界也有一些奇葩。怎是那么神奇。比喻说&nbsp;哈士奇，这种狗狗的行为怎是那么怪异，喜欢模仿人类的动作。效果时常是相反的 。。。\n		&lt;/div&gt;\n	&lt;/li&gt;\n&lt;/ol&gt;', 2, '2020-04-08 22:15:35');
INSERT INTO `exper` VALUES (14, '养宠物的一些小常识10', '&lt;ol&gt;\n	&lt;li&gt;\n		&lt;div class=\"list-icon\"&gt;\n			定时给你的狗狗喂食。\n		&lt;/div&gt;\n	&lt;/li&gt;\n	&lt;li class=\"exp-content-list list-item-2\"&gt;\n		&lt;div class=\"content-list-text\"&gt;\n			&lt;p&gt;\n				定时带你的狗狗出去遛弯，确保它不在家里拉屎拉尿。\n			&lt;/p&gt;\n		&lt;/div&gt;\n	&lt;/li&gt;\n	&lt;li class=\"exp-content-list list-item-2\"&gt;\n		&lt;div class=\"content-list-text\"&gt;\n			&lt;p&gt;\n				注意你的狗狗的一些潜台词，比如说：突然呜呜 ，发出那种不正常的叫声的时候 ，可能是你的狗狗憋着啦 。。。\n			&lt;/p&gt;\n		&lt;/div&gt;\n	&lt;/li&gt;\n	&lt;li class=\"exp-content-list list-item-4\"&gt;\n		&lt;div class=\"list-icon\"&gt;\n			如果前几次在家没有养成良好的习惯，那么一定要注意，实时调整遛弯时间，确保在外出时间解决生理问题。\n		&lt;/div&gt;\n	&lt;/li&gt;\n	&lt;li class=\"exp-content-list list-item-5\"&gt;\n		&lt;div class=\"list-icon\"&gt;\n			如果你想让你的狗狗又乖听话的&nbsp;陪你做一些简单的游戏了。那么长时间有奖励措施的重复指导它做同一件事。那么就会在狗狗的潜意识里面，形成配合你的模式。这里要注意啦，不是每一条狗狗都会那么配合你的，在狗狗界也有一些奇葩。怎是那么神奇。比喻说&nbsp;哈士奇，这种狗狗的行为怎是那么怪异，喜欢模仿人类的动作。效果时常是相反的 。。。\n		&lt;/div&gt;\n	&lt;/li&gt;\n&lt;/ol&gt;', 2, '2020-04-08 22:15:35');
INSERT INTO `exper` VALUES (15, '养宠物的一些小常识11', '&lt;ol&gt;\n	&lt;li&gt;\n		&lt;div class=\"list-icon\"&gt;\n			定时给你的狗狗喂食。\n		&lt;/div&gt;\n	&lt;/li&gt;\n	&lt;li class=\"exp-content-list list-item-2\"&gt;\n		&lt;div class=\"content-list-text\"&gt;\n			&lt;p&gt;\n				定时带你的狗狗出去遛弯，确保它不在家里拉屎拉尿。\n			&lt;/p&gt;\n		&lt;/div&gt;\n	&lt;/li&gt;\n	&lt;li class=\"exp-content-list list-item-2\"&gt;\n		&lt;div class=\"content-list-text\"&gt;\n			&lt;p&gt;\n				注意你的狗狗的一些潜台词，比如说：突然呜呜 ，发出那种不正常的叫声的时候 ，可能是你的狗狗憋着啦 。。。\n			&lt;/p&gt;\n		&lt;/div&gt;\n	&lt;/li&gt;\n	&lt;li class=\"exp-content-list list-item-4\"&gt;\n		&lt;div class=\"list-icon\"&gt;\n			如果前几次在家没有养成良好的习惯，那么一定要注意，实时调整遛弯时间，确保在外出时间解决生理问题。\n		&lt;/div&gt;\n	&lt;/li&gt;\n	&lt;li class=\"exp-content-list list-item-5\"&gt;\n		&lt;div class=\"list-icon\"&gt;\n			如果你想让你的狗狗又乖听话的&nbsp;陪你做一些简单的游戏了。那么长时间有奖励措施的重复指导它做同一件事。那么就会在狗狗的潜意识里面，形成配合你的模式。这里要注意啦，不是每一条狗狗都会那么配合你的，在狗狗界也有一些奇葩。怎是那么神奇。比喻说&nbsp;哈士奇，这种狗狗的行为怎是那么怪异，喜欢模仿人类的动作。效果时常是相反的 。。。\n		&lt;/div&gt;\n	&lt;/li&gt;\n&lt;/ol&gt;', 2, '2020-04-08 22:15:35');
INSERT INTO `exper` VALUES (16, '养宠物的一些小常识12', '&lt;ol&gt;\n	&lt;li&gt;\n		&lt;div class=\"list-icon\"&gt;\n			定时给你的狗狗喂食。\n		&lt;/div&gt;\n	&lt;/li&gt;\n	&lt;li class=\"exp-content-list list-item-2\"&gt;\n		&lt;div class=\"content-list-text\"&gt;\n			&lt;p&gt;\n				定时带你的狗狗出去遛弯，确保它不在家里拉屎拉尿。\n			&lt;/p&gt;\n		&lt;/div&gt;\n	&lt;/li&gt;\n	&lt;li class=\"exp-content-list list-item-2\"&gt;\n		&lt;div class=\"content-list-text\"&gt;\n			&lt;p&gt;\n				注意你的狗狗的一些潜台词，比如说：突然呜呜 ，发出那种不正常的叫声的时候 ，可能是你的狗狗憋着啦 。。。\n			&lt;/p&gt;\n		&lt;/div&gt;\n	&lt;/li&gt;\n	&lt;li class=\"exp-content-list list-item-4\"&gt;\n		&lt;div class=\"list-icon\"&gt;\n			如果前几次在家没有养成良好的习惯，那么一定要注意，实时调整遛弯时间，确保在外出时间解决生理问题。\n		&lt;/div&gt;\n	&lt;/li&gt;\n	&lt;li class=\"exp-content-list list-item-5\"&gt;\n		&lt;div class=\"list-icon\"&gt;\n			如果你想让你的狗狗又乖听话的&nbsp;陪你做一些简单的游戏了。那么长时间有奖励措施的重复指导它做同一件事。那么就会在狗狗的潜意识里面，形成配合你的模式。这里要注意啦，不是每一条狗狗都会那么配合你的，在狗狗界也有一些奇葩。怎是那么神奇。比喻说&nbsp;哈士奇，这种狗狗的行为怎是那么怪异，喜欢模仿人类的动作。效果时常是相反的 。。。\n		&lt;/div&gt;\n	&lt;/li&gt;\n&lt;/ol&gt;', 2, '2020-04-08 22:15:35');
INSERT INTO `exper` VALUES (17, '养宠物的一些小常识13', '&lt;ol&gt;\n	&lt;li&gt;\n		&lt;div class=\"list-icon\"&gt;\n			定时给你的狗狗喂食。\n		&lt;/div&gt;\n	&lt;/li&gt;\n	&lt;li class=\"exp-content-list list-item-2\"&gt;\n		&lt;div class=\"content-list-text\"&gt;\n			&lt;p&gt;\n				定时带你的狗狗出去遛弯，确保它不在家里拉屎拉尿。\n			&lt;/p&gt;\n		&lt;/div&gt;\n	&lt;/li&gt;\n	&lt;li class=\"exp-content-list list-item-2\"&gt;\n		&lt;div class=\"content-list-text\"&gt;\n			&lt;p&gt;\n				注意你的狗狗的一些潜台词，比如说：突然呜呜 ，发出那种不正常的叫声的时候 ，可能是你的狗狗憋着啦 。。。\n			&lt;/p&gt;\n		&lt;/div&gt;\n	&lt;/li&gt;\n	&lt;li class=\"exp-content-list list-item-4\"&gt;\n		&lt;div class=\"list-icon\"&gt;\n			如果前几次在家没有养成良好的习惯，那么一定要注意，实时调整遛弯时间，确保在外出时间解决生理问题。\n		&lt;/div&gt;\n	&lt;/li&gt;\n	&lt;li class=\"exp-content-list list-item-5\"&gt;\n		&lt;div class=\"list-icon\"&gt;\n			如果你想让你的狗狗又乖听话的&nbsp;陪你做一些简单的游戏了。那么长时间有奖励措施的重复指导它做同一件事。那么就会在狗狗的潜意识里面，形成配合你的模式。这里要注意啦，不是每一条狗狗都会那么配合你的，在狗狗界也有一些奇葩。怎是那么神奇。比喻说&nbsp;哈士奇，这种狗狗的行为怎是那么怪异，喜欢模仿人类的动作。效果时常是相反的 。。。\n		&lt;/div&gt;\n	&lt;/li&gt;\n&lt;/ol&gt;', 2, '2020-04-08 22:15:35');

-- ----------------------------
-- Table structure for info
-- ----------------------------
DROP TABLE IF EXISTS `info`;
CREATE TABLE `info`  (
  `info_id` int(11) NOT NULL AUTO_INCREMENT,
  `info_title` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `info_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `info_admin` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `info_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of info
-- ----------------------------
INSERT INTO `info` VALUES (1, '宠物之家网站消息推送1', '宠物之家网站消息推送1宠物之家网站消息推送1宠物之家网站消息推送1', '管理员', '2020-04-08 22:15:35');
INSERT INTO `info` VALUES (2, '宠物之家网站消息推送2', '宠物之家网站消息推送2宠物之家网站消息推送2宠物之家网站消息推送2', '张丽丽', '2020-04-08 22:15:35');
INSERT INTO `info` VALUES (3, '宠物之家网站消息推送3', '&lt;p align=\"center\"&gt;\r\n	&lt;img width=\"500\" height=\"333\" style=\"width:302px;height:202px;\" alt=\"\" src=\"/pet/images/infos/image/20160408/20160408213223_249.jpg\" /&gt;\r\n&lt;/p&gt;\r\n&lt;p style=\"text-indent:2em;\"&gt;\r\n	宠物之家网站消息推送3宠物之家网站消息推送3宠物之家网站消息推送3宠物之家网站消息推送3宠物之家网站消息推送3宠物之家网站消息推送3宠物之家网站消息推送3\r\n&lt;/p&gt;', '蒋龙宇', '2020-04-08 22:15:35');
INSERT INTO `info` VALUES (4, '宠物之家网站消息推送4', '宠物之家网站消息推送1宠物之家网站消息推送1宠物之家网站消息推送1', '管理员', '2020-04-08 22:15:35');
INSERT INTO `info` VALUES (5, '宠物之家网站消息推送5', '宠物之家网站消息推送2宠物之家网站消息推送2宠物之家网站消息推送2', '张丽丽', '2020-04-08 22:15:35');
INSERT INTO `info` VALUES (6, '宠物之家网站消息推送6', '&nbsp;&nbsp;&nbsp;&nbsp;宠物之家网站消息推送3宠物之家网站消息推送3宠物之家网站消息推送3宠物之家网站消息推送3宠物之家网站消息推送3宠物之家网站消息推送3宠物之家网站消息推送3', '蒋龙宇', '2020-04-08 22:15:35');
INSERT INTO `info` VALUES (7, '宠物之家网站消息推送7', '宠物之家网站消息推送1宠物之家网站消息推送1宠物之家网站消息推送1', '管理员', '2020-04-08 22:15:35');
INSERT INTO `info` VALUES (8, '宠物之家网站消息推送8', '宠物之家网站消息推送2宠物之家网站消息推送2宠物之家网站消息推送2', '张丽丽', '2020-04-08 22:15:35');
INSERT INTO `info` VALUES (9, '宠物之家网站消息推送9', '&nbsp;&nbsp;&nbsp;&nbsp;宠物之家网站消息推送3宠物之家网站消息推送3宠物之家网站消息推送3宠物之家网站消息推送3宠物之家网站消息推送3宠物之家网站消息推送3宠物之家网站消息推送3', '蒋龙宇', '2020-04-08 22:15:35');
INSERT INTO `info` VALUES (10, '宠物之家网站消息推送10', '宠物之家网站消息推送1宠物之家网站消息推送1宠物之家网站消息推送1', '管理员', '2020-04-08 22:15:35');
INSERT INTO `info` VALUES (11, '宠物之家网站消息推送11', '宠物之家网站消息推送2宠物之家网站消息推送2宠物之家网站消息推送2', '张丽丽', '2020-04-08 22:15:35');
INSERT INTO `info` VALUES (12, '宠物之家网站消息推送12', '&nbsp;&nbsp;&nbsp;&nbsp;宠物之家网站消息推送3宠物之家网站消息推送3宠物之家网站消息推送3宠物之家网站消息推送3宠物之家网站消息推送3宠物之家网站消息推送3宠物之家网站消息推送3', '蒋龙宇', '2020-04-08 22:15:35');

-- ----------------------------
-- Table structure for lost
-- ----------------------------
DROP TABLE IF EXISTS `lost`;
CREATE TABLE `lost`  (
  `lost_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `user_phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_mail` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `task_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `task_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `task_pic` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `task_age` int(11) NULL DEFAULT NULL,
  `task_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `lost_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`lost_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of lost
-- ----------------------------
INSERT INTO `lost` VALUES (16, 2, '15081182821', '地方2', '15888888888@139.com', '晶晶1', '边牧', '1.jpg', 2, '跑着跑着就没了', '2020-04-08');
INSERT INTO `lost` VALUES (17, 2, '15081182821', '地方2', '15888888888@139.com', '晶晶2', '泰迪', '2.jpg', 2, '跑着跑着就没了', '2020-04-08');
INSERT INTO `lost` VALUES (18, 2, '15081182821', '地方2', '15888888888@139.com', '晶晶3', '比熊', '3.jpg', 2, '跑着跑着就没了', '2020-04-08');
INSERT INTO `lost` VALUES (19, 2, '15081182821', '地方2', '15888888888@139.com', '晶晶4', '茶犬', '4.jpg', 2, '跑着跑着就没了', '2020-04-08');
INSERT INTO `lost` VALUES (20, 2, '15081182821', '地方2', '15888888888@139.com', '晶晶5', '边牧', '5.jpg', 2, '跑着跑着就没了', '2020-04-08');
INSERT INTO `lost` VALUES (21, 2, '15081182821', '地方2', '15888888888@139.com', '晶晶6', '泰迪', '6.jpg', 2, '跑着跑着就没了', '2020-04-08');
INSERT INTO `lost` VALUES (22, 2, '15081182821', '地方2', '15888888888@139.com', '晶晶7', '边牧', '7.jpg', 2, '跑着跑着就没了', '2020-04-08');
INSERT INTO `lost` VALUES (23, 2, '15081182821', '地方2', '15888888888@139.com', '晶晶8', '比熊', '8.jpg', 2, '跑着跑着就没了', '2020-04-08');
INSERT INTO `lost` VALUES (24, 2, '15081182821', '地方2', '15888888888@139.com', '晶晶9', '茶犬', '9.jpg', 2, '跑着跑着就没了', '2020-04-08');
INSERT INTO `lost` VALUES (25, 2, '15081182821', '地方2', '15888888888@139.com', '晶晶10', '边牧', '10.jpg', 2, '跑着跑着就没了', '2020-04-08');
INSERT INTO `lost` VALUES (26, 2, '15081182821', '地方2', '15888888888@139.com', '晶晶11', '边牧', '11.jpg', 2, '跑着跑着就没了', '2020-04-08');
INSERT INTO `lost` VALUES (27, 2, '15081182821', '地方2', '15888888888@139.com', '晶晶12', '边牧', '12.jpg', 2, '跑着跑着就没了', '2020-04-08');
INSERT INTO `lost` VALUES (28, 2, '15081182821', '地方2', '15888888888@139.com', '晶晶13', '边牧', '13.jpg', 2, '跑着跑着就没了', '2020-04-08');

-- ----------------------------
-- Table structure for race
-- ----------------------------
DROP TABLE IF EXISTS `race`;
CREATE TABLE `race`  (
  `race_id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `race_date` date NULL DEFAULT NULL,
  `race_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `race_score` int(11) NULL DEFAULT 1 COMMENT '1:好评 2:中评 3:差评',
  `race_flag` int(11) NULL DEFAULT 1 COMMENT '1:申请中 2:未通过 3:审批通',
  PRIMARY KEY (`race_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of race
-- ----------------------------
INSERT INTO `race` VALUES (1, 32, 3, '2020-04-08', '我会好好对待她的', 1, 3);

-- ----------------------------
-- Table structure for sblog_reply
-- ----------------------------
DROP TABLE IF EXISTS `sblog_reply`;
CREATE TABLE `sblog_reply`  (
  `sblog_reply_id` int(11) NOT NULL AUTO_INCREMENT,
  `exper_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `reply_title` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reply_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `reply_date` datetime NULL DEFAULT NULL,
  `sblog_pic` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sblog_reply_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sblog_reply
-- ----------------------------
INSERT INTO `sblog_reply` VALUES (1, 16, 2, '', '说的太好了啊！！嘻嘻嘻', '2020-04-12 12:26:40', 'images/head/1.gif');
INSERT INTO `sblog_reply` VALUES (2, 16, 3, '回复：李梅梅', '我十分同意！楼主真是好人！', '2020-04-12 12:26:40', 'images/head/2.gif');

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task`  (
  `task_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `user_phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_mail` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `task_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `task_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `task_pic` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `task_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `task_age` int(11) NULL DEFAULT NULL,
  `task_start` date NULL DEFAULT NULL,
  `task_end` date NULL DEFAULT NULL,
  `task_require` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `task_status` int(11) NULL DEFAULT 1 COMMENT '1:待领养 2:已领养',
  PRIMARY KEY (`task_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES (2, 2, '15081182821', '地方2', '15888888888@139.com', '妮妮1', '边牧', '1.jpg', '很好寄养的', 2, '2020-04-12', '2020-04-12', '好好对她', 1);
INSERT INTO `task` VALUES (3, 2, '15081182821', '地方2', '15888888888@139.com', '妮妮2', '泰迪', '2.jpg', '很好寄养的', 2, '2020-04-12', '2020-04-12', '好好对她', 1);
INSERT INTO `task` VALUES (4, 2, '15081182821', '地方2', '15888888888@139.com', '妮妮3', '比熊', '3.jpg', '很好寄养的', 2, '2020-04-12', '2020-04-12', '好好对她', 1);
INSERT INTO `task` VALUES (5, 2, '15081182821', '地方2', '15888888888@139.com', '妮妮4', '茶犬', '4.jpg', '很好寄养的', 2, '2020-04-12', '2020-04-12', '好好对她', 1);
INSERT INTO `task` VALUES (6, 2, '15081182821', '地方2', '15888888888@139.com', '妮妮5', '边牧', '5.jpg', '很好寄养的', 2, '2020-04-12', '2020-04-12', '好好对她', 1);
INSERT INTO `task` VALUES (7, 2, '15081182821', '地方2', '15888888888@139.com', '妮妮6', '泰迪', '6.jpg', '很好寄养的', 2, '2020-04-12', '2020-04-12', '好好对她', 1);
INSERT INTO `task` VALUES (8, 2, '15081182821', '地方2', '15888888888@139.com', '妮妮7', '边牧', '7.jpg', '很好寄养的', 2, '2020-04-12', '2020-04-12', '好好对她', 1);
INSERT INTO `task` VALUES (9, 2, '15081182821', '地方2', '15888888888@139.com', '妮妮8', '比熊', '8.jpg', '很好寄养的', 2, '2020-04-12', '2020-04-12', '好好对她', 1);
INSERT INTO `task` VALUES (10, 2, '15081182821', '地方2', '15888888888@139.com', '妮妮9', '茶犬', '9.jpg', '很好寄养的', 2, '2020-04-12', '2020-04-12', '好好对她', 1);
INSERT INTO `task` VALUES (29, 2, '15081182821', '地方2', '15888888888@139.com', '妮妮10', '边牧', '10.jpg', '很好寄养的', 2, '2020-04-12', '2020-04-12', '好好对她', 1);
INSERT INTO `task` VALUES (30, 2, '15081182821', '地方2', '15888888888@139.com', '妮妮11', '边牧', '11.jpg', '很好寄养的', 2, '2020-04-12', '2020-04-12', '好好对她', 1);
INSERT INTO `task` VALUES (31, 2, '15081182821', '地方2', '15888888888@139.com', '妮妮12', '边牧', '12.jpg', '很好寄养的', 2, '2020-04-12', '2020-04-12', '好好对她', 1);
INSERT INTO `task` VALUES (32, 2, '15081182821', '地方2', '15888888888@139.com', '妮妮13', '边牧', '13.jpg', '很好寄养的', 2, '2020-04-12', '2020-04-12', '好好对她', 1);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_pass` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `real_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nick_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_sex` int(11) NULL DEFAULT 0 COMMENT '1：男 0：女',
  `user_age` int(11) NULL DEFAULT NULL,
  `user_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_mail` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_score` int(11) NULL DEFAULT NULL,
  `user_level` int(11) NULL DEFAULT NULL,
  `reg_date` datetime NULL DEFAULT NULL,
  `user_type` int(11) NULL DEFAULT 0 COMMENT '2：管理员 1：注册用户',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '4cb0a5502e9aa44a0ca99e96742f2e788aad875a', '张丽', '管理员', 1, 22, NULL, '15899999991', '15888888888', NULL, NULL, '2020-04-12 23:08:39', 2);
INSERT INTO `user` VALUES (2, 'limei', '4cb0a5502e9aa44a0ca99e96742f2e788aad875a', '李梅', '李梅梅', 2, 22, '地方2', '15081182821', '15888888888@139.com', 10, 1, '2020-04-12 23:08:39', 1);
INSERT INTO `user` VALUES (3, 'liling', '4cb0a5502e9aa44a0ca99e96742f2e788aad875a', '李玲', '李玲玲', 2, 22, '地方2', '15081182821', '15888888888@139.com', 20, 3, '2020-04-12 23:08:39', 1);
INSERT INTO `user` VALUES (4, 'chensheng', '4cb0a5502e9aa44a0ca99e96742f2e788aad875a', '陈生', '陈生生', 2, 22, '地方4', '15081182821', '15888888888@139.com', 10, 1, '2020-04-12 23:08:39', 1);
INSERT INTO `user` VALUES (5, 'lichao', '4cb0a5502e9aa44a0ca99e96742f2e788aad875a', '李超', '李超超', 1, 24, '地方5', '15081182821', '15888888888@139.com', 20, 2, '2020-04-12 23:08:39', 1);
INSERT INTO `user` VALUES (6, 'zhangbin', '4cb0a5502e9aa44a0ca99e96742f2e788aad875a', '张斌', '张斌斌', 1, 24, '地方6', '15081182821', '15888888888@139.com', 10, 1, '2020-04-12 23:08:39', 1);
INSERT INTO `user` VALUES (7, 'zhaohui', '4cb0a5502e9aa44a0ca99e96742f2e788aad875a', '赵辉', '赵辉辉', 1, 24, '地方7', '15081182821', '15888888888@139.com', 30, 3, '2020-04-12 23:08:39', 1);
INSERT INTO `user` VALUES (8, 'zhangweiming', '4cb0a5502e9aa44a0ca99e96742f2e788aad875a', '张伟明', '张伟明', 1, 24, '地方8', '15081182821', '15888888888@139.com', 40, 4, '2020-04-12 23:08:39', 1);
INSERT INTO `user` VALUES (9, 'likunlun', '4cb0a5502e9aa44a0ca99e96742f2e788aad875a', '李昆仑', '李昆仑', 1, 25, '地方9', '15081182821', '15888888888@139.com', 10, 1, '2020-04-12 23:08:39', 1);
INSERT INTO `user` VALUES (10, 'lijing', '4cb0a5502e9aa44a0ca99e96742f2e788aad875a', '李静', '李静静', 2, 21, '地方10', '15081182821', '15888888888@139.com', 50, 5, '2020-04-12 23:08:39', 1);
INSERT INTO `user` VALUES (11, 'zhangyongle', '4cb0a5502e9aa44a0ca99e96742f2e788aad875a', '张勇乐', '张勇乐', 1, 21, '地方11', '15081182821', '15888888888@139.com', 20, 2, '2020-04-12 23:08:39', 1);
INSERT INTO `user` VALUES (12, 'xiaoming', '4cb0a5502e9aa44a0ca99e96742f2e788aad875a', '小明', '明明白白', 1, 23, '地方12', '15081182821', '15888888888@139.com', 10, 1, '2020-04-12 23:08:39', 1);

SET FOREIGN_KEY_CHECKS = 1;
