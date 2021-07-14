-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 21, 2021 at 12:29 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sms`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` int(191) NOT NULL,
  `attendance_id` varchar(191) CHARACTER SET ascii NOT NULL,
  `student_id` varchar(191) CHARACTER SET ascii NOT NULL,
  `attendance_status` varchar(191) NOT NULL,
  `attendance_date` date NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `attendances`
--

INSERT INTO `attendances` (`id`, `attendance_id`, `student_id`, `attendance_status`, `attendance_date`, `created_at`, `updated_at`) VALUES
(2, '60be680e9a3b6', '60aa99966b6ce', 'absent', '2021-06-19', '2021-06-07 22:40:14', '2021-06-07 23:21:51'),
(5, '60be6e0e63054', '60aa327e73ac7', 'permission', '2021-06-19', '2021-06-07 23:05:50', '2021-06-07 23:21:42'),
(6, '60be6e8202774', '60aa326b4be3b', 'present', '2021-06-19', '2021-06-07 23:07:46', '2021-06-07 23:22:13'),
(7, '60be79b22a095', '60aa996c2f5c1', 'present', '2021-06-19', '2021-06-07 23:55:30', '2021-06-07 23:55:30'),
(8, '60be79b2450ea', '60aa99207afb5', 'present', '2021-06-19', '2021-06-07 23:55:30', '2021-06-07 23:55:30'),
(9, '60bebefbb826d', '60aa99966b6ce', 'present', '2021-06-19', '2021-06-08 04:51:07', '2021-06-08 04:51:07'),
(10, '60bebf028d11a', '60aa327e73ac7', 'absent', '2021-06-19', '2021-06-08 04:51:14', '2021-06-08 04:51:14'),
(11, '60bebf13c7091', '60aa326b4be3b', 'absent', '2021-06-19', '2021-06-08 04:51:31', '2021-06-08 04:51:31'),
(12, '60c17331ec512', '60aa99966b6ce', 'present', '2021-06-19', '2021-06-10 06:04:33', '2021-06-10 06:04:33'),
(13, '60c1733201d6f', '60aa327e73ac7', 'absent', '2021-06-19', '2021-06-10 06:04:34', '2021-06-10 06:04:34'),
(14, '60c1733209f86', '60aa326b4be3b', 'permission', '2021-06-19', '2021-06-10 06:04:34', '2021-06-10 06:04:34'),
(15, '60c17340dd5e8', '60aa996c2f5c1', 'present', '2021-06-19', '2021-06-10 06:04:48', '2021-06-10 06:04:48'),
(16, '60c17340e522e', '60aa99207afb5', 'permission', '2021-06-19', '2021-06-10 06:04:48', '2021-06-10 06:04:48'),
(17, '60c2c008cbaf4', '60aa99966b6ce', 'present', '2021-06-19', '2021-06-11 05:44:40', '2021-06-11 05:44:40'),
(18, '60c2c008d83d5', '60aa327e73ac7', 'present', '2021-06-19', '2021-06-11 05:44:40', '2021-06-11 05:45:23'),
(19, '60c2c008e312d', '60aa326b4be3b', 'present', '2021-06-19', '2021-06-11 05:44:40', '2021-06-11 05:45:23');

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_id` varchar(191) CHARACTER SET ascii NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`id`, `class_id`, `name`, `created_at`, `updated_at`) VALUES
(1, '60a36b2870c24', 'FORM I ART', '2021-05-18 14:22:16', '2021-05-18 14:22:16'),
(2, '60a36b8691e8a', 'FORM II ART', '2021-05-18 14:23:50', '2021-05-18 14:23:50'),
(3, '60a36b8e4457e', 'FORM III ART', '2021-05-18 14:23:58', '2021-05-18 14:23:58'),
(4, '60a36b94b5b47', 'FORM IV ART', '2021-05-18 14:24:04', '2021-05-18 14:24:04'),
(5, '60a36b9d2295d', 'FORM I SCIENCE', '2021-05-18 14:24:13', '2021-05-18 14:49:02'),
(6, '60a36bac690cb', 'FORM II SCIENCE', '2021-05-18 14:24:28', '2021-06-08 05:16:20');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(5, '2014_10_12_000000_create_users_table', 1),
(6, '2014_10_12_100000_create_password_resets_table', 1),
(7, '2019_08_19_000000_create_failed_jobs_table', 1),
(8, '2021_05_05_182237_create_articles_table', 1),
(9, '2021_05_10_112900_create_subjectsps_table', 1),
(10, '2021_05_10_113037_create_subjects_table', 1),
(11, '2021_05_10_113054_create_classes_table', 1),
(12, '2021_05_10_113113_create_teachers_table', 1),
(13, '2021_05_10_113152_create_timetables_table', 1),
(14, '2021_05_23_094544_results', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `id` int(191) NOT NULL,
  `result_id` varchar(191) NOT NULL,
  `class_id` varchar(191) CHARACTER SET armscii8 NOT NULL,
  `student_id` varchar(191) CHARACTER SET ascii NOT NULL,
  `subject_id` varchar(191) CHARACTER SET ascii NOT NULL,
  `score` int(3) NOT NULL,
  `result_status` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `results`
--

INSERT INTO `results` (`id`, `result_id`, `class_id`, `student_id`, `subject_id`, `score`, `result_status`, `created_at`, `updated_at`) VALUES
(164, '60c1fd6014ddd', '60A36B9D2295D', '60c19814bcc3d', '60a369700b6c9', 50, '', '2021-06-10 15:54:08', '2021-06-10 15:55:38'),
(165, '60c1fd601c2ba', '60A36B9D2295D', '60c19814bcc3d', '60a36e0d0d937', 0, 'null', '2021-06-10 15:54:08', '2021-06-10 15:54:08'),
(166, '60c1fd60244c3', '60A36B9D2295D', '60c19814bcc3d', '60a36df918d39', 0, 'null', '2021-06-10 15:54:08', '2021-06-10 15:54:08'),
(167, '60c1fd602c6ce', '60A36B9D2295D', '60c19814bcc3d', '60a36dd40eb25', 0, 'null', '2021-06-10 15:54:08', '2021-06-10 15:54:08'),
(168, '60c1fd6034920', '60A36B9D2295D', '60c19814bcc3d', '60a36ad34c749', 0, 'null', '2021-06-10 15:54:08', '2021-06-10 15:54:08'),
(169, '60c1fd603cb47', '60A36B9D2295D', '60aa996c2f5c1', '60a369700b6c9', 60, '', '2021-06-10 15:54:08', '2021-06-10 15:55:38'),
(170, '60c1fd6044e53', '60A36B9D2295D', '60aa996c2f5c1', '60a36e0d0d937', 0, 'null', '2021-06-10 15:54:08', '2021-06-10 15:54:08'),
(171, '60c1fd604d273', '60A36B9D2295D', '60aa996c2f5c1', '60a36df918d39', 0, 'null', '2021-06-10 15:54:08', '2021-06-10 15:54:08'),
(172, '60c1fd6055491', '60A36B9D2295D', '60aa996c2f5c1', '60a36dd40eb25', 0, 'null', '2021-06-10 15:54:08', '2021-06-10 15:54:08'),
(173, '60c1fd605d623', '60A36B9D2295D', '60aa996c2f5c1', '60a36ad34c749', 0, 'null', '2021-06-10 15:54:08', '2021-06-10 15:54:08'),
(174, '60c1fd6065936', '60A36B9D2295D', '60aa99207afb5', '60a369700b6c9', 80, '', '2021-06-10 15:54:08', '2021-06-10 15:55:38'),
(175, '60c1fd606dbb6', '60A36B9D2295D', '60aa99207afb5', '60a36e0d0d937', 0, 'null', '2021-06-10 15:54:08', '2021-06-10 15:54:08'),
(176, '60c1fd6075dcd', '60A36B9D2295D', '60aa99207afb5', '60a36df918d39', 0, 'null', '2021-06-10 15:54:08', '2021-06-10 15:54:08'),
(177, '60c1fd607dfee', '60A36B9D2295D', '60aa99207afb5', '60a36dd40eb25', 0, 'null', '2021-06-10 15:54:08', '2021-06-10 15:54:08'),
(178, '60c1fd6086220', '60A36B9D2295D', '60aa99207afb5', '60a36ad34c749', 0, 'null', '2021-06-10 15:54:08', '2021-06-10 15:54:08'),
(179, '60c1fd6451251', '60A36B2870C24', '60aa99966b6ce', '60a369700b6c9', 60, '', '2021-06-10 15:54:12', '2021-06-11 05:56:19'),
(180, '60c1fd6484c37', '60A36B2870C24', '60aa99966b6ce', '60a36e0d0d937', 90, '', '2021-06-10 15:54:12', '2021-06-11 05:55:28'),
(181, '60c1fd648cde8', '60A36B2870C24', '60aa99966b6ce', '60a36df918d39', 88, '', '2021-06-10 15:54:12', '2021-06-11 05:57:07'),
(182, '60c1fd6494fa4', '60A36B2870C24', '60aa99966b6ce', '60a36dd40eb25', 0, 'null', '2021-06-10 15:54:12', '2021-06-10 15:54:12'),
(183, '60c1fd649d26c', '60A36B2870C24', '60aa99966b6ce', '60a36ad34c749', 40, '', '2021-06-10 15:54:12', '2021-06-10 15:54:40'),
(184, '60c1fd64a53bb', '60A36B2870C24', '60aa327e73ac7', '60a369700b6c9', 40, '', '2021-06-10 15:54:12', '2021-06-11 05:56:19'),
(185, '60c1fd64ad721', '60A36B2870C24', '60aa327e73ac7', '60a36e0d0d937', 10, '', '2021-06-10 15:54:12', '2021-06-11 05:55:29'),
(186, '60c1fd64b589d', '60A36B2870C24', '60aa327e73ac7', '60a36df918d39', 76, '', '2021-06-10 15:54:12', '2021-06-11 05:57:07'),
(187, '60c1fd64bdc88', '60A36B2870C24', '60aa327e73ac7', '60a36dd40eb25', 0, 'null', '2021-06-10 15:54:12', '2021-06-10 15:54:12'),
(188, '60c1fd64c5d10', '60A36B2870C24', '60aa327e73ac7', '60a36ad34c749', 54, '', '2021-06-10 15:54:12', '2021-06-10 15:54:40'),
(189, '60c1fd64cdf92', '60A36B2870C24', '60aa326b4be3b', '60a369700b6c9', 29, '', '2021-06-10 15:54:12', '2021-06-11 05:56:19'),
(190, '60c1fd64d6199', '60A36B2870C24', '60aa326b4be3b', '60a36e0d0d937', 41, '', '2021-06-10 15:54:12', '2021-06-11 05:55:29'),
(191, '60c1fd64de401', '60A36B2870C24', '60aa326b4be3b', '60a36df918d39', 99, '', '2021-06-10 15:54:12', '2021-06-11 05:57:07'),
(192, '60c1fd64e6553', '60A36B2870C24', '60aa326b4be3b', '60a36dd40eb25', 0, 'null', '2021-06-10 15:54:12', '2021-06-10 15:54:12'),
(193, '60c1fd64ee7bb', '60A36B2870C24', '60aa326b4be3b', '60a36ad34c749', 12, '', '2021-06-10 15:54:12', '2021-06-10 15:54:40'),
(194, '60c2c3277eec6', '60A36B2870C24', '60aa99966b6ce', '60c2c32001a9a', 66, '', '2021-06-11 05:57:59', '2021-06-11 05:58:31'),
(195, '60c2c327a525f', '60A36B2870C24', '60aa327e73ac7', '60c2c32001a9a', 33, '', '2021-06-11 05:57:59', '2021-06-11 05:58:31'),
(196, '60c2c327b0752', '60A36B2870C24', '60aa326b4be3b', '60c2c32001a9a', 23, '', '2021-06-11 05:57:59', '2021-06-11 05:58:31'),
(197, '60c2c3dea3eae', '60a36b94b5b47', '60c2c3b35295e', '60a36dd40eb25', 25, '', '2021-06-11 06:01:02', '2021-06-11 06:01:21'),
(198, '60c2c3f954a0d', '60A36B94B5B47', '60c2c3b35295e', '60c2c364be7a8', 0, 'null', '2021-06-11 06:01:29', '2021-06-11 06:01:29'),
(199, '60c2c3f95e3ce', '60A36B94B5B47', '60c2c3b35295e', '60c2c32001a9a', 0, 'null', '2021-06-11 06:01:29', '2021-06-11 06:01:29'),
(200, '60c2c3f968fe9', '60A36B94B5B47', '60c2c3b35295e', '60a369700b6c9', 0, 'null', '2021-06-11 06:01:29', '2021-06-11 06:01:29'),
(201, '60c2c3f973cb6', '60A36B94B5B47', '60c2c3b35295e', '60a36e0d0d937', 0, 'null', '2021-06-11 06:01:29', '2021-06-11 06:01:29'),
(202, '60c2c3f994265', '60A36B94B5B47', '60c2c3b35295e', '60a36df918d39', 0, 'null', '2021-06-11 06:01:29', '2021-06-11 06:01:29'),
(203, '60c2c3f99f931', '60A36B94B5B47', '60c2c3b35295e', '60a36ad34c749', 0, 'null', '2021-06-11 06:01:29', '2021-06-11 06:01:29');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint(10) NOT NULL,
  `student_id` varchar(191) CHARACTER SET ascii NOT NULL,
  `fname` varchar(191) NOT NULL,
  `sname` varchar(191) NOT NULL,
  `tname` varchar(191) NOT NULL,
  `class` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `student_id`, `fname`, `sname`, `tname`, `class`, `phone`, `created_at`, `updated_at`) VALUES
(16, '60aa326b4be3b', 'Emmanuel', 'Sammba', 'Magari', '60a36b2870c24', '0788994944', '2021-05-23 07:46:03', '2021-05-23 07:46:03'),
(17, '60aa327e73ac7', 'Juma', 'Petro', 'Jackson', '60a36b2870c24', '+255769314295', '2021-05-23 07:46:22', '2021-05-23 07:46:22'),
(18, '60aa99207afb5', 'Julius', 'M', 'Michael', '60a36b9d2295d', '0788456633', '2021-05-23 15:04:16', '2021-05-23 15:04:16'),
(19, '60aa996c2f5c1', 'Marisa', 'J', 'Kolana', '60a36b9d2295d', '0776556644', '2021-05-23 15:05:32', '2021-05-23 15:05:32'),
(20, '60aa99966b6ce', 'Andrew', 'M', 'Mjuni', '60a36b2870c24', '0766546632', '2021-05-23 15:06:14', '2021-05-23 15:06:14'),
(21, '60c19814bcc3d', 'Kelvin', 'Albert', 'Mutalemwa', '60a36b9d2295d', '0756774566', '2021-06-10 08:41:56', '2021-06-10 08:41:56'),
(22, '60c2c3b35295e', 'ASHA', 'JUMA', 'NGEDELE', '60a36b94b5b47', 'UUFDSD', '2021-06-11 06:00:19', '2021-06-11 06:00:19'),
(23, '60c2c5b4bd73f', 're', 're', 'rer', '60a36bac690cb', '9394', '2021-06-11 06:08:52', '2021-06-11 06:08:52');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subject_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `subject_id`, `name`, `created_at`, `updated_at`) VALUES
(1, '60a369700b6c9', 'GEOGRAPHY', '2021-05-18 14:14:56', '2021-05-18 14:56:00'),
(2, '60a36ad34c749', 'HISTORY', '2021-05-18 14:20:51', '2021-05-18 14:20:51'),
(3, '60a36dd40eb25', 'BIOLOGY', '2021-05-18 14:33:40', '2021-05-18 14:33:40'),
(4, '60a36df918d39', 'MATHEMATICS', '2021-05-18 14:34:17', '2021-05-18 14:34:17'),
(5, '60a36e0d0d937', 'ENGLISH', '2021-05-18 14:34:37', '2021-05-18 14:34:37'),
(9, '60c2c32001a9a', 'CIVICS', '2021-06-11 05:57:52', '2021-06-11 05:57:52'),
(10, '60c2c364be7a8', 'KISWAHILI', '2021-06-11 05:59:00', '2021-06-11 05:59:00');

-- --------------------------------------------------------

--
-- Table structure for table `subjectsps`
--

CREATE TABLE `subjectsps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `teacher_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `teacher_id`, `fname`, `sname`, `tname`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(4, '60a2dc18d10c8', 'Faraja', 'Samba', 'Magari', '+255769314295', 'faraja@gmail.com', '2021-05-18 04:11:52', '2021-05-18 04:17:28'),
(5, '60a39712a4605', 'Emmanuel', 'Masawe', 'Magari', '+255769800800', 'masawe@gmail.com', '2021-05-18 17:29:38', '2021-05-18 17:29:38');

-- --------------------------------------------------------

--
-- Table structure for table `timetables`
--

CREATE TABLE `timetables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `timetable_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `teacher_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `day` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `timetables`
--

