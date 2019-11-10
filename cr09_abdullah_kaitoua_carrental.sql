-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 10, 2019 at 02:38 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr09_abdullah_kaitoua_carrental`
--
CREATE DATABASE IF NOT EXISTS `cr09_abdullah_kaitoua_carrental` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cr09_abdullah_kaitoua_carrental`;

-- --------------------------------------------------------

--
-- Table structure for table `additional`
--

CREATE TABLE `additional` (
  `adc_id` int(5) UNSIGNED NOT NULL,
  `tank_amount` varchar(50) DEFAULT NULL,
  `tank_price` double(10,2) DEFAULT NULL,
  `damage_type` varchar(50) DEFAULT NULL,
  `damage_price` double(10,2) DEFAULT NULL,
  `FK_pay_id` int(5) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `additional`
--

INSERT INTO `additional` (`adc_id`, `tank_amount`, `tank_price`, `damage_type`, `damage_price`, `FK_pay_id`) VALUES
(1, 'The car hasn`t been refueled', 20.60, 'dented right door 30cm', 140.50, 1),
(2, 'OK, the tank is full', 0.00, 'scratched windscreen 40cm', 170.50, 2),
(3, 'OK, the tank is full', 0.00, 'OK, no damages', 0.00, 3),
(4, 'The car hasn`t been refueled', 31.60, 'dented bumper, peeling paint ', 220.50, 4),
(5, 'OK, the tank is full', 0.00, 'broken  driving mirrorr ', 60.50, 5),
(6, 'The car hasn`t been refueled', 13.60, 'OK, no damages', 0.00, 6),
(7, 'OK, the tank is full', 0.00, 'OK, no damages', 0.00, 9);

-- --------------------------------------------------------

--
-- Table structure for table `available`
--

CREATE TABLE `available` (
  `available_id` int(5) UNSIGNED NOT NULL,
  `available_date` date DEFAULT NULL,
  `FK_model_id` int(5) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `available`
--

INSERT INTO `available` (`available_id`, `available_date`, `FK_model_id`) VALUES
(1, '2019-12-26', 1),
(2, '2020-01-01', 2),
(3, '2019-11-30', 3),
(4, '2019-11-30', 4),
(5, '2019-12-06', 5),
(6, '2019-12-21', 6),
(7, '2019-11-08', 7),
(8, '2019-11-08', 8),
(9, '2019-12-13', 9),
(10, '2019-11-08', 10);

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `car_id` int(5) UNSIGNED NOT NULL,
  `car_name` varchar(32) DEFAULT NULL,
  `car_color` varchar(32) DEFAULT NULL,
  `FK_reserve_id` int(5) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`car_id`, `car_name`, `car_color`, `FK_reserve_id`) VALUES
(1, 'Land Rover', 'red', 1),
(2, 'Volvo', 'yellow', 5),
(3, 'VW', 'black', 2),
(4, ' Audi', 'red', 4),
(5, 'Fiat', 'pink', 3),
(6, 'Fiat', 'gray', 6),
(7, 'Volvo', 'green', NULL),
(8, 'Toyota', 'blue', NULL),
(9, 'VW', 'white', 7),
(10, 'Ferrari', 'red', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `contact_id` int(5) NOT NULL,
  `city` varchar(32) DEFAULT NULL,
  `street` varchar(32) DEFAULT NULL,
  `phone` int(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `zip` int(10) DEFAULT NULL,
  `country` varchar(25) DEFAULT NULL,
  `FK_customer_id` int(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`contact_id`, `city`, `street`, `phone`, `email`, `zip`, `country`, `FK_customer_id`) VALUES
(1, 'Vienna', 'Twer Street', 2147483647, 'newmall@mail.com', 8035, 'Austria', 1),
(2, 'Berlin', 'new Street', 654656546, 'jioli@mail.com', 97756, 'Germany', 2),
(3, 'Munich', 'hui Street', 444566565, 'create@mail.com', 45466, 'Germany', 3),
(4, 'Munich', 'liii Street', 879556656, 'eetrrt@mail.com', 33353, 'Germany', 4),
(5, 'Berlin', 'real Street', 654645656, 'qqeer@mail.com', 24677, 'Germany', 5),
(6, 'Roma', 'false Street', 566678544, 'qwert@mail.com', 66477, 'Italy', 6);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(5) UNSIGNED NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `licence_num` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `first_name`, `last_name`, `birth_date`, `licence_num`) VALUES
(1, 'John', 'Doe', '1983-12-05', 'JND8313CC'),
(2, 'Mario', 'Rossi', '1970-05-05', 'MRT8310PLL'),
(3, 'Teodore', 'Rooswell', '2000-12-05', 'RTR5513PC'),
(4, 'Frank', 'Mool', '1995-09-05', 'ETD8317UU'),
(5, 'Marjon', 'Zulu', '1987-12-05', 'TRD8313CC'),
(6, 'sarah', 'Althgkd', '1979-12-02', 'KOL8313CC');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `emp_id` int(5) UNSIGNED NOT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `FK_location_id` int(5) UNSIGNED DEFAULT NULL,
  `FK_title_id` int(5) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`emp_id`, `firstname`, `lastname`, `hire_date`, `FK_location_id`, `FK_title_id`) VALUES
(1000, 'John', 'Doe', '1985-12-05', 2, 1),
(1001, 'Raff', 'Creww', '1982-11-05', 1, 1),
(1002, 'Werlo', 'Erol', '1982-08-05', 3, 1),
(1003, 'Moli', 'Pllo', '1983-05-05', 2, 2),
(1004, 'Gregor', 'Alfons', '1984-12-05', 2, 2),
(1005, 'Hernandez', 'Pascal', '1987-03-05', 1, 2),
(1006, 'Albart', 'Remoi', '1992-03-05', 1, 2),
(1008, 'Antony', 'Feeyz', '1991-01-02', 3, 3),
(1009, 'Carloy', 'Yalort', '1991-04-08', 3, 2),
(1010, 'Merlow', 'Terence', '1990-12-02', 1, 3),
(1011, 'Ralph', 'Lorence', '1989-09-12', 2, 3),
(1012, 'Raimond', 'Stephen', '1987-10-05', 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `insurance`
--

CREATE TABLE `insurance` (
  `insurance_id` int(5) UNSIGNED NOT NULL,
  `insurance_typ` varchar(50) DEFAULT NULL,
  `insurance_price` double(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `insurance`
--

INSERT INTO `insurance` (`insurance_id`, `insurance_typ`, `insurance_price`) VALUES
(101, 'No Insurance', NULL),
(102, 'minimum insurance policy', 7.00),
(103, 'Partial Insurance', 10.00),
(104, 'Full Insurance', 15.00);

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(5) UNSIGNED NOT NULL,
  `total` double(10,2) DEFAULT NULL,
  `FK_adc_id` int(5) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `total`, `FK_adc_id`) VALUES
(1, 440.00, 1),
(2, 920.60, 5),
(3, 620.50, 4),
(4, 240.00, 3),
(5, 275.00, 6),
(6, 370.00, 2),
(7, 300.00, 7);

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `location_id` int(5) UNSIGNED NOT NULL,
  `location_address` varchar(45) DEFAULT NULL,
  `location_zip` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`location_id`, `location_address`, `location_zip`) VALUES
(1, 'Ring', '1010'),
(2, 'Reumanplatz', '1100'),
(3, 'Arsenal', '1030');

-- --------------------------------------------------------

--
-- Table structure for table `model`
--

CREATE TABLE `model` (
  `model_id` int(5) UNSIGNED NOT NULL,
  `car_model` varchar(45) DEFAULT NULL,
  `model_year` year(4) DEFAULT NULL,
  `model_fuel` varchar(45) DEFAULT NULL,
  `FK_car_id` int(5) UNSIGNED DEFAULT NULL,
  `FK_location_id` int(4) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `model`
--

INSERT INTO `model` (`model_id`, `car_model`, `model_year`, `model_fuel`, `FK_car_id`, `FK_location_id`) VALUES
(1, 'Discovery ', 2018, 'Diesel', 1, 2),
(2, 'S60', 2016, 'Benzin', 2, 3),
(3, 'Polo', 2018, 'Benzin', 3, 1),
(4, 'Cabriolet', 2015, 'Benzin', 4, 1),
(5, '500', 2019, 'Benzin', 5, 3),
(6, '500XL', 2016, 'Benzin', 6, 3),
(7, 'SW', 2013, 'Diesel', 7, 1),
(8, 'Corolla', 2014, 'Benzin', 8, 1),
(9, 'Golf', 2015, 'Diesel', 9, 2),
(10, 'F40', 2013, 'Benzin', 10, 2);

-- --------------------------------------------------------

--
-- Table structure for table `paid`
--

CREATE TABLE `paid` (
  `paid_id` int(5) UNSIGNED NOT NULL,
  `payment_date` date DEFAULT NULL,
  `FK_invoice_id` int(5) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `paid`
--

INSERT INTO `paid` (`paid_id`, `payment_date`, `FK_invoice_id`) VALUES
(1, '2019-04-28', 1),
(2, '2019-04-28', 2),
(3, '2019-04-28', 3),
(4, '2019-04-28', 4),
(5, '2019-04-28', 5),
(6, NULL, 6),
(7, NULL, 7);

-- --------------------------------------------------------

--
-- Table structure for table `pay`
--

CREATE TABLE `pay` (
  `pay_id` int(5) UNSIGNED NOT NULL,
  `price` double(10,2) DEFAULT NULL,
  `FK_model_id` int(5) UNSIGNED DEFAULT NULL,
  `FK_insurance_id` int(5) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pay`
--

INSERT INTO `pay` (`pay_id`, `price`, `FK_model_id`, `FK_insurance_id`) VALUES
(1, 15.70, 1, 104),
(2, 13.50, 2, 102),
(3, 19.00, 3, 103),
(4, 18.40, 4, 101),
(5, 12.00, 5, 102),
(6, 17.90, 6, 103),
(7, 14.00, 7, NULL),
(8, 15.20, 8, NULL),
(9, 17.00, 9, 101),
(10, 69.90, 10, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reserve`
--

CREATE TABLE `reserve` (
  `reserve_id` int(5) UNSIGNED NOT NULL,
  `pickup_date` date DEFAULT NULL,
  `FK_customer_id` int(5) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reserve`
--

INSERT INTO `reserve` (`reserve_id`, `pickup_date`, `FK_customer_id`) VALUES
(1, '2019-12-02', 1),
(2, '2019-11-13', 2),
(3, '2019-11-30', 3),
(4, '2019-11-13', 2),
(5, '2019-12-22', 6),
(6, '2019-12-10', 4),
(7, '2019-12-06', 5);

-- --------------------------------------------------------

--
-- Table structure for table `return_car`
--

CREATE TABLE `return_car` (
  `return_id` int(5) UNSIGNED NOT NULL,
  `dropoff_date` date DEFAULT NULL,
  `dropoff_location` varchar(35) DEFAULT NULL,
  `FK_model_id` int(5) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `return_car`
--

INSERT INTO `return_car` (`return_id`, `dropoff_date`, `dropoff_location`, `FK_model_id`) VALUES
(1, '2019-12-25', 'Ring', 1),
(2, '2019-12-31', 'Arsenal', 2),
(3, '2019-11-29', 'Reumanplatz', 3),
(4, '2019-11-29', 'Arsenal', 4),
(5, '2019-12-05', 'Ring', 5),
(6, '2019-12-20', 'Arsenal', 6),
(7, '2019-12-12', 'Reumanplatz', 9);

-- --------------------------------------------------------

--
-- Table structure for table `salaries`
--

CREATE TABLE `salaries` (
  `salary_id` int(5) UNSIGNED NOT NULL,
  `salary` double(10,2) DEFAULT NULL,
  `FK_emp_id` int(5) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `salaries`
--

INSERT INTO `salaries` (`salary_id`, `salary`, `FK_emp_id`) VALUES
(1, 89090.00, 1000),
(2, 91120.00, 1001),
(3, 84060.00, 1002),
(4, 56090.00, 1004),
(5, 47030.00, 1005),
(6, 44090.00, 1003),
(7, 38090.00, 1012),
(8, 38766.00, 1006),
(9, 36777.00, 1011),
(10, 33778.00, 1008),
(11, 37666.00, 1009),
(12, 32773.00, 1010);

-- --------------------------------------------------------

--
-- Table structure for table `title`
--

CREATE TABLE `title` (
  `title_id` int(5) UNSIGNED NOT NULL,
  `emp_title` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `title`
--

INSERT INTO `title` (`title_id`, `emp_title`) VALUES
(1, 'branch manager'),
(2, 'customer care'),
(3, 'employee');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `additional`
--
ALTER TABLE `additional`
  ADD PRIMARY KEY (`adc_id`),
  ADD KEY `FK_pay_id` (`FK_pay_id`);

--
-- Indexes for table `available`
--
ALTER TABLE `available`
  ADD PRIMARY KEY (`available_id`),
  ADD KEY `FK_model_id` (`FK_model_id`);

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`car_id`),
  ADD KEY `FK_reserve_id` (`FK_reserve_id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`contact_id`),
  ADD KEY `FK_customer_id` (`FK_customer_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`emp_id`),
  ADD KEY `FK_location_id` (`FK_location_id`),
  ADD KEY `employee_ibfk_2` (`FK_title_id`);

--
-- Indexes for table `insurance`
--
ALTER TABLE `insurance`
  ADD PRIMARY KEY (`insurance_id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `FK_adc_id` (`FK_adc_id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`location_id`);

--
-- Indexes for table `model`
--
ALTER TABLE `model`
  ADD PRIMARY KEY (`model_id`),
  ADD KEY `FK_car_id` (`FK_car_id`),
  ADD KEY `model_ibfk_2` (`FK_location_id`);

--
-- Indexes for table `paid`
--
ALTER TABLE `paid`
  ADD PRIMARY KEY (`paid_id`),
  ADD KEY `FK_invoice_id` (`FK_invoice_id`);

--
-- Indexes for table `pay`
--
ALTER TABLE `pay`
  ADD PRIMARY KEY (`pay_id`),
  ADD KEY `FK_model_id` (`FK_model_id`),
  ADD KEY `pay_ibfk_2` (`FK_insurance_id`);

--
-- Indexes for table `reserve`
--
ALTER TABLE `reserve`
  ADD PRIMARY KEY (`reserve_id`),
  ADD KEY `FK_customer_id` (`FK_customer_id`);

--
-- Indexes for table `return_car`
--
ALTER TABLE `return_car`
  ADD PRIMARY KEY (`return_id`),
  ADD KEY `FK_dropoff_location_id` (`dropoff_location`),
  ADD KEY `return_car_ibfk_2` (`FK_model_id`);

--
-- Indexes for table `salaries`
--
ALTER TABLE `salaries`
  ADD PRIMARY KEY (`salary_id`),
  ADD KEY `FK_emp_id` (`FK_emp_id`);

--
-- Indexes for table `title`
--
ALTER TABLE `title`
  ADD PRIMARY KEY (`title_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `available`
--
ALTER TABLE `available`
  MODIFY `available_id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `car`
--
ALTER TABLE `car`
  MODIFY `car_id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `location_id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `model`
--
ALTER TABLE `model`
  MODIFY `model_id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pay`
--
ALTER TABLE `pay`
  MODIFY `pay_id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `reserve`
--
ALTER TABLE `reserve`
  MODIFY `reserve_id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `additional`
--
ALTER TABLE `additional`
  ADD CONSTRAINT `additional_ibfk_1` FOREIGN KEY (`FK_pay_id`) REFERENCES `pay` (`pay_id`);

--
-- Constraints for table `available`
--
ALTER TABLE `available`
  ADD CONSTRAINT `available_ibfk_1` FOREIGN KEY (`FK_model_id`) REFERENCES `model` (`model_id`);

--
-- Constraints for table `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `car_ibfk_1` FOREIGN KEY (`FK_reserve_id`) REFERENCES `reserve` (`reserve_id`);

--
-- Constraints for table `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `contact_ibfk_1` FOREIGN KEY (`FK_customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`FK_location_id`) REFERENCES `location` (`location_id`),
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`FK_title_id`) REFERENCES `title` (`title_id`);

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`FK_adc_id`) REFERENCES `additional` (`adc_id`);

--
-- Constraints for table `model`
--
ALTER TABLE `model`
  ADD CONSTRAINT `model_ibfk_1` FOREIGN KEY (`FK_car_id`) REFERENCES `car` (`car_id`),
  ADD CONSTRAINT `model_ibfk_2` FOREIGN KEY (`FK_location_id`) REFERENCES `location` (`location_id`);

--
-- Constraints for table `paid`
--
ALTER TABLE `paid`
  ADD CONSTRAINT `paid_ibfk_1` FOREIGN KEY (`FK_invoice_id`) REFERENCES `invoice` (`invoice_id`);

--
-- Constraints for table `pay`
--
ALTER TABLE `pay`
  ADD CONSTRAINT `pay_ibfk_1` FOREIGN KEY (`FK_model_id`) REFERENCES `model` (`model_id`),
  ADD CONSTRAINT `pay_ibfk_2` FOREIGN KEY (`FK_insurance_id`) REFERENCES `insurance` (`insurance_id`);

--
-- Constraints for table `reserve`
--
ALTER TABLE `reserve`
  ADD CONSTRAINT `reserve_ibfk_1` FOREIGN KEY (`FK_customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `return_car`
--
ALTER TABLE `return_car`
  ADD CONSTRAINT `return_car_ibfk_2` FOREIGN KEY (`FK_model_id`) REFERENCES `model` (`model_id`);

--
-- Constraints for table `salaries`
--
ALTER TABLE `salaries`
  ADD CONSTRAINT `salaries_ibfk_1` FOREIGN KEY (`FK_emp_id`) REFERENCES `employee` (`emp_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
