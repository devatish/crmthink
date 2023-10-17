-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 17, 2023 at 04:34 PM
-- Server version: 8.0.32-0ubuntu0.20.04.2
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `thinkcrm`
--

-- --------------------------------------------------------

--
-- Table structure for table `Menus`
--

CREATE TABLE `Menus` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `parentid` tinyint(1) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `sort` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Menus`
--

INSERT INTO `Menus` (`id`, `name`, `slug`, `parentid`, `active`, `sort`, `createdAt`, `updatedAt`) VALUES
(1, 'Dashboard', 'dashboard', 0, 1, 1, '2023-10-06 14:42:19', '2023-10-06 14:42:19'),
(2, 'Users', '#', 0, 1, 2, '2023-10-06 14:42:19', '2023-10-06 14:42:19'),
(3, 'Holidays', 'holidays', 0, 1, 3, '2023-10-06 14:42:19', '2023-10-06 14:42:19'),
(4, 'Leaves', 'leaves', 0, 1, 4, '2023-10-06 14:42:19', '2023-10-06 14:42:19'),
(5, 'Inventory', 'inventory', 0, 1, 5, '2023-10-06 14:42:19', '2023-10-06 14:42:19'),
(6, 'User List', 'userlist', 2, 1, 1, '2023-10-06 14:42:19', '2023-10-06 14:42:19'),
(7, 'Add User', 'adduser', 2, 1, 2, '2023-10-06 14:42:19', '2023-10-06 14:42:19');

-- --------------------------------------------------------

--
-- Table structure for table `Roles`
--

CREATE TABLE `Roles` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Roles`
--

INSERT INTO `Roles` (`id`, `name`, `slug`, `active`, `createdAt`, `updatedAt`) VALUES
(1, 'Admin', 'admin', 1, '2023-10-06 07:32:43', '2023-10-06 07:32:43'),
(2, 'HR', 'hr', 1, '2023-10-06 07:32:43', '2023-10-06 07:32:43'),
(3, 'Sr php developer', 'sr_php_developer', 1, '2023-10-06 07:32:43', '2023-10-06 07:32:43'),
(4, 'Developer', 'developer', 1, '2023-10-06 07:32:43', '2023-10-06 07:32:43'),
(5, 'Jr php developer', 'jr_php_developer', 1, '2023-10-06 07:32:43', '2023-10-06 07:32:43');

-- --------------------------------------------------------

--
-- Table structure for table `SequelizeMeta`
--

CREATE TABLE `SequelizeMeta` (
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `SequelizeMeta`
--

INSERT INTO `SequelizeMeta` (`name`) VALUES
('20230801051752-create-user.js'),
('20230802102508-create-product-categories.js'),
('20231006071403-create-roles.js'),
('20231006090127-create-menus.js');

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `id` int NOT NULL,
  `fullname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` text,
  `role` int NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`id`, `fullname`, `email`, `password`, `role`, `createdAt`, `updatedAt`) VALUES
(5, 'Atish Rana', 'admin@gmail.com', '$2b$10$pu6Pmu.fdX/OP6sdiN.TYOGAyf6R5DdwPrhHO6db410k3mEG7INHu', 1, '2023-08-01 10:03:25', '2023-08-01 10:03:25'),
(15, 'jaswinder Singh', 'jaswindersingh.think@gmail.com', '$2b$10$sfVF9vnhyK.I6vTxIC8cfuQiJKozBFPj.2KtL4EFzlwNRU7tmWisq', 4, '2023-08-07 06:24:40', '2023-08-07 06:24:40'),
(18, 'Atish Rana', 'atish.think@gmail.com', '$2b$10$pu6Pmu.fdX/OP6sdiN.TYOGAyf6R5DdwPrhHO6db410k3mEG7INHu', 3, '2023-09-26 04:03:42', '2023-09-26 04:03:42');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Menus`
--
ALTER TABLE `Menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Roles`
--
ALTER TABLE `Roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `SequelizeMeta`
--
ALTER TABLE `SequelizeMeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Menus`
--
ALTER TABLE `Menus`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `Roles`
--
ALTER TABLE `Roles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
