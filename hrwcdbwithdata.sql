-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 17, 2013 at 08:36 PM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `hrwc`
--

-- --------------------------------------------------------

--
-- Table structure for table `loginusers`
--
-- Creation: Apr 21, 2013 at 07:24 PM
-- Last update: Apr 30, 2013 at 05:08 PM
--

CREATE TABLE IF NOT EXISTS `loginusers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(128) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `loginusers`
--

INSERT INTO `loginusers` (`id`, `username`, `password`) VALUES
(1, 'Kyle', 'Kyle');

-- --------------------------------------------------------

--
-- Table structure for table `ownerinfo`
--
-- Creation: Apr 21, 2013 at 07:24 PM
-- Last update: Apr 21, 2013 at 07:24 PM
--

CREATE TABLE IF NOT EXISTS `ownerinfo` (
  `site_id` char(5) DEFAULT NULL,
  `owner_lastname` varchar(128) DEFAULT NULL,
  `owner_firstname` varchar(128) DEFAULT NULL,
  `secowner_lastname` varchar(128) DEFAULT NULL,
  `secowner_firstname` varchar(128) DEFAULT NULL,
  `owner_address` varchar(128) DEFAULT NULL,
  `owner_city` varchar(128) DEFAULT NULL,
  `owner_state` varchar(128) DEFAULT NULL,
  `owner_zip` char(5) DEFAULT NULL,
  `owner_email` varchar(128) DEFAULT NULL,
  `owner_phone` varchar(12) DEFAULT NULL,
  `prefer_contact` char(10) DEFAULT NULL,
  `owner_notes` varchar(128) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `quesansmap`
--
-- Creation: Apr 21, 2013 at 07:24 PM
-- Last update: May 17, 2013 at 06:20 PM
--

CREATE TABLE IF NOT EXISTS `quesansmap` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `options_desc` varchar(128) DEFAULT NULL,
  `integrity_score` smallint(6) DEFAULT NULL,
  `disturbance_score` smallint(6) DEFAULT NULL,
  `question_id` char(5) DEFAULT NULL,
  `input_type` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `option_id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=222 ;

--
-- Dumping data for table `quesansmap`
--

