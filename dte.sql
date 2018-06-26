-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 26, 2018 at 10:21 AM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 5.6.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dte`
--

-- --------------------------------------------------------

--
-- Table structure for table `tt_branch_master`
--

CREATE TABLE `tt_branch_master` (
  `branch_id` int(11) NOT NULL,
  `branch_type` varchar(27) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tt_branch_master`
--

INSERT INTO `tt_branch_master` (`branch_id`, `branch_type`) VALUES
(0, 'DTE'),
(1, 'Applied Mechanics'),
(2, 'Archi. Assistantship'),
(3, 'Automobile'),
(4, 'Bio-Medical'),
(5, 'C.A.C.D.D.M.'),
(6, 'Ceramic Technology'),
(7, 'Chemical'),
(8, 'Chemistry'),
(9, 'Civil'),
(10, 'Commercial Practice'),
(11, 'Computer'),
(12, 'D.C.P'),
(13, 'Electronics & Communication'),
(14, 'Electrical'),
(15, 'English'),
(16, 'Environmental'),
(17, 'Fabrication Technology'),
(18, 'Geology'),
(19, 'Home Science'),
(20, 'Industrial'),
(21, 'Information & Technology'),
(22, 'Instrumentation & Control'),
(23, 'Interior Design'),
(24, 'Maths'),
(25, 'Mechanical'),
(26, 'Metallurgy'),
(27, 'Mining'),
(28, 'Physics'),
(29, 'Plastic'),
(30, 'Power Electronics'),
(31, 'Printing Technology'),
(32, 'Production'),
(33, 'Rubber Technology'),
(34, 'Textile Design'),
(35, 'Textile Manu/ Tech'),
(36, 'Textile Proc / Chemistry'),
(37, 'Textile Technology'),
(38, 'Transportation'),
(39, 'Manufacuring'),
(40, 'Administrator'),
(41, 'Induction'),
(42, 'Industrial'),
(43, 'Inter Discipline'),
(44, 'BPharm'),
(45, 'Electronics');

-- --------------------------------------------------------

--
-- Table structure for table `tt_course_master`
--

