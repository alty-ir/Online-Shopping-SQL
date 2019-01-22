-- phpMyAdmin SQL Dump
-- version 4.7.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 20, 2018 at 12:17 AM
-- Server version: 5.7.20-log
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_shopping`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `A` ()  BEGIN
      DECLARE a INT Default 1 ;
      simple_loop: LOOP         
         INSERT INTO `person_address`(`Person_ID`, `Address`) VALUES (a,concat("Place addr ",a));
         SET a=a+1;
         IF a=6 THEN
            LEAVE simple_loop;
         END IF;
   END LOOP simple_loop;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `A2` ()  BEGIN
      DECLARE a INT Default 1 ;
      simple_loop: LOOP         
         INSERT INTO `person_phone`(`Person_ID`, `Phone`) VALUES (a,concat(8822661,a));
         SET a=a+1;
         IF a=6 THEN
            LEAVE simple_loop;
         END IF;
   END LOOP simple_loop;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `A3` ()  BEGIN
      DECLARE a INT Default 1 ;
      simple_loop: LOOP      
INSERT INTO `product`(`Name`, `Product_Code`, `Discount`, `Count`, `ProducerName`, `Price`) VALUES (concat("product ",a),concat("code",a),CAST(RAND() * 60 AS UNSIGNED) + 1,CAST(RAND() * 60 AS UNSIGNED) + 1,concat("Producer",a),CAST(RAND() * 6000 AS UNSIGNED) + 1);
         SET a=a+1;
         IF a=10 THEN
            LEAVE simple_loop;
         END IF;
   END LOOP simple_loop;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `A4` ()  BEGIN
      DECLARE a INT Default 4 ;
      simple_loop: LOOP
INSERT INTO `sport_product`(`Product_ID`, `Color`) VALUES (a,'red');

         SET a=a+1;
         IF a=7 THEN
            LEAVE simple_loop;
         END IF;
   END LOOP simple_loop;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `A5` ()  BEGIN
      DECLARE a INT Default 7 ;
      simple_loop: LOOP
INSERT INTO `home_product`(`Product_ID`, `Date`) VALUES (a,"2018-01-01");
         SET a=a+1;
         IF a=10 THEN
            LEAVE simple_loop;
         END IF;
   END LOOP simple_loop;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `ID` int(11) NOT NULL,
  `Purchase_ID` int(11) DEFAULT NULL,
  `Customer_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`ID`, `Purchase_ID`, `Customer_ID`) VALUES
(1, 1, 1),
(2, 2, 3);

--
-- Triggers `cart`
--
DELIMITER $$
CREATE TRIGGER `deleted_cart` AFTER DELETE ON `cart` FOR EACH ROW INSERT INTO deleted_cart VALUES (OLD.ID, OLD.Purchase_ID, OLD.Customer_ID)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cart_content`
--

CREATE TABLE `cart_content` (
  `Product_ID` int(11) NOT NULL,
  `Cart_ID` int(11) NOT NULL,
  `Count` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cart_content`
--

INSERT INTO `cart_content` (`Product_ID`, `Cart_ID`, `Count`) VALUES
(1, 1, 2),
(2, 1, 1),
(2, 2, 1),
(3, 2, 2);

--
-- Triggers `cart_content`
--
DELIMITER $$
CREATE TRIGGER `deleted_cart_content` AFTER DELETE ON `cart_content` FOR EACH ROW INSERT INTO deleted_cart_content VALUES (OLD.Product_ID, OLD.Cart_ID, OLD.Count)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `ID` int(11) NOT NULL,
  `Support_ID` int(11) DEFAULT NULL,
  `User` int(11) DEFAULT NULL,
  `Title` varchar(100) DEFAULT NULL,
  `Duration` time DEFAULT NULL,
  `ChatDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chat`
--

INSERT INTO `chat` (`ID`, `Support_ID`, `User`, `Title`, `Duration`, `ChatDate`) VALUES
(1, 1, 22222222, 'solam mojtoba!!', '03:00:00', '2018-01-09');

--
-- Triggers `chat`
--
DELIMITER $$
CREATE TRIGGER `deleted_chat` AFTER DELETE ON `chat` FOR EACH ROW INSERT INTO deleted_chat VALUES (OLD.ID, OLD.Support_ID, OLD.User, OLD.Title, OLD.Duration, OLD.ChatDate)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `ID` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`ID`, `Name`) VALUES
(1, 'Nike'),
(2, 'Apple'),
(3, 'Ikea');

--
-- Triggers `company`
--
DELIMITER $$
CREATE TRIGGER `deleted_company` AFTER DELETE ON `company` FOR EACH ROW INSERT INTO deleted_company VALUES (OLD.ID, OLD.Name)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `company_address`
--