INSERT INTO `quesansmap` (`id`, `options_desc`, `integrity_score`, `disturbance_score`, `question_id`, `input_type`) VALUES
(2, 'Flat', 0, 0, '1', 'cb'),
(3, 'Gently rolling', 0, 0, '1', 'cb'),
(4, 'Hilly, occasionally steep', 0, 0, '1', 'cb'),
(5, 'Hilly, occasionally steep', 0, 0, '1', 'cb'),
(6, 'Glacial lake plain', 0, 0, '1', 'cb'),
(7, 'Glacial outwash plain', 0, 0, '1', 'cb'),
(8, 'Glacial till or moraine', 0, 0, '1', 'cb'),
(9, 'Kettle, kame, or esker', 0, 0, '1', 'cb'),
(10, 'Large boulders (glacial erratics)', 0, 0, '1', 'cb'),
(11, 'Other (describe)', 0, 0, '1', 'cb'),
(12, 'Description', 0, 0, '1', 'tb'),
(13, 'Bulldozed clearings', 0, 0, '2', 'cb'),
(14, 'Construction', 0, 0, '2', 'cb'),
(15, 'Commercial buildings', 0, 0, '2', 'cb'),
(16, 'Residential buildings', 0, 0, '2', 'cb'),
(17, 'Agricultural field (plowed)', 0, 0, '2', 'cb'),
(18, 'Paved roads', 0, 0, '2', 'cb'),
(19, 'Railroads', 0, 0, '2', 'cb'),
(20, 'Dirt Roads (graveled)', 0, 0, '2', 'cb'),
(21, 'ATV or off-road vehicle trails', 0, 0, '2', 'cb'),
(22, 'Dirt roads (unimproved, two tracks)', 0, 0, '2', 'cb'),
(23, 'Agricultural field (grazed)', 0, 0, '2', 'cb'),
(24, 'Abandoned agricultural field', 0, 0, '2', 'cb'),
(25, 'Abandoned tree farm, orchard', 0, 0, '2', 'cb'),
(26, 'Fences', 0, 0, '2', 'cb'),
(27, 'Abandoned homestead', 0, 0, '2', 'cb'),
(28, 'Rock piles', 0, 0, '2', 'cb'),
(29, 'Logging or tree removal', 0, 0, '2', 'cb'),
(30, 'Dumping, trash piles', 0, 0, '2', 'cb'),
(31, 'Footpaths', 0, 0, '2', 'cb'),
(32, 'Other', 0, 0, '2', 'cb'),
(33, 'Extensive (>50% of site)', 0, 0, '3', 'cb'),
(34, 'Partial (25-50% of site)', 0, 0, '3', 'cb'),
(35, 'Moderate (10-25% of site)', 0, 0, '3', 'cb'),
(36, 'Mild (<10% of site)', 0, 0, '3', 'cb'),
(37, 'Uncertain', 0, 0, '3', 'cb'),
(38, 'None apparent', 0, 0, '3', 'cb'),
(39, 'Gravel or debris pile', 0, 0, '4', 'cb'),
(40, 'Erosion (gullies, washouts)', 0, 0, '4', 'cb'),
(41, 'Bare areas with no vegetation', 0, 0, '4', 'cb'),
(42, 'Compaction or ruts', 0, 0, '4', 'cb'),
(43, 'Other (describe)', 0, 0, '4', 'cb'),
(44, 'Primarily at roadsides and trail edges (exterior)', 0, 0, '5', 'cb'),
(45, 'Pervasive throughout site (interior vs exterior)', 0, 0, '5', 'cb'),
(46, 'Isolated pockets within a single community', 0, 0, '5', 'cb'),
(47, 'Large monotypic stands in one community', 0, 0, '5', 'cb'),
(48, 'Large monotypic stands in two or more communities', 0, 0, '5', 'cb'),
(49, 'Other (describe)', 0, 0, '5', 'cb'),
(50, 'Antler rubs', 0, 0, '6', 'cb'),
(51, 'Bird nests', 0, 0, '6', 'cb'),
(52, 'Carcasses or bones', 0, 0, '6', 'cb'),
(53, 'Deer', 0, 0, '6', 'cb'),
(54, 'Deer tracks, deer browse', 0, 0, '6', 'cb'),
(55, 'Droppings or scat', 0, 0, '6', 'cb'),
(56, 'Fish other aquatic vertebrates', 0, 0, '6', 'cb'),
(57, 'Frogs, toads', 0, 0, '6', 'cb'),
(58, 'Ground-nesting birds (grouse, turkeys, etc.)', 0, 0, '6', 'cb'),
(59, 'Migratory waterfowl', 0, 0, '6', 'cb'),
(60, 'Raptors, raptor nests', 0, 0, '6', 'cb'),
(61, 'Small mammals (squirrels, mice, rabbits,raccoons, etc.)', 0, 0, '6', 'cb'),
(62, 'Small mammal burrows, tracks', 0, 0, '6', 'cb'),
(63, 'Songbirds', 0, 0, '6', 'cb'),
(64, 'Salamanders', 0, 0, '6', 'cb'),
(65, 'Turtles', 0, 0, '6', 'cb'),
(66, 'Other (describe)', 0, 0, '6', 'cb'),
(67, 'Addtional Notes', 0, 0, '7', 'tb'),
(68, 'At margin of river, stream, lake, or pond', 0, 0, '8', 'cb'),
(69, 'Kettle lake or pond', 0, 0, '8', 'cb'),
(70, 'Standing water', 0, 0, '8', 'cb'),
(71, 'In ravine or deppression', 0, 0, '8', 'cb'),
(72, 'Appears occasionally flooded (vernal pond, floodplain forests)', 0, 0, '8', 'cb'),
(73, 'At base of hill or slope', 0, 0, '8', 'cb'),
(74, 'Groundwater seepage area', 0, 0, '8', 'cb'),
(75, 'Source of water  not apparent', 0, 0, '8', 'cb'),
(76, 'Bare muddy ground', 0, 0, '8', 'cb'),
(77, 'Tree trunks buttressed/stained', 0, 0, '8', 'cb'),
(78, 'Tree roots bare or spreading', 0, 0, '8', 'cb'),
(79, 'Other (describe):', 0, 0, '8', 'cb'),
(80, 'Sandy', 0, 0, '9', 'cb'),
(81, 'Heavy, slippery, loam-clay', 0, 0, '9', 'cb'),
(82, 'Mixed with pebble or gravel', 0, 0, '9', 'cb'),
(83, 'Glacial erratics (large rocks)', 0, 0, '9', 'cb'),
(84, 'Light tan or brown', 0, 0, '9', 'cb'),
(85, 'Dark brown', 0, 0, '9', 'cb'),
(86, 'Mucky', 0, 0, '9', 'cb'),
(87, 'Peaty', 0, 0, '9', 'cb'),
(88, 'Top 6"-12" layered or banded', 0, 0, '9', 'cb'),
(89, 'Top 6"-12" appear uniform', 0, 0, '9', 'cb'),
(90, 'Other ', 0, 0, '9', 'cb'),
(91, 'Vegetation clumped in distinct areas or patches', 0, 0, '10', 'cb'),
(92, 'Vegtation has no distinct zones', 0, 0, '10', 'cb'),
(93, 'Open-water area (no plants)', 0, 0, '10', 'cb'),
(94, 'Emergent marsh area (plants rooted under water; some leaves above surface)', 0, 0, '10', 'cb'),
(95, 'Wet meadow or marsh area (dominated by grass-like plants)', 0, 0, '10', 'cb'),
(96, 'Forb area (broad-leafed plants)', 0, 0, '10', 'cb'),
(97, 'Fen area (grass-like and broad-leafed plants; peat/sphagnum moss)', 0, 0, '10', 'cb'),
(98, 'Bog area (sphagnum moss, low broad-leafed evergreen shrubs)', 0, 0, '10', 'cb'),
(99, 'Dense tall shrub area', 0, 0, '10', 'cb'),
(100, 'Forest (swamp, floodplain) area', 0, 0, '10', 'cb'),
(101, 'Other (describe)', 0, 0, '10', 'cb'),
(102, 'Buttonbush', 0, 0, '11', 'cb'),
(103, 'Pickerelweed', 0, 0, '11', 'cb'),
(104, 'Water-willow', 0, 0, '11', 'cb'),
(105, 'Bluejoint gass', 0, 0, '12', 'cb'),
(106, 'Bulrushes', 0, 0, '12', 'cb'),
(107, 'Cottongrass', 0, 0, '12', 'cb'),
(108, 'Tussock sedge', 0, 0, '12', 'cb'),
(109, 'Sedges, uncertain or other', 0, 0, '12', 'cb'),
(110, 'Uncertain', 0, 0, '12', 'cb'),
(111, 'Ferns (cinnamon or royal)', 0, 0, '13', 'cb'),
(112, 'Gentians', 0, 0, '13', 'cb'),
(113, 'Joe-pye weed', 0, 0, '13', 'cb'),
(114, 'Lobelias (EXCEPT Indian tobacco)', 0, 0, '13', 'cb'),
(115, 'Marsh marigold', 0, 0, '13', 'cb'),
(116, 'Orchids', 0, 0, '13', 'cb'),
(117, 'Skullcaps', 0, 0, '13', 'cb'),
(118, 'Skunk cabbage', 0, 0, '13', 'cb'),
(119, 'Blueberries', 0, 0, '14', 'cb'),
(120, 'Buttonbush', 0, 0, '14', 'cb'),
(121, 'Cinquefoil, shrubby', 0, 0, '14', 'cb'),
(122, 'Dogwoods, shrubby (gray, red-osier, silky)', 0, 0, '14', 'cb'),
(123, 'Leatherleaf', 0, 0, '14', 'cb'),
(124, 'Michigan holly', 0, 0, '14', 'cb'),
(125, 'Ninebark', 0, 0, '14', 'cb'),
(126, 'Poison sumac', 0, 0, '14', 'cb'),
(127, 'Willows (shrubby)', 0, 0, '14', 'cb'),
(128, 'Ashes', 0, 0, '15', 'cb'),
(129, 'Birch (yellow)', 0, 0, '15', 'cb'),
(130, 'Cedar, northern white', 0, 0, '15', 'cb'),
(131, 'Larch (tamarack)', 0, 0, '15', 'cb'),
(132, 'Maple (red, silver, other)', 0, 0, '15', 'cb'),
(133, 'Oaks ', 0, 0, '15', 'cb'),
(134, 'Spruce, black', 0, 0, '15', 'cb'),
(135, 'Sycamore', 0, 0, '15', 'cb'),
(136, 'Cottongrass', 0, 0, '16', 'cb'),
(137, 'Leatherleaf', 0, 0, '16', 'cb'),
(138, 'Pitcher plants', 0, 0, '16', 'cb'),
(139, 'Sphagnum moss', 0, 0, '16', 'cb'),
(140, 'Sundews', 0, 0, '16', 'cb'),
(141, 'Black alder', 0, 0, '17', 'cb'),
(142, 'Buckthorns (glossy or common)', 0, 0, '17', 'cb'),
(143, 'Cat-tails (dense, extensive)', 0, 0, '17', 'cb'),
(144, 'Phragmites (common reed)', 0, 0, '17', 'cb'),
(145, 'Purple loosestrife', 0, 0, '17', 'cb'),
(146, 'Reed canary-grass', 0, 0, '17', 'cb'),
(147, 'Total Species ', 0, 0, '18', 'tb'),
(148, 'None (0%)', 0, 0, '69', 'cb'),
(149, 'A little (1-10%)', 0, 0, '69', 'cb'),
(150, 'Common (10-25%)', 0, 0, '69', 'cb'),
(151, 'Abundant (25-50%)', 0, 0, '69', 'cb'),
(152, 'Dominant (>50%)', 0, 0, '69', 'cb'),
(153, 'None (0%)', 0, 0, '70', 'cb'),
(154, 'A little (1-10%)', 0, 0, '70', 'cb'),
(155, 'Common (10-25%)', 0, 0, '70', 'cb'),
(156, 'Abundant (25-50%)', 0, 0, '70', 'cb'),
(157, 'Dominant (>50%)', 0, 0, '70', 'cb'),
(158, 'None (0%)', 0, 0, '71', 'cb'),
(159, 'A little (1-10%)', 0, 0, '71', 'cb'),
(160, 'Common (10-25%)', 0, 0, '71', 'cb'),
(161, 'Abundant (25-50%)', 0, 0, '71', 'cb'),
(162, 'Dominant (>50%)', 0, 0, '71', 'cb'),
(163, 'None (0%)', 0, 0, '72', 'cb'),
(164, 'A little (1-10%)', 0, 0, '72', 'cb'),
(165, 'Common (10-25%)', 0, 0, '72', 'cb'),
(166, 'Abundant (25-50%)', 0, 0, '72', 'cb'),
(167, 'Dominant (>50%)', 0, 0, '72', 'cb'),
(168, 'None (0%)', 0, 0, '73', 'cb'),
(169, 'A little (1-10%)', 0, 0, '73', 'cb'),
(170, 'Common (10-25%)', 0, 0, '73', 'cb'),
(171, 'Abundant (25-50%)', 0, 0, '73', 'cb'),
(172, 'Dominant (>50%)', 0, 0, '73', 'cb'),
(173, 'None (0%)', 0, 0, '74', 'cb'),
(174, 'A little (1-10%)', 0, 0, '74', 'cb'),
(175, 'Common (10-25%)', 0, 0, '74', 'cb'),
(176, 'Abundant (25-50%)', 0, 0, '74', 'cb'),
(177, 'Dominant (>50%)', 0, 0, '74', 'cb'),
(178, 'None (0%)', 0, 0, '75', 'cb'),
(179, 'A little (1-10%)', 0, 0, '75', 'cb'),
(180, 'Common (10-25%)', 0, 0, '75', 'cb'),
(181, 'Abundant (25-50%)', 0, 0, '75', 'cb'),
(182, 'Dominant (>50%)', 0, 0, '75', 'cb'),
(183, 'Primarily along trails and wetland edges (exterior)', 0, 0, '20', 'cb'),
(184, 'Within wetland interior', 0, 0, '20', 'cb'),
(185, 'Occur in isolated pockets', 0, 0, '20', 'cb'),
(186, 'Occur in large monotypic stands', 0, 0, '20', 'cb'),
(187, 'Pervasive throughout wetland (interior and exterior)', 0, 0, '20', 'cb'),
(188, 'Other (describe)', 0, 0, '20', 'cb'),
(189, 'Bulldozed clearings', 0, 0, '21', 'cb'),
(190, 'Ditches, channels, or tiling ', 0, 0, '21', 'cb'),
(191, 'Drainpipes', 0, 0, '21', 'cb'),
(192, 'Berms, dams to divert water', 0, 0, '21', 'cb'),
(193, 'Erosion (gullies, washouts)', 0, 0, '21', 'cb'),
(194, 'Erosion control fencing', 0, 0, '21', 'cb'),
(195, 'Gravel or rubble fill or piles', 0, 0, '21', 'cb'),
(196, 'Dirt roads (graveled or unimproved two tracks)', 0, 0, '21', 'cb'),
(197, 'ATV or off-road vehicle trails', 0, 0, '21', 'cb'),
(198, 'Fences', 0, 0, '21', 'cb'),
(199, 'Agricultural use (describe):', 0, 0, '21', 'cb'),
(200, 'Rock piles', 0, 0, '21', 'cb'),
(201, 'Evidence of plowing', 0, 0, '21', 'cb'),
(202, 'Wheel ruts, compacted areas', 0, 0, '21', 'cb'),
(203, 'Trampled or rutted areas', 0, 0, '21', 'cb'),
(204, 'Footpaths', 0, 0, '21', 'cb'),
(205, 'Other', 0, 0, '21', 'cb'),
(206, 'Extensive (>50% of area)', 0, 0, '22', 'cb'),
(207, 'Partial (25-50% of area)', 0, 0, '22', 'cb'),
(208, 'Moderate (10-25% of area)', 0, 0, '22', 'cb'),
(209, 'Mild (<10% of area)', 0, 0, '22', 'cb'),
(210, 'Uncertain', 0, 0, '22', 'cb'),
(211, 'None apparent', 0, 0, '22', 'cb'),
(212, 'Notes', 0, 0, '23', 'tb'),
(217, 'Description', 0, 0, '8', 'tb'),
(213, 'Description', 0, 0, '2', 'tb'),
(214, 'Description', 0, 0, '4', 'tb'),
(215, 'Description', 0, 0, '5', 'tb'),
(216, 'Description', 0, 0, '6', 'tb'),
(218, 'Description', 0, 0, '9', 'tb'),
(219, 'Description', 0, 0, '10', 'tb'),
(220, 'Description', 0, 0, '20', 'tb'),
(221, 'Description', 0, 0, '21', 'tb');