INSERT INTO `timetables` (`id`, `timetable_id`, `teacher_id`, `subject_id`, `class_id`, `day`, `time`, `created_at`, `updated_at`) VALUES
(1, '60beb8a6bd4bc', '60a2dc18d10c8', '60a36ad34c749', '60a36b2870c24', 'Monday', '08:00:00', '2021-06-08 04:24:06', '2021-06-08 04:24:06'),
(2, '60beb9e5de911', '60a39712a4605', '60a369700b6c9', '60a36bac690cb', 'Monday', '08:00:00', '2021-06-08 04:29:25', '2021-06-08 04:29:25');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `role`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Pedro Jackson', 'Head Master', 'petrojackson5@gmail.com', NULL, '$2y$10$G/S9VBL9Cybp8Sn3iyVOxe4JlxmNTRzoIr63CVnu08ZSVUxzCLBrq', NULL, '2021-05-10 18:51:58', '2021-05-11 17:45:55'),
(2, 'issa', 'Head Master', 'issa@sms', NULL, '$2y$10$vQw5tVn3Of5TEoM0bA0Y0eX4aYFUJaZB/Y6kqZcVxNtFChi4IM.ce', NULL, '2021-05-12 00:36:14', '2021-05-12 00:36:14'),
(7, 'Faraja Samba Magari', '', 'faraja@gmail.com', NULL, '$2y$10$.8vCqIvNQCSwXZQLOIM1Eu75cNe7PmhWV8nSVbDL0mX.ECfHW3xzy', NULL, '2021-05-18 04:11:52', '2021-05-18 04:17:28'),
(8, 'Emmanuel Masawe Magari', '', 'masawe@gmail.com', NULL, '$2y$10$.8vCqIvNQCSwXZQLOIM1Eu75cNe7PmhWV8nSVbDL0mX.ECfHW3xzy', NULL, '2021-05-18 17:29:38', '2021-05-18 17:29:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `subjectsps`
--
ALTER TABLE `subjectsps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `timetables`
--
ALTER TABLE `timetables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `results`
--
ALTER TABLE `results`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `subjectsps`
--
ALTER TABLE `subjectsps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `timetables`
--
ALTER TABLE `timetables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`email`) REFERENCES `users` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
