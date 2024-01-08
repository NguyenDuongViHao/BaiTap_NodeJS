-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 30, 2023 at 01:48 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `qlsinhvien`
--

-- --------------------------------------------------------

--
-- Table structure for table `sinhvien`
--

CREATE TABLE `sinhvien` (
  `Id` int(11) NOT NULL,
  `MSSV` varchar(10) COLLATE utf8_vietnamese_ci NOT NULL,
  `Ho` varchar(50) COLLATE utf8_vietnamese_ci NOT NULL,
  `Ten` varchar(100) COLLATE utf8_vietnamese_ci NOT NULL,
  `DiemLT` float NOT NULL DEFAULT 0,
  `DiemTH` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `sinhvien`
--

INSERT INTO `sinhvien` (`Id`, `MSSV`, `Ho`, `Ten`, `DiemLT`, `DiemTH`) VALUES
(1, '0306211001', 'Nguyễn Văn', 'An', 5.9, 8.4),
(2, '0306211002', 'Trần Thanh', 'Bình', 3.5, 4.8),
(3, '0306211003', 'Lê Hùng', 'Cường', 8.9, 9.5),
(4, '0306211004', 'Lâm Quốc', 'Duy', 6, 6.5),
(5, '0306211005', 'Hoàng Văn', 'Khanh', 4.3, 6.2),
(14, '0306211006', 'Dương Hữu', 'Phước', 9.5, 9.8);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sinhvien`
--
ALTER TABLE `sinhvien`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sinhvien`
--
ALTER TABLE `sinhvien`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
