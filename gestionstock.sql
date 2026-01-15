-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 12 jan. 2026 à 07:42
-- Version du serveur : 9.1.0
-- Version de PHP : 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestionstock`
--

-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

DROP TABLE IF EXISTS `facture`;
CREATE TABLE IF NOT EXISTS `facture` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_facture` datetime DEFAULT CURRENT_TIMESTAMP,
  `montant_total` decimal(10,2) DEFAULT NULL,
  `id_user` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_facture_user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `facture`
--

INSERT INTO `facture` (`id`, `date_facture`, `montant_total`, `id_user`) VALUES
(1, '2026-01-12 08:34:56', 145.00, 1),
(2, '2026-01-12 08:34:56', 1200.00, 2);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` int NOT NULL DEFAULT '0',
  `prix` decimal(10,2) NOT NULL,
  `id_type` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_produit_type` (`id_type`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id`, `nom`, `stock`, `prix`, `id_type`) VALUES
(1, 'Corsair RM750', 10, 120.00, 1),
(2, 'BeQuiet Pure Power', 5, 85.50, 1),
(3, 'Seasonic Focus', 8, 110.00, 1),
(4, 'Cooler Master Watt', 12, 60.00, 1),
(5, 'Souris Logitech', 50, 25.00, 2),
(6, 'Clavier Mécanique', 20, 80.00, 2),
(7, 'Webcam HD', 15, 45.00, 2),
(8, 'Casque Audio', 30, 55.00, 2),
(9, 'Dell XPS 13', 3, 1400.00, 3),
(10, 'MacBook Air', 5, 1200.00, 3),
(11, 'Lenovo ThinkPad', 10, 950.00, 3),
(12, 'Asus ZenBook', 7, 800.00, 3),
(13, 'Cisco 2960', 2, 300.00, 4),
(14, 'Netgear 8 ports', 20, 30.00, 4),
(15, 'Ubiquiti Switch', 5, 150.00, 4),
(16, 'TP-Link Smart', 10, 45.00, 4),
(17, 'RTX 3060', 4, 350.00, 5),
(18, 'Intel i7', 10, 300.00, 5),
(19, 'RAM 16Go', 50, 70.00, 5),
(20, 'SSD 1To', 40, 90.00, 5),
(21, 'Clavier Mécanique', 20, 80.00, 2),
(22, 'Webcam HD', 15, 45.00, 2),
(23, 'Casque Audio', 30, 55.00, 2),
(24, 'MacBook Air', 5, 1200.00, 3),
(25, 'Lenovo ThinkPad', 10, 950.00, 3),
(26, 'Asus ZenBook', 7, 800.00, 3);

-- --------------------------------------------------------

--
-- Structure de la table `typeproduit`
--

DROP TABLE IF EXISTS `typeproduit`;
CREATE TABLE IF NOT EXISTS `typeproduit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `typeproduit`
--

INSERT INTO `typeproduit` (`id`, `libelle`) VALUES
(1, 'Alimentation'),
(2, 'Périphérique'),
(3, 'Matériel portable'),
(4, 'Switch'),
(5, 'Composant');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `nom`, `email`, `password`) VALUES
(1, 'Alice Dupont', 'alice@test.com', 'pass123'),
(2, 'Bob Martin', 'bob@test.com', 'pass123'),
(3, 'Charlie Durand', 'charlie@test.com', 'pass123'),
(4, 'David Lacan', 'david@test.com', 'pass123'),
(5, 'Eve Peron', 'eve@test.com', 'pass123');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `facture`
--
ALTER TABLE `facture`
  ADD CONSTRAINT `fk_facture_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `fk_produit_type` FOREIGN KEY (`id_type`) REFERENCES `typeproduit` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
