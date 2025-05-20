/*
 Navicat Premium Data Transfer

 Target Server Type    : MySQL
 Target Server Version : 80035 (8.0.35)
 File Encoding         : 65001

 Date: 20/05/2025 14:35:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cartItems
-- ----------------------------
DROP TABLE IF EXISTS `cartItems`;
CREATE TABLE `cartItems`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int NULL DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `cartId` int NULL DEFAULT NULL,
  `productId` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `cartItems_productId_cartId_unique`(`cartId` ASC, `productId` ASC) USING BTREE,
  INDEX `productId`(`productId` ASC) USING BTREE,
  CONSTRAINT `cartItems_ibfk_1` FOREIGN KEY (`cartId`) REFERENCES `carts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cartItems_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cartItems
-- ----------------------------
INSERT INTO `cartItems` VALUES (4, 1, '2025-05-20 07:28:12', '2025-05-20 07:28:12', 1, 8);
INSERT INTO `cartItems` VALUES (5, 1, '2025-05-20 07:28:17', '2025-05-20 07:28:17', 1, 10);

-- ----------------------------
-- Table structure for carts
-- ----------------------------
DROP TABLE IF EXISTS `carts`;
CREATE TABLE `carts`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userId`(`userId` ASC) USING BTREE,
  CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of carts
-- ----------------------------
INSERT INTO `carts` VALUES (1, '2025-05-20 07:12:11', '2025-05-20 07:12:11', 1);

-- ----------------------------
-- Table structure for orderItems
-- ----------------------------
DROP TABLE IF EXISTS `orderItems`;
CREATE TABLE `orderItems`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int NULL DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `orderId` int NULL DEFAULT NULL,
  `productId` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `orderItems_orderId_productId_unique`(`orderId` ASC, `productId` ASC) USING BTREE,
  INDEX `productId`(`productId` ASC) USING BTREE,
  CONSTRAINT `orderItems_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orderItems_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderItems
-- ----------------------------
INSERT INTO `orderItems` VALUES (1, 2, '2025-05-20 07:27:53', '2025-05-20 07:27:53', 1, 1);
INSERT INTO `orderItems` VALUES (2, 1, '2025-05-20 07:27:53', '2025-05-20 07:27:53', 1, 3);
INSERT INTO `orderItems` VALUES (3, 1, '2025-05-20 07:28:03', '2025-05-20 07:28:03', 2, 7);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userId`(`userId` ASC) USING BTREE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, '2025-05-20 07:27:53', '2025-05-20 07:27:53', 1);
INSERT INTO `orders` VALUES (2, '2025-05-20 07:28:02', '2025-05-20 07:28:02', 1);

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `price` double NOT NULL,
  `imageUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userId`(`userId` ASC) USING BTREE,
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 'CAPRA SERIES | Signature', 2479200, 'https://www.xionco.com/wp-content/uploads/2025/02/CAPRA-Sign-disp-2-s-1.jpg', 'Sofa Kulit Minimalis | Premium Faux Leather 1 Seater , 2 Seater , 3 Seater Sofa , Ottoman | High-End Living Room | XIONCO', '2025-05-20 07:14:52', '2025-05-20 07:14:52', 1);
INSERT INTO `products` VALUES (2, 'CAPRA SERIES | Deluxe', 3839200, 'https://www.xionco.com/wp-content/uploads/2025/02/CAPRA-DELUXE-disp-3-s-1.jpg', 'Sofa Kulit Minimalis | Premium Faux Leather 1 Seater , 2 Seater , 3 Seater Sofa , Ottoman | High-End Living Room | XIONCO', '2025-05-20 07:15:50', '2025-05-20 07:15:50', 1);
INSERT INTO `products` VALUES (3, 'CANIS', 7150000, 'https://www.xionco.com/wp-content/uploads/2024/08/canis-display-graphite.jpg', 'CANIS - Sofa Minimalis 3 Seater', '2025-05-20 07:17:38', '2025-05-20 07:17:38', 1);
INSERT INTO `products` VALUES (4, 'GUISE', 2814000, 'https://www.xionco.com/wp-content/uploads/2024/07/ec722027-9503-47d1-b7fe-e06f84aad3fb.jpg', 'GUISE', '2025-05-20 07:18:31', '2025-05-20 07:18:31', 1);
INSERT INTO `products` VALUES (5, 'SOMNO', 2280000, 'https://www.xionco.com/wp-content/uploads/2024/07/black-kulit-somno.jpg', 'Platform Bed / Tempat Tidur Divan Minimalis', '2025-05-20 07:21:40', '2025-05-20 07:21:40', 1);
INSERT INTO `products` VALUES (6, 'SYME', 7865000, 'https://www.xionco.com/wp-content/uploads/2023/11/PRESTIGE.jpg', 'SYME - Sliding Wardrobe / Lemari Pakaian Baju Pintu Geser', '2025-05-20 07:22:33', '2025-05-20 07:22:33', 1);
INSERT INTO `products` VALUES (7, 'KYOUKAI', 1320000, 'https://www.xionco.com/wp-content/uploads/2024/07/SK240.jpg', 'KYOUKAI', '2025-05-20 07:23:10', '2025-05-20 07:23:10', 1);
INSERT INTO `products` VALUES (8, 'CUBIX Pillow', 108000, 'https://www.xionco.com/wp-content/uploads/2024/07/bantal-besar-graphite.jpg', 'CUBIX Pillow', '2025-05-20 07:24:38', '2025-05-20 07:24:38', 1);
INSERT INTO `products` VALUES (9, 'CUBIX', 1102500, 'https://www.xionco.com/wp-content/uploads/2024/07/terang-graphite.jpg', 'Modular 3 seater sofa - AC AL AC', '2025-05-20 07:25:46', '2025-05-20 07:25:46', 1);
INSERT INTO `products` VALUES (10, 'VAZRA - Power Switch and Outlet', 23000, 'https://www.xionco.com/wp-content/uploads/2024/08/vazra-power-track-1-gang.jpg', 'VAZRA - Power Switch and Outlet', '2025-05-20 07:26:43', '2025-05-20 07:26:43', 1);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Rendy', 'rendyproklamanta@gmail.com', '2025-05-20 07:12:10', '2025-05-20 07:12:10');

SET FOREIGN_KEY_CHECKS = 1;