-- --------------------------------------------------------

--
-- Table structure for table `siteanswers`
--
-- Creation: Apr 21, 2013 at 07:24 PM
-- Last update: Apr 30, 2013 at 05:36 PM
--

CREATE TABLE IF NOT EXISTS `siteanswers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` char(5) DEFAULT NULL,
  `siteworksheet_id` char(8) DEFAULT NULL,
  `options_id` char(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=165 ;

--
-- Dumping data for table `siteanswers`
--

INSERT INTO `siteanswers` (`id`, `site_id`, `siteworksheet_id`, `options_id`) VALUES
(19, '10', '16', '81'),
(20, '10', '16', '82'),
(18, '10', '16', '80'),
(17, '10', '16', '71'),
(16, '10', '16', '70'),
(15, '10', '16', '69'),
(14, '10', '16', '68'),
(21, '10', '16', '97'),
(22, '10', '16', '98'),
(23, '10', '16', '103'),
(24, '10', '16', '114'),
(25, '10', '16', '115'),
(26, '10', '16', '119'),
(27, '10', '16', '134'),
(32, '', '18', '2'),
(29, '10', '16', '84'),
(30, '10', '16', '85'),
(31, '10', '16', '86'),
(33, '', '18', '3'),
(34, '', '18', '4'),
(35, '', '18', '5'),
(36, '', '18', '13'),
(37, '', '18', '14'),
(38, '', '18', '15'),
(39, '', '18', '35'),
(40, '', '18', '37'),
(41, '', '18', '40'),
(42, '', '18', '41'),
(43, '', '18', '45'),
(44, '', '18', '46'),
(45, '', '18', '53'),
(46, '', '18', '54'),
(47, '', '18', '55'),
(48, '12', '19', '2'),
(49, '12', '19', '4'),
(50, '12', '19', '5'),
(51, '12', '19', '7'),
(52, '12', '19', '8'),
(53, '12', '19', '20'),
(54, '12', '19', '21'),
(55, '12', '19', '22'),
(56, '12', '19', '23'),
(57, '12', '19', '24'),
(58, '12', '19', '25'),
(59, '12', '19', '34'),
(60, '12', '19', '35'),
(61, '12', '19', '36'),
(62, '12', '19', '41'),
(63, '12', '19', '42'),
(64, '12', '19', '54'),
(65, '12', '19', '56'),
(66, '12', '19', '58'),
(67, '12', '19', '59'),
(68, '12', '19', '60'),
(69, '12', '19', '61'),
(70, '12', '20', '71'),
(71, '12', '20', '72'),
(72, '12', '20', '75'),
(73, '12', '20', '76'),
(74, '12', '20', '77'),
(75, '12', '20', '83'),
(76, '12', '20', '84'),
(77, '12', '20', '85'),
(78, '12', '20', '86'),
(79, '12', '20', '94'),
(80, '12', '20', '95'),
(81, '12', '20', '96'),
(82, '12', '20', '103'),
(83, '12', '20', '104'),
(84, '12', '20', '108'),
(85, '12', '20', '110'),
(86, '12', '20', '115'),
(87, '12', '20', '116'),
(88, '12', '20', '122'),
(89, '12', '20', '123'),
(90, '12', '20', '130'),
(91, '12', '20', '131'),
(92, '12', '20', '132'),
(93, '12', '20', '142'),
(94, '12', '20', '143'),
(95, '12', '20', '144'),
(96, '12', '20', '149'),
(97, '12', '20', '150'),
(98, '12', '20', '151'),
(99, '12', '20', '160'),
(100, '12', '20', '161'),
(101, '12', '20', '165'),
(102, '12', '20', '166'),
(103, '12', '20', '170'),
(104, '12', '20', '171'),
(105, '12', '20', '176'),
(106, '12', '20', '195'),
(107, '12', '20', '196'),
(108, '12', '20', '197'),
(109, '12', '20', '198'),
(110, '12', '20', '200'),
(111, '12', '20', '207'),
(112, '12', '20', '208'),
(113, '12', '20', '209'),
(114, '14', '22', '166'),
(115, '14', '22', '170'),
(116, '14', '22', '175'),
(117, '16', '23', '76'),
(118, '16', '23', '77'),
(119, '16', '23', '84'),
(120, '16', '23', '105'),
(121, '16', '23', '106'),
(122, '16', '23', '128'),
(123, '17', '24', '72'),
(124, '17', '24', '75'),
(125, '17', '24', '87'),
(126, '17', '24', '141'),
(127, '17', '24', '142'),
(128, '17', '24', '143'),
(129, '18', '25', '71'),
(130, '18', '25', '72'),
(131, '19', '26', '72'),
(132, '19', '26', '74'),
(133, '19', '26', '75'),
(134, '19', '26', '117'),
(135, '19', '26', '118'),
(136, '19', '26', '133'),
(137, '19', '26', '140'),
(138, '21', '27', '73'),
(139, '21', '27', '76'),
(140, '21', '27', '77'),
(141, '21', '27', '78'),
(142, '21', '27', '105'),
(143, '21', '27', '106'),
(144, '21', '27', '123'),
(145, '21', '27', '126'),
(146, '21', '27', '127'),
(147, '22', '28', '75'),
(148, '22', '28', '76'),
(149, '22', '28', '86'),
(150, '22', '28', '98'),
(151, '22', '28', '103'),
(152, '22', '28', '126'),
(153, '22', '28', '150'),
(154, '22', '28', '153'),
(155, '22', '28', '161'),
(156, '22', '28', '172'),
(157, '22', '28', '176'),
(158, '22', '28', '180'),
(159, '22', '28', '185'),
(160, '22', '28', '197'),
(161, '22', '28', '198'),
(162, '22', '28', '208'),
(163, '22', '29', '179'),
(164, '22', '29', '180');

-- --------------------------------------------------------

--
-- Table structure for table `siteinfo`
--
-- Creation: Apr 21, 2013 at 07:24 PM
-- Last update: Apr 30, 2013 at 05:10 PM
--

CREATE TABLE IF NOT EXISTS `siteinfo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_name` varchar(128) DEFAULT NULL,
  `parcel_no` varchar(18) DEFAULT NULL,
  `acreage` smallint(6) DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL,
  `city` varchar(128) DEFAULT NULL,
  `state` varchar(128) DEFAULT NULL,
  `zip` char(6) DEFAULT NULL,
  `protection_status` varchar(128) DEFAULT NULL,
  `follow_up` varchar(128) DEFAULT NULL,
  `permission` tinyint(4) DEFAULT NULL,
  `preserve_interest` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `siteinfo`
--

INSERT INTO `siteinfo` (`id`, `site_name`, `parcel_no`, `acreage`, `address`, `city`, `state`, `zip`, `protection_status`, `follow_up`, `permission`, `preserve_interest`) VALUES
(1, 'test', '12344', 23, '1813 ', 'ann arbor', 'st', '48105', NULL, NULL, NULL, NULL),
(2, 'Google ', '2345', 34, '203 South State Street', 'Ann Arbor', 'st', '47306', NULL, NULL, NULL, NULL),
(6, 'Bingo', '234567', 23, '1835 Wollowtree Lane', 'Ann Arbor', 'st', '48105', NULL, NULL, NULL, NULL),
(4, 'Township Details', '12345678', 35, '305 South State Street', 'Ann Arbor', 'st', '48109', NULL, NULL, NULL, NULL),
(7, 'Webster213Field', 'C-03-02-400-002', 23, '1813 Willowtree Lane', 'Ann Arbor', 'Michigan', '48105', NULL, NULL, NULL, NULL),
(8, 'Webster211umich', 'C-03-01-321-432', 34, '304 South University', 'Ann Arbor', 'Michigan', '48193', NULL, NULL, NULL, NULL),
(9, 'Webster211umich1', 'C-03-01-321-433', 23, '1813 Willowtree lane', 'Ann Arbor', 'Michigan', '48105', NULL, NULL, NULL, NULL),
(10, 'Flint233Mark', 'C-03-01-321-434', 34, '234 STsate', 'sdhfejhb', 'Mi', '48108', NULL, NULL, NULL, NULL),
(11, 'Webster220Clark', 'C-03-26-200-009', 34, '302 Huron Parkway', 'Ann Arbor', 'Michigan', '48907', NULL, NULL, NULL, NULL),
(12, 'Webster223Berner', 'C-03-01-321-423', 45, '1813 Willowtree Lane', 'Ann Arbor', 'Michigan', '48105', NULL, NULL, NULL, NULL),
(13, 'kughkiuh', 'ugkugiug', 0, 'iugiugi', 'giug', 'iugiug', 'iugig', NULL, NULL, NULL, NULL),
(14, 'po9u0u', 'ijoiuoi', 0, 'oiuoiu', 'lihlijh', 'oijioh', 'oihhoi', NULL, NULL, NULL, NULL),
(15, 'kjlij', 'ljhlhh', 0, 'lkhlh', 'lkhlkh', 'lkhlkh', 'lkhlh', NULL, NULL, NULL, NULL),
(16, ',khlkj', 'ljlkj', 0, 'lkjlkj', 'lkjlkj', 'lkjlkj', 'lkjlkj', NULL, NULL, NULL, NULL),
(17, '111', '111', 111, '111', '111', '11', '111111', NULL, NULL, NULL, NULL),
(18, 'kkkkhihoihohohoh00', 'ihuohuoh', 0, 'ooio', 'oiuoiu', 'oiuoiu', 'oiuoiu', NULL, NULL, NULL, NULL),
(19, '543Webster90', '12-3-00-1', 30, '123 Sesame St', 'RED', 'MI', '45208', NULL, NULL, NULL, NULL),
(20, '', 'dfsgfdf', 0, 'sddfsf', '', '', '', NULL, NULL, NULL, NULL),
(21, '890West90', '10-300-22-1', 45, '123 Sesame St', 'RED', 'MI', '45208', NULL, NULL, NULL, NULL),
(22, '161South90', '100-33-000-01', 10, '100 7th St.', 'Ann Arbor', 'MI', '48108', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `siteworksheets`
--
-- Creation: Apr 21, 2013 at 07:24 PM
-- Last update: Apr 30, 2013 at 05:36 PM
--

CREATE TABLE IF NOT EXISTS `siteworksheets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `community_name` varchar(15) NOT NULL,
  `site_id` char(5) DEFAULT NULL,
  `worksheettype_id` char(2) DEFAULT NULL,
  `score` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=30 ;

--
-- Dumping data for table `siteworksheets`
--

INSERT INTO `siteworksheets` (`id`, `community_name`, `site_id`, `worksheettype_id`, `score`) VALUES
(1, 'wetland A', '6', '2', 23),
(2, 'grassland B', '6', '3', 45),
(4, 'Forests A', '6', '4', NULL),
(5, 'Creeks A', '6', '5', NULL),
(6, 'Site Summary', '6', '6', NULL),
(7, 'Wetland B', '6', '2', NULL),
(8, 'Wetland A', '7', '2', NULL),
(9, 'Wetland A', '8', '2', NULL),
(10, 'Forest B', '8', '4', NULL),
(11, 'Wetland C', '8', '2', NULL),
(12, 'Creeks D', '8', '5', NULL),
(13, 'Wetland A', '9', '2', NULL),
(14, 'Grasslands B', '9', '3', NULL),
(15, 'Forests A', '9', '4', NULL),
(16, 'Wetlands A', '10', '2', NULL),
(17, 'Wetland A', '11', '2', NULL),
(18, 'Site Overview', '11', '1', NULL),
(19, 'Site Overview A', '12', '1', NULL),
(20, 'Wetland A', '12', '2', NULL),
(21, 'wetlandsA', '13', '2', NULL),
(22, '88', '14', '2', NULL),
(23, 'wetlandsV', '16', '2', NULL),
(24, 'Wetlands B', '17', '2', NULL),
(25, 'wetlandsa', '18', '2', NULL),
(26, 'wetlandsA', '19', '2', NULL),
(27, 'WetlandsA', '21', '2', NULL),
(28, 'WetlandsA', '22', '2', NULL),
(29, 'Wetlands B', '22', '2', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `worksheetquesmap`
--
-- Creation: Apr 21, 2013 at 07:24 PM
-- Last update: May 17, 2013 at 06:35 PM
--

CREATE TABLE IF NOT EXISTS `worksheetquesmap` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question_desc` text,
  `worksheettype_id` char(1) DEFAULT NULL,
  `question_order` char(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=76 ;

--
-- Dumping data for table `worksheetquesmap`
--

INSERT INTO `worksheetquesmap` (`id`, `question_desc`, `worksheettype_id`, `question_order`) VALUES
(1, 'Characterize the landscape and landforms in the site (Check all that apply)', '1', NULL),
(2, 'Characterize human-caused disturbances that you observe on the site as a whole(listed in order of potential severity/intensity). Check all that apply.', '1', NULL),
(3, 'Characterize the extent of the human disturbance(s): ', '1', NULL),
(4, 'Effect of previous or current land uses on soil (listed by severity). Check all that apply. ', '1', NULL),
(5, 'Invasive species overall. After traversing the site, characterize that overall pattern(s) of species invasions. Check all that apply. ', '1', NULL),
(6, 'Wildlife Habitat: Small natural areas may provide important wildlife habitat in an increasingly urbanized environment. Check off any of the following wildlife signs or sightings for the entire site. ', '1', NULL),
(7, 'Additional Notes on wildlife (including stories or other anecdotal evidence from land-owner)', '1', NULL),
(8, 'Hydrological Conditions: Wetlands are areas that have standing water periodically, for at least some part of the year, where plants with particular adaptations typically grow, and organic (muck or peat) soils may develop. Characterize the area where thus wetland occurs. Check all that apply. ', '2', '001'),
(9, 'Appearance of soil. If there is bare soil in the area from a tree tip-up, animal digging, or human activities, characterize the soil. Check all that apply. ', '2', '002'),
(10, 'Vegetation Structure. Observe the features and patterns of the vegetation. ', '2', '003'),
(11, 'Native emergent and floating-leaved plants', '2', '005'),
(12, 'Native grasses and grass-like plants (sedges, rushes)', '2', '006'),
(13, 'Native forbs', '2', '007'),
(14, 'Native shrubs', '2', '008'),
(15, 'Native trees', '2', '009'),
(16, 'Native plants of bogs and fens', '2', '010'),
(17, 'Invasive species (grass-like plants, forbs, shrubs, trees)', '2', '011'),
(18, 'Estimate the total number of species of all types (even if you can''t identify them)', '2', '012'),
(19, 'Vegetation cover. Estimate the area covered by each by each type of plants.(Vegetation types may overlap, so total cover can be greater than 100%)', '2', '013'),
(20, 'Invasive species distribution within wetland area. Check all that apply. ', '2', '021'),
(21, 'Human disturbances to wetland area. If possible, walk around the perimeter of the wetland of the wetland to look for possible draining or ditching. Check all that apply.', '2', '022'),
(22, 'Characterize the extent of the disturbance(s) to this wetland area: ', '2', '024'),
(23, 'Additional Notes', '2', '025'),
(24, 'Appearance of Soil. If there is bare soil in the area from a tree tip-up, animal digging, or human activities, characterize the soil. Check all that apply. ', '3', NULL),
(25, 'Vegetation Structure: Tree and Shrub Canopy', '3', NULL),
(26, 'Vegetation Structure: Tree Size Distribution. Estimate the area covered by each of following size classes of trees. ', '3', NULL),
(27, 'Native grasses ', '3', NULL),
(28, 'Non-native grasses (green early & late in season)', '3', NULL),
(29, 'Native forbs', '3', NULL),
(30, 'Invasive forbs (native and non-native old-field weeds)', '3', NULL),
(31, 'Native shrubs (typically grow in clumps of woody stems)', '3', NULL),
(32, 'Native trees. Check off all sizes in which you observe for each species. ', '3', NULL),
(33, 'Non-native shrubs and trees', '3', NULL),
(34, 'Estimate the total number of species of all types (even if you can''t identify them)', '3', NULL),
(35, 'Vegetation Cover. Estimate the area covered by each type of plant. (Types may overlap so total may be > 100%)', '3', NULL),
(36, 'Invasive species distribution within grassland/shrubland area', '3', NULL),
(37, 'Evidence of plowing (arranged by increasing likelihood of plowing). Check all that apply. ', '3', NULL),
(38, 'Human disturbances in grassland/shrubland area. ', '3', NULL),
(39, 'Characterize the extent and effects of human disturbance(s) in grassland and/shrubland area. ', '3', NULL),
(40, 'Additional Notes', '3', NULL),
(41, 'General forest structure and appearance. Check all that apply.', '4', NULL),
(42, 'Appearance of Soil. If there is bare soil in the area from a tree tip-up, animal digging, or human activities, characterize the soil. Check all that apply. ', '4', NULL),
(43, 'Vegetation Structure. Tree Sizes. Estimate and circle the overall canopy area covered by each size class of trees. ', '4', NULL),
(44, 'Vegetation Types: Tree Species. Check off all sizes in which each species appears. ', '4', NULL),
(45, 'Native shrubs and woody vines', '4', NULL),
(46, 'Native herbaceous ground cover and spring flora', '4', NULL),
(47, 'Invasive Species (small trees, shrubs, woody vines and ground cover)', '4', NULL),
(48, 'Estimate the total number of species of all types (even if you can''t identify them)', '4', NULL),
(49, 'Vegetation Cover. Estimate the area covered by each type of plant. (Vegetation types may overlap, so total cover can be greater than 100%)', '4', NULL),
(50, 'Invasive species distribution within forested area', '4', NULL),
(51, 'Human disturbances in this forested area. Check all that apply. ', '4', NULL),
(52, 'Characterize the extent of human disturbance(s) in this forested area ', '4', NULL),
(53, 'Additional notes', '4', NULL),
(54, 'Width of the creek. Check the average width of waterway as it flows through the site.', '5', NULL),
(55, 'Stream structure and stream banks. Characterize the appearance of any stream or river channels. Check all that apply. ', '5', NULL),
(56, 'Aquatic Habitats', '5', NULL),
(57, 'Water appearance and quality, standing or running water. Check all that apply.', '5', NULL),
(58, 'Water Odor', '5', NULL),
(59, 'Human disturbances adjacent to or affecting the waterway. If possible, walk around the perimeter of the waterway (or at least along one side of it) to look for possible drains, ditches, and other disturbances. Check all that apply.', '5', NULL),
(60, 'Characterize the extent of the human disturbance(s) in floodplains and waterways.', '5', NULL),
(61, 'Additional Notes:', '5', NULL),
(62, 'Notes on any Species of plant or animal that you believe to be rare, threatened, or endangered. ', '6', NULL),
(63, 'Notes on property owner''s comments or intentions (e.g. "owner interested in conservation options"; "owner wants advice of controlling invasives")', '6', NULL),
(64, 'Notes on diversity and habitat type of any of the ecosystems you assesses (e.g. "Wetland B is a very diverse wooded swamp")', '6', NULL),
(65, 'Notes on disturbances you found in any of the ecosystems.', '6', NULL),
(66, 'Notes on invasives you found in any of the ecosystems (e.g. "reed canary grass pervasive but there is also a great diversity of native species")', '6', NULL),
(67, 'Notes of ecological quality of any of the ecosystems: (e.g. maturity of forest, hydrological characteristics of wetland)', '6', NULL),
(68, 'Other Comments', '6', NULL),
(69, 'Native Emergent Plants', '2', '014'),
(70, 'Native Grasses, Grass-like Plants', '2', '015'),
(71, 'Native Forbs', '2', '016'),
(72, 'Native Shrubs', '2', '017'),
(73, 'Native Trees', '2', '018'),
(74, 'Native Bog/Fens Plants', '2', '019'),
(75, 'Invasive Species', '2', '020');

-- --------------------------------------------------------

--
-- Table structure for table `worksheettypes`
--
-- Creation: Apr 21, 2013 at 07:24 PM
-- Last update: Apr 21, 2013 at 07:43 PM
--

CREATE TABLE IF NOT EXISTS `worksheettypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `worksheet_name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `worksheettypes`
--

INSERT INTO `worksheettypes` (`id`, `worksheet_name`) VALUES
(1, 'Site Overview'),
(2, 'Wetlands'),
(3, 'Grassland'),
(4, 'Forests'),
(5, 'Creeks/Waterways'),
(6, 'Site Summary');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