CREATE TABLE `company_address` (
  `Company_ID` int(11) NOT NULL,
  `Address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `company_address`
--

INSERT INTO `company_address` (`Company_ID`, `Address`) VALUES
(1, '4128 Sugarfoot Lane'),
(2, '2355 Turkey Pen Road'),
(3, '4435 Jadewood Drive');

--
-- Triggers `company_address`
--
DELIMITER $$
CREATE TRIGGER `deleted_company_address` AFTER DELETE ON `company_address` FOR EACH ROW INSERT INTO deleted_company_address VALUES (OLD.Company_ID, OLD.Address)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `company_phone`
--

CREATE TABLE `company_phone` (
  `Company_ID` int(11) NOT NULL,
  `Phone` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `company_phone`
--

INSERT INTO `company_phone` (`Company_ID`, `Phone`) VALUES
(1, '41283234'),
(2, '23552121'),
(3, '44354343');

--
-- Triggers `company_phone`
--
DELIMITER $$
CREATE TRIGGER `deleted_company_phone` AFTER DELETE ON `company_phone` FOR EACH ROW INSERT INTO deleted_company_phone VALUES (OLD.Company_ID, OLD.Phone)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `create_time`
--

CREATE TABLE `create_time` (
  `table_name` varchar(50) NOT NULL,
  `time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `create_time`
--

INSERT INTO `create_time` (`table_name`, `time`) VALUES
('chat', '2018-01-18 04:14:11');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Person_ID` int(11) DEFAULT NULL,
  `ID` int(11) NOT NULL,
  `UserName` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Person_ID`, `ID`, `UserName`) VALUES
(1, 1, 'username1'),
(2, 2, 'username2'),
(6, 3, 'emp1'),
(7, 4, 'emp2');

--
-- Triggers `customer`
--
DELIMITER $$
CREATE TRIGGER `deleted_customer` AFTER DELETE ON `customer` FOR EACH ROW INSERT INTO deleted_customer VALUES (OLD.Person_ID, OLD.ID, OLD.UserName)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `deleted_cart`
--

