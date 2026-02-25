-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 21-01-2026 a las 16:53:19
-- Versión del servidor: 9.1.0
-- Versión de PHP: 8.4.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbphppec4_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache`
--

DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_01_19_205208_create_topics_table', 1),
(5, '2026_01_19_205916_create_museums_table', 1),
(6, '2026_01_19_210329_create_museum_topic_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `museums`
--

DROP TABLE IF EXISTS `museums`;
CREATE TABLE IF NOT EXISTS `museums` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `schedule` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `guided_tours` enum('sí','no') COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `museums`
--

INSERT INTO `museums` (`id`, `name`, `city`, `schedule`, `guided_tours`, `price`, `image`, `created_at`, `updated_at`) VALUES
(1, 'British Museum', 'Londres', 'Lunes a Sábado, 10:00–20:00', 'sí', 15.50, 'images/museums/british.jpg', '2026-01-19 20:40:13', '2026-01-20 21:19:01'),
(2, 'Louvre Museum', 'París', 'Martes a Domingo, 09:00–18:00', 'sí', 17.00, 'images/museums/louvre.jpg', '2026-01-19 20:41:04', '2026-01-20 21:20:09'),
(3, 'Bradtke-Williamson Museum', 'Natmouth', 'Martes a Sábado, 10:00–21:30', 'sí', 17.24, 'images/museums/b8befbf0-13c7-3d2b-a2ac-756093db0d2a.jpg', '2026-01-20 09:10:10', '2026-01-20 09:40:01'),
(4, 'Corwin Ltd Museum', 'East Richard', 'Miércoles a Jueves, 08:00–21:30', 'no', 7.28, 'images/museums/8451549e-db57-3c87-b43c-d445278993e5.jpg', '2026-01-20 09:10:10', '2026-01-20 09:40:01'),
(5, 'Dach Ltd Museum', 'Okunevamouth', 'Lunes a Sábado, 08:00–21:30', 'sí', 5.05, 'images/museums/8dcbfb08-3a00-3056-949f-6a8603f54a35.jpg', '2026-01-20 09:10:10', '2026-01-20 09:40:01'),
(6, 'Green, Armstrong and Trantow Museum', 'West Elizabury', 'Lunes a Sábado, 08:00–09:00', 'sí', 17.83, 'images/museums/829af703-3a49-3451-be85-e9a01b8c3a2c.jpg', '2026-01-20 09:10:10', '2026-01-20 09:40:01'),
(7, 'Krajcik and Sons Museum', 'Gorczanymouth', 'Lunes a Miércoles, 08:00–21:30', 'no', 6.43, 'images/museums/1fac0cf3-78e3-3d3e-99af-2e709c43987d.jpg', '2026-01-20 09:10:10', '2026-01-20 09:40:01'),
(8, 'Kovacek Inc Museum', 'Krisfurt', 'Martes a Viernes, 11:30–19:30', 'sí', 17.48, 'images/museums/c7d8bbab-d6f9-318e-aa04-73bf4429ba11.jpg', '2026-01-20 09:10:10', '2026-01-20 09:40:01'),
(9, 'Simonis-Torphy Museum', 'North Randall', 'Martes a Domingo, 12:30–16:30', 'sí', 14.16, 'images/museums/8a1a890e-2ef2-3016-80c4-e31b6e123db8.jpg', '2026-01-20 09:10:10', '2026-01-20 09:40:01'),
(10, 'Kris, Collins and Koepp Museum', 'Beahanton', 'Miércoles a Viernes, 12:30–15:30', 'no', 20.15, 'images/museums/c37ed999-cd1e-3619-88ab-04f0f29b53af.jpg', '2026-01-20 09:10:10', '2026-01-20 09:40:01'),
(11, 'Schowalter, Koss and Spencer Museum', 'Goyettefurt', 'Martes a Jueves, 09:00–21:30', 'no', 8.41, 'images/museums/1ef4eeca-504e-3f81-8ef0-0f341b0ac35c.jpg', '2026-01-20 09:10:10', '2026-01-20 09:40:01'),
(12, 'Metz LLC Museum', 'Lilianshire', 'Martes a Miércoles, 08:00–21:30', 'no', 19.25, 'images/museums/e7021231-bd41-3c8e-b187-f4e8c3eab61b.jpg', '2026-01-20 09:10:10', '2026-01-20 09:40:01'),
(13, 'Funk and Sons Museum', 'New Ora', 'Miércoles a Jueves, 08:30–15:00', 'sí', 7.78, 'images/museums/ff9cea2d-db8a-3414-9813-38bbadd8b87c.jpg', '2026-01-20 09:10:10', '2026-01-20 09:40:01'),
(14, 'Upton, Daugherty and Hamill Museum', 'Roobport', 'Miércoles a Jueves, 09:30–20:30', 'sí', 13.84, 'images/museums/245a3195-15e1-321f-97bf-682008b5fb3c.jpg', '2026-01-20 09:10:10', '2026-01-20 09:40:01'),
(15, 'Beatty Inc Museum', 'Port Maya', 'Miércoles a Jueves, 09:00–20:00', 'sí', 8.15, 'images/museums/47690b60-7f04-3e46-ae3e-73313805c2c3.jpg', '2026-01-20 09:10:10', '2026-01-20 09:40:01'),
(16, 'Sanford, Kuhic and Denesik Museum', 'Lake Celineborough', 'Miércoles a Sábado, 11:00–12:30', 'sí', 24.34, 'images/museums/a141683d-ef8f-3a7a-9d4e-4b973cf787ac.jpg', '2026-01-20 09:10:10', '2026-01-20 09:40:01'),
(17, 'Pollich, Thiel and Stanton Museum', 'New Elenora', 'Miércoles a Viernes, 11:30–13:30', 'sí', 14.83, 'images/museums/698ee9c2-6857-3d90-b066-4fd0059b82ae.jpg', '2026-01-20 09:10:10', '2026-01-20 09:40:01'),
(18, 'Dickens-Kessler Museum', 'Koeppport', 'Lunes a Domingo, 10:30–11:00', 'sí', 15.28, 'images/museums/0b3b2b89-0639-3fbd-9e8a-55061ef923da.jpg', '2026-01-20 09:10:10', '2026-01-20 09:40:01'),
(19, 'Klocko, Lind and Jenkins Museum', 'Imeldafort', 'Miércoles a Domingo, 10:00–19:30', 'no', 23.33, 'images/museums/01e251be-b9ec-3e18-99ae-3bee75bfa072.jpg', '2026-01-20 09:10:10', '2026-01-20 09:40:01'),
(20, 'Grant Group Museum', 'East Addieton', 'Martes a Jueves, 10:00–19:00', 'no', 18.41, 'images/museums/0c2d7982-2e1a-3d41-94d7-5a88f2d19b20.jpg', '2026-01-20 09:10:10', '2026-01-20 09:40:01'),
(21, 'Johns, Gusikowski and Fadel Museum', 'South Daphney', 'Martes a Sábado, 08:00–16:30', 'no', 18.38, 'images/museums/473be9ca-beaa-399a-b051-772bf82cbf4f.jpg', '2026-01-20 09:10:10', '2026-01-20 09:40:01'),
(22, 'Beer-Miller Museum', 'Bernardchester', 'Lunes a Jueves, 08:00–19:30', 'no', 20.30, 'images/museums/f72ad864-07fb-35a1-ac22-7606e9f63bf5.jpg', '2026-01-20 09:10:10', '2026-01-20 09:40:01'),
(23, 'Carter-Howell Museum', 'Priceberg', 'Miércoles a Jueves, 11:00–21:30', 'sí', 14.06, 'images/museums/b309d655-dc60-3a98-90d3-e60d45c2baca.jpg', '2026-01-20 09:10:10', '2026-01-20 09:40:01'),
(24, 'Wisoky, Hayes and McKenzie Museum', 'East Elvis', 'Lunes a Miércoles, 10:30–15:30', 'no', 5.28, 'images/museums/f978481e-d250-36b6-89a6-0f7d1194b68a.jpg', '2026-01-20 09:10:10', '2026-01-20 09:40:01'),
(25, 'Bauch-Ferry Museum', 'Queenieberg', 'Martes a Domingo, 09:00–15:30', 'no', 6.81, 'images/museums/141dbe40-b037-381a-b44c-4e9a86d78dc6.jpg', '2026-01-20 09:10:10', '2026-01-20 09:40:01'),
(26, 'O\'Hara Inc Museum', 'Josianeshire', 'Lunes a Viernes, 08:00–13:30', 'no', 6.03, 'images/museums/49610846-673d-34d3-ba9f-6e2c08be2a80.jpg', '2026-01-20 09:10:10', '2026-01-20 09:40:01'),
(27, 'Beahan LLC Museum', 'South Kaia', 'Miércoles a Viernes, 11:30–15:30', 'sí', 18.54, 'images/museums/929a8b01-da35-3d57-ab25-11f9b005d2c7.jpg', '2026-01-20 09:10:10', '2026-01-20 09:40:01'),
(28, 'Christiansen LLC Museum', 'Elishaview', 'Martes a Jueves, 11:00–13:00', 'no', 12.50, 'images/museums/57f91ff6-4bea-3519-aa6e-2e5a9fa30f5a.jpg', '2026-01-20 09:10:10', '2026-01-20 09:40:01'),
(29, 'Hudson-Fahey Museum', 'Hicklefort', 'Lunes a Viernes, 10:00–16:00', 'sí', 11.97, 'images/museums/bc335aa1-47d4-3ddf-943f-1e0011796392.jpg', '2026-01-20 09:10:10', '2026-01-20 09:40:01'),
(30, 'Douglas-Lesch Museum', 'Schusterstad', 'Lunes a Martes, 12:00–18:30', 'no', 20.92, 'images/museums/8990e2cc-8561-3b4d-8bf1-a4c2f783f9c7.jpg', '2026-01-20 09:10:10', '2026-01-20 09:40:01'),
(31, 'Johns Inc Museum', 'Port Whitney', 'Lunes a Martes, 10:30–12:00', 'no', 15.10, 'images/museums/3282609c-ae1f-383c-bfd0-9060e54eb8b0.jpg', '2026-01-20 09:10:10', '2026-01-20 09:40:01'),
(32, 'Champlin Group Museum', 'Brauliomouth', 'Martes a Sábado, 11:30–13:00', 'sí', 11.19, 'images/museums/b68fc924-f599-375c-af72-a051e91c5c40.jpg', '2026-01-20 09:10:10', '2026-01-20 09:40:01'),
(33, 'Hane, Rice and Donnelly Museum', 'Westside', 'Martes a Miércoles, 10:00–19:00', 'no', 5.70, 'images/museums/f06acf89-d990-3627-b85c-f94f1812b18b.jpg', '2026-01-20 09:10:10', '2026-01-20 09:40:01'),
(34, 'Reichert-Legros Museum', 'Daleview', 'Miércoles a Sábado, 11:30–14:30', 'sí', 12.79, 'images/museums/b07aa150-29e7-3855-9b26-1968acdecad8.jpg', '2026-01-20 09:10:10', '2026-01-20 09:40:01'),
(35, 'Windler, Adams and Kuhic Museum', 'Labadieberg', 'Miércoles a Sábado, 09:00–20:00', 'sí', 22.93, 'images/museums/ddd2c3ee-8a82-326a-bc85-9f10e5a9c278.jpg', '2026-01-20 09:10:10', '2026-01-20 09:40:01'),
(36, 'Leffler-Hirthe Museum', 'South Adolphus', 'Martes a Miércoles, 11:30–20:30', 'sí', 6.33, 'images/museums/5c6b1dc4-dbf9-3ecf-8cac-9695c1116b95.jpg', '2026-01-20 09:10:10', '2026-01-20 09:40:01'),
(37, 'Powlowski-Friesen Museum', 'Bernieside', 'Lunes a Martes, 08:00–19:00', 'sí', 11.84, 'images/museums/5547b7de-b936-370b-94c0-f236dc51698f.jpg', '2026-01-20 09:10:10', '2026-01-20 09:40:01'),
(38, 'Kautzer-Sawayn Museum', 'Aiyanafurt', 'Martes a Jueves, 10:30–20:30', 'sí', 21.90, 'images/museums/5fadae7e-5a2f-3eb2-b767-26df6d86bd57.jpg', '2026-01-20 09:10:10', '2026-01-20 09:40:01'),
(39, 'Mueller-Boyer Museum', 'Greggland', 'Miércoles a Domingo, 08:00–17:30', 'sí', 21.23, 'images/museums/c080619a-7662-3c3c-b5d2-85c8b693f0a9.jpg', '2026-01-20 09:10:10', '2026-01-20 09:40:01'),
(40, 'Mante-VonRueden Museum', 'South Michele', 'Martes a Sábado, 11:30–12:00', 'no', 14.75, 'images/museums/5f2404fe-4cb3-3af0-94aa-c646caac9a5d.jpg', '2026-01-20 09:10:10', '2026-01-20 09:40:01'),
(41, 'Adams-Terry Museum', 'Murphyberg', 'Martes a Sábado, 10:00–15:30', 'no', 16.36, 'images/museums/93ef3624-cead-38ad-9885-581873f36094.jpg', '2026-01-20 09:10:10', '2026-01-20 09:40:01'),
(42, 'Mosciski, Pfeffer and Schuster Museum', 'Port Vidal', 'Lunes a Domingo, 09:00–16:00', 'no', 14.30, 'images/museums/161588d1-d923-3b68-a0fa-fdcda3583b85.jpg', '2026-01-20 09:10:10', '2026-01-20 09:40:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `museum_topic`
--

DROP TABLE IF EXISTS `museum_topic`;
CREATE TABLE IF NOT EXISTS `museum_topic` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `museum_id` bigint UNSIGNED NOT NULL,
  `topic_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `museum_topic_museum_id_foreign` (`museum_id`),
  KEY `museum_topic_topic_id_foreign` (`topic_id`)
) ENGINE=MyISAM AUTO_INCREMENT=138 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `museum_topic`
--

