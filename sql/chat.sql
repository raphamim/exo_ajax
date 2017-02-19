-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Dim 19 Février 2017 à 15:39
-- Version du serveur :  10.1.13-MariaDB
-- Version de PHP :  5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `chat`
--

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `author` varchar(45) DEFAULT NULL,
  `content` text NOT NULL,
  `date_mess` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `message`
--

INSERT INTO `message` (`id`, `author`, `content`, `date_mess`) VALUES
(157, 'userTest', 'hey !', '2017-02-18 11:05:17'),
(158, 'userTest', 'Salut !', '2017-02-18 11:05:22'),
(159, 'userTest', 'Ã§a va ?', '2017-02-18 11:05:28'),
(160, 'userTest', 'bah grave Ã§a marche enfin ! ', '2017-02-18 11:05:38'),
(161, 'userTest', 'et toi??', '2017-02-18 11:05:50'),
(162, 'userTest', 'plutÃ´t bien !', '2017-02-18 11:06:05'),
(163, 'userTest', 't''ai-je dÃ©jÃ  dit que tu Ã©tais un fdp?', '2017-02-18 11:06:21'),
(164, 'userTest', 'hey', '2017-02-18 11:08:01'),
(165, 'userTest', 'hey', '2017-02-18 11:10:19'),
(166, 'userTest', 'hey', '2017-02-18 11:12:43'),
(167, 'userTest', 'hey', '2017-02-18 11:13:45'),
(168, 'userTest', 'yo', '2017-02-18 11:13:51'),
(169, 'userTest', 'hey', '2017-02-18 11:14:16'),
(170, 'userTest', 'yoooo', '2017-02-18 11:14:20'),
(171, 'userTest', 'hey', '2017-02-18 11:16:00'),
(172, 'userTest', 'yooo', '2017-02-18 11:17:36'),
(173, 'userTest', 'wesh', '2017-02-18 11:18:33'),
(174, 'userTest', 'heeey', '2017-02-18 11:19:58'),
(175, 'userTest', 'plz', '2017-02-18 11:20:13'),
(176, 'userTest', 'WHAT', '2017-02-18 11:21:34'),
(177, 'userTest', 'effaces', '2017-02-18 11:22:13'),
(178, 'userTest', 'hey', '2017-02-18 11:24:08'),
(179, 'userTest', 'Ã§a va ?', '2017-02-18 11:24:12'),
(180, 'userTest', 'lol', '2017-02-18 11:29:11'),
(181, NULL, 'hey', '2017-02-18 12:09:19'),
(182, NULL, 'hey', '2017-02-18 12:13:22'),
(183, NULL, 'i''m john', '2017-02-18 12:16:25'),
(184, NULL, 'hey', '2017-02-18 12:26:37'),
(185, NULL, 'yo', '2017-02-18 12:28:39'),
(186, 'anonymous', 'hey', '2017-02-18 12:31:06'),
(187, 'anonymous', 'yooo', '2017-02-18 12:33:10'),
(188, NULL, 'salut !', '2017-02-18 12:38:38'),
(189, NULL, 'yoooo', '2017-02-18 12:40:52'),
(190, 'john', 'john', '2017-02-18 12:49:09'),
(191, ' heyyy', ' heyyy', '2017-02-18 12:49:13'),
(192, 'john', 'john', '2017-02-18 12:50:30'),
(193, 'salut', 'salut', '2017-02-18 12:50:36'),
(194, 'test', 'test', '2017-02-18 12:51:02'),
(195, 'euuh', 'euuh', '2017-02-18 12:51:06'),
(196, NULL, 'hey', '2017-02-18 12:52:09'),
(197, NULL, 'yo', '2017-02-18 12:58:30'),
(198, NULL, 'dsdq', '2017-02-18 12:59:12'),
(199, NULL, 'hey', '2017-02-18 13:03:10'),
(200, NULL, 'lol', '2017-02-18 13:04:24'),
(201, NULL, 'hey', '2017-02-18 13:05:16'),
(202, 'mike', 'hey', '2017-02-18 19:30:46'),
(203, 'mike', 'yo', '2017-02-18 19:31:00'),
(204, 'fck', 'hey', '2017-02-18 19:35:05'),
(205, 'john', 'hey mike', '2017-02-18 19:35:10'),
(206, 'john', 'hey', '2017-02-18 19:55:38'),
(207, 'mike', 'hey john !', '2017-02-18 19:59:54'),
(208, 'john', 'yo', '2017-02-18 20:00:28'),
(209, 'anonymous', 'hey', '2017-02-18 20:05:20'),
(210, 'john', 'yo', '2017-02-18 20:05:56'),
(211, 'john', 'heeeey', '2017-02-18 20:09:28'),
(212, 'john', 'yo', '2017-02-18 20:45:52'),
(213, 'lol', 'hey', '2017-02-18 20:50:01'),
(214, 'caro', 'j''suis cheum', '2017-02-18 21:15:54'),
(215, 'hey', 'hey', '2017-02-18 21:42:22'),
(216, 'yo', 'hey', '2017-02-18 21:42:37'),
(217, 'bitch', 'ola ola', '2017-02-18 21:43:04'),
(218, '&lt;script&gt;alert(''ok'');&lt;/script&gt;', 'hey', '2017-02-18 21:47:11'),
(219, 'hey', 'yo', '2017-02-18 21:51:54'),
(220, 'test', 'test pdo', '2017-02-18 21:52:13'),
(221, 'test', 'retest', '2017-02-18 21:54:21'),
(222, 'hey', 'test', '2017-02-19 14:20:05'),
(223, 'hey', 'hey', '2017-02-19 14:20:18'),
(224, 'test', 'test', '2017-02-19 14:25:53'),
(225, 'test', 'test', '2017-02-19 14:25:57'),
(226, 'test', 'hey', '2017-02-19 14:26:52'),
(227, 'test', 'test', '2017-02-19 14:26:55'),
(228, 'test', 'hey', '2017-02-19 14:36:00'),
(229, 'test', 'yo', '2017-02-19 14:53:19'),
(230, 'test', 'hey', '2017-02-19 14:54:21'),
(231, 'test', 'typing', '2017-02-19 14:56:09'),
(232, 'test', 'sqd', '2017-02-19 14:56:26'),
(233, 'test', 'hey', '2017-02-19 14:56:53'),
(234, 'test', '??', '2017-02-19 14:58:21'),
(235, 'test', '??', '2017-02-19 14:58:28'),
(236, 'test', 'sa', '2017-02-19 15:06:47'),
(237, 'test', 's', '2017-02-19 15:10:54'),
(238, 'test', 't', '2017-02-19 15:11:18'),
(239, 'test', 'salut Ã§a va ?', '2017-02-19 15:22:23');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
