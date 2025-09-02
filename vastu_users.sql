-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 24, 2025 at 07:04 PM
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
-- Database: `vastu_users`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `dob` varchar(100) NOT NULL,
  `birthplace` varchar(100) DEFAULT NULL,
  `referred_by` varchar(100) DEFAULT NULL,
  `profession` varchar(100) DEFAULT NULL,
  `location` varchar(100) NOT NULL,
  `property_type` enum('residential','commercial') NOT NULL,
  `phone` varchar(20) NOT NULL,
  `mode` enum('online','offline') NOT NULL,
  `date` date DEFAULT curdate(),
  `time` time DEFAULT curtime(),
  `status` enum('solved','unsolved') NOT NULL DEFAULT 'unsolved',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `astrologer_msg` text DEFAULT NULL,
  `products` text DEFAULT NULL,
  `user_problem` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `user_id`, `name`, `dob`, `birthplace`, `referred_by`, `profession`, `location`, `property_type`, `phone`, `mode`, `date`, `time`, `status`, `created_at`, `astrologer_msg`, `products`, `user_problem`) VALUES
(140, 33, 'Emy Bhai', 'jj', 'j', 'lkj', 'lj', 'jlkj', 'commercial', 'ljl', 'online', '2025-08-24', '17:50:15', '', '2025-08-24 15:50:15', '', '', 'ljl'),
(141, 33, 'Bhai Log', 'kjlk', 'jlkj', 'lkj', 'lkjl', 'ljlkj', 'commercial', 'lj', 'online', '2025-08-24', '17:51:04', 'solved', '2025-08-24 15:51:04', 'hi bhai', 'Guru kata', 'jlj');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `astrologer_msg` text DEFAULT NULL,
  `products` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `is_read` tinyint(1) DEFAULT 0,
  `audio_path` varchar(255) DEFAULT NULL,
  `appointment_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `user_id`, `astrologer_msg`, `products`, `created_at`, `is_read`, `audio_path`, `appointment_id`) VALUES
(25, 25, 'buy this', NULL, '2025-08-23 16:47:19', 0, NULL, 0),
(26, 25, 'buy this', NULL, '2025-08-23 16:49:03', 0, 'uploads/audio/1755947943_recording.webm', 0),
(27, 27, 'hi kumar', NULL, '2025-08-23 23:53:24', 0, 'uploads/audio/1755973404_recording.webm', 0),
(28, 30, 'hey shiva no worries i am here to help com to the slot time i will be there', NULL, '2025-08-24 11:29:57', 0, 'uploads/audio/1756015197_recording.webm', 0),
(29, 33, 'hi bhai', NULL, '2025-08-24 21:22:43', 0, 'uploads/audio/1756050763_recording.webm', 0);

-- --------------------------------------------------------

--
-- Table structure for table `recommended_products`
--

CREATE TABLE `recommended_products` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `recommended_on` datetime DEFAULT current_timestamp(),
  `appointment_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recommended_products`
--

INSERT INTO `recommended_products` (`id`, `user_id`, `product_name`, `recommended_on`, `appointment_id`) VALUES
(30, 33, 'Guru kata', '2025-08-24 21:22:43', 141);

-- --------------------------------------------------------

--
-- Table structure for table `scheduled_appointments`
--

CREATE TABLE `scheduled_appointments` (
  `id` int(11) NOT NULL,
  `appointment_id` int(11) DEFAULT NULL,
  `scheduled_date` date DEFAULT NULL,
  `time_slot` varchar(20) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `scheduled_appointments`
--

INSERT INTO `scheduled_appointments` (`id`, `appointment_id`, `scheduled_date`, `time_slot`, `user_name`) VALUES
(117, 140, '2027-08-17', '5:00 PM - 6:00 PM', 'Emy Bhai'),
(119, 141, '2026-08-26', '4:00 PM - 5:00 PM', 'Bhai Log');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullname`, `username`, `email`, `phone`, `password`) VALUES
(25, 'dp', '123', 'dp@dp.com', '1234567890', '$2y$10$S0Mzv7rh47Y/QQSgH5nMOurCAUjrcIePW0p7tAW0NulcrwqRJ0bzC'),
(26, 'Sahil Kalaskar ', 'Sahil23', 'sahilkalaskar18@gmail.com', '9699566775', '$2y$10$dd5UUZGoS2fjkeJ61k662OClY2lm34fB6imQcHeo7m0Gd6GML858K'),
(27, 'Test', 'Test', 'Test@gmail.com', '12345678', '$2y$10$D0JCobKaa8Vhh6V6jE.G/eR/hT1e49tZVQypX5whpEFJpCRNHsx/m'),
(28, 'Disha Pure', 'disha', 'disha.boston@gmail.com', '08208721752', '$2y$10$iZgVi96srHzmw9KMG5cBcee5GbDEjksGyPuF8tOzOoa.v0IVIUgfW'),
(30, 'Shiva', 'shiva', 'disha.pure@gmail.com', '08208721752', '$2y$10$PnvcZa05lGyoph2vXqazreCJaiJE99MlaCg1uJ7ZbUn4BLRFj4/c.'),
(31, 'Doctor G', 'doc', 'dhruv.boston@gmail.com', '08208721752', '$2y$10$/w9OmzpijcFwmc/vZhvoVu6iglAIram.WDPzGO1hfQWt2dGZWxZoG'),
(32, 'Jany', 'jany', 'disha.boston.edu@gmail.com', '1234567890', '$2y$10$oVjtWtDRqr1S.KoKE3gXTuQ/iMFIQ2QPrIxuv6.Tk8N30UIxLMXWK'),
(33, 'Dheeraj Pure', 'pure', 'dheeraj.pure.learn@gmail.com', '7815353490', '$2y$10$cAkbkQ4rwIkinhd7Go0uxeqR6PoA28g2z9qzdk7WJOwf51yBgabva');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recommended_products`
--
ALTER TABLE `recommended_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `appointment_id` (`appointment_id`);

--
-- Indexes for table `scheduled_appointments`
--
ALTER TABLE `scheduled_appointments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `appointment_id` (`appointment_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `recommended_products`
--
ALTER TABLE `recommended_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `scheduled_appointments`
--
ALTER TABLE `scheduled_appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `recommended_products`
--
ALTER TABLE `recommended_products`
  ADD CONSTRAINT `recommended_products_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `recommended_products_ibfk_2` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`id`);

--
-- Constraints for table `scheduled_appointments`
--
ALTER TABLE `scheduled_appointments`
  ADD CONSTRAINT `scheduled_appointments_ibfk_1` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
