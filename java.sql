-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 13, 2025 at 06:11 AM
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
-- Database: `java`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `barcode` varchar(50) NOT NULL,
  `brand` varchar(100) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `current_quantity` int(11) DEFAULT 0,
  `reorder_level` int(11) DEFAULT 0,
  `status` enum('In Stock','Low Stock','Out of Stock') DEFAULT 'In Stock',
  `date_added` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `barcode`, `brand`, `category`, `price`, `current_quantity`, `reorder_level`, `status`, `date_added`) VALUES
(1, 'Coca-Cola 1L', '1234567890123', 'Coca-Cola', 'Beverages', 30.00, 12, 10, 'In Stock', '2025-05-13 00:31:54'),
(2, 'Bear Brand Powdered Milk 300g', '2345678901234', 'Nestlé', 'Dairy', 55.00, 29, 5, 'In Stock', '2025-05-13 00:31:54'),
(3, 'Lucky Me Pancit Canton', '3456789012345', 'Monde Nissin', 'Noodles', 15.00, 100, 20, 'In Stock', '2025-05-13 00:31:54'),
(4, 'Piattos Cheese 85g', '4567890123456', 'Jack ’n Jill', 'Snacks', 20.00, 40, 10, 'In Stock', '2025-05-13 00:31:54'),
(5, 'Safeguard Soap 135g', '5678901234567', 'Procter & Gamble', 'Personal Care', 25.00, 25, 5, 'In Stock', '2025-05-13 00:31:54');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL,
  `discount` double DEFAULT 0,
  `total` double NOT NULL,
  `timestamp` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','staff','cashier') NOT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `created_date`, `created_time`) VALUES
(1, 'admin', 'admin123', 'admin', NULL, NULL),
(2, 'staff1', 'staff123', 'staff', NULL, NULL),
(3, 'cashier1', 'cashier123', 'cashier', NULL, NULL),
(4, 'Joshua', 'cb14bf5073ebaf6d9d04b63164b7017b2011d3558fb2f80f9450c9f5de6f6de8', 'cashier', '2025-05-12', '20:02:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD UNIQUE KEY `barcode` (`barcode`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