CREATE TABLE `tt_course_master` (
  `course_master_id` int(11) NOT NULL,
  `course_name` varchar(31) NOT NULL,
  `course_type_id` int(11) NOT NULL,
  `map_id` int(11) NOT NULL,
  `a_year` varchar(255) NOT NULL,
  `term` varchar(255) NOT NULL,
  `branch_name` varchar(255) NOT NULL,
  `filename` text NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tt_course_master`
--

INSERT INTO `tt_course_master` (`course_master_id`, `course_name`, `course_type_id`, `map_id`, `a_year`, `term`, `branch_name`, `filename`, `status`) VALUES
(4, 'electrical communication', 0, 180, '0', '0', '0', '0', 'NOT UPLOADED'),
(10, 'newnew', 1, 135, '0', '0', '0', '0', 'NOT UPLOADED'),
(11, 'yeah bro', 1, 180, '0', '0', '0', '0', 'NOT UPLOADED'),
(12, 'computer networks', 0, 135, '0', '0', '0', '0', 'NOT UPLOADED'),
(13, 'aspnet', 2, 135, '0', '0', '0', '0', 'NOT UPLOADED'),
(14, 'aspnet', 3, 135, '0', '0', '0', '0', 'NOT UPLOADED');

-- --------------------------------------------------------

--
-- Table structure for table `tt_course_type`
--

CREATE TABLE `tt_course_type` (
  `course_type_id` int(11) NOT NULL,
  `course_type_name` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tt_course_type`
--

INSERT INTO `tt_course_type` (`course_type_id`, `course_type_name`) VALUES
(0, 'UG'),
(1, 'PG'),
(2, 'DIPLOMA'),
(3, 'PDDC');

-- --------------------------------------------------------

--
-- Table structure for table `tt_dept_login`
--

CREATE TABLE `tt_dept_login` (
  `dept_login_id` int(11) NOT NULL,
  `dept_uid` varchar(9) NOT NULL,
  `dept_pwd` varchar(255) NOT NULL,
  `map_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tt_dept_login`
--

INSERT INTO `tt_dept_login` (`dept_login_id`, `dept_uid`, `dept_pwd`, `map_id`) VALUES
(0, 'comp_ldce', '12345', 135),
(1, 'elec_ldce', '21519', 136),
(2, 'comp_vgec', '28280', 179),
(3, 'elec_vgec', '11111', 180),
(4, 'admin', 'admin123', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tt_institute_master`
--

CREATE TABLE `tt_institute_master` (
  `inst_id` int(11) NOT NULL,
  `inst_name` varchar(83) NOT NULL,
  `inst_type_id` int(11) NOT NULL,
  `org_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tt_institute_master`
--

INSERT INTO `tt_institute_master` (`inst_id`, `inst_name`, `inst_type_id`, `org_id`) VALUES
(1, 'DTE, Gandhinagar', 0, 3),
(2, 'Government Engineering College, Bharuch', 1, 3),
(3, 'Government Engineering College, Bhavnagar', 1, 3),
(4, 'Government Engineering College, BHUJ', 1, 3),
(5, 'Government Engineering College, Dahod', 1, 3),
(6, 'Government Engineering College, Gandhinagar', 1, 3),
(7, 'Government Engineering College, Godhra', 1, 3),
(8, 'Government Engineering College, Modasa', 1, 3),
(9, 'Government Engineering College, Palanpur', 1, 3),
(10, 'Government Engineering College, Patan', 1, 3),
(11, 'Government Engineering College, Rajkot', 1, 3),
(12, 'Government Engineering College, Surat', 1, 3),
(13, 'Government Engineering College, Valsad', 1, 3),
(14, 'Government MCA College, Maninagar', 1, 3),
(15, 'IITRAM, Ahmedabad', 1, 3),
(16, 'L.D.College of Engineering, Ahmedabad', 1, 3),
(17, 'Lukhdhirji Engineering College, Morbi', 1, 3),
(18, 'Shantilal Shah Engineering College, Bhavnagar', 1, 3),
(19, 'Vishwakarma Govt Engineering College, Chandkheda', 1, 3),
(20, 'AV PAREKH TECHNICAL INSTITUTE, Rajkot', 2, 3),
(21, 'C U Shah Polytechnic, SuredraNagar', 2, 3),
(22, 'Dr. S & S. S. Ghandhy College of Engineering & Technology, Surat', 2, 3),
(23, 'Government Polytechnic For Girls, Ahmedabad', 2, 3),
(24, 'Government Polytechnic For Girls, Surat', 2, 3),
(25, 'Government Polytechnic, Ahmedabad', 2, 3),
(26, 'Government Polytechnic, Bhuj', 2, 3),
(27, 'Government Polytechnic, chhotaudepur', 2, 3),
(28, 'Government Polytechnic, Dahod', 2, 3),
(29, 'Government Polytechnic, Gandhinagar', 2, 3),
(30, 'Government Polytechnic, Godhra', 2, 3),
(31, 'Government Polytechnic, Himatnagar', 2, 3),
(32, 'Government Polytechnic, Jamnagar', 2, 3),
(33, 'Government Polytechnic, Junagadh', 2, 3),
(34, 'Government Polytechnic, Kheda', 2, 3),
(35, 'Government Polytechnic, Navsari', 2, 3),
(36, 'Government Polytechnic, Palanpur', 2, 3),
(37, 'Government Polytechnic, Porbandar', 2, 3),
(38, 'Government Polytechnic, Rajkot', 2, 3),
(39, 'Government Polytechnic, Rajpipla', 2, 3),
(40, 'Government Polytechnic, Vadnagar', 2, 3),
(41, 'Government Polytechnic, VALSAD', 2, 3),
(42, 'Government Polytechnic, Vyara', 2, 3),
(43, 'Government Polytechnic, Waghai', 2, 3),
(44, 'JNMP, Amreli', 2, 3),
(45, 'K D Polytechnic, Patan', 2, 3),
(46, 'LUKHDHIRJI ENGINEERING COLLEGE (DIPLOMA), Morbi', 2, 3),
(47, 'RC TECHNICAL INSTITUTE, Ahmedabad', 2, 3),
(48, 'Shri K J Polytechnic, Bharuch', 2, 3),
(49, 'Sir Bhavsinhji Polytechnic Institute, Bhavnagar', 2, 3),
(50, 'Indian Institute of Science, Bengaluru', 5, 1),
(51, 'Indian Institute of Technology (IIT), Gandhi Nagar', 5, 1),
(52, 'Indian Institute of Technology (IIT), Bhubaneshwar', 5, 1),
(53, 'Indian Institute of Technology (IIT), Madras', 5, 1),
(54, 'Indian Institute of Technology (IIT), Guwahati', 5, 1),
(55, 'Indian Institute of Technology (IIT), Indore', 5, 1),
(56, 'Indian Institute of Technology (IIT), Kanpur', 5, 1),
(57, 'Indian Institute of Technology (IIT), Jodhpur', 5, 1),
(58, 'Indian Institute of Technology (IIT), Kharagpur', 5, 1),
(59, 'Indian Institute of Technology (IIT), Hyderabad', 5, 1),
(60, 'Indian Institute of Technology (IIT), Mumbai', 5, 1),
(61, 'Indian Institute of Technology (IIT), Patna', 5, 1),
(62, 'Indian Institute of Technology (IIT), Delhi', 5, 1),
(63, 'Indian Institute of Technology (IIT), Ropar', 5, 1),
(64, 'Indian Institute of Technology (IIT), Mandi', 5, 1),
(65, 'Indian Institute of Technology (IIT), Roorkee', 5, 1),
(66, 'Indian Institute of Technology (Banaras Hindu University), Varanasi', 5, 1),
(67, 'Indian Institute of Technology (IIT), Jammu', 5, 1),
(68, 'Indian Institute of Technology (IIT), Palakkad', 5, 1),
(69, 'Indian Institute of Technology (IIT), Tirupati', 5, 1),
(70, 'Indian Institute of Technology (IIT), Goa', 5, 1),
(71, 'Indian Institute of Technology (IIT), Bhilai', 5, 1),
(72, 'Indian Institute of Technology (IIT) Dharwad', 5, 1),
(73, 'Indian Institute of Technology (Indian School of Mines), Dhanbad', 5, 1),
(74, 'Indian Institute of Management, Ahmedabad, Gujarat', 5, 1),
(75, 'Indian Institute of Management, Kolkata, West Bengal', 5, 1),
(76, 'Indian Institute of Management, Bangalore, Karnataka', 5, 1),
(77, 'Indian Institute of Management, Lucknow, Uttar Pradesh', 5, 1),
(78, 'Indian Institute of Management, Kozhikode, Kerala', 5, 1),
(79, 'Indian Institute of Management, Indore, Madhya Pradesh', 5, 1),
(80, 'Indian Institute of Management, Shillong, Meghalaya', 5, 1),
(81, 'Indian Institute of Management, Rohtak, Haryana', 5, 1),
(82, 'Indian Institute of Management, Ranchi, Jharkhand', 5, 1),
(83, 'Indian Institute of Management, Raipur, Chhattisgarh', 5, 1),
(84, 'Indian Institute of Management, Tiruchirappalli, Tamil Nadu', 5, 1),
(85, 'Indian Institute of Management, Kashipur, Uttarakhand', 5, 1),
(86, 'Indian Institute of Management, Udaipur, Rajasthan', 5, 1),
(87, 'Indian Institute of Management, Nagpur, Maharashtra', 5, 1),
(88, 'Indian Institute of Management, Vishakhapatnam, Andhra Pradesh', 5, 1),
(89, 'Indian Institute of Management, Bodh Gaya, Bihar', 5, 1),
(90, 'Indian Institute of Management, Amritsar, Punjab', 5, 1),
(91, 'Indian Institute of Management, Sambalpur, Odisha', 5, 1),
(92, 'Indian Institute of Management, Sirmaur, Himachal Pradesh', 5, 1),
(93, 'Indian Institute of Management, Jammu, Jammu & Kashmir', 5, 1),
(94, 'Ahmedabad University, Ahmedabad', 5, 2),
(95, 'Anand Agricultural University, anand', 5, 2),
(96, 'Anant National University, Ahmedabad', 5, 2),
(97, 'AURO University of Hospitality and Management, Surat', 5, 2),
(98, 'Bhakta Kavi Narsinh Mehta University, Junagadh', 5, 2),
(99, 'C. U. Shah University, Surendranagar', 5, 2),
(100, 'Calorx Teacher\'s University, Ahmadabad', 5, 2),
(101, 'Central University of Gujarat, Gandhinagar', 5, 2),
(102, 'CEPT University, Ahmedabad', 5, 2),
(103, 'Charotar University of Science & Technology, Anand', 5, 2),
(104, 'Children\'s University, Gandhinagar', 5, 2),
(105, 'Dharmsinh Desai University, Nadiad', 5, 2),
(106, 'Dhirubhai Ambani Institute of Information and Communication Technology, Gandhinagar', 5, 2),
(107, 'Dr. Babasaheb Ambedkar Open University, Ahmedabad', 5, 2),
(108, 'G.L.S. University, Ahmedabad', 5, 2),
(109, 'Ganpat University, Mehsana', 5, 2),
(110, 'GSFC University, Vadodara', 5, 2),
(111, 'Gujarat Agricultural University, Banaskantha', 5, 2),
(112, 'Gujarat Ayurveda University, Jamnagar', 5, 2),
(113, 'Gujarat Forensic Sciences University, Gandhinagar', 5, 2),
(114, 'Gujarat National Law University, Gandhinagar', 5, 2),
(115, 'Gujarat Technological University, Ahmedabad', 5, 2),
(116, 'Gujarat University of Transplantation Sciences, Ahmedabad', 5, 2),
(117, 'Gujarat University, Ahmedabad', 5, 2),
(118, 'Gujarat Vidyapeeth, Ahmedabad', 5, 2),
(119, 'Hemchandracharya North Gujarat University, Patan', 5, 2),
(120, 'Indian Institute of Public Health, Ahmedabad', 5, 2),
(121, 'Indian Institute of Teacher Education, Gandhinagar', 5, 2),
(122, 'Indrashil University, Ahmedabad', 5, 2),
(123, 'Indus University, Ahmedabad', 5, 2),
(124, 'Institute of Advanced Research, Gandhinagar', 5, 2),
(125, 'Institute of Infrastructure Technology Research and Management, Ahmedabad', 5, 2),
(126, 'ITM Vocational University, Vadodara', 5, 2),
(127, 'Junagarh Agricultural University, Junagadh', 5, 2),
(128, 'Kadi Sarva Vishwavidyalaya, Gandhinagar', 5, 2),
(129, 'Kamdhenu University, Gandhinagar', 5, 2),
(130, 'Karnavati University, Gandhinagar', 5, 2),
(131, 'Krantiguru Shyamji Krishna Verma Kachchh University, Kachchh', 5, 2),
(132, 'Krishnakumarsinhji Bhavnagar University, Bhavnagar', 5, 2),
(133, 'Lakulish Yoga University, Ahmedabad', 5, 2),
(134, 'Maharaja Sayajirao University of Baroda, Vadodara', 5, 2),
(135, 'Marwadi University, Rajkot', 5, 2),
(136, 'Navrachana University, Ahmedabad', 5, 2),
(137, 'Navsari Agriculture University, Navsari', 5, 2),
(138, 'Nirma University, Ahmedabad', 5, 2),
(139, 'P. P. Savani University, Surat', 5, 2),
(140, 'Pandit Deendayal petroleum University, Gandhinagar', 5, 2),
(141, 'Parul University, Vadodara', 5, 2),
(142, 'Plastindia International University, Valsad', 5, 2),
(143, 'Rai University, Ahmedabad', 5, 2),
(144, 'Raksha Shakti University, Ahmedabad', 5, 2),
(145, 'RK University, Rajkot', 5, 2),
(146, 'Sankalchand Patel University, Visanagar', 5, 2),
(147, 'Sardar Patel University, Anand', 5, 2),
(148, 'Saurashtra University, Rajkot', 5, 2),
(149, 'Shree Somnath Sanskrit University, Junagadh', 5, 2),
(150, 'Shri Govind Guru University, Panchmahals', 5, 2),
(151, 'Sumandeep Vidyapeeth, Vadodara', 5, 2),
(152, 'Swarnim Gujarat Sports University, Gandhinagar', 5, 2),
(153, 'Swarnim Startup & Innovation University, Gandhinagar', 5, 2),
(154, 'Team Lease Skills University, Vadodara', 5, 2),
(155, 'UKA Tarsadia University, Surat', 5, 2),
(156, 'Veer Narmad South Gujarat University, Surat', 5, 2),
(157, 'SPIPA', 5, 4),
(158, 'NITTTR,Ahmedabad', 5, 6),
(159, 'NITTTR,Bhopal', 5, 6),
(160, 'ALISON', 5, 7),
(161, 'Canvas Network', 5, 7),
(162, 'Coursera', 5, 7),
(163, 'Coursmos', 5, 7),
(164, 'edX', 5, 7),
(165, 'Eliademy', 5, 7),
(166, 'FutureLearn', 5, 7),
(167, 'iversity', 5, 7),
(168, 'Kadenze', 5, 7),
(169, 'Khan Academy', 5, 7),
(170, 'Lynda.com', 5, 7),
(171, 'NovoEd', 5, 7),
(172, 'Open2Study', 5, 7),
(173, 'OpenClassrooms', 5, 7),
(174, 'openHPI', 5, 7),
(175, 'OpenLearning', 5, 7),
(176, 'Peer to Peer University', 5, 7),
(177, 'POLHN', 5, 7),
(178, 'Shaw Academy', 5, 7),
(179, 'Stanford Online', 5, 7),
(180, 'Udacity', 5, 7),
(181, 'Udemy', 5, 7),
(182, 'WizIQ', 5, 7),
(183, 'Motilal Nehru National Institute of Technology Allahabad', 5, 1),
(184, 'National Institute of Technology Sikkim', 5, 1),
(185, 'National Institute of Technology Patna', 5, 1),
(186, 'National Institute of Technology Karnataka, Surathkal', 5, 1),
(187, 'Malaviya National Institute of Technology Jaipur', 5, 1),
(188, 'National Institute of Technology, Uttarakhand', 5, 1),
(189, 'National Institute of Technology Durgapur', 5, 1),
(190, 'National Institute of Technology Warangal', 5, 1),
(191, 'National Institute of Technology Rourkela', 5, 1),
(192, 'National Institute of Technology Manipur', 5, 1),
(193, 'National Institute of Technology Kurukshetra', 5, 1),
(194, 'National Institute of Technology, Hamirpur', 5, 1),
(195, 'Visvesvaraya National Institute of Technology Nagpur', 5, 1),
(196, 'Sardar Vallabhbhai National Institute of Technology Surat', 5, 1),
(197, 'National Institute of Technology Tiruchirappalli', 5, 1),
(198, 'National Institute of Technology Srinagar', 5, 1),
(199, 'National Institute of Technology Mizoram', 5, 1),
(200, 'National Institute of Technology Meghalaya', 5, 1),
(201, 'National Institute of Technology Jamshedpur', 5, 1),
(202, 'National Institute of Technology Goa', 5, 1),
(203, 'National Institute of Technology Delhi', 5, 1),
(204, 'National Institute of Technology Calicut', 5, 1),
(205, 'National Institute of Technology Arunachal Pradesh', 5, 1),
(206, 'National Institute of Technology Agartala', 5, 1),
(207, 'National Institute of Technology Andhra Pradesh', 5, 1),
(208, 'Maulana Azad National Institute of Technology Bhopal', 5, 1),
(209, 'Dr B R Ambedkar National Institute of Technology Jalandhar', 5, 1),
(210, 'National Institute of Technology Puducherry, Karaikal', 5, 1),
(211, 'National Institute of Technology, Raipur', 5, 1),
(212, 'National Institute of Technology, Silchar', 5, 1),
(213, 'NITTTR,Goa', 5, 6),
(214, 'NITTTR,Raipur', 5, 6),
(215, 'NITTTR,Pune', 5, 6),
(216, 'NITTTR,chandigarh', 5, 6),
(217, 'NITTTR,kolkata', 5, 6),
(218, 'NITTTR,Chennai', 5, 6),
(219, 'B.K.Mody Government Pharmacy College,Rajkot', 3, 3),
(220, 'NPTEL', 5, 7),
(221, 'BVM Engineering College,Vallabh Vidyanagar', 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tt_institute_type`
--

CREATE TABLE `tt_institute_type` (
  `inst_type_id` int(11) NOT NULL,
  `inst_type` varchar(19) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tt_institute_type`
--

INSERT INTO `tt_institute_type` (`inst_type_id`, `inst_type`) VALUES
(0, 'DTE,Gandhinagar'),
(1, 'Degree Engineering'),
(2, 'Diploma Engineering'),
(3, 'Degree Pharmacy'),
(4, 'Diploma Pharmacy'),
(5, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `tt_login`
--

CREATE TABLE `tt_login` (
  `inst_id` int(11) NOT NULL,
  `inst_name` varchar(83) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tt_login`
--

INSERT INTO `tt_login` (`inst_id`, `inst_name`, `username`, `password`) VALUES
(1, 'DTE, Gandhinagar', '', ''),
(2, 'Government Engineering College, Bharuch', '', ''),
(3, 'Government Engineering College, Bhavnagar', '', ''),
(4, 'Government Engineering College, BHUJ', '', ''),
(5, 'Government Engineering College, Dahod', '', ''),
(6, 'Government Engineering College, Gandhinagar', '', ''),
(7, 'Government Engineering College, Godhra', '', ''),
(8, 'Government Engineering College, Modasa', '', ''),
(9, 'Government Engineering College, Palanpur', '', ''),
(10, 'Government Engineering College, Patan', '', ''),
(11, 'Government Engineering College, Rajkot', '', ''),
(12, 'Government Engineering College, Surat', '', ''),
(13, 'Government Engineering College, Valsad', '', ''),
(14, 'Government MCA College, Maninagar', '', ''),
(15, 'IITRAM, Ahmedabad', '', ''),
(16, 'L.D.College of Engineering, Ahmedabad', '', ''),
(17, 'Lukhdhirji Engineering College, Morbi', '', ''),
(18, 'Shantilal Shah Engineering College, Bhavnagar', '', ''),
(19, 'Vishwakarma Govt Engineering College, Chandkheda', '', ''),
(20, 'AV PAREKH TECHNICAL INSTITUTE, Rajkot', '', ''),
(21, 'C U Shah Polytechnic, SuredraNagar', '', ''),
(22, 'Dr. S & S. S. Ghandhy College of Engineering & Technology, Surat', '', ''),
(23, 'Government Polytechnic For Girls, Ahmedabad', '', ''),
(24, 'Government Polytechnic For Girls, Surat', '', ''),
(25, 'Government Polytechnic, Ahmedabad', '', ''),
(26, 'Government Polytechnic, Bhuj', '', ''),
(27, 'Government Polytechnic, chhotaudepur', '', ''),
(28, 'Government Polytechnic, Dahod', '', ''),
(29, 'Government Polytechnic, Gandhinagar', '', ''),
(30, 'Government Polytechnic, Godhra', '', ''),
(31, 'Government Polytechnic, Himatnagar', '', ''),
(32, 'Government Polytechnic, Jamnagar', '', ''),
(33, 'Government Polytechnic, Junagadh', '', ''),
(34, 'Government Polytechnic, Kheda', '', ''),
(35, 'Government Polytechnic, Navsari', '', ''),
(36, 'Government Polytechnic, Palanpur', '', ''),
(37, 'Government Polytechnic, Porbandar', '', ''),
(38, 'Government Polytechnic, Rajkot', '', ''),
(39, 'Government Polytechnic, Rajpipla', '', ''),
(40, 'Government Polytechnic, Vadnagar', '', ''),
(41, 'Government Polytechnic, VALSAD', '', ''),
(42, 'Government Polytechnic, Vyara', '', ''),
(43, 'Government Polytechnic, Waghai', '', ''),
(44, 'JNMP, Amreli', '', ''),
(45, 'K D Polytechnic, Patan', '', ''),
(46, 'LUKHDHIRJI ENGINEERING COLLEGE (DIPLOMA), Morbi', '', ''),
(47, 'RC TECHNICAL INSTITUTE, Ahmedabad', '', ''),
(48, 'Shri K J Polytechnic, Bharuch', '', ''),
(49, 'Sir Bhavsinhji Polytechnic Institute, Bhavnagar', '', ''),
(50, 'Indian Institute of Science, Bengaluru', '', ''),
(51, 'Indian Institute of Technology (IIT), Gandhi Nagar', '', ''),
(52, 'Indian Institute of Technology (IIT), Bhubaneshwar', '', ''),
(53, 'Indian Institute of Technology (IIT), Madras', '', ''),
(54, 'Indian Institute of Technology (IIT), Guwahati', '', ''),
(55, 'Indian Institute of Technology (IIT), Indore', '', ''),
(56, 'Indian Institute of Technology (IIT), Kanpur', '', ''),
(57, 'Indian Institute of Technology (IIT), Jodhpur', '', ''),
(58, 'Indian Institute of Technology (IIT), Kharagpur', '', ''),
(59, 'Indian Institute of Technology (IIT), Hyderabad', '', ''),
(60, 'Indian Institute of Technology (IIT), Mumbai', '', ''),
(61, 'Indian Institute of Technology (IIT), Patna', '', ''),
(62, 'Indian Institute of Technology (IIT), Delhi', '', ''),
(63, 'Indian Institute of Technology (IIT), Ropar', '', ''),
(64, 'Indian Institute of Technology (IIT), Mandi', '', ''),
(65, 'Indian Institute of Technology (IIT), Roorkee', '', ''),
(66, 'Indian Institute of Technology (Banaras Hindu University), Varanasi', '', ''),
(67, 'Indian Institute of Technology (IIT), Jammu', '', ''),
(68, 'Indian Institute of Technology (IIT), Palakkad', '', ''),
(69, 'Indian Institute of Technology (IIT), Tirupati', '', ''),
(70, 'Indian Institute of Technology (IIT), Goa', '', ''),
(71, 'Indian Institute of Technology (IIT), Bhilai', '', ''),
(72, 'Indian Institute of Technology (IIT) Dharwad', '', ''),
(73, 'Indian Institute of Technology (Indian School of Mines), Dhanbad', '', ''),
(74, 'Indian Institute of Management, Ahmedabad, Gujarat', '', ''),
(75, 'Indian Institute of Management, Kolkata, West Bengal', '', ''),
(76, 'Indian Institute of Management, Bangalore, Karnataka', '', ''),
(77, 'Indian Institute of Management, Lucknow, Uttar Pradesh', '', ''),
(78, 'Indian Institute of Management, Kozhikode, Kerala', '', ''),
(79, 'Indian Institute of Management, Indore, Madhya Pradesh', '', ''),
(80, 'Indian Institute of Management, Shillong, Meghalaya', '', ''),
(81, 'Indian Institute of Management, Rohtak, Haryana', '', ''),
(82, 'Indian Institute of Management, Ranchi, Jharkhand', '', ''),
(83, 'Indian Institute of Management, Raipur, Chhattisgarh', '', ''),
(84, 'Indian Institute of Management, Tiruchirappalli, Tamil Nadu', '', ''),
(85, 'Indian Institute of Management, Kashipur, Uttarakhand', '', ''),
(86, 'Indian Institute of Management, Udaipur, Rajasthan', '', ''),
(87, 'Indian Institute of Management, Nagpur, Maharashtra', '', ''),
(88, 'Indian Institute of Management, Vishakhapatnam, Andhra Pradesh', '', ''),
(89, 'Indian Institute of Management, Bodh Gaya, Bihar', '', ''),
(90, 'Indian Institute of Management, Amritsar, Punjab', '', ''),
(91, 'Indian Institute of Management, Sambalpur, Odisha', '', ''),
(92, 'Indian Institute of Management, Sirmaur, Himachal Pradesh', '', ''),
(93, 'Indian Institute of Management, Jammu, Jammu & Kashmir', '', ''),
(94, 'Ahmedabad University, Ahmedabad', '', ''),
(95, 'Anand Agricultural University, anand', '', ''),
(96, 'Anant National University, Ahmedabad', '', ''),
(97, 'AURO University of Hospitality and Management, Surat', '', ''),
(98, 'Bhakta Kavi Narsinh Mehta University, Junagadh', '', ''),
(99, 'C. U. Shah University, Surendranagar', '', ''),
(100, 'Calorx Teacher\'s University, Ahmadabad', '', ''),
(101, 'Central University of Gujarat, Gandhinagar', '', ''),
(102, 'CEPT University, Ahmedabad', '', ''),
(103, 'Charotar University of Science & Technology, Anand', '', ''),
(104, 'Children\'s University, Gandhinagar', '', ''),
(105, 'Dharmsinh Desai University, Nadiad', '', ''),
(106, 'Dhirubhai Ambani Institute of Information and Communication Technology, Gandhinagar', '', ''),
(107, 'Dr. Babasaheb Ambedkar Open University, Ahmedabad', '', ''),
(108, 'G.L.S. University, Ahmedabad', '', ''),
(109, 'Ganpat University, Mehsana', '', ''),
(110, 'GSFC University, Vadodara', '', ''),
(111, 'Gujarat Agricultural University, Banaskantha', '', ''),
(112, 'Gujarat Ayurveda University, Jamnagar', '', ''),
(113, 'Gujarat Forensic Sciences University, Gandhinagar', '', ''),
(114, 'Gujarat National Law University, Gandhinagar', '', ''),
(115, 'Gujarat Technological University, Ahmedabad', '', ''),
(116, 'Gujarat University of Transplantation Sciences, Ahmedabad', '', ''),
(117, 'Gujarat University, Ahmedabad', '', ''),
(118, 'Gujarat Vidyapeeth, Ahmedabad', '', ''),
(119, 'Hemchandracharya North Gujarat University, Patan', '', ''),
(120, 'Indian Institute of Public Health, Ahmedabad', '', ''),
(121, 'Indian Institute of Teacher Education, Gandhinagar', '', ''),
(122, 'Indrashil University, Ahmedabad', '', ''),
(123, 'Indus University, Ahmedabad', '', ''),
(124, 'Institute of Advanced Research, Gandhinagar', '', ''),
(125, 'Institute of Infrastructure Technology Research and Management, Ahmedabad', '', ''),
(126, 'ITM Vocational University, Vadodara', '', ''),
(127, 'Junagarh Agricultural University, Junagadh', '', ''),
(128, 'Kadi Sarva Vishwavidyalaya, Gandhinagar', '', ''),
(129, 'Kamdhenu University, Gandhinagar', '', ''),
(130, 'Karnavati University, Gandhinagar', '', ''),
(131, 'Krantiguru Shyamji Krishna Verma Kachchh University, Kachchh', '', ''),
(132, 'Krishnakumarsinhji Bhavnagar University, Bhavnagar', '', ''),
(133, 'Lakulish Yoga University, Ahmedabad', '', ''),
(134, 'Maharaja Sayajirao University of Baroda, Vadodara', '', ''),
(135, 'Marwadi University, Rajkot', '', ''),
(136, 'Navrachana University, Ahmedabad', '', ''),
(137, 'Navsari Agriculture University, Navsari', '', ''),
(138, 'Nirma University, Ahmedabad', '', ''),
(139, 'P. P. Savani University, Surat', '', ''),
(140, 'Pandit Deendayal petroleum University, Gandhinagar', '', ''),
(141, 'Parul University, Vadodara', '', ''),
(142, 'Plastindia International University, Valsad', '', ''),
(143, 'Rai University, Ahmedabad', '', ''),
(144, 'Raksha Shakti University, Ahmedabad', '', ''),
(145, 'RK University, Rajkot', '', ''),
(146, 'Sankalchand Patel University, Visanagar', '', ''),
(147, 'Sardar Patel University, Anand', '', ''),
(148, 'Saurashtra University, Rajkot', '', ''),
(149, 'Shree Somnath Sanskrit University, Junagadh', '', ''),
(150, 'Shri Govind Guru University, Panchmahals', '', ''),
(151, 'Sumandeep Vidyapeeth, Vadodara', '', ''),
(152, 'Swarnim Gujarat Sports University, Gandhinagar', '', ''),
(153, 'Swarnim Startup & Innovation University, Gandhinagar', '', ''),
(154, 'Team Lease Skills University, Vadodara', '', ''),
(155, 'UKA Tarsadia University, Surat', '', ''),
(156, 'Veer Narmad South Gujarat University, Surat', '', ''),
(157, 'SPIPA', '', ''),
(158, 'NITTTR,Ahmedabad', '', ''),
(159, 'NITTTR,Bhopal', '', ''),
(160, 'ALISON', '', ''),
(161, 'Canvas Network', '', ''),
(162, 'Coursera', '', ''),
(163, 'Coursmos', '', ''),
(164, 'edX', '', ''),
(165, 'Eliademy', '', ''),
(166, 'FutureLearn', '', ''),
(167, 'iversity', '', ''),
(168, 'Kadenze', '', ''),
(169, 'Khan Academy', '', ''),
(170, 'Lynda.com', '', ''),
(171, 'NovoEd', '', ''),
(172, 'Open2Study', '', ''),
(173, 'OpenClassrooms', '', ''),
(174, 'openHPI', '', ''),
(175, 'OpenLearning', '', ''),
(176, 'Peer to Peer University', '', ''),
(177, 'POLHN', '', ''),
(178, 'Shaw Academy', '', ''),
(179, 'Stanford Online', '', ''),
(180, 'Udacity', '', ''),
(181, 'Udemy', '', ''),
(182, 'WizIQ', '', ''),
(183, 'Motilal Nehru National Institute of Technology Allahabad', '', ''),
(184, 'National Institute of Technology Sikkim', '', ''),
(185, 'National Institute of Technology Patna', '', ''),
(186, 'National Institute of Technology Karnataka, Surathkal', '', ''),
(187, 'Malaviya National Institute of Technology Jaipur', '', ''),
(188, 'National Institute of Technology, Uttarakhand', '', ''),
(189, 'National Institute of Technology Durgapur', '', ''),
(190, 'National Institute of Technology Warangal', '', ''),
(191, 'National Institute of Technology Rourkela', '', ''),
(192, 'National Institute of Technology Manipur', '', ''),
(193, 'National Institute of Technology Kurukshetra', '', ''),
(194, 'National Institute of Technology, Hamirpur', '', ''),
(195, 'Visvesvaraya National Institute of Technology Nagpur', '', ''),
(196, 'Sardar Vallabhbhai National Institute of Technology Surat', '', ''),
(197, 'National Institute of Technology Tiruchirappalli', '', ''),
(198, 'National Institute of Technology Srinagar', '', ''),
(199, 'National Institute of Technology Mizoram', '', ''),
(200, 'National Institute of Technology Meghalaya', '', ''),
(201, 'National Institute of Technology Jamshedpur', '', ''),
(202, 'National Institute of Technology Goa', '', ''),
(203, 'National Institute of Technology Delhi', '', ''),
(204, 'National Institute of Technology Calicut', '', ''),
(205, 'National Institute of Technology Arunachal Pradesh', '', ''),
(206, 'National Institute of Technology Agartala', '', ''),
(207, 'National Institute of Technology Andhra Pradesh', '', ''),
(208, 'Maulana Azad National Institute of Technology Bhopal', '', ''),
(209, 'Dr B R Ambedkar National Institute of Technology Jalandhar', '', ''),
(210, 'National Institute of Technology Puducherry, Karaikal', '', ''),
(211, 'National Institute of Technology, Raipur', '', ''),
(212, 'National Institute of Technology, Silchar', '', ''),
(213, 'NITTTR,Goa', '', ''),
(214, 'NITTTR,Raipur', '', ''),
(215, 'NITTTR,Pune', '', ''),
(216, 'NITTTR,chandigarh', '', ''),
(217, 'NITTTR,kolkata', '', ''),
(218, 'NITTTR,Chennai', '', ''),
(219, 'B.K.Mody Government Pharmacy College,Rajkot', '', ''),
(220, 'NPTEL', '', ''),
(221, 'BVM Engineering College,Vallabh Vidyanagar', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tt_mpg_institute_branch`
--

CREATE TABLE `tt_mpg_institute_branch` (
  `map_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `branch_name` varchar(27) NOT NULL,
  `inst_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tt_mpg_institute_branch`
--

INSERT INTO `tt_mpg_institute_branch` (`map_id`, `branch_id`, `branch_name`, `inst_id`) VALUES
(1, 0, 'DTE', 1),
(2, 1, 'Applied Mechanics', 2),
(3, 7, 'Chemical', 2),
(4, 8, 'Chemistry', 2),
(5, 9, 'Civil', 2),
(6, 14, 'Electrical', 2),
(7, 13, 'Electronics & Communication', 2),
(8, 15, 'English', 2),
(9, 24, 'Maths', 2),
(10, 25, 'Mechanical', 2),
(11, 28, 'Physics', 2),
(12, 1, 'Applied Mechanics', 3),
(13, 9, 'Civil', 3),
(14, 11, 'Computer', 3),
(15, 14, 'Electrical', 3),
(16, 13, 'Electronics & Communication', 3),
(17, 15, 'English', 3),
(18, 21, 'Information & Technology', 3),
(19, 24, 'Maths', 3),
(20, 25, 'Mechanical', 3),
(21, 28, 'Physics', 3),
(22, 32, 'Production', 3),
(23, 1, 'Applied Mechanics', 4),
(24, 7, 'Chemical', 4),
(25, 8, 'Chemistry', 4),
(26, 9, 'Civil', 4),
(27, 11, 'Computer', 4),
(28, 14, 'Electrical', 4),
(29, 13, 'Electronics & Communication', 4),
(30, 15, 'English', 4),
(31, 16, 'Environmental', 4),
(32, 18, 'Geology', 4),
(33, 24, 'Maths', 4),
(34, 25, 'Mechanical', 4),
(35, 27, 'Mining', 4),
(36, 28, 'Physics', 4),
(37, 1, 'Applied Mechanics', 5),
(38, 9, 'Civil', 5),
(39, 11, 'Computer', 5),
(40, 14, 'Electrical', 5),
(41, 13, 'Electronics & Communication', 5),
(42, 15, 'English', 5),
(43, 25, 'Mechanical', 5),
(44, 1, 'Applied Mechanics', 6),
(45, 4, 'Bio-Medical', 6),
(46, 9, 'Civil', 6),
(47, 11, 'Computer', 6),
(48, 14, 'Electrical', 6),
(49, 13, 'Electronics & Communication', 6),
(50, 15, 'English', 6),
(51, 21, 'Information & Technology', 6),
(52, 22, 'Instrumentation & Control', 6),
(53, 24, 'Maths', 6),
(54, 25, 'Mechanical', 6),
(55, 26, 'Metallurgy', 6),
(56, 28, 'Physics', 6),
(57, 1, 'Applied Mechanics', 7),
(58, 9, 'Civil', 7),
(59, 14, 'Electrical', 7),
(60, 13, 'Electronics & Communication', 7),
(61, 15, 'English', 7),
(62, 24, 'Maths', 7),
(63, 25, 'Mechanical', 7),
(64, 28, 'Physics', 7),
(65, 1, 'Applied Mechanics', 8),
(66, 3, 'Automobile', 8),
(67, 9, 'Civil', 8),
(68, 11, 'Computer', 8),
(69, 14, 'Electrical', 8),
(70, 13, 'Electronics & Communication', 8),
(71, 15, 'English', 8),
(72, 21, 'Information & Technology', 8),
(73, 24, 'Maths', 8),
(74, 25, 'Mechanical', 8),
(75, 28, 'Physics', 8),
(76, 1, 'Applied Mechanics', 9),
(77, 8, 'Chemistry', 9),
(78, 9, 'Civil', 9),
(79, 14, 'Electrical', 9),
(80, 18, 'Geology', 9),
(81, 24, 'Maths', 9),
(82, 25, 'Mechanical', 9),
(83, 27, 'Mining', 9),
(84, 28, 'Physics', 9),
(85, 1, 'Applied Mechanics', 10),
(86, 9, 'Civil', 10),
(87, 11, 'Computer', 10),
(88, 14, 'Electrical', 10),
(89, 13, 'Electronics & Communication', 10),
(90, 15, 'English', 10),
(91, 24, 'Maths', 10),
(92, 25, 'Mechanical', 10),
(93, 28, 'Physics', 10),
(94, 1, 'Applied Mechanics', 11),
(95, 3, 'Automobile', 11),
(96, 9, 'Civil', 11),
(97, 11, 'Computer', 11),
(98, 12, 'D.C.P', 11),
(99, 14, 'Electrical', 11),
(100, 13, 'Electronics & Communication', 11),
(101, 15, 'English', 11),
(102, 22, 'Instrumentation & Control', 11),
(103, 24, 'Maths', 11),
(104, 25, 'Mechanical', 11),
(105, 28, 'Physics', 11),
(106, 1, 'Applied Mechanics', 12),
(107, 9, 'Civil', 12),
(108, 11, 'Computer', 12),
(109, 14, 'Electrical', 12),
(110, 13, 'Electronics & Communication', 12),
(111, 15, 'English', 12),
(112, 16, 'Environmental', 12),
(113, 24, 'Maths', 12),
(114, 25, 'Mechanical', 12),
(115, 28, 'Physics', 12),
(116, 1, 'Applied Mechanics', 13),
(117, 7, 'Chemical', 13),
(118, 8, 'Chemistry', 13),
(119, 9, 'Civil', 13),
(120, 14, 'Electrical', 13),
(121, 13, 'Electronics & Communication', 13),
(122, 15, 'English', 13),
(123, 16, 'Environmental', 13),
(124, 24, 'Maths', 13),
(125, 25, 'Mechanical', 13),
(126, 28, 'Physics', 13),
(127, 22, 'Instrumentation & Control', 14),
(128, 9, 'Civil', 15),
(129, 1, 'Applied Mechanics', 16),
(130, 3, 'Automobile', 16),
(131, 4, 'Bio-Medical', 16),
(132, 7, 'Chemical', 16),
(133, 8, 'Chemistry', 16),
(134, 9, 'Civil', 16),
(135, 11, 'Computer', 16),
(136, 14, 'Electrical', 16),
(137, 13, 'Electronics & Communication', 16),
(138, 15, 'English', 16),
(139, 16, 'Environmental', 16),
(140, 18, 'Geology', 16),
(141, 21, 'Information & Technology', 16),
(142, 22, 'Instrumentation & Control', 16),
(143, 24, 'Maths', 16),
(144, 25, 'Mechanical', 16),
(145, 26, 'Metallurgy', 16),
(146, 28, 'Physics', 16),
(147, 29, 'Plastic', 16),
(148, 33, 'Rubber Technology', 16),
(149, 37, 'Textile Technology', 16),
(150, 1, 'Applied Mechanics', 17),
(151, 7, 'Chemical', 17),
(152, 8, 'Chemistry', 17),
(153, 9, 'Civil', 17),
(154, 14, 'Electrical', 17),
(155, 15, 'English', 17),
(156, 20, 'Industrial', 17),
(157, 21, 'Information & Technology', 17),
(158, 24, 'Maths', 17),
(159, 25, 'Mechanical', 17),
(160, 28, 'Physics', 17),
(161, 30, 'Power Electronics', 17),
(162, 32, 'Production', 17),
(163, 1, 'Applied Mechanics', 18),
(164, 9, 'Civil', 18),
(165, 14, 'Electrical', 18),
(166, 13, 'Electronics & Communication', 18),
(167, 15, 'English', 18),
(168, 20, 'Industrial', 18),
(169, 21, 'Information & Technology', 18),
(170, 22, 'Instrumentation & Control', 18),
(171, 24, 'Maths', 18),
(172, 25, 'Mechanical', 18),
(173, 28, 'Physics', 18),
(174, 32, 'Production', 18),
(175, 1, 'Applied Mechanics', 19),
(176, 7, 'Chemical', 19),
(177, 8, 'Chemistry', 19),
(178, 9, 'Civil', 19),
(179, 11, 'Computer', 19),
(180, 14, 'Electrical', 19),
(181, 13, 'Electronics & Communication', 19),
(182, 15, 'English', 19),
(183, 21, 'Information & Technology', 19),
(184, 22, 'Instrumentation & Control', 19),
(185, 24, 'Maths', 19),
(186, 25, 'Mechanical', 19),
(187, 28, 'Physics', 19),
(188, 30, 'Power Electronics', 19),
(189, 4, 'Bio-Medical', 20),
(190, 5, 'C.A.C.D.D.M.', 20),
(191, 8, 'Chemistry', 20),
(192, 10, 'Commercial Practice', 20),
(193, 11, 'Computer', 20),
(194, 14, 'Electrical', 20),
(195, 13, 'Electronics & Communication', 20),
(196, 15, 'English', 20),
(197, 19, 'Home Science', 20),
(198, 22, 'Instrumentation & Control', 20),
(199, 24, 'Maths', 20),
(200, 25, 'Mechanical', 20),
(201, 28, 'Physics', 20),
(202, 1, 'Applied Mechanics', 21),
(203, 3, 'Automobile', 21),
(204, 5, 'C.A.C.D.D.M.', 21),
(205, 8, 'Chemistry', 21),
(206, 9, 'Civil', 21),
(207, 11, 'Computer', 21),
(208, 14, 'Electrical', 21),
(209, 15, 'English', 21),
(210, 19, 'Home Science', 21),
(211, 24, 'Maths', 21),
(212, 25, 'Mechanical', 21),
(213, 28, 'Physics', 21),
(214, 1, 'Applied Mechanics', 22),
(215, 3, 'Automobile', 22),
(216, 8, 'Chemistry', 22),
(217, 9, 'Civil', 22),
(218, 14, 'Electrical', 22),
(219, 15, 'English', 22),
(220, 21, 'Information & Technology', 22),
(221, 24, 'Maths', 22),
(222, 25, 'Mechanical', 22),
(223, 26, 'Metallurgy', 22),
(224, 28, 'Physics', 22),
(225, 30, 'Power Electronics', 22),
(226, 35, 'Textile Manu/ Tech', 22),
(227, 36, 'Textile Proc / Chemistry', 22),
(228, 1, 'Applied Mechanics', 23),
(229, 2, 'Archi. Assistantship', 23),
(230, 4, 'Bio-Medical', 23),
(231, 5, 'C.A.C.D.D.M.', 23),
(232, 9, 'Civil', 23),
(233, 10, 'Commercial Practice', 23),
(234, 11, 'Computer', 23),
(235, 14, 'Electrical', 23),
(236, 13, 'Electronics & Communication', 23),
(237, 15, 'English', 23),
(238, 19, 'Home Science', 23),
(239, 21, 'Information & Technology', 23),
(240, 23, 'Interior Design', 23),
(241, 24, 'Maths', 23),
(242, 25, 'Mechanical', 23),
(243, 28, 'Physics', 23),
(244, 2, 'Archi. Assistantship', 24),
(245, 9, 'Civil', 24),
(246, 10, 'Commercial Practice', 24),
(247, 11, 'Computer', 24),
(248, 14, 'Electrical', 24),
(249, 13, 'Electronics & Communication', 24),
(250, 15, 'English', 24),
(251, 21, 'Information & Technology', 24),
(252, 24, 'Maths', 24),
(253, 25, 'Mechanical', 24),
(254, 28, 'Physics', 24),
(255, 34, 'Textile Design', 24),
(256, 1, 'Applied Mechanics', 25),
(257, 3, 'Automobile', 25),
(258, 4, 'Bio-Medical', 25),
(259, 8, 'Chemistry', 25),
(260, 9, 'Civil', 25),
(261, 11, 'Computer', 25),
(262, 14, 'Electrical', 25),
(263, 13, 'Electronics & Communication', 25),
(264, 15, 'English', 25),
(265, 21, 'Information & Technology', 25),
(266, 22, 'Instrumentation & Control', 25),
(267, 24, 'Maths', 25),
(268, 25, 'Mechanical', 25),
(269, 28, 'Physics', 25),
(270, 29, 'Plastic', 25),
(271, 1, 'Applied Mechanics', 26),
(272, 8, 'Chemistry', 26),
(273, 9, 'Civil', 26),
(274, 11, 'Computer', 26),
(275, 14, 'Electrical', 26),
(276, 15, 'English', 26),
(277, 21, 'Information & Technology', 26),
(278, 24, 'Maths', 26),
(279, 25, 'Mechanical', 26),
(280, 26, 'Metallurgy', 26),
(281, 27, 'Mining', 26),
(282, 28, 'Physics', 26),
(283, 1, 'Applied Mechanics', 27),
(284, 3, 'Automobile', 27),
(285, 8, 'Chemistry', 27),
(286, 9, 'Civil', 27),
(287, 14, 'Electrical', 27),
(288, 15, 'English', 27),
(289, 24, 'Maths', 27),
(290, 25, 'Mechanical', 27),
(291, 28, 'Physics', 27),
(292, 29, 'Plastic', 27),
(293, 1, 'Applied Mechanics', 28),
(294, 5, 'C.A.C.D.D.M.', 28),
(295, 9, 'Civil', 28),
(296, 11, 'Computer', 28),
(297, 14, 'Electrical', 28),
(298, 13, 'Electronics & Communication', 28),
(299, 15, 'English', 28),
(300, 24, 'Maths', 28),
(301, 25, 'Mechanical', 28),
(302, 28, 'Physics', 28),
(303, 5, 'C.A.C.D.D.M.', 29),
(304, 7, 'Chemical', 29),
(305, 8, 'Chemistry', 29),
(306, 9, 'Civil', 29),
(307, 11, 'Computer', 29),
(308, 14, 'Electrical', 29),
(309, 13, 'Electronics & Communication', 29),
(310, 15, 'English', 29),
(311, 21, 'Information & Technology', 29),
(312, 22, 'Instrumentation & Control', 29),
(313, 24, 'Maths', 29),
(314, 25, 'Mechanical', 29),
(315, 28, 'Physics', 29),
(316, 1, 'Applied Mechanics', 30),
(317, 8, 'Chemistry', 30),
(318, 9, 'Civil', 30),
(319, 14, 'Electrical', 30),
(320, 15, 'English', 30),
(321, 19, 'Home Science', 30),
(322, 24, 'Maths', 30),
(323, 25, 'Mechanical', 30),
(324, 28, 'Physics', 30),
(325, 1, 'Applied Mechanics', 31),
(326, 5, 'C.A.C.D.D.M.', 31),
(327, 8, 'Chemistry', 31),
(328, 9, 'Civil', 31),
(329, 11, 'Computer', 31),
(330, 14, 'Electrical', 31),
(331, 13, 'Electronics & Communication', 31),
(332, 15, 'English', 31),
(333, 21, 'Information & Technology', 31),
(334, 24, 'Maths', 31),
(335, 25, 'Mechanical', 31),
(336, 28, 'Physics', 31),
(337, 1, 'Applied Mechanics', 32),
(338, 8, 'Chemistry', 32),
(339, 9, 'Civil', 32),
(340, 11, 'Computer', 32),
(341, 14, 'Electrical', 32),
(342, 13, 'Electronics & Communication', 32),
(343, 15, 'English', 32),
(344, 24, 'Maths', 32),
(345, 25, 'Mechanical', 32),
(346, 28, 'Physics', 32),
(347, 1, 'Applied Mechanics', 33),
(348, 8, 'Chemistry', 33),
(349, 9, 'Civil', 33),
(350, 14, 'Electrical', 33),
(351, 15, 'English', 33),
(352, 24, 'Maths', 33),
(353, 25, 'Mechanical', 33),
(354, 28, 'Physics', 33),
(355, 1, 'Applied Mechanics', 34),
(356, 9, 'Civil', 34),
(357, 14, 'Electrical', 34),
(358, 15, 'English', 34),
(359, 24, 'Maths', 34),
(360, 25, 'Mechanical', 34),
(361, 28, 'Physics', 34),
(362, 1, 'Applied Mechanics', 35),
(363, 8, 'Chemistry', 35),
(364, 9, 'Civil', 35),
(365, 14, 'Electrical', 35),
(366, 15, 'English', 35),
(367, 24, 'Maths', 35),
(368, 25, 'Mechanical', 35),
(369, 28, 'Physics', 35),
(370, 1, 'Applied Mechanics', 36),
(371, 8, 'Chemistry', 36),
(372, 9, 'Civil', 36),
(373, 14, 'Electrical', 36),
(374, 13, 'Electronics & Communication', 36),
(375, 15, 'English', 36),
(376, 22, 'Instrumentation & Control', 36),
(377, 24, 'Maths', 36),
(378, 25, 'Mechanical', 36),
(379, 28, 'Physics', 36),
(380, 1, 'Applied Mechanics', 37),
(381, 9, 'Civil', 37),
(382, 11, 'Computer', 37),
(383, 14, 'Electrical', 37),
(384, 15, 'English', 37),
(385, 24, 'Maths', 37),
(386, 25, 'Mechanical', 37),
(387, 28, 'Physics', 37),
(388, 38, 'Transportation', 37),
(389, 1, 'Applied Mechanics', 38),
(390, 7, 'Chemical', 38),
(391, 8, 'Chemistry', 38),
(392, 9, 'Civil', 38),
(393, 10, 'Commercial Practice', 38),
(394, 11, 'Computer', 38),
(395, 14, 'Electrical', 38),
(396, 13, 'Electronics & Communication', 38),
(397, 15, 'English', 38),
(398, 21, 'Information & Technology', 38),
(399, 24, 'Maths', 38),
(400, 25, 'Mechanical', 38),
(401, 26, 'Metallurgy', 38),
(402, 28, 'Physics', 38),
(403, 14, 'Electrical', 39),
(404, 25, 'Mechanical', 39),
(405, 2, 'Archi. Assistantship', 40),
(406, 9, 'Civil', 40),
(407, 13, 'Electronics & Communication', 40),
(408, 15, 'English', 40),
(409, 24, 'Maths', 40),
(410, 25, 'Mechanical', 40),
(411, 28, 'Physics', 40),
(412, 1, 'Applied Mechanics', 41),
(413, 7, 'Chemical', 41),
(414, 8, 'Chemistry', 41),
(415, 9, 'Civil', 41),
(416, 14, 'Electrical', 41),
(417, 13, 'Electronics & Communication', 41),
(418, 15, 'English', 41),
(419, 24, 'Maths', 41),
(420, 25, 'Mechanical', 41),
(421, 28, 'Physics', 41),
(422, 29, 'Plastic', 41),
(423, 1, 'Applied Mechanics', 42),
(424, 8, 'Chemistry', 42),
(425, 9, 'Civil', 42),
(426, 14, 'Electrical', 42),
(427, 15, 'English', 42),
(428, 25, 'Mechanical', 42),
(429, 28, 'Physics', 42),
(430, 1, 'Applied Mechanics', 43),
(431, 8, 'Chemistry', 43),
(432, 9, 'Civil', 43),
(433, 11, 'Computer', 43),
(434, 14, 'Electrical', 43),
(435, 15, 'English', 43),
(436, 21, 'Information & Technology', 43),
(437, 24, 'Maths', 43),
(438, 25, 'Mechanical', 43),
(439, 28, 'Physics', 43),
(440, 1, 'Applied Mechanics', 44),
(441, 3, 'Automobile', 44),
(442, 8, 'Chemistry', 44),
(443, 9, 'Civil', 44),
(444, 14, 'Electrical', 44),
(445, 13, 'Electronics & Communication', 44),
(446, 15, 'English', 44),
(447, 24, 'Maths', 44),
(448, 25, 'Mechanical', 44),
(449, 28, 'Physics', 44),
(450, 1, 'Applied Mechanics', 45),
(451, 8, 'Chemistry', 45),
(452, 9, 'Civil', 45),
(453, 11, 'Computer', 45),
(454, 14, 'Electrical', 45),
(455, 13, 'Electronics & Communication', 45),
(456, 15, 'English', 45),
(457, 24, 'Maths', 45),
(458, 25, 'Mechanical', 45),
(459, 28, 'Physics', 45),
(460, 1, 'Applied Mechanics', 46),
(461, 6, 'Ceramic Technology', 46),
(462, 8, 'Chemistry', 46),
(463, 9, 'Civil', 46),
(464, 14, 'Electrical', 46),
(465, 13, 'Electronics & Communication', 46),
(466, 15, 'English', 46),
(467, 21, 'Information & Technology', 46),
(468, 24, 'Maths', 46),
(469, 25, 'Mechanical', 46),
(470, 26, 'Metallurgy', 46),
(471, 28, 'Physics', 46),
(472, 1, 'Applied Mechanics', 47),
(473, 8, 'Chemistry', 47),
(474, 9, 'Civil', 47),
(475, 11, 'Computer', 47),
(476, 14, 'Electrical', 47),
(477, 15, 'English', 47),
(478, 21, 'Information & Technology', 47),
(479, 24, 'Maths', 47),
(480, 25, 'Mechanical', 47),
(481, 28, 'Physics', 47),
(482, 31, 'Printing Technology', 47),
(483, 35, 'Textile Manu/ Tech', 47),
(484, 36, 'Textile Proc / Chemistry', 47),
(485, 1, 'Applied Mechanics', 48),
(486, 5, 'C.A.C.D.D.M.', 48),
(487, 7, 'Chemical', 48),
(488, 9, 'Civil', 48),
(489, 11, 'Computer', 48),
(490, 14, 'Electrical', 48),
(491, 13, 'Electronics & Communication', 48),
(492, 15, 'English', 48),
(493, 16, 'Environmental', 48),
(494, 19, 'Home Science', 48),
(495, 24, 'Maths', 48),
(496, 25, 'Mechanical', 48),
(497, 28, 'Physics', 48),
(498, 1, 'Applied Mechanics', 49),
(499, 3, 'Automobile', 49),
(500, 5, 'C.A.C.D.D.M.', 49),
(501, 7, 'Chemical', 49),
(502, 9, 'Civil', 49),
(503, 10, 'Commercial Practice', 49),
(504, 14, 'Electrical', 49),
(505, 13, 'Electronics & Communication', 49),
(506, 15, 'English', 49),
(507, 17, 'Fabrication Technology', 49),
(508, 21, 'Information & Technology', 49),
(509, 24, 'Maths', 49),
(510, 25, 'Mechanical', 49),
(511, 28, 'Physics', 49),
(512, 35, 'Textile Manu/ Tech', 49),
(513, 14, 'Electrical', 15),
(514, 25, 'Mechanical', 15),
(515, 44, 'BPharm', 219),
(516, 9, 'Civil', 221),
(517, 1, 'Applied Mechanics', 221),
(518, 11, 'Computer', 221),
(519, 45, 'Electronics', 221),
(520, 14, 'Electrical', 221),
(521, 25, 'Mechanical', 221),
(522, 32, 'Production', 221),
(523, 13, 'Electronics & Communication', 221),
(524, 21, 'Information & Technology', 221),
(525, 25, 'Maths', 221);

-- --------------------------------------------------------

--
-- Table structure for table `tt_org_master`
--

CREATE TABLE `tt_org_master` (
  `org_id` int(11) NOT NULL,
  `org_name` varchar(28) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tt_org_master`
--

INSERT INTO `tt_org_master` (`org_id`, `org_name`) VALUES
(1, 'Institute of National Repute'),
(2, 'State Level University'),
(3, 'DTE Gujarat Institute'),
(4, 'State Level Institute'),
(5, 'Video Conference'),
(6, 'NITTTR'),
(7, 'MOOC'),
(8, 'Other'),
(9, 'ISTE/AICTE'),
(10, 'UGC/MHRD');

-- --------------------------------------------------------

--
-- Table structure for table `tt_upload_data`
--

CREATE TABLE `tt_upload_data` (
  `upload_id` int(11) NOT NULL,
  `map_id` int(11) NOT NULL,
  `a_year` int(11) NOT NULL,
  `term` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tt_upload_table`
--

CREATE TABLE `tt_upload_table` (
  `upload_id` int(255) NOT NULL,
  `course_master_id` int(11) NOT NULL,
  `map_id` int(11) NOT NULL,
  `a_year` varchar(255) NOT NULL,
  `term` varchar(255) NOT NULL,
  `filename` text NOT NULL,
  `status` varchar(255) NOT NULL,
  `branch_name` varchar(255) NOT NULL,
  `course_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tt_upload_table`
--

INSERT INTO `tt_upload_table` (`upload_id`, `course_master_id`, `map_id`, `a_year`, `term`, `filename`, `status`, `branch_name`, `course_type_id`) VALUES
(23, 11, 180, '0', '0', '0', 'NOT UPLOADED', '', 0),
(24, 4, 180, '2017', 'ODD', '180_4_2017-2018_ODD', 'NOT UPLOADED', '', 0),
(25, 4, 180, '2013', 'ODD', '180_4_2013-2014_ODD', 'NOT UPLOADED', '', 0),
(27, 10, 135, '2017', 'ODD', '135_10_2017-2018_ODD', 'UPLOADED', '', 1),
(28, 12, 135, '2014', 'EVEN', '135_12_2014-2015_EVEN', 'UPLOADED', 'Computer', 0),
(29, 12, 135, '2015', 'EVEN', '135_12_2015-2016_EVEN', 'UPLOADED', 'Computer', 0),
(31, 13, 135, '2014', 'EVEN', '135_13_2014-2015_EVEN', 'UPLOADED', 'Computer', 2),
(33, 14, 135, '2010', 'EVEN', '135_14_2010-2011_EVEN', 'UPLOADED', 'Computer', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tt_branch_master`
--
ALTER TABLE `tt_branch_master`
  ADD PRIMARY KEY (`branch_id`);

--
-- Indexes for table `tt_course_master`
--
ALTER TABLE `tt_course_master`
  ADD UNIQUE KEY `course_master_id` (`course_master_id`);

--
-- Indexes for table `tt_course_type`
--
ALTER TABLE `tt_course_type`
  ADD PRIMARY KEY (`course_type_id`);

--
-- Indexes for table `tt_dept_login`
--
ALTER TABLE `tt_dept_login`
  ADD PRIMARY KEY (`dept_login_id`);

--
-- Indexes for table `tt_institute_master`
--
ALTER TABLE `tt_institute_master`
  ADD PRIMARY KEY (`inst_id`);

--
-- Indexes for table `tt_institute_type`
--
ALTER TABLE `tt_institute_type`
  ADD PRIMARY KEY (`inst_type_id`);

--
-- Indexes for table `tt_login`
--
ALTER TABLE `tt_login`
  ADD PRIMARY KEY (`inst_id`);

--
-- Indexes for table `tt_mpg_institute_branch`
--
ALTER TABLE `tt_mpg_institute_branch`
  ADD PRIMARY KEY (`map_id`);

--
-- Indexes for table `tt_org_master`
--
ALTER TABLE `tt_org_master`
  ADD PRIMARY KEY (`org_id`);

--
-- Indexes for table `tt_upload_table`
--
ALTER TABLE `tt_upload_table`
  ADD UNIQUE KEY `upload_id` (`upload_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tt_course_master`
--
ALTER TABLE `tt_course_master`
  MODIFY `course_master_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tt_upload_table`
--
ALTER TABLE `tt_upload_table`
  MODIFY `upload_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
