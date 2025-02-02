/*
 Navicat Premium Dump SQL

 Source Server         : bloodlines
 Source Server Type    : MySQL
 Source Server Version : 100428 (10.4.28-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : bloodlines

 Target Server Type    : MySQL
 Target Server Version : 100428 (10.4.28-MariaDB)
 File Encoding         : 65001

 Date: 23/01/2025 23:25:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auditlogs
-- ----------------------------
DROP TABLE IF EXISTS `auditlogs`;
CREATE TABLE `auditlogs`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `action` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `performed_at` timestamp NOT NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `auditlogs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auditlogs
-- ----------------------------

-- ----------------------------
-- Table structure for blood_requests
-- ----------------------------
DROP TABLE IF EXISTS `blood_requests`;
CREATE TABLE `blood_requests`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `blood_type` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `quantity` int NOT NULL,
  `required_date` date NOT NULL,
  `status` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp,
  `donor_id` int NULL DEFAULT NULL,
  `donor_info_shared` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `patient_id`(`patient_id` ASC) USING BTREE,
  CONSTRAINT `blood_requests_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blood_requests
-- ----------------------------
INSERT INTO `blood_requests` VALUES (1, 5, 'O+', 1, '2025-01-22', 'Accepted', '2025-01-17 00:30:32', NULL, 0);
INSERT INTO `blood_requests` VALUES (2, 5, 'A+', 1, '2025-01-23', 'Rejected', '2025-01-17 00:50:48', NULL, 0);
INSERT INTO `blood_requests` VALUES (3, 5, 'O-', 2, '2025-01-20', 'Rejected', '2025-01-17 01:09:57', NULL, 0);
INSERT INTO `blood_requests` VALUES (4, 5, 'B+', 2, '2025-01-29', 'Accepted', '2025-01-17 22:21:09', 3, 1);
INSERT INTO `blood_requests` VALUES (5, 5, 'AB+', 5, '2025-01-22', 'Accepted', '2025-01-19 20:03:41', 3, 1);
INSERT INTO `blood_requests` VALUES (6, 5, 'AB-', 3, '2025-01-29', 'Accepted', '2025-01-22 00:13:55', 3, 1);
INSERT INTO `blood_requests` VALUES (7, 5, 'B+', 5, '2025-01-29', 'Rejected', '2025-01-23 23:15:17', NULL, 0);

-- ----------------------------
-- Table structure for donors
-- ----------------------------
DROP TABLE IF EXISTS `donors`;
CREATE TABLE `donors`  (
  `donor_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `blood_group` enum('A+','A-','B+','B-','O+','O-','AB+','AB-') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `last_donation_date` date NULL DEFAULT NULL,
  `availability` enum('Available','Unavailable') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `contact` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `address` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `user_id` int NULL DEFAULT NULL,
  `ngo_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`donor_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of donors
-- ----------------------------
INSERT INTO `donors` VALUES (1, 'Mark Wilson', 'A+', '2023-11-01', 'Available', '678-123-4567', '123 Elm St, City, Country', 1, 1);
INSERT INTO `donors` VALUES (2, 'Rachel Green', 'B-', '2023-10-10', 'Available', '789-234-5678', '456 Birch St, City, Country', 2, 1);
INSERT INTO `donors` VALUES (3, 'David Lee', 'O+', '2023-09-05', 'Available', '890-345-6789', '789 Cedar St, City, Country', 3, 2);
INSERT INTO `donors` VALUES (4, 'Jessica Taylor', 'AB+', '2023-08-30', 'Available', '901-456-7890', '101 Pine St, City, Country', 4, 2);
INSERT INTO `donors` VALUES (5, 'Chris Martin', 'O-', '2023-07-15', 'Unavailable', '102-567-8901', '202 Oak St, City, Country', 5, 3);
INSERT INTO `donors` VALUES (6, 'Haider Pasha', 'A-', '2025-01-21', 'Available', '0092-5462987', '7th road', NULL, 1);
INSERT INTO `donors` VALUES (7, 'Haider Pasha', 'AB+', '2025-01-07', 'Available', '0092-5462987', '7th road', NULL, 1);

-- ----------------------------
-- Table structure for donors_copy1
-- ----------------------------
DROP TABLE IF EXISTS `donors_copy1`;
CREATE TABLE `donors_copy1`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `blood_group` enum('A+','A-','B+','B-','O+','O-','AB+','AB-') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `last_donation_date` date NULL DEFAULT NULL,
  `availability` enum('Available','Unavailable') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'Available',
  `contact` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `address` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `user_id` int NULL DEFAULT NULL,
  `ngo_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `donors_copy1_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of donors_copy1
-- ----------------------------
INSERT INTO `donors_copy1` VALUES (1, 'Donor ali', 'A+', '2024-10-10', 'Available', '9876543210', '456 Another St, City B', 3, 1);
INSERT INTO `donors_copy1` VALUES (2, 'Donor ham', 'O-', '2024-09-05', 'Available', '9876543211', '789 Next St, City C', 4, NULL);
INSERT INTO `donors_copy1` VALUES (3, 'Micheal', 'B+', '2024-12-30', 'Available', '0092-5462987', 'KKH', NULL, 1);
INSERT INTO `donors_copy1` VALUES (4, 'Micheal', 'B+', '2024-12-30', 'Available', '0092-5462987', 'KKH', NULL, 2);

-- ----------------------------
-- Table structure for ngos
-- ----------------------------
DROP TABLE IF EXISTS `ngos`;
CREATE TABLE `ngos`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `contact` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `address` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `user_id` int NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ngo_image` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ngos
-- ----------------------------
INSERT INTO `ngos` VALUES (1, 'NGO A', '1234567890', '123 Main St, City A', 2, 'images/ngo1.jpeg', 'ngo1.jpg');

-- ----------------------------
-- Table structure for patients
-- ----------------------------
DROP TABLE IF EXISTS `patients`;
CREATE TABLE `patients`  (
  `patient_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `blood_group` enum('A+','A-','B+','B-','O+','O-','AB+','AB-') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `contact` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `address` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `ngo_id` int NOT NULL,
  `required_date` date NULL DEFAULT NULL,
  `status` enum('Pending','Approved','Rejected') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'Pending',
  PRIMARY KEY (`patient_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patients
-- ----------------------------
INSERT INTO `patients` VALUES (1, 'John Doe', 'A+', '123-456-7890', '123 Main St, City, Country', 1, '2024-01-20', 'Pending');
INSERT INTO `patients` VALUES (2, 'Jane Smith', 'B-', '234-567-8901', '456 Oak St, City, Country', 1, '2024-01-22', 'Pending');
INSERT INTO `patients` VALUES (3, 'Emily Johnson', 'O+', '345-678-9012', '789 Pine St, City, Country', 2, '2024-02-10', 'Pending');
INSERT INTO `patients` VALUES (4, 'Michael Brown', 'AB+', '456-789-0123', '101 Maple St, City, Country', 2, '2024-02-15', 'Pending');
INSERT INTO `patients` VALUES (5, 'Sarah Davis', 'O-', '567-890-1234', '202 Birch St, City, Country', 3, '2024-01-25', 'Pending');
INSERT INTO `patients` VALUES (6, 'haider avcon', 'A+', '0092-5462987', 'na-15', 0, '2025-01-27', 'Pending');

-- ----------------------------
-- Table structure for patients_copy1
-- ----------------------------
DROP TABLE IF EXISTS `patients_copy1`;
CREATE TABLE `patients_copy1`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `blood_group` enum('A+','A-','B+','B-','O+','O-','AB+','AB-') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `required_date` date NOT NULL,
  `priority` enum('High','Medium','Low') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'Medium',
  `status` enum('Pending','Fulfilled','Cancelled') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'Pending',
  `ngo_id` int NULL DEFAULT NULL,
  `age` int NULL DEFAULT NULL,
  `contact` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `address` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ngo_id`(`ngo_id` ASC) USING BTREE,
  CONSTRAINT `patients_copy1_ibfk_1` FOREIGN KEY (`ngo_id`) REFERENCES `ngos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patients_copy1
-- ----------------------------
INSERT INTO `patients_copy1` VALUES (1, 'Patient 1', 'A+', '2024-12-15', 'High', 'Pending', 1, 25, '', '');
INSERT INTO `patients_copy1` VALUES (2, 'Patient 2', 'O-', '2024-12-20', 'Medium', 'Pending', 1, 15, '', '');
INSERT INTO `patients_copy1` VALUES (3, 'Patient 3', 'B+', '2024-12-18', 'High', 'Fulfilled', 1, 18, '', '');
INSERT INTO `patients_copy1` VALUES (4, 'Patient 4', 'A+', '2024-12-11', 'Medium', 'Pending', 1, 23, '', '');
INSERT INTO `patients_copy1` VALUES (5, 'ali mustafa', 'B+', '2025-01-09', 'Medium', 'Pending', NULL, NULL, '0092-5462987', 'KKH');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `email` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `role` enum('Admin','NGO','Donor','Patient') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `email`(`email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Admin User', 'admin@system.com', 'hashed_admin_pw', 'Admin', '2024-12-11 00:58:28');
INSERT INTO `users` VALUES (2, 'NGO A User', 'ngoa@ngo.com', 'hashed_ngo_pw', 'NGO', '2024-12-11 00:58:28');
INSERT INTO `users` VALUES (3, 'Donor Ali', 'donor1@xyz.com', '123', 'Donor', '2024-12-11 00:58:28');
INSERT INTO `users` VALUES (4, 'Donor Ham', 'patient2@xyz.com', 'hashed_donor2_pw', 'Patient', '2024-12-11 00:58:28');
INSERT INTO `users` VALUES (5, 'saqi', 'patient1@xyz.com', '123', 'Patient', '2025-01-14 01:26:21');

SET FOREIGN_KEY_CHECKS = 1;
