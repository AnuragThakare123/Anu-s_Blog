-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2024 at 01:41 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `anu`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(11) NOT NULL,
  `name` text NOT NULL,
  `phone_num` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mess` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `phone_num`, `email`, `mess`, `date`) VALUES
(1, 'first post', '123456789', 'firstpost@gmail.com', 'firstpost', '2024-04-26 17:18:21'),
(2, 'Rakesh Thappa', '8899101620', 'beulud@santhoshi.edu.pl', 'hiii', '0000-00-00 00:00:00'),
(3, 'Anurag Thakare ', '7255278289', 'kavi79742@gmail.com', 'Heyy Hii i am Anurag', '2024-04-26 19:56:31'),
(4, 'kavi', '23256790', 'sfesfssfssdsdd@gmail.com', 'gdhfhjfukyu', '2024-04-26 23:22:04'),
(5, 'kavi', '23256790', 'kinganuragthakare@gmail.com', 'gdhfhjfukyu', '2024-04-26 23:36:21'),
(6, 'kavi', '23256790', 'kinganuragthakare@gmail.com', 'gdhfhjfukyu', '2024-04-26 23:36:28'),
(7, 'kavi', '23256790', 'crce.9513.ecs@gmail.com', 'hsfhghh', '2024-04-26 23:40:09'),
(8, 'Scripted_pipeline', '23256790', 'beulud@santhoshi.edu.pl', 'ffdfg', '2024-04-27 14:55:03'),
(9, 'Exp_5_part_1', '34566789', 'happysingh@gmail.com', 'heyy man', '2024-04-27 14:57:11'),
(12, 'Ravish kumar', '9838373829', 'ravish@gmial.com', 'Heyy i  am ravish kumar from NDTV', '2024-04-27 15:01:52'),
(13, 'Ravish kumar', '9838373829', 'ravish@gmial.com', 'Heyy i  am ravish kumar from NDTV', '2024-04-27 16:31:00'),
(14, 'Anurag Thakare ', '8308100361', 'kinganuragthakare@gmail.com', 'sss', '2024-05-06 17:03:13');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `title` text NOT NULL,
  `tagline` text NOT NULL,
  `slug` varchar(25) NOT NULL,
  `content` text NOT NULL,
  `img_file` varchar(50) NOT NULL,
  `date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `tagline`, `slug`, `content`, `img_file`, `date`) VALUES
(1, 'What is NASA?', 'This is my first post', 'first post', 'The National Aeronautics and Space Administration (NASA /ˈnæsə/) is an independent agency of the U.S. federal government responsible for the civil space program, aeronautics research, and space research. Established in 1958, it succeeded the National Advisory Committee for Aeronautics (NACA) to give the U.S. space development effort a distinctly civilian orientation, emphasizing peaceful applications in space science.[4][5][6] It has since led most American space exploration, including Project Mercury, Project Gemini, the 1968–1972 Apollo Moon landing missions, the Skylab space station, and the Space Shuttle. It currently supports the International Space Station and oversees the development of the Orion spacecraft and the Space Launch System for the crewed lunar Artemis program, the Commercial Crew spacecraft, and the planned Lunar Gateway space station.\r\n\r\nNASA\'s science is focused on better understanding Earth through the Earth Observing System;[7] advancing heliophysics through the efforts of the Science Mission Directorate\'s Heliophysics Research Program;[8] exploring bodies throughout the Solar System with advanced robotic spacecraft such as New Horizons and planetary rovers such as Perseverance;[9] and researching astrophysics topics, such as the Big Bang, through the James Webb Space Telescope, the Great Observatories and associated programs.[10] The Launch Services Program oversees launch operations and countdown management for its uncrewed launches.', 'post-bg.jpg', '2024-04-28 12:41:03'),
(2, 'What is Jinja Templating in Flask by Anurag?', 'Unlocking Dynamic Web Content: Exploring Flask\'s Jinja Templating', 'second-post', 'A Jinja template is simply a text file. Jinja can generate any text-based format (HTML, XML, CSV, LaTeX, etc.). A Jinja template doesn’t need to have a specific extension: .html, .xml, or any other extension is just fine.\r\n\r\nA template contains variables and/or expressions, which get replaced with values when a template is rendered; and tags, which control the logic of the template. The template syntax is heavily inspired by Django and Python.\r\n\r\nBelow is a minimal template that illustrates a few basics using the default Jinja configuration. We will cover the details later in this document:', 'flask.png', '2024-05-05 21:35:38'),
(3, '\r\nIndia, Bharat and Pakistan', 'The Constitutional Journey of a Sandwiched Civilisation', 'third-post', 'India, Bharat and Pakistan, the second book of the Bharat Trilogy, takes the discussion forward from its bestselling predecessor, India That Is Bharat. It explores the combined influence of European and Middle Eastern colonialities on Bharat as the successor state to the Indic civilisation, and on the origins of the Indian Constitution. To this end, the book traces the thought continuum of Middle Eastern coloniality, from the rise of Islamic Revivalism in the 1740s following the decline of the Mughal Empire, which presaged the idea of Pakistan, until the end of the Khilafat Movement in 1924, which cemented the road to Pakistan.', 'f.jpg', '2024-04-28 15:07:40'),
(4, 'Palm oil', 'Edible oil\r\n', 'forth-post', 'Palm oil is an edible vegetable oil derived from the mesocarp of the fruit of oil palms. The oil is used in food manufacturing, in beauty products, and as biofuel. Palm oil accounted for about 36% of global oils produced from oil crops in 2014', 'oil.jpg', '2024-04-28 15:07:40'),
(5, 'Ocean sunfish', ' one of the largest bony fish.', 'fifth-post', 'The ocean sunfish or common mola (Mola mola) is one of the largest bony fish in the world. It was misidentified as the heaviest bony fish, which was actually a different and closely-related species of sunfish, Mola alexandrini.[5] Adults typically weigh between 247 and 1,000 kg (545 and 2,205 lb). The species belongs to the Mola genus, one of three in the Molidae family.[6] It is native to tropical and temperate waters around the world. It resembles a fish head without a tail, and its main body is flattened laterally. Sunfish can be as tall as they are long when their dorsal and ventral fins are extended.\r\n\r\nAdult sunfish are vulnerable to few natural predators, but sea lions, killer whales, and sharks will consume them. Sunfish are considered a delicacy in some parts of the world, including Japan, Korea, and Taiwan. In the European Union, regulations ban the sale of fish and fishery products derived from the family Molidae.[7] Sunfish are frequently caught in gillnets.\r\n\r\nThe sunfish is a member of the order Tetraodontiformes, which also includes pufferfish, porcupinefish, and filefish, it shares many traits common to members of this order. It is the type species of the genus', 'sun.jpg', '2024-04-28 15:12:37'),
(6, 'Hyderabad', 'City of Pearls', 'sixth-post', 'This city is also known by some as the \"City of Pearls,\" owing to its historical role as a pearl trading center. Nowadays, most of its wealth comes not from jewelry, but information technology. What makes the city special, however, is its ability to meld together its modern vibe with an ancient atmosphere. One look at the 12th-century Golconda Fort and the towers of Charminar and you\'ll feel the bygone yet palpable grandeur of Hyderabad\'s past. The Salar Jung Museum and Ramoji Film City, meanwhile, feature diverse art collections and film production facilities.', 'hyd.jpeg', '2024-04-28 15:12:37'),
(7, 'anurag ', 'Thakare', 'Anu', '2446789', 'an', '2024-05-06 11:32:07');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