INSERT INTO `museum_topic` (`id`, `museum_id`, `topic_id`) VALUES
(1, 1, 1),
(2, 1, 3),
(3, 2, 1),
(4, 2, 4),
(5, 3, 1),
(6, 3, 2),
(7, 3, 5),
(8, 3, 7),
(9, 3, 8),
(10, 4, 2),
(11, 4, 3),
(12, 4, 4),
(13, 4, 5),
(14, 4, 6),
(15, 4, 7),
(16, 4, 8),
(17, 5, 1),
(18, 5, 2),
(19, 5, 3),
(20, 5, 4),
(21, 5, 6),
(22, 5, 8),
(23, 6, 1),
(24, 6, 2),
(25, 6, 3),
(26, 6, 4),
(27, 6, 5),
(28, 6, 6),
(29, 6, 7),
(30, 6, 8),
(31, 7, 2),
(32, 7, 3),
(33, 7, 5),
(34, 7, 6),
(35, 7, 7),
(36, 7, 8),
(37, 8, 1),
(38, 8, 2),
(39, 8, 3),
(40, 8, 4),
(41, 8, 5),
(42, 8, 6),
(43, 8, 7),
(44, 8, 8),
(45, 9, 3),
(46, 9, 4),
(47, 9, 5),
(48, 9, 6),
(49, 10, 1),
(50, 10, 2),
(51, 10, 3),
(52, 10, 4),
(53, 10, 5),
(54, 10, 6),
(55, 10, 7),
(56, 10, 8),
(57, 11, 1),
(58, 11, 2),
(59, 11, 5),
(60, 11, 6),
(61, 11, 7),
(62, 12, 5),
(63, 12, 6),
(64, 12, 7),
(65, 12, 8),
(66, 13, 1),
(67, 13, 2),
(68, 13, 4),
(69, 13, 5),
(70, 13, 7),
(71, 14, 3),
(72, 14, 4),
(73, 14, 5),
(74, 15, 1),
(75, 15, 2),
(76, 15, 3),
(77, 15, 4),
(78, 15, 5),
(79, 15, 6),
(80, 15, 7),
(81, 16, 1),
(82, 16, 7),
(83, 16, 8),
(84, 17, 1),
(85, 17, 4),
(86, 17, 8),
(87, 18, 1),
(88, 18, 2),
(89, 18, 3),
(90, 18, 4),
(91, 18, 6),
(92, 18, 7),
(93, 18, 8),
(94, 19, 1),
(95, 19, 2),
(96, 19, 3),
(97, 19, 4),
(98, 19, 5),
(99, 19, 6),
(100, 19, 7),
(101, 19, 8),
(102, 20, 1),
(103, 20, 2),
(104, 20, 3),
(105, 20, 4),
(106, 20, 5),
(107, 20, 6),
(108, 20, 7),
(109, 20, 8),
(110, 21, 2),
(111, 21, 3),
(112, 21, 5),
(113, 21, 6),
(114, 22, 2),
(115, 22, 3),
(116, 22, 6),
(117, 22, 7),
(118, 23, 4),
(119, 24, 3),
(120, 25, 7),
(121, 26, 4),
(122, 27, 1),
(123, 28, 4),
(124, 29, 8),
(125, 30, 3),
(126, 31, 5),
(127, 32, 3),
(128, 33, 7),
(129, 34, 1),
(130, 35, 4),
(131, 36, 3),
(132, 37, 2),
(133, 38, 3),
(134, 39, 4),
(135, 40, 6),
(136, 41, 4),
(137, 42, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `topics`
--

DROP TABLE IF EXISTS `topics`;
CREATE TABLE IF NOT EXISTS `topics` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `topics`
--

INSERT INTO `topics` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Historia del arte', '2026-01-19 20:38:52', '2026-01-19 20:38:52'),
(2, 'Ciencia', '2026-01-19 20:39:17', '2026-01-19 20:39:17'),
(3, 'Arqueología', '2026-01-19 20:39:23', '2026-01-19 20:39:23'),
(4, 'Arte moderno', '2026-01-19 20:39:27', '2026-01-19 20:39:27'),
(5, 'Fotografía', '2026-01-20 09:10:09', '2026-01-20 09:10:09'),
(6, 'Diseño industrial', '2026-01-20 09:10:09', '2026-01-20 09:10:09'),
(7, 'Astronomía', '2026-01-20 09:10:09', '2026-01-20 09:10:09'),
(8, 'Literatura', '2026-01-20 09:10:09', '2026-01-20 09:10:09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(3, 'admin', 'admin@fakemail.com', NULL, '$2y$12$9JaBJEizXDjEa4Uk8yUSR..Z7lA9V6PWKeoOMTUyiLu2vV3DeURBq', 'FWlCU39UQiOAQWfHkq4A3DUsMyjDIRi11eT1z9SimV0UVXMUCgg0LFBj7kCo', '2026-01-20 17:44:26', '2026-01-20 17:44:26');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
