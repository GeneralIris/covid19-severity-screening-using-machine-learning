-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 31, 2022 at 02:26 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `covid19_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` bigint(20) NOT NULL,
  `name` varchar(125) NOT NULL,
  `ic` varchar(12) NOT NULL,
  `phoneNo` varchar(12) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `age` int(100) NOT NULL,
  `fever` tinyint(1) NOT NULL,
  `cough` tinyint(1) NOT NULL,
  `fatigue` tinyint(1) NOT NULL,
  `dyspnea` tinyint(1) NOT NULL,
  `temperature` float NOT NULL,
  `type` varchar(20) NOT NULL,
  `frontlinerId` bigint(20) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `name`, `ic`, `phoneNo`, `gender`, `age`, `fever`, `cough`, `fatigue`, `dyspnea`, `temperature`, `type`, `frontlinerId`, `time`, `status`) VALUES
(1, 'Emma Rock', '990919139999', '0123456789', 'female', 29, 1, 0, 0, 0, 38, 'mild', 4, '2022-01-18 14:04:56', 'examined'),
(2, 'Peter Parking', '987654653215', '0185645581', 'male', 29, 1, 0, 0, 0, 38, 'mild', 4, '2022-01-18 14:04:56', 'waiting'),
(3, 'Mary Joke', '761221125858', '0123845234', 'female', 34, 1, 0, 1, 0, 37.8, 'mild', 4, '2022-01-18 14:05:21', 'examined'),
(4, 'Danial Bluecliffe', '870601105715', '0123456789', 'male', 50, 1, 1, 1, 0, 39, 'severe', 1, '2022-01-16 23:55:56', 'waiting'),
(8, 'Pepper Pegg', '948543124845', '0186456854', 'female', 23, 0, 0, 0, 0, 23, 'mild', 4, '2022-01-16 23:55:56', 'waiting'),
(9, 'Ryan Reynold', '984562135465', '0164847865', 'male', 24, 1, 1, 0, 0, 38.6, 'mild', 4, '2022-01-16 23:55:56', 'waiting'),
(10, 'Tom Holland', '121212121212', '0198712121', 'male', 1, 0, 0, 0, 0, 36.7, 'mild', 4, '2022-01-16 23:55:56', 'examined'),
(34, 'Donald Duck', '468165254975', '0123231829', 'male', 16, 1, 1, 1, 0, 38.6, 'mild', 4, '2022-01-18 14:05:44', 'examined'),
(35, 'Will Smith', '982176271612', '0198123422', 'male', 36, 0, 0, 0, 0, 36.5, 'asymptomatic', 4, '2022-01-18 14:10:33', 'waiting'),
(36, 'Tony Start', '123456121234', '0123456789', 'male', 45, 1, 1, 0, 1, 39, 'severe', 4, '2022-01-18 14:10:33', 'waiting'),
(38, 'Red Johansson', '123456121234', '0198250961', 'female', 23, 1, 0, 0, 0, 36.7, 'mild', 4, '2022-01-18 14:09:08', 'waiting'),
(39, 'Chris Hemsnotworth', '123456121234', '0196453456', 'female', 23, 0, 0, 0, 0, 44, 'asymptomatic', 4, '2022-01-22 10:06:39', 'examined'),
(40, 'Monica Geller', '123456121234', '0198250961', 'female', 23, 1, 0, 0, 1, 38.6, 'severe', 4, '2022-01-18 14:10:02', 'waiting'),
(41, 'Rachel Green', '123456121234', '01987654321', 'female', 23, 1, 1, 0, 0, 38.6, 'mild', 4, '2022-01-18 14:10:02', 'waiting'),
(42, 'Ali Baki', '982375839204', '018492958', 'male', 34, 0, 0, 0, 0, 36.7, 'asymptomatic', 4, '2022-01-31 01:10:07', 'waiting'),
(43, 'Kennan Lopez', '986838872590', '0128658157', 'male', 35, 1, 1, 0, 1, 43, 'mild', 5, '2022-01-14 17:30:13', 'examined'),
(44, 'Dana Little', '619212887116', '0128658655', 'male', 40, 0, 1, 0, 1, 44, 'severe', 6, '2021-05-12 16:53:05', 'examined'),
(45, 'Jamal Rasmussen', '895460499509', '0148672438', 'male', 43, 1, 1, 1, 1, 43, 'severe', 6, '2021-11-13 00:21:48', 'examined'),
(46, 'Lev Hickman', '188435882203', '0120075841', 'male', 12, 0, 1, 1, 0, 37, 'mild', 5, '2022-03-30 17:28:46', 'waiting'),
(47, 'Gail Merrill', '514995939894', '0154666754', 'female', 35, 1, 0, 1, 1, 40, 'mild', 4, '2021-11-03 03:20:05', 'examined'),
(48, 'Burton Mckay', '199264536244', '0117685310', 'female', 5, 1, 0, 0, 1, 43, 'mild', 4, '2021-05-31 08:14:14', 'examined'),
(49, 'Damon Joyce', '254298544242', '0115275543', 'female', 43, 0, 0, 0, 1, 41, 'asymptomatic', 6, '2023-01-15 14:46:13', 'examined'),
(50, 'Donna Davenport', '699501965578', '0144839215', 'female', 3, 0, 1, 0, 1, 37, 'asymptomatic', 5, '2022-07-31 19:31:31', 'waiting'),
(51, 'Holmes Aguilar', '796755873617', '0117454220', 'female', 40, 1, 0, 0, 0, 42, 'asymptomatic', 5, '2022-08-05 22:11:32', 'examined'),
(52, 'Drake Hooper', '848615907995', '0132556213', 'female', 9, 0, 0, 1, 1, 39, 'asymptomatic', 6, '2021-09-23 03:47:14', 'examined'),
(53, 'Zoe Irwin', '203443063781', '0126245649', 'male', 58, 1, 0, 1, 1, 41, 'severe', 5, '2021-09-24 04:22:07', 'waiting'),
(54, 'Christian Long', '398824718687', '0121703407', 'male', 24, 1, 1, 1, 0, 44, 'severe', 5, '2021-12-28 17:36:55', 'examined'),
(55, 'Mohammad Velasquez', '450829861237', '0189178756', 'male', 58, 1, 1, 0, 1, 39, 'asymptomatic', 4, '2022-11-13 01:51:43', 'waiting'),
(56, 'Florence Tyler', '888888336875', '0124274174', 'female', 30, 1, 1, 1, 0, 40, 'mild', 4, '2022-05-07 01:26:45', 'waiting'),
(57, 'Kennedy Phillips', '163016898008', '0159407737', 'female', 29, 0, 1, 0, 0, 42, 'mild', 5, '2021-07-20 10:27:38', 'waiting'),
(58, 'Minerva Saunders', '397374845890', '0150187331', 'male', 5, 0, 1, 0, 0, 44, 'asymptomatic', 4, '2022-03-24 05:41:12', 'waiting'),
(59, 'Leslie Mccray', '134395855233', '0113371167', 'male', 24, 1, 1, 0, 0, 40, 'mild', 5, '2022-02-26 08:14:31', 'examined'),
(60, 'Nicholas Herring', '804630121892', '0196564549', 'female', 41, 1, 0, 1, 0, 37, 'severe', 6, '2021-02-03 07:51:02', 'waiting'),
(61, 'Lunea Webster', '686011684003', '0185727284', 'male', 23, 0, 0, 1, 0, 40, 'severe', 6, '2021-10-28 10:37:39', 'waiting'),
(62, 'Glenna Sanchez', '190615352151', '0151815569', 'female', 54, 1, 0, 0, 1, 36, 'asymptomatic', 6, '2021-07-27 22:56:46', 'examined'),
(63, 'Bo Mooney', '347633482395', '0175831377', 'male', 20, 1, 0, 0, 1, 41, 'mild', 5, '2022-01-05 19:35:03', 'waiting'),
(64, 'Catherine Ortega', '520799431888', '0171122236', 'male', 60, 1, 0, 0, 0, 41, 'severe', 5, '2022-10-09 00:18:31', 'waiting'),
(65, 'Bruno Hester', '318450021039', '0161718316', 'female', 5, 1, 0, 1, 0, 43, 'mild', 6, '2021-12-11 17:26:27', 'waiting'),
(66, 'Hedda Rice', '249309571364', '0168169516', 'female', 54, 1, 0, 0, 0, 43, 'mild', 5, '2021-09-25 09:13:42', 'waiting'),
(67, 'Sopoline Molina', '929557234322', '0124993241', 'male', 26, 0, 1, 1, 0, 36, 'asymptomatic', 6, '2021-10-12 17:12:04', 'examined'),
(68, 'Davis Carroll', '220444197695', '0171278567', 'male', 2, 1, 1, 1, 1, 42, 'mild', 4, '2021-06-30 23:16:45', 'examined'),
(69, 'Judah Wood', '385134001100', '0163781362', 'male', 20, 1, 0, 0, 0, 44, 'asymptomatic', 5, '2022-06-10 03:40:44', 'waiting'),
(70, 'Francesca Cain', '865734052599', '0174634113', 'male', 43, 0, 0, 1, 1, 38, 'severe', 5, '2022-10-26 04:28:13', 'waiting'),
(71, 'Cassidy Snow', '213219352341', '0109288641', 'male', 1, 1, 0, 1, 0, 40, 'severe', 5, '2022-05-16 02:02:39', 'examined'),
(72, 'Marvin Carrillo', '211945905892', '0191328772', 'male', 29, 0, 1, 1, 1, 36, 'mild', 5, '2022-12-12 13:08:37', 'examined'),
(73, 'Indigo Greene', '288893943175', '0118194374', 'female', 30, 1, 1, 1, 1, 41, 'mild', 5, '2021-05-03 20:41:32', 'examined'),
(74, 'Malcolm Lynn', '304007293938', '0177770916', 'male', 48, 0, 1, 0, 0, 38, 'asymptomatic', 4, '2021-02-06 10:17:38', 'examined'),
(75, 'Hiram Rodriquez', '527371068004', '0186966086', 'male', 52, 0, 1, 1, 1, 36, 'mild', 6, '2022-08-17 07:20:37', 'examined'),
(76, 'Daquan Stark', '234781782200', '0184001688', 'male', 41, 0, 0, 0, 1, 37, 'asymptomatic', 6, '2022-04-10 18:10:28', 'waiting'),
(77, 'Ryder Bright', '814698961272', '0195713663', 'male', 40, 1, 0, 0, 0, 38, 'asymptomatic', 5, '2021-08-27 04:25:16', 'waiting'),
(78, 'Micah Macdonald', '515502210820', '0108353293', 'male', 57, 0, 1, 1, 1, 41, 'asymptomatic', 5, '2022-02-09 21:24:54', 'waiting'),
(79, 'Brody Myers', '285463707148', '0137177092', 'female', 38, 0, 1, 0, 0, 36, 'mild', 5, '2022-05-07 05:03:49', 'waiting'),
(80, 'Hasad Trujillo', '225389924878', '0136824290', 'female', 46, 1, 1, 0, 1, 40, 'mild', 4, '2022-07-30 21:13:20', 'waiting'),
(81, 'Grace Drake', '298422363566', '0176337344', 'male', 14, 1, 0, 0, 1, 44, 'severe', 5, '2021-10-01 09:07:33', 'examined'),
(82, 'Yetta Valencia', '970369646951', '0148951345', 'male', 11, 0, 1, 0, 0, 44, 'asymptomatic', 6, '2021-11-07 14:43:03', 'waiting'),
(83, 'Carla Chandler', '164417345676', '0185456214', 'male', 40, 0, 0, 0, 0, 39, 'mild', 5, '2021-06-26 03:09:42', 'examined'),
(84, 'Dylan Barron', '916300969863', '0162453776', 'female', 53, 1, 0, 1, 1, 40, 'severe', 5, '2022-11-05 11:43:48', 'examined'),
(85, 'Rama Curry', '418336053659', '0155118043', 'male', 29, 0, 1, 0, 0, 42, 'severe', 4, '2022-01-19 15:52:01', 'examined'),
(86, 'Dara Montoya', '449606462467', '0158666538', 'male', 60, 1, 1, 1, 1, 41, 'severe', 5, '2021-07-20 09:05:57', 'waiting'),
(87, 'Cyrus Carey', '720977427161', '0127663518', 'female', 21, 1, 0, 0, 0, 37, 'mild', 5, '2021-03-30 23:17:12', 'waiting'),
(88, 'Craig Wagner', '363100269672', '0135424136', 'male', 22, 0, 0, 0, 0, 39, 'asymptomatic', 5, '2022-01-12 22:55:14', 'waiting'),
(89, 'Flavia Mcclure', '167290969754', '0124413634', 'male', 57, 0, 0, 1, 1, 36, 'mild', 5, '2022-04-21 03:49:41', 'waiting'),
(90, 'Leilani Burt', '506482914115', '0125626400', 'male', 22, 0, 1, 1, 1, 41, 'severe', 5, '2022-07-22 12:10:26', 'examined'),
(91, 'Willow Huber', '372257680897', '0146913165', 'female', 55, 1, 0, 0, 1, 44, 'severe', 4, '2022-01-29 22:08:59', 'waiting'),
(92, 'Noble Michael', '335290722246', '0196765540', 'female', 54, 0, 1, 0, 1, 39, 'asymptomatic', 4, '2022-04-11 02:35:21', 'examined'),
(93, 'Mia Rodriquez', '708087305734', '0147095154', 'male', 1, 0, 0, 1, 1, 42, 'mild', 6, '2021-07-03 23:27:31', 'waiting'),
(94, 'Martena Dale', '779535796475', '0146733276', 'female', 45, 0, 1, 1, 0, 44, 'mild', 5, '2021-10-19 07:06:02', 'waiting'),
(95, 'Irene Robinson', '210659764470', '0169554391', 'female', 42, 0, 0, 0, 1, 37, 'mild', 6, '2021-11-07 20:44:46', 'waiting'),
(96, 'Steel Byrd', '446745341249', '0117244387', 'male', 28, 1, 0, 1, 1, 43, 'severe', 5, '2021-09-26 23:45:32', 'examined'),
(97, 'Alma Camacho', '922524506694', '0104588507', 'male', 54, 0, 1, 0, 0, 36, 'severe', 5, '2021-07-26 09:26:37', 'waiting'),
(98, 'Karyn Davidson', '431531495491', '0147711661', 'female', 28, 1, 0, 0, 1, 40, 'severe', 6, '2021-08-05 17:09:51', 'examined'),
(99, 'September Flowers', '189419305239', '0195215343', 'male', 36, 1, 1, 0, 1, 39, 'asymptomatic', 5, '2022-04-15 16:30:38', 'examined'),
(100, 'Lucy Joseph', '696968294040', '0117668901', 'female', 58, 1, 1, 1, 1, 39, 'mild', 5, '2021-03-23 08:14:58', 'waiting'),
(101, 'Cheyenne Alston', '173123660392', '0158371216', 'male', 42, 0, 0, 0, 1, 38, 'asymptomatic', 5, '2022-10-24 02:09:04', 'examined'),
(102, 'Dominic Carlson', '472538242313', '0172861772', 'female', 51, 1, 0, 0, 0, 41, 'asymptomatic', 6, '2022-06-27 14:48:21', 'examined'),
(103, 'Wallace Christensen', '853487198911', '0116543420', 'male', 43, 0, 0, 0, 1, 42, 'severe', 5, '2022-02-05 06:14:35', 'examined'),
(104, 'Caesar Sexton', '428338464865', '0193663773', 'male', 15, 1, 1, 1, 0, 42, 'mild', 5, '2021-05-31 20:26:43', 'examined'),
(105, 'Otto Cooley', '467537233858', '0105857856', 'female', 41, 1, 1, 0, 1, 37, 'asymptomatic', 4, '2022-12-17 22:23:20', 'waiting'),
(106, 'Chandler Walters', '960883516612', '0193419055', 'male', 40, 1, 0, 1, 1, 36, 'mild', 6, '2021-11-03 15:17:32', 'examined'),
(107, 'Hyatt Elliott', '221855938294', '0131903515', 'female', 37, 0, 1, 0, 1, 41, 'asymptomatic', 4, '2022-04-24 10:03:06', 'waiting'),
(108, 'Morgan Gaines', '601595352150', '0173547558', 'female', 28, 1, 0, 0, 1, 39, 'mild', 4, '2022-10-19 03:56:25', 'examined'),
(109, 'Nehru Santiago', '958655457130', '0116954668', 'male', 15, 0, 0, 1, 0, 44, 'mild', 6, '2021-05-29 03:20:01', 'waiting'),
(110, 'Giselle Larsen', '967334974828', '0197730683', 'female', 44, 0, 0, 1, 1, 39, 'mild', 6, '2022-04-19 00:36:57', 'examined'),
(111, 'Amal Branch', '658287582134', '0196787225', 'female', 47, 1, 1, 1, 1, 43, 'asymptomatic', 5, '2021-03-12 18:27:19', 'waiting'),
(112, 'Fritz Hale', '274203006889', '0108567363', 'female', 30, 0, 1, 1, 1, 37, 'severe', 4, '2022-08-16 08:39:23', 'waiting'),
(113, 'Rudyard Coffey', '536274850345', '0167683261', 'male', 43, 0, 0, 1, 1, 41, 'asymptomatic', 6, '2021-10-03 10:45:54', 'examined'),
(114, 'Eliana Hancock', '703737646181', '0187876439', 'female', 14, 0, 1, 1, 1, 41, 'asymptomatic', 5, '2021-05-02 08:11:13', 'examined'),
(115, 'Kato Gardner', '161783788094', '0123448637', 'female', 37, 1, 1, 1, 1, 42, 'asymptomatic', 6, '2021-08-16 07:38:21', 'examined'),
(116, 'Carolyn Clay', '798305482134', '0136632168', 'female', 28, 0, 0, 0, 1, 43, 'severe', 5, '2022-12-12 23:58:07', 'waiting'),
(117, 'Eric Lynn', '127084554973', '0133552388', 'male', 59, 0, 0, 0, 0, 38, 'mild', 5, '2021-08-25 23:48:27', 'examined'),
(118, 'Sydney Barr', '759629041029', '0147101927', 'male', 13, 0, 0, 0, 0, 38, 'severe', 5, '2022-04-12 20:38:38', 'examined'),
(119, 'Herrod Rojas', '695667784305', '0155121735', 'female', 29, 1, 1, 0, 0, 44, 'mild', 5, '2022-05-21 23:05:21', 'examined'),
(120, 'Ralph Hill', '799621839861', '0113868152', 'male', 33, 0, 0, 0, 0, 43, 'asymptomatic', 5, '2021-11-22 04:44:27', 'waiting'),
(121, 'Cassandra Martin', '532983993882', '0132192441', 'female', 38, 1, 0, 1, 0, 36, 'severe', 5, '2022-06-22 17:06:36', 'waiting'),
(122, 'Otto Sexton', '784120521104', '0101724082', 'female', 57, 1, 0, 0, 1, 43, 'mild', 6, '2022-10-26 14:35:57', 'waiting'),
(123, 'Abra Cannon', '911384405573', '0155517426', 'male', 12, 0, 0, 0, 0, 43, 'asymptomatic', 4, '2021-06-21 22:10:23', 'examined'),
(124, 'Xavier Hartman', '605621557228', '0155893743', 'male', 37, 1, 1, 1, 0, 40, 'mild', 5, '2021-08-10 06:51:43', 'examined'),
(125, 'Rashad Soto', '872333735235', '0185321901', 'male', 8, 0, 1, 1, 1, 39, 'mild', 5, '2022-06-06 23:21:19', 'waiting'),
(126, 'Mary Rollins', '256637516554', '0145384125', 'female', 6, 0, 1, 1, 0, 41, 'mild', 6, '2022-06-07 22:26:57', 'examined'),
(127, 'Katelyn Mccullough', '509694861190', '0136225466', 'female', 24, 0, 0, 1, 1, 43, 'severe', 4, '2022-06-14 20:46:10', 'waiting'),
(128, 'Cleo Perry', '232897852301', '0126636785', 'male', 30, 0, 0, 0, 1, 38, 'severe', 6, '2022-10-02 05:53:36', 'waiting'),
(129, 'Frances Sullivan', '686279858755', '0187922663', 'male', 58, 0, 0, 0, 1, 43, 'mild', 5, '2021-02-08 13:48:41', 'waiting'),
(130, 'Neil Walters', '720430650661', '0176387115', 'male', 42, 1, 0, 0, 0, 44, 'asymptomatic', 5, '2022-05-24 04:05:39', 'waiting'),
(131, 'Ingrid Castaneda', '827558885337', '0126445985', 'male', 33, 1, 1, 0, 0, 40, 'severe', 5, '2022-09-10 09:27:23', 'examined'),
(132, 'Michael Banks', '282121046068', '0158942246', 'male', 11, 1, 1, 0, 0, 40, 'asymptomatic', 5, '2022-07-11 17:41:47', 'examined'),
(133, 'Jesse Shaw', '651145825880', '0173768105', 'female', 50, 0, 1, 1, 0, 41, 'asymptomatic', 5, '2022-10-10 05:57:29', 'examined'),
(134, 'Barclay Barker', '773726460091', '0133337646', 'male', 41, 0, 1, 1, 0, 42, 'asymptomatic', 5, '2021-11-15 15:15:26', 'waiting'),
(135, 'Cameron Glover', '259142427009', '0188951279', 'female', 51, 0, 0, 0, 0, 40, 'severe', 5, '2022-01-26 08:12:17', 'examined'),
(136, 'Ulric Foster', '851531094684', '0168488746', 'female', 36, 1, 1, 0, 0, 38, 'asymptomatic', 5, '2022-04-07 12:52:25', 'examined'),
(137, 'Keiko English', '737958915363', '0128486135', 'female', 5, 1, 0, 1, 0, 39, 'asymptomatic', 5, '2022-02-08 20:41:43', 'waiting'),
(138, 'Amery Rodriguez', '324246332703', '0185322946', 'female', 35, 0, 0, 0, 0, 38, 'mild', 4, '2022-08-05 04:14:38', 'waiting'),
(139, 'Lamar Kelly', '740604610465', '0175252247', 'female', 55, 0, 0, 0, 1, 42, 'asymptomatic', 4, '2022-10-19 01:22:30', 'waiting'),
(140, 'Camden Zimmerman', '286399441172', '0127781512', 'male', 32, 1, 0, 0, 1, 37, 'mild', 6, '2021-04-02 09:39:39', 'examined'),
(141, 'Denise Marsh', '496287958472', '0177638171', 'male', 4, 0, 1, 0, 1, 37, 'asymptomatic', 5, '2021-04-06 02:16:01', 'waiting'),
(142, 'Gary Douglas', '387649049899', '0168110437', 'male', 20, 0, 0, 0, 1, 42, 'mild', 6, '2021-11-02 18:54:41', 'waiting'),
(143, 'Murphy Decker', '891265141849', '0130906610', 'male', 33, 1, 0, 0, 1, 37, 'severe', 5, '2021-05-23 23:40:29', 'examined'),
(144, 'Ralph Beard', '929735688014', '0159907682', 'male', 5, 0, 0, 0, 1, 43, 'mild', 4, '2022-07-21 20:20:01', 'waiting'),
(145, 'Ainsley Wall', '966439253372', '0183173427', 'female', 56, 1, 1, 1, 1, 43, 'mild', 4, '2021-08-24 19:30:58', 'waiting'),
(146, 'Rogan Eaton', '190469630838', '0161326273', 'female', 34, 0, 1, 1, 0, 39, 'mild', 4, '2021-10-28 12:17:45', 'examined'),
(147, 'Alana Finley', '991477620910', '0150687484', 'male', 43, 0, 0, 1, 1, 37, 'asymptomatic', 5, '2021-09-08 18:29:47', 'waiting'),
(148, 'Aimee Duran', '662720538215', '0152134639', 'female', 52, 0, 1, 1, 1, 39, 'severe', 4, '2021-06-18 17:53:10', 'waiting'),
(149, 'Thor Rodgers', '744766075611', '0152864584', 'male', 55, 1, 1, 0, 1, 40, 'asymptomatic', 5, '2021-12-31 08:45:49', 'examined'),
(150, 'Tate Fields', '555090649376', '0143735751', 'male', 25, 1, 0, 0, 0, 37, 'mild', 4, '2021-02-05 13:43:07', 'examined'),
(151, 'Patrick Whitney', '535432399832', '0141565616', 'male', 2, 0, 1, 1, 0, 41, 'asymptomatic', 6, '2022-05-09 11:55:58', 'waiting'),
(152, 'Calvin Martin', '422462083093', '0146851462', 'male', 10, 0, 0, 0, 0, 36, 'mild', 5, '2022-03-24 14:10:15', 'waiting'),
(153, 'TaShya Jarvis', '860522602051', '0136376328', 'female', 33, 0, 1, 0, 0, 39, 'mild', 5, '2022-08-27 00:30:25', 'examined'),
(154, 'Todd Alston', '377099178282', '0186366214', 'male', 45, 1, 1, 1, 1, 36, 'mild', 5, '2021-05-29 19:18:24', 'examined'),
(155, 'Olivia Evans', '432784090700', '0172534373', 'male', 56, 0, 1, 0, 0, 38, 'mild', 5, '2021-07-22 10:59:34', 'examined'),
(156, 'Ocean Finley', '774256115284', '0141848124', 'male', 2, 0, 1, 1, 0, 39, 'mild', 6, '2022-10-11 08:20:57', 'examined'),
(157, 'Josiah Bryant', '931840159643', '0148669355', 'female', 3, 0, 0, 0, 1, 40, 'mild', 5, '2021-05-05 08:34:27', 'waiting'),
(158, 'Yen Woods', '621591604448', '0137714149', 'male', 9, 1, 1, 1, 1, 36, 'asymptomatic', 6, '2022-06-21 05:01:55', 'waiting'),
(159, 'Darrel Pacheco', '511602795597', '0124042116', 'male', 25, 1, 1, 1, 0, 41, 'asymptomatic', 6, '2021-03-10 15:24:02', 'examined'),
(160, 'Levi Wiley', '638633192022', '0133872171', 'female', 53, 1, 1, 1, 1, 39, 'mild', 4, '2021-07-26 22:29:07', 'waiting'),
(161, 'Clinton Campbell', '777050133002', '0157544802', 'male', 8, 0, 1, 0, 1, 43, 'mild', 5, '2021-11-08 19:48:15', 'examined'),
(162, 'Dylan Mercer', '377593101816', '0125271584', 'male', 41, 1, 1, 1, 0, 42, 'mild', 6, '2021-04-12 18:29:49', 'examined'),
(163, 'Burton Vang', '408091705009', '0154454879', 'male', 59, 1, 1, 1, 1, 40, 'asymptomatic', 5, '2021-06-21 10:53:48', 'waiting'),
(164, 'Blaze Hartman', '806431773668', '0191247817', 'male', 40, 0, 1, 0, 1, 44, 'severe', 6, '2021-09-05 17:53:48', 'waiting'),
(165, 'Octavius Hendricks', '728267404700', '0188751427', 'male', 44, 1, 0, 1, 0, 37, 'severe', 5, '2022-04-10 01:15:23', 'examined'),
(166, 'Linus Nichols', '430344747577', '0146150302', 'female', 58, 0, 0, 0, 1, 40, 'mild', 5, '2021-11-07 13:12:43', 'examined'),
(167, 'Erin Payne', '967018609078', '0128681548', 'female', 42, 0, 1, 1, 1, 38, 'asymptomatic', 4, '2021-04-09 06:38:28', 'examined'),
(168, 'Clio Cotton', '546004613155', '0147745478', 'female', 20, 1, 1, 1, 0, 43, 'asymptomatic', 4, '2022-12-03 17:22:47', 'waiting'),
(169, 'Jolie Cobb', '296432309013', '0176732570', 'female', 36, 0, 1, 1, 1, 36, 'mild', 6, '2022-07-19 16:27:24', 'examined'),
(170, 'Kiara Hall', '433636275530', '0146856815', 'female', 25, 1, 1, 1, 1, 42, 'severe', 5, '2022-12-27 03:36:22', 'examined'),
(171, 'Mercedes Ramsey', '952772570787', '0101638641', 'male', 56, 0, 0, 0, 0, 38, 'severe', 5, '2022-01-07 23:37:21', 'examined'),
(172, 'Dennis Patton', '526406523066', '0132557917', 'male', 54, 0, 0, 1, 1, 41, 'severe', 5, '2022-02-23 22:27:23', 'waiting'),
(173, 'Macey Blake', '605718104708', '0130274330', 'male', 51, 0, 1, 0, 0, 38, 'severe', 4, '2022-12-27 15:50:00', 'waiting'),
(174, 'Stella Cochran', '777568166463', '0108708267', 'male', 56, 1, 0, 0, 0, 37, 'asymptomatic', 6, '2022-01-09 04:49:27', 'waiting'),
(175, 'Maryam Marsh', '228332113854', '0147725601', 'male', 3, 1, 0, 1, 1, 37, 'asymptomatic', 5, '2021-05-11 18:43:39', 'waiting'),
(176, 'Charlotte Sweeney', '743372777686', '0183883518', 'female', 19, 0, 1, 1, 0, 43, 'asymptomatic', 6, '2022-11-05 14:39:00', 'examined'),
(177, 'Wendy Hansen', '486995868656', '0148245102', 'male', 14, 0, 1, 0, 0, 44, 'severe', 5, '2021-04-14 05:45:41', 'examined'),
(178, 'Grady Rodgers', '365933948097', '0138167474', 'male', 29, 1, 1, 0, 0, 41, 'asymptomatic', 5, '2021-04-11 07:16:45', 'examined'),
(179, 'Dylan Guthrie', '156203763406', '0124838984', 'male', 55, 0, 0, 1, 1, 40, 'asymptomatic', 6, '2022-12-23 06:53:46', 'waiting'),
(180, 'Timon Walter', '873011033052', '0147752846', 'female', 37, 1, 0, 1, 1, 43, 'mild', 5, '2021-07-08 06:45:22', 'examined'),
(181, 'Diana Jefferson', '241157174325', '0122516582', 'female', 25, 0, 0, 1, 0, 37, 'mild', 6, '2022-04-19 02:48:09', 'waiting'),
(182, 'Baker Sawyer', '659485638976', '0177504183', 'male', 43, 0, 0, 0, 1, 41, 'mild', 5, '2021-04-10 10:07:49', 'waiting'),
(183, 'Velma Maynard', '187534071265', '0145237963', 'male', 59, 1, 1, 0, 0, 44, 'asymptomatic', 5, '2021-06-20 01:54:10', 'examined'),
(184, 'Jaden Bird', '593327102736', '0163638261', 'male', 37, 1, 0, 0, 0, 37, 'asymptomatic', 5, '2021-05-15 10:34:29', 'waiting'),
(185, 'Lacey Mcguire', '741645657393', '0146633169', 'female', 27, 0, 0, 0, 1, 44, 'mild', 5, '2021-06-28 18:12:17', 'examined'),
(186, 'Shoshana Marshall', '401130725150', '0127565842', 'male', 9, 1, 0, 0, 0, 40, 'mild', 5, '2022-09-26 17:03:57', 'examined'),
(187, 'Danielle Mcgee', '297735916026', '0147653697', 'female', 40, 0, 0, 0, 0, 44, 'asymptomatic', 5, '2022-04-04 19:33:07', 'waiting'),
(188, 'Kay Walsh', '903185764954', '0114566763', 'female', 37, 0, 1, 0, 0, 43, 'severe', 4, '2022-08-13 08:59:41', 'waiting'),
(189, 'Armand Hardin', '553961620041', '0182552092', 'female', 27, 1, 1, 0, 1, 41, 'severe', 5, '2021-09-23 08:46:35', 'examined'),
(190, 'Nelle Dalton', '281858895652', '0183205680', 'female', 56, 0, 0, 1, 0, 43, 'asymptomatic', 5, '2021-05-14 01:37:22', 'examined'),
(191, 'Zia Acevedo', '517089196794', '0163327138', 'female', 57, 0, 1, 1, 0, 42, 'mild', 4, '2022-01-07 17:06:29', 'examined'),
(192, 'Joy Brock', '227862118473', '0186625169', 'male', 15, 1, 0, 1, 0, 39, 'asymptomatic', 5, '2022-09-27 13:49:47', 'waiting'),
(193, 'Illana Solis', '262182204830', '0153073042', 'male', 26, 0, 0, 1, 1, 38, 'severe', 4, '2022-01-22 23:27:12', 'waiting'),
(194, 'Audrey Hyde', '124424987037', '0150135562', 'male', 48, 0, 0, 1, 0, 40, 'mild', 5, '2023-01-05 21:40:54', 'waiting'),
(195, 'Amaya Barlow', '954113072006', '0122790100', 'male', 43, 0, 0, 1, 0, 42, 'asymptomatic', 4, '2021-07-25 04:47:39', 'examined'),
(196, 'Dustin Tanner', '326483025728', '0121784296', 'female', 16, 0, 0, 1, 0, 37, 'mild', 5, '2021-11-15 08:58:35', 'examined'),
(197, 'Madison Ballard', '598981021791', '0129333333', 'female', 4, 1, 0, 1, 0, 41, 'mild', 6, '2022-08-19 16:28:23', 'examined'),
(198, 'Guinevere Griffith', '173152536496', '0141524325', 'male', 53, 0, 0, 0, 0, 39, 'mild', 5, '2022-05-22 15:22:51', 'examined'),
(199, 'Ray Bradshaw', '737738243631', '0132232558', 'female', 48, 1, 0, 1, 0, 44, 'asymptomatic', 6, '2021-12-09 07:01:21', 'examined'),
(200, 'Germaine Harding', '943568762670', '0104961633', 'male', 20, 1, 0, 1, 1, 40, 'mild', 5, '2022-03-06 09:06:18', 'waiting'),
(201, 'Jordan Cobb', '389496492402', '0157527392', 'female', 41, 0, 0, 1, 0, 40, 'mild', 6, '2021-06-17 11:02:46', 'examined'),
(202, 'Kirestin Williams', '446109498483', '0146546371', 'female', 39, 0, 1, 1, 1, 39, 'severe', 6, '2022-07-10 14:41:53', 'waiting'),
(203, 'Leilani Jenkins', '208940601489', '0149688584', 'female', 24, 0, 0, 0, 1, 44, 'asymptomatic', 5, '2022-03-05 14:59:25', 'waiting'),
(204, 'Glenna Bennett', '225853589187', '0141888220', 'female', 55, 0, 0, 1, 1, 39, 'mild', 5, '2022-08-26 01:37:52', 'waiting'),
(205, 'Caryn Lloyd', '988385785672', '0181714414', 'female', 27, 1, 0, 1, 0, 37, 'severe', 6, '2023-01-09 16:09:07', 'waiting'),
(206, 'Chancellor Duran', '216526161292', '0181747358', 'female', 55, 1, 0, 0, 0, 38, 'asymptomatic', 5, '2021-03-12 03:25:00', 'waiting'),
(207, 'Doris Paul', '313595796806', '0115857738', 'male', 3, 1, 0, 1, 1, 38, 'mild', 5, '2022-05-04 23:38:33', 'examined'),
(208, 'Priscilla Farrell', '794538029661', '0116128662', 'male', 15, 1, 0, 0, 0, 40, 'severe', 4, '2022-12-31 02:26:32', 'examined'),
(209, 'Amanda Jensen', '382284670775', '0168713862', 'female', 50, 1, 1, 1, 0, 37, 'asymptomatic', 4, '2022-03-01 21:48:25', 'examined'),
(210, 'Omar Skinner', '881988018584', '0168535546', 'female', 25, 1, 0, 1, 0, 42, 'mild', 4, '2022-04-19 00:19:43', 'examined'),
(211, 'Kareem Mccarty', '247943212429', '0146484246', 'female', 28, 1, 0, 0, 0, 40, 'mild', 6, '2021-09-30 20:05:51', 'examined'),
(212, 'Leila Hansen', '751004111247', '0124159685', 'male', 33, 1, 0, 1, 1, 38, 'asymptomatic', 6, '2021-09-08 07:42:42', 'waiting'),
(213, 'Kenyon Fuller', '300517313360', '0109216511', 'male', 6, 1, 0, 0, 1, 43, 'severe', 5, '2022-08-22 06:08:16', 'examined'),
(214, 'Deirdre Puckett', '609411384603', '0163587757', 'female', 18, 0, 1, 0, 1, 38, 'mild', 5, '2022-12-29 17:08:19', 'waiting'),
(215, 'Travis Trujillo', '343729152895', '0138616161', 'female', 37, 0, 1, 0, 0, 43, 'severe', 5, '2022-02-26 21:24:11', 'examined'),
(216, 'Lareina Forbes', '434992090459', '0160224485', 'male', 21, 0, 0, 0, 1, 40, 'asymptomatic', 4, '2022-07-31 15:27:42', 'examined'),
(217, 'Risa Barnett', '632074425809', '0197850754', 'female', 58, 0, 1, 1, 0, 41, 'mild', 4, '2023-01-26 22:51:51', 'examined'),
(218, 'Harding Hahn', '768230262716', '0144750676', 'male', 4, 0, 1, 0, 0, 41, 'asymptomatic', 6, '2021-08-12 18:28:42', 'examined'),
(219, 'Mallory Berger', '621200041021', '0177717481', 'female', 13, 0, 1, 1, 0, 39, 'severe', 5, '2022-08-23 16:33:38', 'waiting'),
(220, 'Imogene White', '339513852084', '0174668673', 'male', 6, 0, 0, 0, 1, 42, 'asymptomatic', 6, '2021-04-18 17:04:21', 'waiting'),
(221, 'Paki Welch', '967137593627', '0143873561', 'female', 13, 1, 1, 0, 0, 36, 'severe', 5, '2023-01-19 09:15:42', 'waiting'),
(222, 'Mannix Brennan', '756989971626', '0174364120', 'female', 5, 0, 0, 1, 0, 41, 'severe', 4, '2021-06-19 09:41:22', 'examined'),
(223, 'Buckminster Carpenter', '138787384843', '0171993093', 'female', 16, 0, 1, 0, 0, 41, 'mild', 5, '2023-01-16 02:24:39', 'waiting'),
(224, 'Sawyer Mullen', '945840222730', '0138835643', 'female', 16, 0, 1, 1, 0, 44, 'severe', 4, '2021-03-16 02:14:39', 'waiting'),
(225, 'MacKenzie Kelly', '384530708829', '0184936831', 'male', 52, 0, 0, 1, 0, 40, 'mild', 5, '2022-01-27 20:32:27', 'waiting'),
(226, 'Judith Garcia', '911027027210', '0118510980', 'male', 9, 1, 1, 0, 1, 40, 'severe', 4, '2021-04-21 19:37:14', 'waiting'),
(227, 'Erich Herrera', '168195939294', '0115861078', 'male', 47, 1, 1, 1, 0, 40, 'mild', 5, '2022-05-15 07:28:36', 'examined'),
(228, 'Ross Ryan', '269028517604', '0166343203', 'male', 3, 1, 1, 0, 1, 42, 'mild', 6, '2021-11-08 20:00:58', 'examined'),
(229, 'Abigail Delgado', '678234239958', '0165500088', 'female', 15, 0, 1, 0, 1, 39, 'asymptomatic', 5, '2021-04-02 01:23:53', 'waiting'),
(230, 'Julie Blackburn', '637448392146', '0115618782', 'female', 3, 0, 0, 1, 0, 37, 'asymptomatic', 4, '2022-07-07 00:28:11', 'waiting'),
(231, 'Caesar Mercer', '697867818334', '0127712125', 'female', 47, 1, 1, 1, 0, 38, 'mild', 5, '2021-04-13 06:02:36', 'examined'),
(232, 'Ryan Fitzpatrick', '159264076688', '0157882882', 'male', 32, 0, 0, 1, 1, 43, 'asymptomatic', 4, '2022-07-15 09:57:54', 'waiting'),
(233, 'Roanna Henry', '574149765121', '0146936185', 'male', 47, 1, 1, 0, 1, 38, 'severe', 5, '2022-01-19 04:57:31', 'examined'),
(234, 'Kylie Mcleod', '152563309616', '0151574815', 'male', 48, 0, 0, 0, 0, 41, 'severe', 4, '2022-04-24 15:47:11', 'examined'),
(235, 'Helen Kaufman', '917495600563', '0146120762', 'male', 15, 1, 1, 1, 1, 39, 'mild', 4, '2021-05-19 09:04:17', 'examined'),
(236, 'Kiara Camacho', '953751627366', '0132670435', 'female', 41, 1, 0, 1, 0, 44, 'mild', 5, '2021-07-06 14:16:43', 'waiting'),
(237, 'Fritz Rodriguez', '271032334113', '0188618518', 'male', 8, 1, 1, 1, 0, 37, 'asymptomatic', 5, '2021-08-17 08:27:50', 'waiting'),
(238, 'Kuame Vance', '724244305450', '0145634691', 'male', 30, 0, 0, 0, 0, 38, 'severe', 5, '2022-04-23 17:07:52', 'examined'),
(239, 'Patricia Booker', '670373380877', '0165568709', 'female', 17, 0, 0, 0, 0, 41, 'severe', 5, '2022-06-11 00:42:51', 'waiting'),
(240, 'Neville Mullins', '778400576368', '0106215465', 'female', 31, 1, 0, 1, 0, 37, 'asymptomatic', 6, '2021-09-06 11:49:07', 'examined'),
(241, 'Julie Hunter', '667809639347', '0162455774', 'female', 18, 0, 0, 1, 1, 38, 'severe', 5, '2022-11-08 13:42:55', 'examined'),
(242, 'Kenyon Farley', '620406864293', '0114596202', 'female', 55, 1, 1, 0, 0, 43, 'asymptomatic', 5, '2022-04-25 08:17:46', 'waiting'),
(243, 'Aida Tuah', '213456434567', '0183628472', 'female', 35, 1, 1, 0, 0, 44, 'mild', 4, '2022-01-31 01:23:51', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phoneNo` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `position` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phoneNo`, `username`, `password`, `position`) VALUES
(1, 'Abang Mohd Irham Amiruddin Bin Yusuf', 'irhamamiruddin@gmail.com', '0198250961', 'admin', 'admin', 'admin'),
(2, 'John Doe', 'john@gmail.com', '0198765432', 'john', 'john', 'doctor'),
(4, 'Mark Ruffalo', 'mark_ruffalo@gmail.com', '0199999999', 'mark', 'mark', 'frontliner'),
(5, 'Tester1', 'tester1@gmail.com', '0198765432', 'tester1', 'tester1', 'frontliner'),
(6, 'Abu Bakar', 'abubakarali@gmail.com', '0123456789', 'abu', 'abu', 'frontliner');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `frontlinerId` (`frontlinerId`),
  ADD KEY `frontlinerId_2` (`frontlinerId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=244;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
