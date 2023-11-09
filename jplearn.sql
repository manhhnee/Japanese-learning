-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 09, 2023 at 09:06 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jplearn`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bookmark_courses`
--

CREATE TABLE `bookmark_courses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_messages`
--

CREATE TABLE `chat_messages` (
  `id` int(11) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `message_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` float DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `teacher_id`, `title`, `description`, `price`, `status`) VALUES
(1, 25, 'khóa học JAV...a', 'the sun can\'t shine without darkness', 12000, 1),
(2, 3, 'khóa học nodejs pro', 'alasdjsadasdasda', 20000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

CREATE TABLE `lessons` (
  `id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `url` text DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `comment` text NOT NULL,
  `rating_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`id`, `user_id`, `course_id`, `star`, `comment`, `rating_date`) VALUES
(0, 11, 1, 4, 'quá hay', '2023-11-01'),
(1, 11, 1, 5, 'quá đỉnh', '2023-11-01'),
(3, 0, 2, 1, 'chất lượng quá tệ', '2023-11-01'),
(4, 18, 1, 3, 'khóa học rất to và tròn :v', '2023-11-23');

-- --------------------------------------------------------

--
-- Table structure for table `records`
--

CREATE TABLE `records` (
  `id` int(11) NOT NULL,
  `appointment_id` int(11) DEFAULT NULL,
  `url` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `detail_infor` varchar(255) DEFAULT NULL,
  `study_goal` varchar(50) DEFAULT NULL,
  `jp_level` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_courses`
--

CREATE TABLE `student_courses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `attendance_status` varchar(50) DEFAULT NULL,
  `attendance_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `detail_infor` varchar(255) DEFAULT NULL,
  `experience` varchar(255) DEFAULT NULL,
  `jp_level` varchar(25) DEFAULT NULL,
  `createdAt` date DEFAULT NULL,
  `updatedAt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `user_id`, `detail_infor`, `experience`, `jp_level`, `createdAt`, `updatedAt`) VALUES
(0, NULL, 'nihongo ga omoshiroi desu', '0 năm', 'N1', '2023-10-27', '2023-10-27'),
(1, 1, 'nihongo ga jozu desu', '1 năm', 'N2', '2023-10-27', '2023-10-27'),
(2, 2, 'nihongo ga jozu desu', '2 năm', 'N2', '2023-10-27', '2023-10-27'),
(3, 3, 'nihongo ga jozu desu', '3 năm', 'N1', '2023-10-27', '2023-10-27'),
(4, 4, 'nihongo ga omoshiroi desu', '4 năm', 'N1', '2023-10-27', '2023-10-27'),
(5, 5, 'nihongo ga jozu desu', '5 năm', 'N1', '2023-10-27', '2023-10-27'),
(6, 6, 'nihongo ga jozu desu', '6 năm', 'N2', '2023-10-27', '2023-10-27'),
(7, 7, 'nihongo ga jozu desu', '7 năm', 'N2', '2023-10-27', '2023-10-27'),
(8, 8, 'nihongo ga omoshiroi desu', '8 năm', 'N2', '2023-10-27', '2023-10-27'),
(9, 9, 'nihongo ga omoshiroi desu', '9 năm', 'N2', '2023-10-27', '2023-10-27'),
(10, 10, 'nihongo ga jozu desu', '10 năm', 'N1', '2023-10-27', '2023-10-27'),
(11, 11, 'nihongo ga omoshiroi desu', '11 năm', 'N2', '2023-10-27', '2023-10-27'),
(12, 12, 'nihongo ga jozu desu', '12 năm', 'N2', '2023-10-27', '2023-10-27'),
(13, 13, 'nihongo ga jozu desu', '13 năm', 'N2', '2023-10-27', '2023-10-27'),
(14, 14, 'nihongo ga jozu desu', '14 năm', 'N1', '2023-10-27', '2023-10-27'),
(15, 15, 'nihongo ga jozu desu', '15 năm', 'N1', '2023-10-27', '2023-10-27'),
(16, 16, 'nihongo ga jozu desu', '16 năm', 'N2', '2023-10-27', '2023-10-27'),
(17, 17, 'nihongo ga jozu desu', '17 năm', 'N1', '2023-10-27', '2023-10-27'),
(18, 18, 'nihongo ga omoshiroi desu', '18 năm', 'N2', '2023-10-27', '2023-10-27'),
(19, 19, 'nihongo ga jozu desu', '19 năm', 'N1', '2023-10-27', '2023-10-27'),
(20, 20, 'nihongo ga omoshiroi desu', '20 năm', 'N2', '2023-10-27', '2023-10-27'),
(21, 21, 'nihongo ga omoshiroi desu', '21 năm', 'N1', '2023-10-27', '2023-10-27'),
(22, 22, 'nihongo ga jozu desu', '22 năm', 'N2', '2023-10-27', '2023-10-27'),
(23, 23, 'nihongo ga jozu desu', '23 năm', 'N1', '2023-10-27', '2023-10-27'),
(24, 24, 'nihongo ga jozu desu', '24 năm', 'N1', '2023-10-27', '2023-10-27'),
(25, 25, 'nihongo ga jozu desu', '25 năm', 'N2', '2023-10-27', '2023-10-27'),
(26, 26, 'nihongo ga omoshiroi desu', '26 năm', 'N2', '2023-10-27', '2023-10-27'),
(27, 27, 'nihongo ga omoshiroi desu', '27 năm', 'N1', '2023-10-27', '2023-10-27'),
(28, 28, 'nihongo ga jozu desu', '28 năm', 'N1', '2023-10-27', '2023-10-27'),
(29, 29, 'nihongo ga omoshiroi desu', '29 năm', 'N1', '2023-10-27', '2023-10-27'),
(30, 30, 'nihongo ga omoshiroi desu', '30 năm', 'N2', '2023-10-27', '2023-10-27'),
(31, 31, 'nihongo ga omoshiroi desu', '31 năm', 'N1', '2023-10-27', '2023-10-27'),
(32, 32, 'nihongo ga omoshiroi desu', '32 năm', 'N1', '2023-10-27', '2023-10-27'),
(33, 33, 'nihongo ga omoshiroi desu', '33 năm', 'N2', '2023-10-27', '2023-10-27'),
(34, 34, 'nihongo ga omoshiroi desu', '34 năm', 'N2', '2023-10-27', '2023-10-27'),
(35, 35, 'nihongo ga jozu desu', '35 năm', 'N1', '2023-10-27', '2023-10-27'),
(36, 36, 'nihongo ga jozu desu', '36 năm', 'N1', '2023-10-27', '2023-10-27'),
(37, 37, 'nihongo ga jozu desu', '37 năm', 'N2', '2023-10-27', '2023-10-27'),
(38, 38, 'nihongo ga omoshiroi desu', '38 năm', 'N1', '2023-10-27', '2023-10-27'),
(39, 39, 'nihongo ga jozu desu', '39 năm', 'N1', '2023-10-27', '2023-10-27'),
(40, 40, 'nihongo ga omoshiroi desu', '40 năm', 'N2', '2023-10-27', '2023-10-27'),
(41, 41, 'nihongo ga jozu desu', '41 năm', 'N2', '2023-10-27', '2023-10-27'),
(42, 42, 'nihongo ga jozu desu', '42 năm', 'N2', '2023-10-27', '2023-10-27'),
(43, 43, 'nihongo ga omoshiroi desu', '43 năm', 'N1', '2023-10-27', '2023-10-27'),
(44, 44, 'nihongo ga omoshiroi desu', '44 năm', 'N1', '2023-10-27', '2023-10-27'),
(45, 45, 'nihongo ga omoshiroi desu', '45 năm', 'N1', '2023-10-27', '2023-10-27'),
(46, 46, 'nihongo ga jozu desu', '46 năm', 'N1', '2023-10-27', '2023-10-27'),
(47, 47, 'nihongo ga jozu desu', '47 năm', 'N1', '2023-10-27', '2023-10-27'),
(48, 48, 'nihongo ga omoshiroi desu', '48 năm', 'N2', '2023-10-27', '2023-10-27'),
(49, 49, 'nihongo ga jozu desu', '49 năm', 'N2', '2023-10-27', '2023-10-27'),
(50, 50, 'nihongo ga omoshiroi desu', '50 năm', 'N1', '2023-10-27', '2023-10-27'),
(51, 51, 'nihongo ga jozu desu', '51 năm', 'N2', '2023-10-27', '2023-10-27'),
(52, 52, 'nihongo ga jozu desu', '52 năm', 'N2', '2023-10-27', '2023-10-27'),
(53, 53, 'nihongo ga omoshiroi desu', '53 năm', 'N1', '2023-10-27', '2023-10-27'),
(54, 54, 'nihongo ga jozu desu', '54 năm', 'N2', '2023-10-27', '2023-10-27'),
(55, 55, 'nihongo ga omoshiroi desu', '55 năm', 'N2', '2023-10-27', '2023-10-27'),
(56, 56, 'nihongo ga omoshiroi desu', '56 năm', 'N2', '2023-10-27', '2023-10-27'),
(57, 57, 'nihongo ga jozu desu', '57 năm', 'N1', '2023-10-27', '2023-10-27'),
(58, 58, 'nihongo ga omoshiroi desu', '58 năm', 'N2', '2023-10-27', '2023-10-27'),
(59, 59, 'nihongo ga omoshiroi desu', '59 năm', 'N1', '2023-10-27', '2023-10-27'),
(60, 60, 'nihongo ga omoshiroi desu', '60 năm', 'N2', '2023-10-27', '2023-10-27'),
(61, 61, 'nihongo ga omoshiroi desu', '61 năm', 'N2', '2023-10-27', '2023-10-27'),
(62, 62, 'nihongo ga omoshiroi desu', '62 năm', 'N2', '2023-10-27', '2023-10-27'),
(63, 63, 'nihongo ga jozu desu', '63 năm', 'N2', '2023-10-27', '2023-10-27'),
(64, 64, 'nihongo ga omoshiroi desu', '64 năm', 'N2', '2023-10-27', '2023-10-27'),
(65, 65, 'nihongo ga jozu desu', '65 năm', 'N2', '2023-10-27', '2023-10-27'),
(66, 66, 'nihongo ga omoshiroi desu', '66 năm', 'N1', '2023-10-27', '2023-10-27'),
(67, 67, 'nihongo ga jozu desu', '67 năm', 'N2', '2023-10-27', '2023-10-27'),
(68, 68, 'nihongo ga omoshiroi desu', '68 năm', 'N2', '2023-10-27', '2023-10-27'),
(69, 69, 'nihongo ga omoshiroi desu', '69 năm', 'N1', '2023-10-27', '2023-10-27'),
(70, 70, 'nihongo ga omoshiroi desu', '70 năm', 'N1', '2023-10-27', '2023-10-27'),
(71, 71, 'nihongo ga omoshiroi desu', '71 năm', 'N2', '2023-10-27', '2023-10-27'),
(72, 72, 'nihongo ga omoshiroi desu', '72 năm', 'N1', '2023-10-27', '2023-10-27'),
(73, 73, 'nihongo ga omoshiroi desu', '73 năm', 'N1', '2023-10-27', '2023-10-27'),
(74, 74, 'nihongo ga jozu desu', '74 năm', 'N1', '2023-10-27', '2023-10-27'),
(75, 75, 'nihongo ga jozu desu', '75 năm', 'N1', '2023-10-27', '2023-10-27'),
(76, 76, 'nihongo ga jozu desu', '76 năm', 'N1', '2023-10-27', '2023-10-27'),
(77, 77, 'nihongo ga omoshiroi desu', '77 năm', 'N1', '2023-10-27', '2023-10-27'),
(78, 78, 'nihongo ga omoshiroi desu', '78 năm', 'N2', '2023-10-27', '2023-10-27'),
(79, 79, 'nihongo ga omoshiroi desu', '79 năm', 'N2', '2023-10-27', '2023-10-27'),
(80, 80, 'nihongo ga omoshiroi desu', '80 năm', 'N2', '2023-10-27', '2023-10-27'),
(81, 81, 'nihongo ga omoshiroi desu', '81 năm', 'N2', '2023-10-27', '2023-10-27'),
(82, 82, 'nihongo ga jozu desu', '82 năm', 'N2', '2023-10-27', '2023-10-27'),
(83, 83, 'nihongo ga omoshiroi desu', '83 năm', 'N2', '2023-10-27', '2023-10-27'),
(84, 84, 'nihongo ga omoshiroi desu', '84 năm', 'N2', '2023-10-27', '2023-10-27'),
(85, 85, 'nihongo ga jozu desu', '85 năm', 'N2', '2023-10-27', '2023-10-27'),
(86, 86, 'nihongo ga jozu desu', '86 năm', 'N1', '2023-10-27', '2023-10-27'),
(87, 87, 'nihongo ga omoshiroi desu', '87 năm', 'N1', '2023-10-27', '2023-10-27'),
(88, 88, 'nihongo ga omoshiroi desu', '88 năm', 'N1', '2023-10-27', '2023-10-27'),
(89, 89, 'nihongo ga omoshiroi desu', '89 năm', 'N1', '2023-10-27', '2023-10-27'),
(90, 90, 'nihongo ga jozu desu', '90 năm', 'N2', '2023-10-27', '2023-10-27'),
(91, 91, 'nihongo ga jozu desu', '91 năm', 'N2', '2023-10-27', '2023-10-27'),
(92, 92, 'nihongo ga omoshiroi desu', '92 năm', 'N1', '2023-10-27', '2023-10-27'),
(93, 93, 'nihongo ga omoshiroi desu', '93 năm', 'N1', '2023-10-27', '2023-10-27'),
(94, 94, 'nihongo ga jozu desu', '94 năm', 'N1', '2023-10-27', '2023-10-27'),
(95, 95, 'nihongo ga jozu desu', '95 năm', 'N2', '2023-10-27', '2023-10-27'),
(96, 96, 'nihongo ga jozu desu', '96 năm', 'N2', '2023-10-27', '2023-10-27'),
(97, 97, 'nihongo ga jozu desu', '97 năm', 'N2', '2023-10-27', '2023-10-27'),
(98, 98, 'nihongo ga omoshiroi desu', '98 năm', 'N1', '2023-10-27', '2023-10-27'),
(99, 99, 'nihongo ga jozu desu', '99 năm', 'N2', '2023-10-27', '2023-10-27');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nick_name` varchar(50) NOT NULL,
  `mail` varchar(50) DEFAULT NULL,
  `password` varchar(50) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `gender` tinyint(3) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `role` varchar(25) DEFAULT NULL,
  `status` tinyint(2) DEFAULT NULL,
  `createdAt` date DEFAULT NULL,
  `updatedAt` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nick_name`, `mail`, `password`, `avatar`, `gender`, `first_name`, `last_name`, `dob`, `role`, `status`, `createdAt`, `updatedAt`) VALUES
