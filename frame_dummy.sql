-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 08, 2022 at 08:03 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `frame_dummy`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(14) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `role` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `username`, `password`, `name`, `role`) VALUES
(1, 'admin', 'admin', 'PRINCE ARCE', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `master_client`
--

CREATE TABLE `master_client` (
  `id_no` int(11) NOT NULL,
  `ref_cd` varchar(50) DEFAULT NULL,
  `ref_nm` varchar(100) DEFAULT NULL,
  `address_tx` varchar(100) DEFAULT NULL,
  `email_nm` varchar(50) DEFAULT NULL,
  `contact_no` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_client`
--

INSERT INTO `master_client` (`id_no`, `ref_cd`, `ref_nm`, `address_tx`, `email_nm`, `contact_no`) VALUES
(1, 'HRX', 'HEALTH RX, INC.', 'QUEZON CITY', NULL, NULL),
(2, 'PDD', 'CAMINETTO FOODS CORPORATION', 'BACOOR, CAVITE', NULL, NULL),
(3, 'FNSDP', 'FARMACIA NUESTRA SENORA DEL PILAR, INC.', 'VIGAN CITY, ILOCOS SUR', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `master_item`
--

CREATE TABLE `master_item` (
  `id_no` int(11) NOT NULL,
  `ref_cd` varchar(30) NOT NULL,
  `ref_nm` varchar(100) NOT NULL,
  `cost_am` decimal(18,2) DEFAULT NULL,
  `price_am` decimal(18,2) DEFAULT NULL,
  `catid_no` int(11) DEFAULT NULL,
  `qty_am` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_item`
--

INSERT INTO `master_item` (`id_no`, `ref_cd`, `ref_nm`, `cost_am`, `price_am`, `catid_no`, `qty_am`) VALUES
(1, '100001', 'AMLODIPINE 50MG', '2.00', '4.00', 1, 10),
(2, '100002', 'GATORADE', '30.00', '45.00', 2, 5),
(3, '100003', 'PARACETAMOL 5MG', '1.00', '3.00', 3, 5),
(4, '100004', 'ALAXAN FR', '5.00', '10.00', 4, 20),
(5, '100005', 'BAND AID', '1.00', '1.50', 5, 50);

-- --------------------------------------------------------

--
-- Table structure for table `master_location`
--

CREATE TABLE `master_location` (
  `id_no` int(11) NOT NULL,
  `ref_cd` varchar(50) DEFAULT NULL,
  `ref_nm` varchar(100) DEFAULT NULL,
  `clientid_no` int(11) DEFAULT NULL,
  `address_tx` varchar(100) DEFAULT NULL,
  `contact_no` varchar(20) DEFAULT NULL,
  `email_tx` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_location`
--

INSERT INTO `master_location` (`id_no`, `ref_cd`, `ref_nm`, `clientid_no`, `address_tx`, `contact_no`, `email_tx`) VALUES
(1, 'BR001', 'MAIN', 1, 'STA ANA, QUEZON CITY', '999-000-0000', NULL),
(2, 'BR002', 'TANYAG', 1, 'TANYAG, PASIG CITY', '909-000-0000', NULL),
(3, 'BR003', 'BIC', 1, 'BICUTAN', '999-111-1011', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pos_sales`
--

CREATE TABLE `pos_sales` (
  `id_no` int(11) NOT NULL,
  `itemid_no` int(11) NOT NULL,
  `cost_am` decimal(18,2) NOT NULL DEFAULT 0.00,
  `price_am` decimal(18,2) NOT NULL DEFAULT 0.00,
  `qty_am` decimal(18,2) NOT NULL DEFAULT 0.00,
  `tran_dt` date DEFAULT NULL,
  `clientid_no` int(11) DEFAULT NULL,
  `locid_no` int(11) NOT NULL,
  `others_tx` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pos_sales`
--

INSERT INTO `pos_sales` (`id_no`, `itemid_no`, `cost_am`, `price_am`, `qty_am`, `tran_dt`, `clientid_no`, `locid_no`, `others_tx`) VALUES
(1, 1, '2.00', '4.00', '10.00', '0000-00-00', 0, 0, ''),
(2, 4, '5.00', '10.00', '2.00', '0000-00-00', 1, 1, ''),
(3, 4, '5.00', '10.00', '1.00', '0000-00-00', 1, 1, ''),
(4, 3, '1.00', '3.00', '2.00', '0000-00-00', 1, 1, ''),
(5, 2, '30.00', '45.00', '1.00', '0000-00-00', 1, 1, ''),
(6, 2, '30.00', '45.00', '2.00', '0000-00-00', 1, 1, ''),
(7, 5, '1.00', '1.50', '5.00', '0000-00-00', 1, 1, ''),
(8, 3, '1.00', '3.00', '10.00', '0000-00-00', 1, 1, ''),
(9, 4, '5.00', '10.00', '5.00', '0000-00-00', 1, 1, ''),
(10, 5, '1.00', '1.50', '5.00', '2022-01-30', 1, 1, ''),
(11, 1, '2.00', '4.00', '5.00', '2022-01-30', 1, 1, ''),
(12, 1, '2.00', '4.00', '2.00', '2022-01-30', 1, 1, ''),
(13, 4, '5.00', '10.00', '2.00', '2022-01-30', 1, 1, ''),
(14, 4, '5.00', '10.00', '1.00', '2022-01-30', 1, 1, ''),
(15, 3, '1.00', '3.00', '2.00', '2022-01-30', 1, 1, ''),
(16, 2, '30.00', '45.00', '1.00', '2022-01-30', 1, 1, ''),
(17, 2, '30.00', '45.00', '5.00', '2022-01-30', 1, 1, ''),
(18, 5, '1.00', '1.50', '5.00', '2022-01-30', 1, 1, ''),
(19, 3, '1.00', '3.00', '5.00', '2022-01-30', 1, 1, ''),
(20, 4, '5.00', '10.00', '5.00', '2022-01-30', 1, 1, ''),
(21, 5, '1.00', '1.50', '5.00', '2022-01-30', 1, 1, ''),
(22, 1, '2.00', '4.00', '1.00', '2022-01-30', 1, 1, ''),
(23, 2, '30.00', '45.00', '1.00', '2022-01-30', 1, 1, ''),
(24, 2, '30.00', '45.00', '2.00', '2022-01-30', 1, 1, ''),
(25, 5, '1.00', '1.50', '5.00', '2022-01-30', 1, 1, ''),
(26, 3, '1.00', '3.00', '10.00', '2022-01-30', 1, 1, ''),
(27, 4, '5.00', '10.00', '5.00', '2022-01-30', 1, 1, ''),
(28, 5, '1.00', '1.50', '5.00', '2022-01-30', 1, 1, ''),
(29, 1, '2.00', '4.00', '5.00', '2022-01-30', 1, 1, ''),
(30, 1, '2.00', '4.00', '2.00', '2022-01-30', 1, 1, ''),
(31, 4, '5.00', '10.00', '2.00', '2022-01-30', 1, 1, ''),
(32, 4, '5.00', '10.00', '1.00', '2022-01-30', 1, 1, ''),
(33, 3, '1.00', '3.00', '2.00', '2022-01-30', 1, 1, ''),
(34, 2, '30.00', '45.00', '1.00', '2022-01-30', 1, 1, ''),
(35, 4, '5.00', '10.00', '1.00', '2022-01-30', 1, 1, ''),
(36, 3, '1.00', '3.00', '2.00', '2022-01-30', 1, 1, ''),
(37, 2, '30.00', '45.00', '1.00', '2022-01-30', 1, 1, ''),
(38, 2, '30.00', '45.00', '2.00', '2022-01-30', 1, 1, ''),
(39, 5, '1.00', '1.50', '5.00', '2022-01-30', 1, 1, ''),
(40, 3, '1.00', '3.00', '10.00', '2022-01-31', 1, 1, ''),
(41, 4, '5.00', '10.00', '5.00', '2022-01-31', 1, 1, ''),
(42, 5, '1.00', '1.75', '5.00', '2022-01-31', 1, 1, ''),
(43, 1, '2.00', '4.00', '5.00', '2022-01-31', 1, 1, ''),
(44, 1, '2.00', '4.00', '2.00', '2022-01-31', 1, 1, ''),
(45, 4, '5.00', '10.00', '2.00', '2022-01-31', 1, 1, ''),
(46, 4, '5.00', '10.00', '1.00', '2022-01-31', 1, 1, ''),
(47, 3, '1.50', '3.00', '2.00', '2022-01-31', 1, 1, ''),
(48, 2, '30.00', '46.00', '1.00', '2022-01-31', 1, 1, ''),
(49, 2, '30.00', '46.00', '5.00', '2022-01-31', 1, 1, ''),
(50, 5, '1.00', '1.50', '5.00', '2022-01-31', 1, 1, ''),
(51, 3, '1.00', '3.00', '5.00', '2022-01-31', 1, 1, ''),
(52, 4, '5.00', '10.00', '5.00', '2022-01-31', 1, 1, ''),
(53, 3, '1.50', '3.00', '2.00', '2022-01-31', 1, 1, ''),
(54, 2, '30.00', '46.00', '1.00', '2022-01-31', 1, 1, ''),
(55, 2, '30.00', '46.00', '5.00', '2022-01-31', 1, 1, ''),
(56, 5, '1.00', '1.50', '5.00', '2022-01-31', 1, 1, ''),
(57, 3, '1.00', '3.00', '5.00', '2022-01-31', 1, 1, ''),
(58, 4, '5.00', '10.00', '5.00', '2022-01-31', 1, 1, ''),
(59, 5, '1.00', '1.50', '5.00', '2022-01-31', 1, 1, ''),
(60, 1, '2.00', '4.00', '1.00', '2022-01-31', 1, 1, ''),
(61, 2, '30.00', '46.00', '1.00', '2022-01-31', 1, 1, ''),
(62, 2, '30.00', '46.00', '2.00', '2022-01-31', 1, 1, ''),
(63, 5, '1.00', '1.50', '5.00', '2022-01-31', 1, 1, ''),
(64, 3, '1.00', '3.00', '10.00', '2022-01-31', 1, 1, ''),
(65, 4, '5.00', '10.00', '5.00', '2022-01-31', 1, 1, ''),
(66, 5, '1.00', '1.50', '5.00', '2022-01-31', 1, 1, ''),
(67, 1, '2.00', '4.00', '5.00', '2022-01-31', 1, 1, ''),
(68, 1, '2.00', '4.00', '2.00', '2022-01-31', 1, 1, ''),
(69, 4, '5.00', '10.00', '2.00', '2022-01-31', 1, 1, ''),
(70, 1, '2.00', '4.00', '5.00', '2022-01-30', 1, 2, ''),
(71, 4, '5.00', '10.00', '2.00', '2022-01-30', 1, 2, ''),
(72, 4, '5.00', '10.00', '3.00', '2022-01-30', 1, 2, ''),
(73, 3, '1.00', '3.00', '2.00', '2022-01-30', 1, 2, ''),
(74, 2, '30.00', '45.00', '1.00', '2022-01-30', 1, 2, ''),
(75, 2, '30.00', '45.00', '2.00', '2022-01-30', 1, 2, ''),
(76, 5, '1.00', '1.50', '5.00', '2022-01-30', 1, 2, ''),
(77, 3, '1.00', '3.00', '20.00', '2022-01-30', 1, 2, ''),
(78, 4, '5.00', '10.00', '5.00', '2022-01-30', 1, 2, ''),
(79, 5, '1.00', '1.50', '5.00', '2022-01-30', 1, 2, ''),
(80, 1, '2.00', '4.00', '5.00', '2022-01-30', 1, 2, ''),
(81, 1, '2.00', '4.00', '5.00', '2022-01-30', 1, 2, ''),
(82, 4, '5.00', '10.00', '2.00', '2022-01-30', 1, 2, ''),
(83, 4, '5.00', '10.00', '1.00', '2022-01-30', 1, 2, ''),
(84, 3, '1.00', '3.00', '2.00', '2022-01-30', 1, 2, ''),
(85, 2, '30.00', '45.00', '2.00', '2022-01-30', 1, 2, ''),
(86, 2, '30.00', '45.00', '5.00', '2022-01-30', 1, 2, ''),
(87, 5, '1.00', '1.50', '20.00', '2022-01-30', 1, 2, ''),
(88, 3, '1.00', '3.00', '5.00', '2022-01-30', 1, 2, ''),
(89, 4, '5.00', '10.00', '5.00', '2022-01-30', 1, 2, ''),
(90, 5, '1.00', '1.50', '5.00', '2022-01-30', 1, 2, ''),
(91, 1, '2.00', '4.00', '1.00', '2022-01-30', 1, 2, ''),
(92, 2, '30.00', '45.00', '2.00', '2022-01-30', 1, 2, ''),
(93, 2, '30.00', '45.00', '4.00', '2022-01-30', 1, 2, ''),
(94, 5, '1.00', '1.50', '5.00', '2022-01-30', 1, 2, ''),
(95, 3, '1.00', '3.00', '20.00', '2022-01-30', 1, 2, ''),
(96, 4, '5.00', '10.00', '5.00', '2022-01-30', 1, 2, ''),
(97, 5, '1.00', '1.50', '5.00', '2022-01-30', 1, 2, ''),
(98, 1, '2.00', '4.00', '5.00', '2022-01-30', 1, 2, ''),
(99, 1, '2.00', '4.00', '2.00', '2022-01-30', 1, 2, ''),
(100, 4, '5.00', '10.00', '2.00', '2022-01-30', 1, 2, ''),
(101, 4, '5.00', '10.00', '1.00', '2022-01-30', 1, 2, ''),
(102, 3, '1.00', '3.00', '2.00', '2022-01-30', 1, 2, ''),
(103, 2, '30.00', '45.00', '1.00', '2022-01-30', 1, 2, ''),
(104, 4, '5.00', '10.00', '1.00', '2022-01-30', 1, 2, ''),
(105, 3, '1.00', '3.00', '5.00', '2022-01-30', 1, 2, ''),
(106, 2, '30.00', '45.00', '1.00', '2022-01-30', 1, 2, ''),
(107, 2, '30.00', '45.00', '2.00', '2022-01-30', 1, 2, ''),
(108, 5, '1.00', '1.50', '5.00', '2022-01-30', 1, 2, ''),
(109, 3, '1.00', '3.00', '20.00', '2022-01-30', 1, 2, ''),
(110, 4, '5.00', '10.00', '5.00', '2022-01-30', 1, 2, ''),
(111, 5, '1.00', '1.75', '5.00', '2022-01-30', 1, 2, ''),
(112, 1, '2.00', '4.00', '5.00', '2022-01-30', 1, 2, ''),
(113, 1, '2.00', '4.00', '2.00', '2022-01-31', 1, 2, ''),
(114, 4, '5.00', '10.00', '2.00', '2022-01-31', 1, 2, ''),
(115, 4, '5.00', '10.00', '1.00', '2022-01-31', 1, 2, ''),
(116, 3, '1.50', '3.00', '2.00', '2022-01-31', 1, 2, ''),
(117, 2, '30.00', '46.00', '1.00', '2022-01-31', 1, 2, ''),
(118, 2, '30.00', '46.00', '5.00', '2022-01-31', 1, 2, ''),
(119, 5, '1.00', '1.50', '5.00', '2022-01-31', 1, 2, ''),
(120, 3, '1.00', '3.00', '5.00', '2022-01-31', 1, 2, ''),
(121, 4, '5.00', '10.00', '5.00', '2022-01-31', 1, 2, ''),
(122, 3, '1.50', '3.00', '2.00', '2022-01-31', 1, 2, ''),
(123, 2, '30.00', '46.00', '1.00', '2022-01-31', 1, 2, ''),
(124, 2, '30.00', '46.00', '5.00', '2022-01-31', 1, 2, ''),
(125, 5, '1.00', '1.50', '5.00', '2022-01-31', 1, 2, ''),
(126, 3, '1.00', '3.00', '5.00', '2022-01-31', 1, 2, ''),
(127, 4, '5.00', '10.00', '5.00', '2022-01-31', 1, 2, ''),
(128, 5, '1.00', '1.50', '5.00', '2022-01-31', 1, 2, ''),
(129, 1, '2.00', '4.00', '1.00', '2022-01-31', 1, 2, ''),
(130, 2, '30.00', '46.00', '1.00', '2022-01-31', 1, 2, ''),
(131, 2, '30.00', '46.00', '2.00', '2022-01-31', 1, 2, ''),
(132, 5, '1.00', '1.50', '5.00', '2022-01-31', 1, 2, ''),
(133, 3, '1.00', '3.00', '10.00', '2022-01-31', 1, 2, ''),
(134, 4, '5.00', '10.00', '5.00', '2022-01-31', 1, 2, ''),
(135, 5, '1.00', '1.50', '5.00', '2022-01-31', 1, 2, ''),
(136, 1, '2.00', '4.00', '5.00', '2022-01-31', 1, 2, ''),
(137, 1, '2.00', '4.00', '2.00', '2022-01-31', 1, 2, ''),
(138, 4, '5.00', '10.00', '2.00', '2022-01-31', 1, 2, ''),
(139, 2, '30.00', '46.00', '1.00', '2022-01-31', 1, 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ref_category`
--

CREATE TABLE `ref_category` (
  `id_no` int(11) NOT NULL,
  `ref_cd` varchar(50) DEFAULT NULL,
  `ref_nm` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ref_category`
--

INSERT INTO `ref_category` (`id_no`, `ref_cd`, `ref_nm`) VALUES
(1, 'ORAL', 'ORAL'),
(2, 'CD', 'COLD DRINKS'),
(3, 'PK', 'PAIN KILLER'),
(4, 'PATCH', 'PATCH');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_client`
--
ALTER TABLE `master_client`
  ADD PRIMARY KEY (`id_no`);

--
-- Indexes for table `master_item`
--
ALTER TABLE `master_item`
  ADD PRIMARY KEY (`id_no`);

--
-- Indexes for table `master_location`
--
ALTER TABLE `master_location`
  ADD PRIMARY KEY (`id_no`);

--
-- Indexes for table `pos_sales`
--
ALTER TABLE `pos_sales`
  ADD PRIMARY KEY (`id_no`);

--
-- Indexes for table `ref_category`
--
ALTER TABLE `ref_category`
  ADD PRIMARY KEY (`id_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `master_client`
--
ALTER TABLE `master_client`
  MODIFY `id_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `master_item`
--
ALTER TABLE `master_item`
  MODIFY `id_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `master_location`
--
ALTER TABLE `master_location`
  MODIFY `id_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pos_sales`
--
ALTER TABLE `pos_sales`
  MODIFY `id_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT for table `ref_category`
--
ALTER TABLE `ref_category`
  MODIFY `id_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
