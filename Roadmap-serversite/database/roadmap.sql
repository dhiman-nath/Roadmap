-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 05, 2025 at 01:08 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `roadmap`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Feature', NULL, NULL),
(2, 'In progress', NULL, NULL),
(3, 'Planned', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `comment_text` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `item_id`, `parent_id`, `comment_text`, `created_at`, `updated_at`) VALUES
(1, 5, 1, NULL, 'Nice & Attractive', '2025-06-24 03:15:50', '2025-06-24 03:15:50'),
(2, 5, 1, NULL, 'Nice & Attractive', '2025-06-24 03:16:36', '2025-06-24 03:16:36'),
(4, 5, 1, 1, 'dfsdfs', '2025-06-24 05:25:00', '2025-06-24 05:25:00'),
(5, 5, 1, 4, 'dfs', '2025-06-24 05:25:54', '2025-06-24 05:25:54'),
(6, 5, 1, 1, 'fgdfgdfg', '2025-06-24 05:26:52', '2025-06-24 05:26:52'),
(7, 5, 1, 4, 'fgd', '2025-06-24 05:27:01', '2025-06-24 05:27:01'),
(19, 5, 2, NULL, 'uyuyuyh', '2025-06-24 06:43:27', '2025-06-24 06:43:27'),
(20, 5, 2, 19, 'ooo', '2025-06-24 06:43:40', '2025-06-24 06:43:40'),
(21, 5, 2, NULL, 'oooooooooooooooooooooooooo', '2025-06-24 06:43:47', '2025-06-24 06:43:47'),
(22, 5, 2, 21, 'huhuihih', '2025-06-24 06:43:59', '2025-06-24 06:43:59'),
(23, 5, 1, NULL, 'rtrtrr', '2025-06-24 07:41:29', '2025-06-24 07:41:29'),
(24, 5, 1, NULL, 'ererer', '2025-06-24 07:42:30', '2025-06-24 07:42:30'),
(25, 5, 1, NULL, 'trytytreyt', '2025-06-24 07:44:31', '2025-06-24 07:44:31'),
(26, 5, 1, NULL, 'ererererer', '2025-06-24 07:55:17', '2025-06-24 07:55:17'),
(27, 5, 1, NULL, 'wewqewwwwwwwwwwwwwwwwwwwww', '2025-06-24 07:55:28', '2025-06-24 07:55:28'),
(28, 5, 1, NULL, 'wqewewe', '2025-06-24 07:56:03', '2025-06-24 07:56:03'),
(30, 7, 1, NULL, 'hvvv', '2025-07-05 03:41:20', '2025-07-05 03:41:20');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `item_name`, `description`, `status`, `category_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Dark mode support', 'Add an option to switch to a dark theme', 1, 1, 1, NULL, NULL),
(2, 'Improved Performance', 'Optimize the application load faster', 1, 2, 1, NULL, NULL),
(3, 'New Feature A', 'Description For a new feature', 1, 3, 1, NULL, NULL),
(4, 'New item feature', 'Very effective', 1, 1, 7, NULL, NULL),
(5, 'Two-Factor Authentication', 'Two-Factor Authentication', 1, 3, 5, NULL, NULL),
(6, 'Multi-language Support', 'Add localization support for multiple languages.', 1, 2, 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2019_12_14_000001_create_personal_access_tokens_table', 2),
(10, '2025_06_17_094459_create_categories_table', 2),
(11, '2025_06_19_070937_create_items_table', 2),
(12, '2025_06_19_071214_create_votes_table', 2),
(13, '2025_06_19_071232_create_comments_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 3, 'api', 'c19856dbd88e2ee47a827a0a32ed9cf13dcd7f7feb380c102fb5623625f10bed', '[\"*\"]', NULL, NULL, '2025-06-23 03:05:27', '2025-06-23 03:05:27'),
(2, 'App\\Models\\User', 4, 'api', 'cea240feb5676a0dd285eaa650e11a05ee0d59d709056a4a1c449b206729cb26', '[\"*\"]', NULL, NULL, '2025-06-23 23:05:25', '2025-06-23 23:05:25'),
(3, 'App\\Models\\User', 4, 'api', '655ca4a13471223c3d086c1edd7ce108e98d07c0fb2658cb1d222b83c55748ac', '[\"*\"]', NULL, NULL, '2025-06-23 23:07:30', '2025-06-23 23:07:30'),
(4, 'App\\Models\\User', 4, 'api', 'c9425bc1f83551d52eaa3a97f0cdcdb7924e9935afc5d15302849558684a94eb', '[\"*\"]', NULL, NULL, '2025-06-23 23:31:39', '2025-06-23 23:31:39'),
(5, 'App\\Models\\User', 4, 'api', 'ca80b532cff11146f643d56447311603d4fa339dfc4f636a3315a0e633a13cac', '[\"*\"]', NULL, NULL, '2025-06-23 23:31:45', '2025-06-23 23:31:45'),
(7, 'App\\Models\\User', 6, 'api', '4ebe974a6c8c5df144aaa602d8b0feb5544f13cf6c3132dc1372608fa5f84177', '[\"*\"]', NULL, NULL, '2025-06-23 23:54:28', '2025-06-23 23:54:28'),
(20, 'App\\Models\\User', 5, 'api', '18aadd431a2f67b323bf351de6c76d9cb2a349570b742a72c851c7bbe6bd4c7b', '[\"*\"]', '2025-06-24 07:26:34', NULL, '2025-06-24 07:22:12', '2025-06-24 07:26:34'),
(21, 'App\\Models\\User', 5, 'api', '1c0884f04381dcf77772c737d79ebff300ce5f8b57b518ce5e55df0128372f58', '[\"*\"]', '2025-06-24 07:28:48', NULL, '2025-06-24 07:28:48', '2025-06-24 07:28:48'),
(22, 'App\\Models\\User', 5, 'api', 'b4c69b0818c36671904724de2acca36d0b65e471f39e7081c512109afb291f97', '[\"*\"]', '2025-06-24 07:28:58', NULL, '2025-06-24 07:28:58', '2025-06-24 07:28:58'),
(23, 'App\\Models\\User', 5, 'api', 'e283971da04bd0ab8ac01e22439f9a3f7faecbd48571559aa531d156cd88889f', '[\"*\"]', '2025-06-24 07:31:10', NULL, '2025-06-24 07:29:53', '2025-06-24 07:31:10'),
(24, 'App\\Models\\User', 5, 'api', 'e34fa3aeb06706aec3f1d429583774fb183cbc665928116e29b27adb850d9180', '[\"*\"]', '2025-06-24 07:31:25', NULL, '2025-06-24 07:31:24', '2025-06-24 07:31:25'),
(25, 'App\\Models\\User', 5, 'api', 'b69bad180435e5f00ebbcfcdd6bab5d2686c5e7393c2cc1d5416004c6fc2955b', '[\"*\"]', '2025-06-24 08:09:34', NULL, '2025-06-24 07:31:36', '2025-06-24 08:09:34'),
(26, 'App\\Models\\User', 5, 'api', '9f444d914074980c1293bc9965ebab0c7614908cf096e4a79738c7923520d5bb', '[\"*\"]', '2025-06-24 08:15:16', NULL, '2025-06-24 08:15:16', '2025-06-24 08:15:16'),
(27, 'App\\Models\\User', 5, 'api', 'b7ed97a1cd0b9bb734d71054d34ff751f2032916d82e98093a8fea55aef8134a', '[\"*\"]', '2025-07-05 03:32:15', NULL, '2025-06-30 03:55:30', '2025-07-05 03:32:15'),
(28, 'App\\Models\\User', 7, 'api', 'cc72bad9f2b43c6c8d879a179645448d1e2659f629eee83bd3bd62692ffb3a99', '[\"*\"]', NULL, NULL, '2025-07-05 03:35:16', '2025-07-05 03:35:16'),
(29, 'App\\Models\\User', 7, 'api', '5b2528652da9beb4d71fb57241c30756a0799d1e3adf869aff1b5ec51dad5df6', '[\"*\"]', '2025-07-05 04:40:57', NULL, '2025-07-05 03:35:23', '2025-07-05 04:40:57'),
(30, 'App\\Models\\User', 7, 'api', 'a0ff88655d36faf78b89ecdca199ebbcf62ae5d1dc55e9979fd4a4e7231b67b4', '[\"*\"]', '2025-07-05 04:34:27', NULL, '2025-07-05 04:33:58', '2025-07-05 04:34:27');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Dhiman Nath', 'dhiman.nath.cse@gmail.com', '12345678', NULL, NULL, NULL),
(2, 'Azizur rahman', 'munnachy@gmail.com', '12345678', NULL, NULL, NULL),
(3, 'Joyanta Dutta', 'joy123@gmail.com', '$2y$12$gN1uA41Sn9wLfHdR6tKoBeD7/q5T4DUP47.5BhXPZEE4KyruIeGye', NULL, '2025-06-23 03:05:27', '2025-06-23 03:05:27'),
(4, 'Imran vai degree', 'shariar@gmail.com', '$2y$12$ltOWFLWxpkeeSueTJDycyO0896/gE8I90V6WY2Tw1fOeJWQx8RJbG', NULL, '2025-06-23 23:05:25', '2025-06-23 23:05:25'),
(5, 'Shama Devi', 'shama@gmail.com', '$2y$12$AleC8JMFK2fAr3eMl1Inbudpxn1..heTaTbE8LiKUZHPc7lXu/CuO', NULL, '2025-06-23 23:44:22', '2025-06-23 23:44:22'),
(6, 'Anisur Rahman Akib', 'dabinharis@gmail.com', '$2y$12$L.7Cp3Elccysw6e/tfSkiu7eyofp/9/T/8mTPhWKoFQYb/1m1kWsm', NULL, '2025-06-23 23:54:28', '2025-06-23 23:54:28'),
(7, 'Shimanta Sagar', 'manta@gmail.com', '$2y$12$RKadD9SQDuLBmeBSd132EuNZMVFajDNLaNpoGOwZpH5yKoj5kKSRm', NULL, '2025-07-05 03:35:16', '2025-07-05 03:35:16');

-- --------------------------------------------------------

--
-- Table structure for table `votes`
--

CREATE TABLE `votes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `votes`
--

INSERT INTO `votes` (`id`, `user_id`, `item_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '2025-06-23 03:07:17', '2025-06-23 03:07:17'),
(2, 5, 2, '2025-06-24 00:53:59', '2025-06-24 00:53:59'),
(3, 5, 1, '2025-06-24 00:54:06', '2025-06-24 00:54:06'),
(4, 5, 3, '2025-06-24 02:26:07', '2025-06-24 02:26:07'),
(5, 7, 1, '2025-07-05 03:35:27', '2025-07-05 03:35:27'),
(6, 7, 2, '2025-07-05 03:35:32', '2025-07-05 03:35:32'),
(7, 7, 4, '2025-07-05 04:40:52', '2025-07-05 04:40:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_user_id_foreign` (`user_id`),
  ADD KEY `comments_item_id_foreign` (`item_id`),
  ADD KEY `comments_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `items_category_id_foreign` (`category_id`),
  ADD KEY `items_user_id_foreign` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `votes`
--
ALTER TABLE `votes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `votes_user_id_foreign` (`user_id`),
  ADD KEY `votes_item_id_foreign` (`item_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `votes`
--
ALTER TABLE `votes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `items_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `votes`
--
ALTER TABLE `votes`
  ADD CONSTRAINT `votes_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `votes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
