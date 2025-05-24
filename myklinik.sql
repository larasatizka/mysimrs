/*
 Navicat Premium Dump SQL

 Source Server         : klinik
 Source Server Type    : MySQL
 Source Server Version : 90300 (9.3.0)
 Source Host           : localhost:3306
 Source Schema         : myklinik

 Target Server Type    : MySQL
 Target Server Version : 90300 (9.3.0)
 File Encoding         : 65001

 Date: 24/05/2025 21:15:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for antrians
-- ----------------------------
DROP TABLE IF EXISTS `antrians`;
CREATE TABLE `antrians` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `rekam_id` bigint unsigned NOT NULL,
  `nomor` int NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `antrians_rekam_id_foreign` (`rekam_id`),
  CONSTRAINT `antrians_rekam_id_foreign` FOREIGN KEY (`rekam_id`) REFERENCES `rekams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of antrians
-- ----------------------------
BEGIN;
INSERT INTO `antrians` (`id`, `rekam_id`, `nomor`, `deleted_at`, `created_at`, `updated_at`) VALUES (3, 3, 2, NULL, '2025-05-24 09:02:56', '2025-05-24 09:02:56');
INSERT INTO `antrians` (`id`, `rekam_id`, `nomor`, `deleted_at`, `created_at`, `updated_at`) VALUES (4, 4, 3, NULL, '2025-05-24 09:27:53', '2025-05-24 09:27:53');
INSERT INTO `antrians` (`id`, `rekam_id`, `nomor`, `deleted_at`, `created_at`, `updated_at`) VALUES (5, 5, 4, NULL, '2025-05-24 12:48:38', '2025-05-24 12:48:38');
INSERT INTO `antrians` (`id`, `rekam_id`, `nomor`, `deleted_at`, `created_at`, `updated_at`) VALUES (6, 6, 5, NULL, '2025-05-24 13:01:42', '2025-05-24 13:01:42');
INSERT INTO `antrians` (`id`, `rekam_id`, `nomor`, `deleted_at`, `created_at`, `updated_at`) VALUES (7, 7, 6, NULL, '2025-05-24 13:06:05', '2025-05-24 13:06:05');
INSERT INTO `antrians` (`id`, `rekam_id`, `nomor`, `deleted_at`, `created_at`, `updated_at`) VALUES (8, 8, 7, NULL, '2025-05-24 13:07:15', '2025-05-24 13:07:15');
COMMIT;

-- ----------------------------
-- Table structure for dokters
-- ----------------------------
DROP TABLE IF EXISTS `dokters`;
CREATE TABLE `dokters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `karyawan_id` bigint unsigned NOT NULL,
  `poliklinik_id` bigint unsigned NOT NULL,
  `no_izin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dokters_karyawan_id_foreign` (`karyawan_id`),
  KEY `dokters_poliklinik_id_foreign` (`poliklinik_id`),
  CONSTRAINT `dokters_karyawan_id_foreign` FOREIGN KEY (`karyawan_id`) REFERENCES `karyawans` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dokters_poliklinik_id_foreign` FOREIGN KEY (`poliklinik_id`) REFERENCES `polikliniks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of dokters
-- ----------------------------
BEGIN;
INSERT INTO `dokters` (`id`, `karyawan_id`, `poliklinik_id`, `no_izin`, `deleted_at`, `created_at`, `updated_at`) VALUES (1, 2, 1, '22323232323', NULL, '2025-05-23 16:55:12', '2025-05-23 16:55:12');
INSERT INTO `dokters` (`id`, `karyawan_id`, `poliklinik_id`, `no_izin`, `deleted_at`, `created_at`, `updated_at`) VALUES (2, 4, 1, '22323232323', NULL, '2025-05-23 16:55:12', '2025-05-23 16:55:12');
COMMIT;

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for golongan_obats
-- ----------------------------
DROP TABLE IF EXISTS `golongan_obats`;
CREATE TABLE `golongan_obats` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of golongan_obats
-- ----------------------------
BEGIN;
INSERT INTO `golongan_obats` (`id`, `name`, `deleted_at`, `created_at`, `updated_at`) VALUES (1, 'obat bebas', NULL, '2025-05-23 16:55:10', '2025-05-23 16:55:10');
INSERT INTO `golongan_obats` (`id`, `name`, `deleted_at`, `created_at`, `updated_at`) VALUES (2, 'obat bebas terbatas', NULL, '2025-05-23 16:55:10', '2025-05-23 16:55:10');
INSERT INTO `golongan_obats` (`id`, `name`, `deleted_at`, `created_at`, `updated_at`) VALUES (3, 'obat keras', NULL, '2025-05-23 16:55:10', '2025-05-23 16:55:10');
COMMIT;

-- ----------------------------
-- Table structure for karyawans
-- ----------------------------
DROP TABLE IF EXISTS `karyawans`;
CREATE TABLE `karyawans` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `nip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sex` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_bergabung` date NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `karyawans_user_id_foreign` (`user_id`),
  CONSTRAINT `karyawans_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of karyawans
-- ----------------------------
BEGIN;
INSERT INTO `karyawans` (`id`, `user_id`, `nip`, `alamat`, `phone`, `sex`, `tanggal_bergabung`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES (1, 3, 'ST-123123123232', 'bogor', NULL, 'P', '2025-05-23', 1, NULL, '2025-05-23 16:55:12', '2025-05-23 16:55:12');
INSERT INTO `karyawans` (`id`, `user_id`, `nip`, `alamat`, `phone`, `sex`, `tanggal_bergabung`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES (2, 4, 'DK-3232323232', 'bogor', NULL, 'L', '2025-05-23', 1, NULL, '2025-05-23 16:55:12', '2025-05-23 16:55:12');
INSERT INTO `karyawans` (`id`, `user_id`, `nip`, `alamat`, `phone`, `sex`, `tanggal_bergabung`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES (3, 5, 'AP-42423323', 'bogor', NULL, 'P', '2025-05-23', 1, NULL, '2025-05-23 16:55:12', '2025-05-23 16:55:12');
INSERT INTO `karyawans` (`id`, `user_id`, `nip`, `alamat`, `phone`, `sex`, `tanggal_bergabung`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES (4, 7, 'PR-42423323', 'bogor', NULL, 'P', '2025-05-23', 1, NULL, '2025-05-23 16:55:12', '2025-05-23 16:55:12');
COMMIT;

-- ----------------------------
-- Table structure for kategori_obats
-- ----------------------------
DROP TABLE IF EXISTS `kategori_obats`;
CREATE TABLE `kategori_obats` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of kategori_obats
-- ----------------------------
BEGIN;
INSERT INTO `kategori_obats` (`id`, `name`, `deleted_at`, `created_at`, `updated_at`) VALUES (1, 'antibiotik', NULL, '2025-05-23 16:55:10', '2025-05-23 16:55:10');
INSERT INTO `kategori_obats` (`id`, `name`, `deleted_at`, `created_at`, `updated_at`) VALUES (2, 'vitamin', NULL, '2025-05-23 16:55:10', '2025-05-23 16:55:10');
INSERT INTO `kategori_obats` (`id`, `name`, `deleted_at`, `created_at`, `updated_at`) VALUES (3, 'obat', NULL, '2025-05-23 16:55:10', '2025-05-23 16:55:10');
COMMIT;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
BEGIN;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (2, '2014_10_12_100000_create_password_reset_tokens_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (4, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (5, '2024_02_07_051006_create_roles_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (6, '2024_02_10_012124_create_kategori_obats_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (7, '2024_02_10_015516_create_golongan_obats_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (8, '2024_02_10_040954_create_obats_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (9, '2024_02_13_143712_create_polikliniks_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (10, '2024_02_14_014827_create_karyawans_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (11, '2024_02_14_021418_create_dokters_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (12, '2024_03_07_095528_create_pasiens_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (13, '2024_03_11_112411_create_rekams_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (14, '2024_03_12_131334_create_antrians_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (15, '2024_08_12_085046_create_produsens_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (16, '2024_08_12_102741_edit_obats_table', 1);
COMMIT;

-- ----------------------------
-- Table structure for obats
-- ----------------------------
DROP TABLE IF EXISTS `obats`;
CREATE TABLE `obats` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `kategoriobat_id` bigint unsigned NOT NULL,
  `golonganobat_id` bigint unsigned NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int NOT NULL DEFAULT '0',
  `stock` int NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `produsen_id` bigint unsigned DEFAULT NULL,
  `kekuatan` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `obats_kategoriobat_id_foreign` (`kategoriobat_id`),
  KEY `obats_golonganobat_id_foreign` (`golonganobat_id`),
  KEY `obats_produsen_id_foreign` (`produsen_id`),
  CONSTRAINT `obats_golonganobat_id_foreign` FOREIGN KEY (`golonganobat_id`) REFERENCES `golongan_obats` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `obats_kategoriobat_id_foreign` FOREIGN KEY (`kategoriobat_id`) REFERENCES `kategori_obats` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `obats_produsen_id_foreign` FOREIGN KEY (`produsen_id`) REFERENCES `produsens` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of obats
-- ----------------------------
BEGIN;
INSERT INTO `obats` (`id`, `kategoriobat_id`, `golonganobat_id`, `code`, `name`, `type`, `price`, `stock`, `deleted_at`, `created_at`, `updated_at`, `produsen_id`, `kekuatan`) VALUES (1, 1, 1, 'vCQMyEosgZ', 'ACARBOSE', NULL, 10000, 100, NULL, '2025-05-24 10:40:55', '2025-05-24 10:40:55', NULL, 1);
INSERT INTO `obats` (`id`, `kategoriobat_id`, `golonganobat_id`, `code`, `name`, `type`, `price`, `stock`, `deleted_at`, `created_at`, `updated_at`, `produsen_id`, `kekuatan`) VALUES (2, 1, 1, 'KFYDjcORB3', 'AMBROXOL', NULL, 5000, 150, NULL, '2025-05-24 10:45:32', '2025-05-24 10:45:32', NULL, 1);
INSERT INTO `obats` (`id`, `kategoriobat_id`, `golonganobat_id`, `code`, `name`, `type`, `price`, `stock`, `deleted_at`, `created_at`, `updated_at`, `produsen_id`, `kekuatan`) VALUES (3, 1, 1, 'nOf65JBXrb', 'ASAM MEFENAMAT', NULL, 2000, 50, NULL, '2025-05-24 10:46:41', '2025-05-24 10:46:41', NULL, 1);
INSERT INTO `obats` (`id`, `kategoriobat_id`, `golonganobat_id`, `code`, `name`, `type`, `price`, `stock`, `deleted_at`, `created_at`, `updated_at`, `produsen_id`, `kekuatan`) VALUES (5, 1, 1, '0OJOyyi2X1', 'ABILIFY', NULL, 20000, 20, NULL, '2025-05-24 11:04:53', '2025-05-24 11:04:53', NULL, 1);
INSERT INTO `obats` (`id`, `kategoriobat_id`, `golonganobat_id`, `code`, `name`, `type`, `price`, `stock`, `deleted_at`, `created_at`, `updated_at`, `produsen_id`, `kekuatan`) VALUES (6, 1, 1, 'uAj9HIw7CF', 'SANMOL', NULL, 15000, 35, NULL, '2025-05-24 12:50:43', '2025-05-24 12:50:43', NULL, 1);
INSERT INTO `obats` (`id`, `kategoriobat_id`, `golonganobat_id`, `code`, `name`, `type`, `price`, `stock`, `deleted_at`, `created_at`, `updated_at`, `produsen_id`, `kekuatan`) VALUES (7, 1, 1, '7pOsuCmZKm', 'PARACETAMOL', NULL, 4000, 200, NULL, '2025-05-24 13:03:23', '2025-05-24 13:03:23', NULL, 1);
INSERT INTO `obats` (`id`, `kategoriobat_id`, `golonganobat_id`, `code`, `name`, `type`, `price`, `stock`, `deleted_at`, `created_at`, `updated_at`, `produsen_id`, `kekuatan`) VALUES (8, 1, 1, 'q6N8VTKKIH', 'MIXAGRIP', NULL, 3000, 100, NULL, '2025-05-24 13:09:02', '2025-05-24 13:09:02', NULL, 1);
COMMIT;

-- ----------------------------
-- Table structure for pasiens
-- ----------------------------
DROP TABLE IF EXISTS `pasiens`;
CREATE TABLE `pasiens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `kode_pasien` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_lengkap` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `tempat_lahir` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sex` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pendidikan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gol_darah` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pekerjaan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of pasiens
-- ----------------------------
BEGIN;
INSERT INTO `pasiens` (`id`, `kode_pasien`, `nama_lengkap`, `tanggal_lahir`, `tempat_lahir`, `sex`, `agama`, `pendidikan`, `phone`, `gol_darah`, `pekerjaan`, `alamat`, `deleted_at`, `created_at`, `updated_at`) VALUES (1, 'AGTS-052025-0000001', 'LARASATIZKA', '2001-08-08', 'MALANG', 'P', 'ISLAM', 'SD', NULL, 'B', NULL, 'MALANG', NULL, '2025-05-23 17:51:15', '2025-05-24 09:27:53');
INSERT INTO `pasiens` (`id`, `kode_pasien`, `nama_lengkap`, `tanggal_lahir`, `tempat_lahir`, `sex`, `agama`, `pendidikan`, `phone`, `gol_darah`, `pekerjaan`, `alamat`, `deleted_at`, `created_at`, `updated_at`) VALUES (2, 'AGTS-052025-0000002', 'MARCELLINO', '2025-05-31', 'BOGOR', 'L', 'ISLAM', 'S1', NULL, 'A', NULL, NULL, NULL, '2025-05-24 09:02:56', '2025-05-24 09:02:56');
INSERT INTO `pasiens` (`id`, `kode_pasien`, `nama_lengkap`, `tanggal_lahir`, `tempat_lahir`, `sex`, `agama`, `pendidikan`, `phone`, `gol_darah`, `pekerjaan`, `alamat`, `deleted_at`, `created_at`, `updated_at`) VALUES (3, 'AGTS-052025-0000003', 'XELLA MARCELA', '2020-06-04', 'BOGOR', 'P', 'ISLAM', 'SD', '081313272622', 'A', NULL, 'BOGOR', NULL, '2025-05-24 12:48:38', '2025-05-24 12:48:38');
INSERT INTO `pasiens` (`id`, `kode_pasien`, `nama_lengkap`, `tanggal_lahir`, `tempat_lahir`, `sex`, `agama`, `pendidikan`, `phone`, `gol_darah`, `pekerjaan`, `alamat`, `deleted_at`, `created_at`, `updated_at`) VALUES (4, 'AGTS-052025-0000004', 'LARAS AYU', '2009-05-08', 'MALANG', 'P', 'ISLAM', 'SD', '081313272622', 'B', NULL, 'MALANG KOTA INDAH', NULL, '2025-05-24 13:01:42', '2025-05-24 13:01:42');
INSERT INTO `pasiens` (`id`, `kode_pasien`, `nama_lengkap`, `tanggal_lahir`, `tempat_lahir`, `sex`, `agama`, `pendidikan`, `phone`, `gol_darah`, `pekerjaan`, `alamat`, `deleted_at`, `created_at`, `updated_at`) VALUES (5, 'AGTS-052025-0000005', 'LARAS AYUNINGTYAS', '2004-05-07', 'MALANG', 'P', 'ISLAM', 'SD', '081313272622', 'A', NULL, 'MALANG SEJUK', NULL, '2025-05-24 13:06:05', '2025-05-24 13:06:05');
INSERT INTO `pasiens` (`id`, `kode_pasien`, `nama_lengkap`, `tanggal_lahir`, `tempat_lahir`, `sex`, `agama`, `pendidikan`, `phone`, `gol_darah`, `pekerjaan`, `alamat`, `deleted_at`, `created_at`, `updated_at`) VALUES (6, 'AGTS-052025-0000006', 'AYANA JIHYE', '2003-05-02', 'MALANG', 'P', 'ISLAM', 'SD', '081313272622', 'A', NULL, 'MALANG ASRI', NULL, '2025-05-24 13:07:15', '2025-05-24 13:07:15');
COMMIT;

-- ----------------------------
-- Table structure for password_reset_tokens
-- ----------------------------
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_reset_tokens
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for polikliniks
-- ----------------------------
DROP TABLE IF EXISTS `polikliniks`;
CREATE TABLE `polikliniks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of polikliniks
-- ----------------------------
BEGIN;
INSERT INTO `polikliniks` (`id`, `name`, `deleted_at`, `created_at`, `updated_at`) VALUES (1, 'Dokter UMUM', NULL, '2025-05-23 16:55:10', '2025-05-23 16:55:10');
INSERT INTO `polikliniks` (`id`, `name`, `deleted_at`, `created_at`, `updated_at`) VALUES (2, 'Spesialist THT', NULL, '2025-05-23 16:55:10', '2025-05-23 16:55:10');
INSERT INTO `polikliniks` (`id`, `name`, `deleted_at`, `created_at`, `updated_at`) VALUES (3, 'Dokter ANAK', NULL, '2025-05-23 16:55:10', '2025-05-23 16:55:10');
COMMIT;

-- ----------------------------
-- Table structure for produsens
-- ----------------------------
DROP TABLE IF EXISTS `produsens`;
CREATE TABLE `produsens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of produsens
-- ----------------------------
BEGIN;
INSERT INTO `produsens` (`id`, `code`, `name`, `is_active`, `deleted_at`, `created_at`, `updated_at`) VALUES (1, 'VbFLhm5pHq', 'PT Kimia Farma', 1, NULL, '2025-05-23 16:55:10', '2025-05-23 16:55:10');
COMMIT;

-- ----------------------------
-- Table structure for rekams
-- ----------------------------
DROP TABLE IF EXISTS `rekams`;
CREATE TABLE `rekams` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `pasien_id` bigint unsigned NOT NULL,
  `dokter_id` bigint unsigned NOT NULL,
  `kode_rekam` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tekanan_darah` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `suhu_badan` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `berat_badan` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tinggi_badan` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keluhan_utama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `diagnosis` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deskripsi_tindakan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rekams_pasien_id_foreign` (`pasien_id`),
  KEY `rekams_dokter_id_foreign` (`dokter_id`),
  CONSTRAINT `rekams_dokter_id_foreign` FOREIGN KEY (`dokter_id`) REFERENCES `dokters` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rekams_pasien_id_foreign` FOREIGN KEY (`pasien_id`) REFERENCES `pasiens` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of rekams
-- ----------------------------
BEGIN;
INSERT INTO `rekams` (`id`, `pasien_id`, `dokter_id`, `kode_rekam`, `tekanan_darah`, `rate`, `suhu_badan`, `berat_badan`, `tinggi_badan`, `keluhan_utama`, `diagnosis`, `deskripsi_tindakan`, `created_by`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES (3, 2, 2, 'RKM-052025-00000003', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pendaftaran', 1, NULL, '2025-05-24 09:02:56', '2025-05-24 09:05:22');
INSERT INTO `rekams` (`id`, `pasien_id`, `dokter_id`, `kode_rekam`, `tekanan_darah`, `rate`, `suhu_badan`, `berat_badan`, `tinggi_badan`, `keluhan_utama`, `diagnosis`, `deskripsi_tindakan`, `created_by`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES (4, 1, 2, 'RKM-052025-00000004', '120/80', '30', '40', '45', '155', 'panas, demam, mual', 'typus', 'pemberian obat', 'pendaftaran', 2, NULL, '2025-05-24 09:27:53', '2025-05-24 09:53:42');
INSERT INTO `rekams` (`id`, `pasien_id`, `dokter_id`, `kode_rekam`, `tekanan_darah`, `rate`, `suhu_badan`, `berat_badan`, `tinggi_badan`, `keluhan_utama`, `diagnosis`, `deskripsi_tindakan`, `created_by`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES (5, 3, 2, 'RKM-052025-00000005', '110/70', '30', '40', '45', '155', 'panas, mual, pusing', 'typus', 'pemberian obat', 'pendaftaran', 2, NULL, '2025-05-24 12:48:38', '2025-05-24 12:49:59');
INSERT INTO `rekams` (`id`, `pasien_id`, `dokter_id`, `kode_rekam`, `tekanan_darah`, `rate`, `suhu_badan`, `berat_badan`, `tinggi_badan`, `keluhan_utama`, `diagnosis`, `deskripsi_tindakan`, `created_by`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES (6, 4, 2, 'RKM-052025-00000006', '110/70', '30', '40', '45', '155', 'panas, mual, sakit perut', 'typus', 'pemberian obat', 'pendaftaran', 2, NULL, '2025-05-24 13:01:42', '2025-05-24 13:02:48');
INSERT INTO `rekams` (`id`, `pasien_id`, `dokter_id`, `kode_rekam`, `tekanan_darah`, `rate`, `suhu_badan`, `berat_badan`, `tinggi_badan`, `keluhan_utama`, `diagnosis`, `deskripsi_tindakan`, `created_by`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES (7, 5, 2, 'RKM-052025-00000007', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pendaftaran', 0, NULL, '2025-05-24 13:06:05', '2025-05-24 13:06:05');
INSERT INTO `rekams` (`id`, `pasien_id`, `dokter_id`, `kode_rekam`, `tekanan_darah`, `rate`, `suhu_badan`, `berat_badan`, `tinggi_badan`, `keluhan_utama`, `diagnosis`, `deskripsi_tindakan`, `created_by`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES (8, 6, 2, 'RKM-052025-00000008', '110/70', '30', '40', '45', '155', 'panas, pusing, sakit perut', 'typus', 'pemberian obat', 'pendaftaran', 2, NULL, '2025-05-24 13:07:15', '2025-05-24 13:08:19');
COMMIT;

-- ----------------------------
-- Table structure for reseps
-- ----------------------------
DROP TABLE IF EXISTS `reseps`;
CREATE TABLE `reseps` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `rekam_id` bigint unsigned NOT NULL,
  `obat_id` bigint unsigned NOT NULL,
  `jenisracikan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rke` int DEFAULT NULL,
  `dosis` float DEFAULT NULL,
  `jumlahracikan` int DEFAULT NULL,
  `qtyobat` float DEFAULT NULL,
  `aturanpakai` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of reseps
-- ----------------------------
BEGIN;
INSERT INTO `reseps` (`id`, `rekam_id`, `obat_id`, `jenisracikan`, `rke`, `dosis`, `jumlahracikan`, `qtyobat`, `aturanpakai`, `deleted_at`, `created_at`, `updated_at`) VALUES (1, 4, 5, 'Non Racikan', 1, NULL, NULL, 7, NULL, NULL, '2025-05-24 11:34:20', '2025-05-24 11:34:20');
INSERT INTO `reseps` (`id`, `rekam_id`, `obat_id`, `jenisracikan`, `rke`, `dosis`, `jumlahracikan`, `qtyobat`, `aturanpakai`, `deleted_at`, `created_at`, `updated_at`) VALUES (6, 4, 2, 'Non Racikan', 2, NULL, NULL, 14, '3x1 setelah makan', NULL, '2025-05-24 11:41:56', '2025-05-24 11:41:56');
INSERT INTO `reseps` (`id`, `rekam_id`, `obat_id`, `jenisracikan`, `rke`, `dosis`, `jumlahracikan`, `qtyobat`, `aturanpakai`, `deleted_at`, `created_at`, `updated_at`) VALUES (7, 4, 3, 'Racikan', 3, 0.5, 10, 5, '1x1', NULL, '2025-05-24 12:41:15', '2025-05-24 12:41:15');
INSERT INTO `reseps` (`id`, `rekam_id`, `obat_id`, `jenisracikan`, `rke`, `dosis`, `jumlahracikan`, `qtyobat`, `aturanpakai`, `deleted_at`, `created_at`, `updated_at`) VALUES (8, 6, 1, 'Non Racikan', 1, NULL, NULL, 14, '3X1 SETELAH MAKAN', NULL, '2025-05-24 13:03:46', '2025-05-24 13:03:46');
INSERT INTO `reseps` (`id`, `rekam_id`, `obat_id`, `jenisracikan`, `rke`, `dosis`, `jumlahracikan`, `qtyobat`, `aturanpakai`, `deleted_at`, `created_at`, `updated_at`) VALUES (9, 6, 1, 'Non Racikan', 1, NULL, NULL, 14, '3X1 SETELAH MAKAN', NULL, '2025-05-24 13:04:55', '2025-05-24 13:04:55');
INSERT INTO `reseps` (`id`, `rekam_id`, `obat_id`, `jenisracikan`, `rke`, `dosis`, `jumlahracikan`, `qtyobat`, `aturanpakai`, `deleted_at`, `created_at`, `updated_at`) VALUES (10, 8, 1, 'Non Racikan', 1, NULL, NULL, 14, '3x1 setelah makan', NULL, '2025-05-24 13:09:24', '2025-05-24 13:09:24');
INSERT INTO `reseps` (`id`, `rekam_id`, `obat_id`, `jenisracikan`, `rke`, `dosis`, `jumlahracikan`, `qtyobat`, `aturanpakai`, `deleted_at`, `created_at`, `updated_at`) VALUES (11, 8, 7, 'Racikan', 2, 0.5, 10, 5, '1x1 setelah makan', NULL, '2025-05-24 13:09:44', '2025-05-24 13:09:44');
COMMIT;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
BEGIN;
INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES (1, 'audit', '2025-05-23 16:55:10', '2025-05-23 16:55:10');
INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES (2, 'admin', '2025-05-23 16:55:10', '2025-05-23 16:55:10');
INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES (3, 'pendaftaran', '2025-05-23 16:55:10', '2025-05-23 16:55:10');
INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES (4, 'dokter', '2025-05-23 16:55:10', '2025-05-23 16:55:10');
INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES (5, 'apotik', '2025-05-23 16:55:10', '2025-05-23 16:55:10');
INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES (6, 'user', '2025-05-23 16:55:10', '2025-05-23 16:55:10');
INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES (7, 'perawat', '2025-05-23 16:55:10', '2025-05-23 16:55:10');
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `deleted_at`, `created_at`, `updated_at`) VALUES (1, 1, 'audit', 'audit@gmail.com', NULL, '$2y$12$hITTuGNO0.llsIi3fJD8Muxw9zQMIveaRdbZB1cXH/Gfib6oxZez2', NULL, NULL, '2025-05-23 16:55:10', '2025-05-23 16:55:10');
INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `deleted_at`, `created_at`, `updated_at`) VALUES (2, 2, 'admin', 'admin@gmail.com', NULL, '$2y$12$y0dIP/nLYH5vHORA/C5WTuaWWHrAAoA57abdIUDKmuPgdB9Fa/XbO', NULL, NULL, '2025-05-23 16:55:10', '2025-05-23 16:55:10');
INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `deleted_at`, `created_at`, `updated_at`) VALUES (3, 3, 'pendaftaran', 'pendaftaran@gmail.com', NULL, '$2y$12$wOAe2a50SrlEMGHdPUnEPeN.wvAdKsye.F2tB2GCIHPy8eu6dgF2i', NULL, NULL, '2025-05-23 16:55:10', '2025-05-23 16:55:10');
INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `deleted_at`, `created_at`, `updated_at`) VALUES (4, 4, 'dokter', 'dokter@gmail.com', NULL, '$2y$12$rPnwfBPFGJJiSCkd4sIgHOpy6.neJHe6O8KQxc4hy91yOqcb5d4rm', NULL, NULL, '2025-05-23 16:55:10', '2025-05-23 16:55:10');
INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `deleted_at`, `created_at`, `updated_at`) VALUES (5, 5, 'apotik', 'apotik@gmail.com', NULL, '$2y$12$fTnY96VlN6xxQ5G.JxW7fOe/sKJ8wovfQsYNrHPgEKgA1vpaH9tSK', NULL, NULL, '2025-05-23 16:55:10', '2025-05-23 16:55:10');
INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `deleted_at`, `created_at`, `updated_at`) VALUES (6, 6, 'user', 'user@gmail.com', NULL, '$2y$12$MnRnoZuEphfEFyU4O0NMZuECEpPVjdWAxjkbXXQjcj2QIndbwclm2', NULL, NULL, '2025-05-23 16:55:10', '2025-05-23 16:55:10');
INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `deleted_at`, `created_at`, `updated_at`) VALUES (7, 7, 'perawat', 'perawat@gmail.com', NULL, '$2y$12$MnRnoZuEphfEFyU4O0NMZuECEpPVjdWAxjkbXXQjcj2QIndbwclm2', NULL, NULL, '2025-05-23 16:55:10', '2025-05-23 16:55:10');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