(0, 'teacher0', 'teacher0@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '0', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(1, 'teacher1', 'teacher1@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '1', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(2, 'teacher2', 'teacher2@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '2', '2023-10-27', 'teacher', 0, '2023-10-27', 2023),
(3, 'teacher3', 'teacher3@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '3', '2023-10-27', 'teacher', 0, '2023-10-27', 2023),
(4, 'teacher4', 'teacher4@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '4', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(5, 'teacher5', 'teacher5@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '5', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(6, 'teacher6', 'teacher6@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '6', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(7, 'teacher7', 'teacher7@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '7', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(8, 'teacher8', 'teacher8@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '8', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(9, 'teacher9', 'teacher9@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '9', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(10, 'teacher10', 'teacher10@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '10', '2023-10-27', 'teacher', 0, '2023-10-27', 2023),
(11, 'teacher11', 'teacher11@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '11', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(12, 'teacher12', 'teacher12@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '12', '2023-10-27', 'teacher', 0, '2023-10-27', 2023),
(13, 'teacher13', 'teacher13@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '13', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(14, 'teacher14', 'teacher14@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '14', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(15, 'teacher15', 'teacher15@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '15', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(16, 'teacher16', 'teacher16@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '16', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(17, 'teacher17', 'teacher17@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '17', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(18, 'teacher18', 'teacher18@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '18', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(19, 'teacher19', 'teacher19@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '19', '2023-10-27', 'teacher', 0, '2023-10-27', 2023),
(20, 'teacher20', 'teacher20@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '20', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(21, 'teacher21', 'teacher21@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '21', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(22, 'teacher22', 'teacher22@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '22', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(23, 'teacher23', 'teacher23@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '23', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(24, 'teacher24', 'teacher24@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '24', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(25, 'teacher25', 'teacher25@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '25', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(26, 'teacher26', 'teacher26@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '26', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(27, 'teacher27', 'teacher27@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '27', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(28, 'teacher28', 'teacher28@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '28', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(29, 'teacher29', 'teacher29@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 1, 'teacher', '29', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(30, 'teacher30', 'teacher30@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '30', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(31, 'teacher31', 'teacher31@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '31', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(32, 'teacher32', 'teacher32@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '32', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(33, 'teacher33', 'teacher33@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '33', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(34, 'teacher34', 'teacher34@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '34', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(35, 'teacher35', 'teacher35@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '35', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(36, 'teacher36', 'teacher36@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '36', '2023-10-27', 'teacher', 0, '2023-10-27', 2023),
(37, 'teacher37', 'teacher37@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 1, 'teacher', '37', '2023-10-27', 'teacher', 0, '2023-10-27', 2023),
(38, 'teacher38', 'teacher38@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '38', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(39, 'teacher39', 'teacher39@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '39', '2023-10-27', 'teacher', 0, '2023-10-27', 2023),
(40, 'teacher40', 'teacher40@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 1, 'teacher', '40', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(41, 'teacher41', 'teacher41@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '41', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(42, 'teacher42', 'teacher42@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 1, 'teacher', '42', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(43, 'teacher43', 'teacher43@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 1, 'teacher', '43', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(44, 'teacher44', 'teacher44@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '44', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(45, 'teacher45', 'teacher45@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '45', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(46, 'teacher46', 'teacher46@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 1, 'teacher', '46', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(47, 'teacher47', 'teacher47@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '47', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(48, 'teacher48', 'teacher48@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '48', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(49, 'teacher49', 'teacher49@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '49', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(50, 'teacher50', 'teacher50@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '50', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(51, 'teacher51', 'teacher51@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '51', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(52, 'teacher52', 'teacher52@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 1, 'teacher', '52', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(53, 'teacher53', 'teacher53@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '53', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(54, 'teacher54', 'teacher54@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 1, 'teacher', '54', '2023-10-27', 'teacher', 0, '2023-10-27', 2023),
(55, 'teacher55', 'teacher55@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '55', '2023-10-27', 'teacher', 0, '2023-10-27', 2023),
(56, 'teacher56', 'teacher56@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '56', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(57, 'teacher57', 'teacher57@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '57', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(58, 'teacher58', 'teacher58@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '58', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(59, 'teacher59', 'teacher59@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '59', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(60, 'teacher60', 'teacher60@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '60', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(61, 'teacher61', 'teacher61@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 1, 'teacher', '61', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(62, 'teacher62', 'teacher62@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 1, 'teacher', '62', '2023-10-27', 'teacher', 0, '2023-10-27', 2023),
(63, 'teacher63', 'teacher63@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '63', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(64, 'teacher64', 'teacher64@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 1, 'teacher', '64', '2023-10-27', 'teacher', 0, '2023-10-27', 2023),
(65, 'teacher65', 'teacher65@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 1, 'teacher', '65', '2023-10-27', 'teacher', 0, '2023-10-27', 2023),
(66, 'teacher66', 'teacher66@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '66', '2023-10-27', 'teacher', 0, '2023-10-27', 2023),
(67, 'teacher67', 'teacher67@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '67', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(68, 'teacher68', 'teacher68@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '68', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(69, 'teacher69', 'teacher69@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 1, 'teacher', '69', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(70, 'teacher70', 'teacher70@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '70', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(71, 'teacher71', 'teacher71@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '71', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(72, 'teacher72', 'teacher72@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '72', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(73, 'teacher73', 'teacher73@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '73', '2023-10-27', 'teacher', 0, '2023-10-27', 2023),
(74, 'teacher74', 'teacher74@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '74', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(75, 'teacher75', 'teacher75@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '75', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(76, 'teacher76', 'teacher76@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '76', '2023-10-27', 'teacher', 0, '2023-10-27', 2023),
(77, 'teacher77', 'teacher77@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 1, 'teacher', '77', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(78, 'teacher78', 'teacher78@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '78', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(79, 'teacher79', 'teacher79@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '79', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(80, 'teacher80', 'teacher80@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '80', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(81, 'teacher81', 'teacher81@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '81', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(82, 'teacher82', 'teacher82@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '82', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(83, 'teacher83', 'teacher83@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '83', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(84, 'teacher84', 'teacher84@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '84', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(85, 'teacher85', 'teacher85@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '85', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(86, 'teacher86', 'teacher86@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '86', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(87, 'teacher87', 'teacher87@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '87', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(88, 'teacher88', 'teacher88@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '88', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(89, 'teacher89', 'teacher89@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 1, 'teacher', '89', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(90, 'teacher90', 'teacher90@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 1, 'teacher', '90', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(91, 'teacher91', 'teacher91@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '91', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(92, 'teacher92', 'teacher92@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '92', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(93, 'teacher93', 'teacher93@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '93', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(94, 'teacher94', 'teacher94@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '94', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(95, 'teacher95', 'teacher95@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '95', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(96, 'teacher96', 'teacher96@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '96', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(97, 'teacher97', 'teacher97@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '97', '2023-10-27', 'teacher', 0, '2023-10-27', 2023),
(98, 'teacher98', 'teacher98@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '98', '2023-10-27', 'teacher', 1, '2023-10-27', 2023),
(99, 'teacher99', 'teacher99@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 1, 'teacher', '99', '2023-10-27', 'teacher', 1, '2023-10-27', 2023);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- Indexes for table `bookmark_courses`
--
ALTER TABLE `bookmark_courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teacher_id` (`teacher_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- Indexes for table `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `records`
--
ALTER TABLE `records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appointment_id` (`appointment_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `student_courses`
--
ALTER TABLE `student_courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD CONSTRAINT `chat_messages_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `chat_messages_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `lessons_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
