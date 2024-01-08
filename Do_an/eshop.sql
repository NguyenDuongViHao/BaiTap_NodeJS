-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 12, 2023 at 12:00 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `Id` int(11) NOT NULL,
  `Username` varchar(20) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `Password` varchar(20) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `Email` varchar(200) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `Phone` varchar(200) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `Address` varchar(200) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `FullName` varchar(200) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `IsAdmin` bit(4) NOT NULL,
  `Avatar` varchar(200) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `Status` bit(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`Id`, `Username`, `Password`, `Email`, `Phone`, `Address`, `FullName`, `IsAdmin`, `Avatar`, `Status`) VALUES
(1, 'vihao23', 'vihao000@', 'nvihao2003@gmail.com', '0355303024', 'An Giang', 'Nguyễn Dương Vĩ Hào', b'0000', 'null', b'0001'),
(2, 'nhathuy', 'nhathuy000@', 'nhathuy2003@gmail.com', '0355303025', 'Bến Tre', 'Nguyễn Nhật Huy', b'0000', 'null', b'0001'),
(3, 'viettuong', 'viettuong000@', 'viettuong2003@gmail.com', '0355303026', 'Tp Hồ Chí Minh', 'Phạm Viết Tường', b'0000', 'null', b'0001');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `Id` int(11) NOT NULL,
  `Accountld` int(11) NOT NULL,
  `Productld` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoicedetails`
--

CREATE TABLE `invoicedetails` (
  `Id` int(11) NOT NULL,
  `Invoiceld` int(11) NOT NULL,
  `Productld` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `UnitPrice` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `Id` int(11) NOT NULL,
  `Code` varchar(200) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `Accountld` int(11) NOT NULL,
  `IssuedDate` datetime(6) NOT NULL,
  `ShippingAddress` varchar(200) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `ShippingPhone` varchar(200) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `Total` int(11) NOT NULL,
  `Status` bit(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`Id`, `Code`, `Accountld`, `IssuedDate`, `ShippingAddress`, `ShippingPhone`, `Total`, `Status`) VALUES
(1, 'HD01', 1, '2023-06-12 14:30:52.000000', 'TP Hồ Chí Minh, Quận Bình Thạnh', '0355303024', 20000, b'0001'),
(2, 'HD02', 2, '2023-06-12 14:33:34.000000', 'TP Hồ Chí Minh, Quận Bình Tân', '0355303025', 10000, b'0001'),
(3, 'HD03', 1, '2023-06-10 14:35:50.000000', 'TP Hồ Chí Minh, Quận Bình Thạnh', '0355303024', 21000, b'0001');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `Id` int(11) NOT NULL,
  `SKU` varchar(200) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `Name` varchar(200) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `Description` varchar(200) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `Price` int(11) NOT NULL,
  `Stock` int(11) NOT NULL,
  `ProductTypeld` int(11) NOT NULL,
  `Image` varchar(200) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `Status` bit(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`Id`, `SKU`, `Name`, `Description`, `Price`, `Stock`, `ProductTypeld`, `Image`, `Status`) VALUES
(1, 'ASDFGHJKL', 'Sherlock holmes', 'Conan Doyle', 10000, 10, 1, 'null', b'0001'),
(2, 'AWERTYUIOP', 'Re:ZeRo', 'Tappei Nagatsuki', 11000, 10, 2, 'null', b'0001'),
(3, 'ZXCVBNMLK', 'Ma Cà Rồng', 'Yi Dolce', 10000, 10, 3, 'null', b'0001'),
(4, 'AHGFIJDKDL', 'FRIENDZONE', 'You Ling', 10000, 10, 4, 'null', b'0001'),
(5, 'AHFHFHFRH', 'Bad Luck', 'You Ling', 10000, 10, 4, 'null', b'0001'),
(6, 'LKJHGFDSA', 'OVERLORD', 'Maruyama Kugane', 11000, 10, 2, 'null', b'0001'),
(7, 'POIUYTHFGD', 'Tấm Vải Đỏ', 'Hồng Nương Tử', 10000, 10, 3, 'null', b'0001');

-- --------------------------------------------------------

--
-- Table structure for table `producttypes`
--

CREATE TABLE `producttypes` (
  `Id` int(11) NOT NULL,
  `Name` varchar(200) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `Status` bit(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `producttypes`
--

INSERT INTO `producttypes` (`Id`, `Name`, `Status`) VALUES
(1, 'Truyện tiểu thuyết', b'0001'),
(2, 'Truyện tranh', b'0001'),
(3, 'Truyện kinh dị', b'0001'),
(4, 'Truyện hài', b'0001');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Productld` (`Productld`),
  ADD KEY `Accountld` (`Accountld`);

--
-- Indexes for table `invoicedetails`
--
ALTER TABLE `invoicedetails`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Invoiceld` (`Invoiceld`),
  ADD KEY `Productld` (`Productld`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Accountld` (`Accountld`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `ProductTypeld` (`ProductTypeld`);

--
-- Indexes for table `producttypes`
--
ALTER TABLE `producttypes`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoicedetails`
--
ALTER TABLE `invoicedetails`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `producttypes`
--
ALTER TABLE `producttypes`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`Productld`) REFERENCES `products` (`Id`),
  ADD CONSTRAINT `carts_ibfk_2` FOREIGN KEY (`Accountld`) REFERENCES `account` (`Id`);

--
-- Constraints for table `invoicedetails`
--
ALTER TABLE `invoicedetails`
  ADD CONSTRAINT `invoicedetails_ibfk_1` FOREIGN KEY (`Invoiceld`) REFERENCES `invoices` (`Id`),
  ADD CONSTRAINT `invoicedetails_ibfk_2` FOREIGN KEY (`Productld`) REFERENCES `products` (`Id`);

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`Accountld`) REFERENCES `account` (`Id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`ProductTypeld`) REFERENCES `producttypes` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