CREATE TABLE `deleted_cart` (
  `ID` int(11) NOT NULL,
  `Purchase_ID` int(11) DEFAULT NULL,
  `Customer_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `deleted_cart_content`
--

CREATE TABLE `deleted_cart_content` (
  `Product_ID` int(11) NOT NULL,
  `Cart_ID` int(11) NOT NULL,
  `Count` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `deleted_chat`
--

CREATE TABLE `deleted_chat` (
  `ID` int(11) NOT NULL,
  `Support_ID` int(11) DEFAULT NULL,
  `User` int(11) DEFAULT NULL,
  `Title` varchar(100) DEFAULT NULL,
  `Duration` time DEFAULT NULL,
  `ChatDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `deleted_company`
--

CREATE TABLE `deleted_company` (
  `ID` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `deleted_company_address`
--

CREATE TABLE `deleted_company_address` (
  `Company_ID` int(11) NOT NULL,
  `Address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `deleted_company_phone`
--

CREATE TABLE `deleted_company_phone` (
  `Company_ID` int(11) NOT NULL,
  `Phone` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `deleted_customer`
--

CREATE TABLE `deleted_customer` (
  `Person_ID` int(11) DEFAULT NULL,
  `ID` int(11) NOT NULL,
  `UserName` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `deleted_delivery`
--

CREATE TABLE `deleted_delivery` (
  `ID` int(11) NOT NULL,
  `Purchase_ID` int(11) DEFAULT NULL,
  `Driver_ID` int(11) DEFAULT NULL,
  `Status` tinyint(1) DEFAULT '0',
  `dateDelivered` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `deleted_driver`
--

CREATE TABLE `deleted_driver` (
  `ID` int(11) NOT NULL,
  `Person_ID` int(11) DEFAULT NULL,
  `License_Plate` varchar(20) DEFAULT NULL,
  `Car_Type` varchar(20) DEFAULT NULL,
  `Nation_Code` decimal(10,0) DEFAULT NULL,
  `Status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `deleted_employee`
--

CREATE TABLE `deleted_employee` (
  `ID` int(11) NOT NULL,
  `customer_ID` int(11) DEFAULT NULL,
  `Company_ID` int(11) DEFAULT NULL,
  `Validation` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `deleted_employee_purchase`
--

CREATE TABLE `deleted_employee_purchase` (
  `Employee_ID` int(11) NOT NULL,
  `Purchase_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `deleted_home_product`
--

CREATE TABLE `deleted_home_product` (
  `Product_ID` int(11) NOT NULL,
  `Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `deleted_operator`
--

CREATE TABLE `deleted_operator` (
  `ID` int(11) NOT NULL,
  `FName` varchar(50) DEFAULT NULL,
  `LName` varchar(50) DEFAULT NULL,
  `Company_ID` int(11) DEFAULT NULL,
  `HireDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `deleted_operator_phone`
--

CREATE TABLE `deleted_operator_phone` (
  `Operator_ID` int(11) NOT NULL,
  `Phone` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `deleted_person`
--

CREATE TABLE `deleted_person` (
  `ID` int(11) NOT NULL,
  `FName` varchar(50) DEFAULT NULL,
  `LName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `deleted_person`
--

INSERT INTO `deleted_person` (`ID`, `FName`, `LName`) VALUES
(8, 'osgol', 'osgolzade');

-- --------------------------------------------------------

--
-- Table structure for table `deleted_person_address`
--

CREATE TABLE `deleted_person_address` (
  `Person_ID` int(11) NOT NULL,
  `Address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `deleted_person_phone`
--

CREATE TABLE `deleted_person_phone` (
  `Person_ID` int(11) NOT NULL,
  `Phone` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `deleted_product`
--

CREATE TABLE `deleted_product` (
  `ID` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Product_Code` varchar(20) DEFAULT NULL,
  `Discount` int(11) DEFAULT NULL,
  `Count` int(11) DEFAULT NULL,
  `ProducerName` varchar(50) DEFAULT NULL,
  `Price` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `deleted_product`
--

INSERT INTO `deleted_product` (`ID`, `Name`, `Product_Code`, `Discount`, `Count`, `ProducerName`, `Price`) VALUES
(12, 'man', 'man', 11, 11, 'man', 11),
(14, 'aA', 'DS', 1, 1, 'AS', 2);

-- --------------------------------------------------------

--
-- Table structure for table `deleted_product_rating`
--

CREATE TABLE `deleted_product_rating` (
  `Product_ID` int(11) NOT NULL,
  `Customer_ID` int(11) NOT NULL,
  `Rating` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `deleted_purchase`
--

CREATE TABLE `deleted_purchase` (
  `ID` int(11) NOT NULL,
  `Discount` int(11) DEFAULT NULL,
  `DateTime` datetime DEFAULT NULL,
  `Tax` int(11) DEFAULT NULL,
  `TotalPrice` int(11) DEFAULT NULL,
  `Type` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `deleted_registered_customer`
--

CREATE TABLE `deleted_registered_customer` (
  `customer_ID` int(11) NOT NULL,
  `Credit` int(11) DEFAULT NULL,
  `registerDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `deleted_sport_product`
--

CREATE TABLE `deleted_sport_product` (
  `Product_ID` int(11) NOT NULL,
  `Color` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `deleted_status_support`
--

CREATE TABLE `deleted_status_support` (
  `ID` int(11) NOT NULL,
  `Support_ID` int(11) DEFAULT NULL,
  `Type` tinyint(1) DEFAULT NULL,
  `Status_DateTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `deleted_support`
--

CREATE TABLE `deleted_support` (
  `ID` int(11) NOT NULL,
  `Person_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `ID` int(11) NOT NULL,
  `Purchase_ID` int(11) DEFAULT NULL,
  `Driver_ID` int(11) DEFAULT NULL,
  `Status` tinyint(1) DEFAULT '0',
  `dateDelivered` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`ID`, `Purchase_ID`, `Driver_ID`, `Status`, `dateDelivered`) VALUES
(1, 1, 1, 0, '2018-01-22 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `ID` int(11) NOT NULL,
  `Person_ID` int(11) DEFAULT NULL,
  `License_Plate` varchar(20) DEFAULT NULL,
  `Car_Type` varchar(20) DEFAULT NULL,
  `Nation_Code` decimal(10,0) DEFAULT NULL,
  `Status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`ID`, `Person_ID`, `License_Plate`, `Car_Type`, `Nation_Code`, `Status`) VALUES
(1, 3, 'Vanet', 'plate3', '53', 0);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `ID` int(11) NOT NULL,
  `customer_ID` int(11) DEFAULT NULL,
  `Company_ID` int(11) DEFAULT NULL,
  `Validation` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`ID`, `customer_ID`, `Company_ID`, `Validation`) VALUES
(1, 3, 1, 0),
(2, 4, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `employee_purchase`
--

CREATE TABLE `employee_purchase` (
  `Employee_ID` int(11) NOT NULL,
  `Purchase_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee_purchase`
--

INSERT INTO `employee_purchase` (`Employee_ID`, `Purchase_ID`) VALUES
(1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `home_product`
--

CREATE TABLE `home_product` (
  `Product_ID` int(11) NOT NULL,
  `Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `home_product`
--

INSERT INTO `home_product` (`Product_ID`, `Date`) VALUES
(8, '2018-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `log_product`
--

CREATE TABLE `log_product` (
  `ID` int(11) NOT NULL,
  `Query_Type` varchar(10) DEFAULT NULL,
  `TID` int(11) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Product_Code` varchar(20) DEFAULT NULL,
  `Discount` int(11) DEFAULT NULL,
  `Count` int(11) DEFAULT NULL,
  `ProducerName` varchar(50) DEFAULT NULL,
  `Price` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `log_product`
--

INSERT INTO `log_product` (`ID`, `Query_Type`, `TID`, `Name`, `Product_Code`, `Discount`, `Count`, `ProducerName`, `Price`) VALUES
(1, 'Insert', 13, 's', 'as', 2, 2, 'asd', 21),
(2, 'Insert', 14, 'aA', 'DS', 1, 1, 'AS', 2),
(3, 'Delete', 14, 'aA', 'DS', 1, 1, 'AS', 2);

-- --------------------------------------------------------

--
-- Table structure for table `operator`
--

CREATE TABLE `operator` (
  `ID` int(11) NOT NULL,
  `FName` varchar(50) DEFAULT NULL,
  `LName` varchar(50) DEFAULT NULL,
  `Company_ID` int(11) DEFAULT NULL,
  `HireDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `operator`
--

INSERT INTO `operator` (`ID`, `FName`, `LName`, `Company_ID`, `HireDate`) VALUES
(1, 'Mahdi', 'Rashidi', 1, '2018-01-01'),
(2, 'Ahmad', 'Asadi', 2, '2018-01-02');

-- --------------------------------------------------------

--
-- Table structure for table `operator_phone`
--

CREATE TABLE `operator_phone` (
  `Operator_ID` int(11) NOT NULL,
  `Phone` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `operator_phone`
--

INSERT INTO `operator_phone` (`Operator_ID`, `Phone`) VALUES
(1, '2829684');

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `ID` int(11) NOT NULL,
  `FName` varchar(50) DEFAULT NULL,
  `LName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`ID`, `FName`, `LName`) VALUES
(1, 'Ali', 'Tabesh'),
(2, 'Mahyar', 'Salamat'),
(3, 'Shiva', 'Bikaran'),
(5, 'John', 'Doe'),
(6, 'Eric', 'Clapton'),
(7, 'Amy', 'Lee');

--
-- Triggers `person`
--
DELIMITER $$
CREATE TRIGGER `deleted_person` AFTER DELETE ON `person` FOR EACH ROW INSERT INTO deleted_person VALUES (OLD.ID, OLD.Fname, OLD.Lname)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `person_address`
--

CREATE TABLE `person_address` (
  `Person_ID` int(11) NOT NULL,
  `Address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `person_address`
--

INSERT INTO `person_address` (`Person_ID`, `Address`) VALUES
(1, 'Place addr 1'),
(2, 'Place addr 2'),
(3, 'Place addr 3'),
(5, 'Place addr 5');

-- --------------------------------------------------------

--
-- Table structure for table `person_phone`
--

CREATE TABLE `person_phone` (
  `Person_ID` int(11) NOT NULL,
  `Phone` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `person_phone`
--

INSERT INTO `person_phone` (`Person_ID`, `Phone`) VALUES
(1, '88226611'),
(2, '88226612'),
(3, '88226613'),
(5, '88226615');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ID` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Product_Code` varchar(20) DEFAULT NULL,
  `Discount` int(11) DEFAULT NULL,
  `Count` int(11) DEFAULT NULL,
  `ProducerName` varchar(50) DEFAULT NULL,
  `Price` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ID`, `Name`, `Product_Code`, `Discount`, `Count`, `ProducerName`, `Price`) VALUES
(1, 'product 1', 'code1', 4, 26, 'Producer1', 5293),
(2, 'product 2', 'code2', 12, 15, 'Producer2', 3989),
(3, 'product 3', 'code3', 37, 3, 'Producer3', 2175),
(4, 'product 4', 'code4', 43, 27, 'Producer4', 224),
(5, 'product 5', 'code5', 55, 24, 'Producer5', 1132),
(6, 'product 6', 'code6', 50, 31, 'Producer6', 455),
(8, 'product 8', 'code8', 29, 29, 'Producer8', 5571),
(13, 's', 'as', 2, 2, 'asd', 21);

--
-- Triggers `product`
--
DELIMITER $$
CREATE TRIGGER `Date_Log_Product_Delete` AFTER DELETE ON `product` FOR EACH ROW INSERT INTO table_last_modified (TableName,Date_Time) VALUES ("Product",NOW())
ON DUPLICATE KEY UPDATE
  Date_Time = NOW()
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Date_Log_Product_Insert` AFTER INSERT ON `product` FOR EACH ROW INSERT INTO table_last_modified (TableName,Date_Time) VALUES ("Product",NOW())
ON DUPLICATE KEY UPDATE
  Date_Time = NOW()
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Date_Log_Product_Update` AFTER UPDATE ON `product` FOR EACH ROW INSERT INTO table_last_modified (TableName,Date_Time) VALUES ("Product",NOW())
ON DUPLICATE KEY UPDATE
  Date_Time = NOW()
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `deleted_Product` AFTER DELETE ON `product` FOR EACH ROW insert into deleted_Product values (OLD.ID, OLD.Name, OLD.Product_Code, OLD.Discount, OLD.Count, OLD.ProducerName, OLD.Price)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_Product_Delete` AFTER DELETE ON `product` FOR EACH ROW INSERT INTO log_Product
    VALUES (null,"Delete", OLD.ID,OLD.Name,OLD.Product_Code,OLD.Discount,OLD.Count,OLD.ProducerName,OLD.Price)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_Product_Insert` AFTER INSERT ON `product` FOR EACH ROW INSERT INTO log_Product
    VALUES (null,"Insert", NEW.ID,NEW.Name,NEW.Product_Code,NEW.Discount,NEW.Count,NEW.ProducerName,NEW.Price)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_Product_Update` AFTER UPDATE ON `product` FOR EACH ROW INSERT INTO log_Product
    VALUES (null,"Update", NEW.ID,NEW.Name,NEW.Product_Code,NEW.Discount,NEW.Count,NEW.ProducerName,NEW.Price)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `product_rating`
--

CREATE TABLE `product_rating` (
  `Product_ID` int(11) NOT NULL,
  `Customer_ID` int(11) NOT NULL,
  `Rating` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_rating`
--

INSERT INTO `product_rating` (`Product_ID`, `Customer_ID`, `Rating`) VALUES
(2, 1, 7),
(2, 2, 2),
(3, 1, 8),
(3, 2, 7),
(4, 1, 2),
(5, 1, 1),
(5, 2, 1);

--
-- Triggers `product_rating`
--
DELIMITER $$
CREATE TRIGGER `deleted_Product_rating` AFTER DELETE ON `product_rating` FOR EACH ROW insert into deleted_product_rating values (product_rating.Product_ID, product_rating.Customer_ID, product_rating.Rating)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `ID` int(11) NOT NULL,
  `Discount` int(11) DEFAULT NULL,
  `DateTime` datetime DEFAULT NULL,
  `Tax` int(11) DEFAULT NULL,
  `TotalPrice` int(11) DEFAULT NULL,
  `Type` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `purchase`
--

INSERT INTO `purchase` (`ID`, `Discount`, `DateTime`, `Tax`, `TotalPrice`, `Type`) VALUES
(1, 0, '2018-01-01 01:00:00', 0, 1000, 0),
(2, 0, '2018-01-01 00:00:00', 0, 50000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `registered_customer`
--

CREATE TABLE `registered_customer` (
  `customer_ID` int(11) NOT NULL,
  `Credit` int(11) DEFAULT NULL,
  `registerDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `registered_customer`
--

INSERT INTO `registered_customer` (`customer_ID`, `Credit`, `registerDate`) VALUES
(2, 1000, '2018-01-01');

--
-- Triggers `registered_customer`
--
DELIMITER $$
CREATE TRIGGER `deleted_registered_customer` AFTER DELETE ON `registered_customer` FOR EACH ROW INSERT INTO deleted_registered_customer VALUES (OLD.customer_ID, OLD.Credit, OLD.registerDate)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `sport_product`
--

CREATE TABLE `sport_product` (
  `Product_ID` int(11) NOT NULL,
  `Color` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sport_product`
--

INSERT INTO `sport_product` (`Product_ID`, `Color`) VALUES
(4, 'red'),
(5, 'red'),
(6, 'red');

--
-- Triggers `sport_product`
--
DELIMITER $$
CREATE TRIGGER `deleted_sport_product` AFTER DELETE ON `sport_product` FOR EACH ROW INSERT INTO deleted_sport_product VALUES (sport_product.Product_ID, sport_product.Color)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `status_support`
--

CREATE TABLE `status_support` (
  `ID` int(11) NOT NULL,
  `Support_ID` int(11) DEFAULT NULL,
  `Type` tinyint(1) DEFAULT NULL,
  `Status_DateTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `status_support`
--

INSERT INTO `status_support` (`ID`, `Support_ID`, `Type`, `Status_DateTime`) VALUES
(1, 1, 0, '2018-01-01 00:00:00'),
(2, 1, 1, '2018-02-01 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `support`
--

CREATE TABLE `support` (
  `ID` int(11) NOT NULL,
  `Person_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `support`
--

INSERT INTO `support` (`ID`, `Person_ID`) VALUES
(1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `table_last_modified`
--

CREATE TABLE `table_last_modified` (
  `TableName` varchar(50) NOT NULL,
  `Date_Time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `table_last_modified`
--

INSERT INTO `table_last_modified` (`TableName`, `Date_Time`) VALUES
('Product', '2018-01-19 23:51:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Purchase_ID` (`Purchase_ID`),
  ADD KEY `Customer_ID` (`Customer_ID`);

--
-- Indexes for table `cart_content`
--
ALTER TABLE `cart_content`
  ADD PRIMARY KEY (`Product_ID`,`Cart_ID`),
  ADD KEY `Cart_ID` (`Cart_ID`);

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Support_ID` (`Support_ID`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `company_address`
--
ALTER TABLE `company_address`
  ADD PRIMARY KEY (`Address`,`Company_ID`),
  ADD KEY `Company_ID` (`Company_ID`);

--
-- Indexes for table `company_phone`
--
ALTER TABLE `company_phone`
  ADD PRIMARY KEY (`Phone`,`Company_ID`),
  ADD KEY `Company_ID` (`Company_ID`);

--
-- Indexes for table `create_time`
--
ALTER TABLE `create_time`
  ADD PRIMARY KEY (`table_name`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Person_ID` (`Person_ID`);

--
-- Indexes for table `deleted_cart`
--
ALTER TABLE `deleted_cart`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Purchase_ID` (`Purchase_ID`),
  ADD KEY `Customer_ID` (`Customer_ID`);

--
-- Indexes for table `deleted_cart_content`
--
ALTER TABLE `deleted_cart_content`
  ADD PRIMARY KEY (`Product_ID`,`Cart_ID`),
  ADD KEY `Cart_ID` (`Cart_ID`);

--
-- Indexes for table `deleted_chat`
--
ALTER TABLE `deleted_chat`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Support_ID` (`Support_ID`);

--
-- Indexes for table `deleted_company`
--
ALTER TABLE `deleted_company`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `deleted_company_address`
--
ALTER TABLE `deleted_company_address`
  ADD PRIMARY KEY (`Address`,`Company_ID`),
  ADD KEY `Company_ID` (`Company_ID`);

--
-- Indexes for table `deleted_company_phone`
--
ALTER TABLE `deleted_company_phone`
  ADD PRIMARY KEY (`Phone`,`Company_ID`),
  ADD KEY `Company_ID` (`Company_ID`);

--
-- Indexes for table `deleted_customer`
--
ALTER TABLE `deleted_customer`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Person_ID` (`Person_ID`);

--
-- Indexes for table `deleted_delivery`
--
ALTER TABLE `deleted_delivery`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Purchase_ID` (`Purchase_ID`),
  ADD KEY `Driver_ID` (`Driver_ID`);

--
-- Indexes for table `deleted_driver`
--
ALTER TABLE `deleted_driver`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Person_ID` (`Person_ID`);

--
-- Indexes for table `deleted_employee`
--
ALTER TABLE `deleted_employee`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Company_ID` (`Company_ID`),
  ADD KEY `customer_ID` (`customer_ID`);

--
-- Indexes for table `deleted_employee_purchase`
--
ALTER TABLE `deleted_employee_purchase`
  ADD PRIMARY KEY (`Employee_ID`,`Purchase_ID`),
  ADD KEY `Purchase_ID` (`Purchase_ID`);

--
-- Indexes for table `deleted_home_product`
--
ALTER TABLE `deleted_home_product`
  ADD PRIMARY KEY (`Product_ID`);

--
-- Indexes for table `deleted_operator`
--
ALTER TABLE `deleted_operator`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Company_ID` (`Company_ID`);

--
-- Indexes for table `deleted_operator_phone`
--
ALTER TABLE `deleted_operator_phone`
  ADD PRIMARY KEY (`Phone`,`Operator_ID`),
  ADD KEY `Operator_ID` (`Operator_ID`);

--
-- Indexes for table `deleted_person`
--
ALTER TABLE `deleted_person`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `deleted_person_address`
--
ALTER TABLE `deleted_person_address`
  ADD PRIMARY KEY (`Address`,`Person_ID`),
  ADD KEY `Person_ID` (`Person_ID`);

--
-- Indexes for table `deleted_person_phone`
--
ALTER TABLE `deleted_person_phone`
  ADD PRIMARY KEY (`Phone`,`Person_ID`),
  ADD KEY `Person_ID` (`Person_ID`);

--
-- Indexes for table `deleted_product`
--
ALTER TABLE `deleted_product`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `deleted_product_rating`
--
ALTER TABLE `deleted_product_rating`
  ADD PRIMARY KEY (`Product_ID`,`Customer_ID`),
  ADD KEY `Customer_ID` (`Customer_ID`);

--
-- Indexes for table `deleted_purchase`
--
ALTER TABLE `deleted_purchase`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `deleted_registered_customer`
--
ALTER TABLE `deleted_registered_customer`
  ADD PRIMARY KEY (`customer_ID`);

--
-- Indexes for table `deleted_sport_product`
--
ALTER TABLE `deleted_sport_product`
  ADD PRIMARY KEY (`Product_ID`);

--
-- Indexes for table `deleted_status_support`
--
ALTER TABLE `deleted_status_support`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Support_ID` (`Support_ID`);

--
-- Indexes for table `deleted_support`
--
ALTER TABLE `deleted_support`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Person_ID` (`Person_ID`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Purchase_ID` (`Purchase_ID`),
  ADD KEY `Driver_ID` (`Driver_ID`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Person_ID` (`Person_ID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Company_ID` (`Company_ID`),
  ADD KEY `customer_ID` (`customer_ID`);

--
-- Indexes for table `employee_purchase`
--
ALTER TABLE `employee_purchase`
  ADD PRIMARY KEY (`Employee_ID`,`Purchase_ID`),
  ADD KEY `Purchase_ID` (`Purchase_ID`);

--
-- Indexes for table `home_product`
--
ALTER TABLE `home_product`
  ADD PRIMARY KEY (`Product_ID`);

--
-- Indexes for table `log_product`
--
ALTER TABLE `log_product`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `operator`
--
ALTER TABLE `operator`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Company_ID` (`Company_ID`);

--
-- Indexes for table `operator_phone`
--
ALTER TABLE `operator_phone`
  ADD PRIMARY KEY (`Phone`,`Operator_ID`),
  ADD KEY `Operator_ID` (`Operator_ID`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `person_address`
--
ALTER TABLE `person_address`
  ADD PRIMARY KEY (`Address`,`Person_ID`),
  ADD KEY `Person_ID` (`Person_ID`);

--
-- Indexes for table `person_phone`
--
ALTER TABLE `person_phone`
  ADD PRIMARY KEY (`Phone`,`Person_ID`),
  ADD KEY `Person_ID` (`Person_ID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `product_rating`
--
ALTER TABLE `product_rating`
  ADD PRIMARY KEY (`Product_ID`,`Customer_ID`),
  ADD KEY `Customer_ID` (`Customer_ID`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `registered_customer`
--
ALTER TABLE `registered_customer`
  ADD PRIMARY KEY (`customer_ID`);

--
-- Indexes for table `sport_product`
--
ALTER TABLE `sport_product`
  ADD PRIMARY KEY (`Product_ID`);

--
-- Indexes for table `status_support`
--
ALTER TABLE `status_support`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Support_ID` (`Support_ID`);

--
-- Indexes for table `support`
--
ALTER TABLE `support`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Person_ID` (`Person_ID`);

--
-- Indexes for table `table_last_modified`
--
ALTER TABLE `table_last_modified`
  ADD PRIMARY KEY (`TableName`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `chat`
--
ALTER TABLE `chat`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `deleted_cart`
--
ALTER TABLE `deleted_cart`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deleted_chat`
--
ALTER TABLE `deleted_chat`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deleted_company`
--
ALTER TABLE `deleted_company`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deleted_customer`
--
ALTER TABLE `deleted_customer`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deleted_delivery`
--
ALTER TABLE `deleted_delivery`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deleted_driver`
--
ALTER TABLE `deleted_driver`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deleted_employee`
--
ALTER TABLE `deleted_employee`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deleted_operator`
--
ALTER TABLE `deleted_operator`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deleted_person`
--
ALTER TABLE `deleted_person`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `deleted_purchase`
--
ALTER TABLE `deleted_purchase`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deleted_status_support`
--
ALTER TABLE `deleted_status_support`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deleted_support`
--
ALTER TABLE `deleted_support`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `driver`
--
ALTER TABLE `driver`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `log_product`
--
ALTER TABLE `log_product`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `operator`
--
ALTER TABLE `operator`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `purchase`
--
ALTER TABLE `purchase`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `status_support`
--
ALTER TABLE `status_support`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `support`
--
ALTER TABLE `support`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`Purchase_ID`) REFERENCES `purchase` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `cart_content`
--
ALTER TABLE `cart_content`
  ADD CONSTRAINT `cart_content_ibfk_1` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_content_ibfk_2` FOREIGN KEY (`Cart_ID`) REFERENCES `cart` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `chat`
--
ALTER TABLE `chat`
  ADD CONSTRAINT `chat_ibfk_1` FOREIGN KEY (`Support_ID`) REFERENCES `support` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `company_address`
--
ALTER TABLE `company_address`
  ADD CONSTRAINT `company_address_ibfk_1` FOREIGN KEY (`Company_ID`) REFERENCES `company` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `company_phone`
--
ALTER TABLE `company_phone`
  ADD CONSTRAINT `company_phone_ibfk_1` FOREIGN KEY (`Company_ID`) REFERENCES `company` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`Person_ID`) REFERENCES `person` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `deleted_cart`
--
ALTER TABLE `deleted_cart`
  ADD CONSTRAINT `deleted_cart_ibfk_1` FOREIGN KEY (`Purchase_ID`) REFERENCES `deleted_purchase` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `deleted_cart_ibfk_2` FOREIGN KEY (`Customer_ID`) REFERENCES `deleted_customer` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `deleted_cart_content`
--
ALTER TABLE `deleted_cart_content`
  ADD CONSTRAINT `deleted_cart_content_ibfk_1` FOREIGN KEY (`Product_ID`) REFERENCES `deleted_product` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `deleted_cart_content_ibfk_2` FOREIGN KEY (`Cart_ID`) REFERENCES `deleted_cart` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `deleted_chat`
--
ALTER TABLE `deleted_chat`
  ADD CONSTRAINT `deleted_chat_ibfk_1` FOREIGN KEY (`Support_ID`) REFERENCES `deleted_support` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `deleted_company_address`
--
ALTER TABLE `deleted_company_address`
  ADD CONSTRAINT `deleted_company_address_ibfk_1` FOREIGN KEY (`Company_ID`) REFERENCES `deleted_company` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `deleted_company_phone`
--
ALTER TABLE `deleted_company_phone`
  ADD CONSTRAINT `deleted_company_phone_ibfk_1` FOREIGN KEY (`Company_ID`) REFERENCES `deleted_company` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `deleted_customer`
--
ALTER TABLE `deleted_customer`
  ADD CONSTRAINT `deleted_customer_ibfk_1` FOREIGN KEY (`Person_ID`) REFERENCES `deleted_person` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `deleted_delivery`
--
ALTER TABLE `deleted_delivery`
  ADD CONSTRAINT `deleted_delivery_ibfk_1` FOREIGN KEY (`Purchase_ID`) REFERENCES `deleted_purchase` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `deleted_delivery_ibfk_2` FOREIGN KEY (`Driver_ID`) REFERENCES `deleted_driver` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `deleted_driver`
--
ALTER TABLE `deleted_driver`
  ADD CONSTRAINT `deleted_driver_ibfk_1` FOREIGN KEY (`Person_ID`) REFERENCES `deleted_person` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `deleted_employee`
--
ALTER TABLE `deleted_employee`
  ADD CONSTRAINT `deleted_employee_ibfk_1` FOREIGN KEY (`Company_ID`) REFERENCES `deleted_company` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `deleted_employee_ibfk_2` FOREIGN KEY (`customer_ID`) REFERENCES `deleted_customer` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `deleted_employee_purchase`
--
ALTER TABLE `deleted_employee_purchase`
  ADD CONSTRAINT `deleted_employee_purchase_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `deleted_employee` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `deleted_employee_purchase_ibfk_2` FOREIGN KEY (`Purchase_ID`) REFERENCES `deleted_purchase` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `deleted_home_product`
--
ALTER TABLE `deleted_home_product`
  ADD CONSTRAINT `deleted_home_product_ibfk_1` FOREIGN KEY (`Product_ID`) REFERENCES `deleted_product` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `deleted_operator`
--
ALTER TABLE `deleted_operator`
  ADD CONSTRAINT `deleted_operator_ibfk_1` FOREIGN KEY (`Company_ID`) REFERENCES `deleted_company` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `deleted_operator_phone`
--
ALTER TABLE `deleted_operator_phone`
  ADD CONSTRAINT `deleted_operator_phone_ibfk_1` FOREIGN KEY (`Operator_ID`) REFERENCES `deleted_operator` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `deleted_person_address`
--
ALTER TABLE `deleted_person_address`
  ADD CONSTRAINT `deleted_person_address_ibfk_1` FOREIGN KEY (`Person_ID`) REFERENCES `deleted_person` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `deleted_person_phone`
--
ALTER TABLE `deleted_person_phone`
  ADD CONSTRAINT `deleted_person_phone_ibfk_1` FOREIGN KEY (`Person_ID`) REFERENCES `deleted_person` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `deleted_product_rating`
--
ALTER TABLE `deleted_product_rating`
  ADD CONSTRAINT `deleted_product_rating_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `deleted_customer` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `deleted_product_rating_ibfk_2` FOREIGN KEY (`Product_ID`) REFERENCES `deleted_product` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `deleted_registered_customer`
--
ALTER TABLE `deleted_registered_customer`
  ADD CONSTRAINT `deleted_registered_customer_ibfk_1` FOREIGN KEY (`customer_ID`) REFERENCES `deleted_customer` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `deleted_sport_product`
--
ALTER TABLE `deleted_sport_product`
  ADD CONSTRAINT `deleted_sport_product_ibfk_1` FOREIGN KEY (`Product_ID`) REFERENCES `deleted_product` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `deleted_status_support`
--
ALTER TABLE `deleted_status_support`
  ADD CONSTRAINT `deleted_status_support_ibfk_1` FOREIGN KEY (`Support_ID`) REFERENCES `deleted_support` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `deleted_support`
--
ALTER TABLE `deleted_support`
  ADD CONSTRAINT `deleted_support_ibfk_1` FOREIGN KEY (`Person_ID`) REFERENCES `deleted_person` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`Purchase_ID`) REFERENCES `purchase` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `delivery_ibfk_2` FOREIGN KEY (`Driver_ID`) REFERENCES `driver` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `driver`
--
ALTER TABLE `driver`
  ADD CONSTRAINT `driver_ibfk_1` FOREIGN KEY (`Person_ID`) REFERENCES `person` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`Company_ID`) REFERENCES `company` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`customer_ID`) REFERENCES `customer` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `employee_purchase`
--
ALTER TABLE `employee_purchase`
  ADD CONSTRAINT `employee_purchase_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `employee_purchase_ibfk_2` FOREIGN KEY (`Purchase_ID`) REFERENCES `purchase` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `home_product`
--
ALTER TABLE `home_product`
  ADD CONSTRAINT `home_product_ibfk_1` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `operator`
--
ALTER TABLE `operator`
  ADD CONSTRAINT `operator_ibfk_1` FOREIGN KEY (`Company_ID`) REFERENCES `company` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `operator_phone`
--
ALTER TABLE `operator_phone`
  ADD CONSTRAINT `operator_phone_ibfk_1` FOREIGN KEY (`Operator_ID`) REFERENCES `operator` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `person_address`
--
ALTER TABLE `person_address`
  ADD CONSTRAINT `person_address_ibfk_1` FOREIGN KEY (`Person_ID`) REFERENCES `person` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `person_phone`
--
ALTER TABLE `person_phone`
  ADD CONSTRAINT `person_phone_ibfk_1` FOREIGN KEY (`Person_ID`) REFERENCES `person` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `product_rating`
--
ALTER TABLE `product_rating`
  ADD CONSTRAINT `product_rating_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_rating_ibfk_2` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `registered_customer`
--
ALTER TABLE `registered_customer`
  ADD CONSTRAINT `registered_customer_ibfk_1` FOREIGN KEY (`customer_ID`) REFERENCES `customer` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `sport_product`
--
ALTER TABLE `sport_product`
  ADD CONSTRAINT `sport_product_ibfk_1` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `status_support`
--
ALTER TABLE `status_support`
  ADD CONSTRAINT `status_support_ibfk_1` FOREIGN KEY (`Support_ID`) REFERENCES `support` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `support`
--
ALTER TABLE `support`
  ADD CONSTRAINT `support_ibfk_1` FOREIGN KEY (`Person_ID`) REFERENCES `person` (`ID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
