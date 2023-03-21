-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 21, 2023 at 07:18 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `addition`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rand_id` varchar(255) DEFAULT NULL,
  `url_to_reset` text DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `password`, `rand_id`, `url_to_reset`, `date`) VALUES
(1, 'renish', 'suriya', 'renidh', 'MiuDX', 'http://localhost:5050/reset_password/MiuDX/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwicmFuZF9pZCI6Ik1pdURYIiwiaWF0IjoxNjc5NDIxNDAyfQ.jXcNTUsKY6TPDrUg7ufduq1v-M8M_Rx2kVvp2G2BXT0', '2023-03-19 15:30:53'),
(2, 'meet', 'dobariya', 'renidh', 'caLtn', 'http://localhost:5050/reset_password/caLtn/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwicmFuZF9pZCI6ImNhTHRuIiwiaWF0IjoxNjc5NDIxNDAyfQ.675_HNvt-BvfHdaAElhbGaEiDpYbDrsXt8TQdPcKru4', '2023-03-19 15:31:39'),
(3, 'himanshu', 'moliya', 'renidh', 'nt1oc', 'http://localhost:5050/reset_password/nt1oc/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywicmFuZF9pZCI6Im50MW9jIiwiaWF0IjoxNjc5NDIxNDAyfQ.HWnXEzZvxxMhVb3zdn-9ouwIs4CCYJLyec95-qjiIQs', '2023-03-19 15:32:22'),
(4, 'roshan', 'thummar', 'renidh', 'AK0AT', 'http://localhost:5050/reset_password/AK0AT/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwicmFuZF9pZCI6IkFLMEFUIiwiaWF0IjoxNjc5NDIxNDAyfQ.taz9UFmwq6EJTmxNH8tHVFT268aCdUV7iIYi8tGyHMI', '2023-03-19 15:32:28'),
(5, 'heet', 'kheni', 'renidh', 'bSNj9', 'http://localhost:5050/reset_password/bSNj9/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NSwicmFuZF9pZCI6ImJTTmo5IiwiaWF0IjoxNjc5NDIxNDAyfQ.CltOcHQLXuPpe7kX7SbipGJULDdCNnqikjsjX3oBpqI', '2023-03-19 15:33:00'),
(6, 'hello', 'hello', 'hello', 'V0JW8', 'http://localhost:5050/reset_password/V0JW8/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwicmFuZF9pZCI6IlYwSlc4IiwiaWF0IjoxNjc5NDIxNDAyfQ.Zo14kqeD9cEy4NNDJHbNOp1G6ZNAwtfcvGSnPQ2ORZ0', '2023-03-21 23:16:41'),
(7, 'fads', 'fasd', 'asdfasdf', 'AyjTK', 'http://localhost:5050/reset_password/AyjTK/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NywicmFuZF9pZCI6IkF5alRLIiwiaWF0IjoxNjc5NDIxNDAyfQ.jKOmKDwbtxDiXRcPOb_IJAVXds_9zkNzZRBfciRxls8', '2023-03-21 23:22:42'),
(8, 'afds', 'fasdf', 'asdfsadf', 'SdzR4', 'http://localhost:5050/reset_password/SdzR4/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwicmFuZF9pZCI6IlNkelI0IiwiaWF0IjoxNjc5NDIxNDAyfQ.ReYnJHnJ2TkCJ_MJ12AqLb0KZpok-i1NHfPWL8hpJf4', '2023-03-21 23:23:58'),
(9, 'demo', 'demo', 'demo', 'fp4c4', 'http://localhost:5050/reset_password/fp4c4/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OSwicmFuZF9pZCI6ImZwNGM0IiwiaWF0IjoxNjc5NDIxNDAyfQ.JT-EsuHzIH-_XUGobbnplOQIrZwR3Cir2_-30l_kY8Q', '2023-03-21 23:26:27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
