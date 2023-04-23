-- phpMyAdmin SQL Dump
-- version 3.4.9
-- http://www.phpmyadmin.net
--
-- Client: 127.0.0.1
-- Généré le : Dim 23 Avril 2023 à 11:42
-- Version du serveur: 5.5.20
-- Version de PHP: 5.3.9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `sitegames`
--

-- --------------------------------------------------------

--
-- Structure de la table `chariot`
--

CREATE TABLE IF NOT EXISTS `chariot` (
  `idclient` int(11) NOT NULL,
  `item` varchar(50) NOT NULL,
  `prix` int(11) NOT NULL,
  KEY `idclient` (`idclient`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `idclient` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `phone_number` int(8) NOT NULL,
  `email` varchar(50) NOT NULL,
  `pass` varchar(20) NOT NULL,
  PRIMARY KEY (`idclient`,`nom`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `client`
--

INSERT INTO `client` (`idclient`, `nom`, `phone_number`, `email`, `pass`) VALUES
(1, 'ddsssijevfc', 1425, 'hjhd', 'fdvsq'),
(2, 'Ayoub ben Ahmed', 29489895, 'benahmedayoub222@gmail.com', 'ayoub140523'),
(3, 'ghazi', 27189889, 'ghazi1452@gmail.com', '1425mm');

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE IF NOT EXISTS `produit` (
  `id_produit` int(11) NOT NULL AUTO_INCREMENT,
  `nom_produit` varchar(50) NOT NULL,
  `prix_produit` decimal(10,2) NOT NULL,
  `quantite_produit` int(11) NOT NULL,
  `description_produit` text,
  PRIMARY KEY (`id_produit`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `produit`
--

INSERT INTO `produit` (`id_produit`, `nom_produit`, `prix_produit`, `quantite_produit`, `description_produit`) VALUES
(1, '5$ steam', '20.00', 200, 'steam gift card USD'),
(2, '10$ steam', '38.00', 100, 'steam gift card USD'),
(3, '20$ steam', '75.00', 30, 'steam gift card USD'),
(4, '50$ steam', '175.00', 10, 'steam gift card USD'),
(5, '20 TRY', '6.00', 50, 'gift cart turkich Lira'),
(6, '50 TRY', '14.00', 35, 'gift cart turkich Lira');

-- --------------------------------------------------------

--
-- Structure de la table `purchases`
--

CREATE TABLE IF NOT EXISTS `purchases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idclient` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `product` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idclient` (`idclient`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Contenu de la table `purchases`
--

INSERT INTO `purchases` (`id`, `idclient`, `name`, `email`, `phone`, `address`, `product`, `price`, `created_at`) VALUES
(2, 2, 'Ayoub ben Ahmed', 'benahmedayoub111@gmail.com', '14253678', 'kjllllllllllllllk', 'l,,;,;,;lklk', 0, '2023-03-30 04:58:51'),
(3, 2, 'Ayoub ben Ahmed', 'benahmedayoub111@gmail.com', '14253678', 'kjllllllllllllllk', 'l,,;,;,;lklk', 0, '2023-03-30 05:02:28'),
(5, 1, 'ayoub', 'ayoub@gmail.com', '1245678', 'addre', 'jhh', 0, '2023-04-01 11:10:45'),
(9, 0, ' .Ayoub ben Ahmed . ', ' .benahmedayoub222@gmail.com . ', ' . 29489895 . ', '. jkl:;n, .', ' . jjkljlklk', 0, '2023-04-01 11:55:39'),
(10, 0, ' .Ayoub ben Ahmed . ', ' .benahmedayoub222@gmail.com . ', ' . 29489895 . ', '. jkl:;n, .', ' . jjkljlklk', 0, '2023-04-01 11:55:50'),
(11, 0, ' .Ayoub ben Ahmed . ', ' .benahmedayoub222@gmail.com . ', ' . 29489895 . ', '. jkl:;n, .', ' . jjkljlklk', 0, '2023-04-01 11:57:26'),
(12, 2, ' Ayoub ben Ahmed  ', ' benahmedayoub222@gmail.com  ', '  29489895  ', ' jkl:;n, ', ' jjkljlklk', 0, '2023-04-01 11:58:57'),
(13, 3, ' ghazi  ', ' ghazi1452@gmail.com  ', '  27189889  ', ' jgzhkjlxsqnkmw ', ' ksjldks', 0, '2023-04-01 12:01:05'),
(14, 2, ' Ayoub ben Ahmed  ', ' benahmedayoub222@gmail.com  ', '  29489895  ', ' moknine ', ' jjj', 0, '2023-04-03 16:54:43'),
(15, 2, ' Ayoub ben Ahmed  ', ' benahmedayoub222@gmail.com  ', '  29489895  ', ' moknine ', ' jjj', 0, '2023-04-03 16:57:31'),
(16, 2, ' Ayoub ben Ahmed  ', ' benahmedayoub222@gmail.com  ', '  29489895  ', ' &&&&&&aaa ', ' aaaaaaaaaaaaa', 0, '2023-04-04 05:54:28');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `chariot`
--
ALTER TABLE `chariot`
  ADD CONSTRAINT `chariot_ibfk_1` FOREIGN KEY (`idclient`) REFERENCES `client` (`idclient`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
