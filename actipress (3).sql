-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 23 nov. 2022 à 10:24
-- Version du serveur : 10.4.24-MariaDB
-- Version de PHP : 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `actipress`
--

-- --------------------------------------------------------

--
-- Structure de la table `boite`
--

CREATE TABLE `boite` (
  `LOGIN` char(20) NOT NULL,
  `REÇUS` char(32) DEFAULT NULL,
  `EMIS` char(32) DEFAULT NULL,
  `USER_RECEIVED` char(32) DEFAULT NULL,
  `USER_SED` char(32) DEFAULT NULL,
  `ID_BOITE` char(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

CREATE TABLE `contact` (
  `ID_MESS_CONTACT` char(32) NOT NULL,
  `MAIL_EXPE` char(32) DEFAULT NULL,
  `MESSAGE` char(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `contenir`
--

CREATE TABLE `contenir` (
  `ID_MESSAGE` char(32) NOT NULL,
  `ID_BOITE` char(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `infos_perso`
--

CREATE TABLE `infos_perso` (
  `login` char(20) NOT NULL,
  `ID_MESS_CONTACT` char(32) NOT NULL,
  `MDP` char(32) DEFAULT NULL,
  `Nom` char(32) DEFAULT NULL,
  `Prenom` char(32) DEFAULT NULL,
  `id_login` int(32) NOT NULL,
  `TYPE_DE_PROFILS` double DEFAULT NULL,
  `pass_hash` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `infos_perso`
--

INSERT INTO `infos_perso` (`login`, `ID_MESS_CONTACT`, `MDP`, `Nom`, `Prenom`, `id_login`, `TYPE_DE_PROFILS`, `pass_hash`) VALUES
('test', '', 'test', 'test', 'test', 1, 1, '$2y$10$tRlbY3cs/cTCFgBkDAxNDuHXVckyn0P/vGMWdJGLrpqOrMnn9XzDG'),
('remi.pontello', '', 'Unmotdepasselong1', 'pontello', 'remi', 2, 1, '$2y$10$YPr8r4W0AZHTfHuHnLPr0OIUAyo7Y95sjaGUfsvMBrboOFV6Xs2Ia');

-- --------------------------------------------------------

--
-- Structure de la table `messages`
--

CREATE TABLE `messages` (
  `NOM` char(32) DEFAULT NULL,
  `PRÉNOM` char(32) DEFAULT NULL,
  `DATE_MESS` date DEFAULT NULL,
  `HEURE` time(6) DEFAULT NULL,
  `LOCALISATION` char(32) DEFAULT NULL,
  `SUJET` char(32) DEFAULT NULL,
  `TEXTE` char(32) DEFAULT NULL,
  `BOOL_SUPP` tinyint(1) DEFAULT NULL,
  `DATE_SUPP` date DEFAULT NULL,
  `ID_MESSAGE` char(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `boite`
--
ALTER TABLE `boite`
  ADD PRIMARY KEY (`ID_BOITE`),
  ADD UNIQUE KEY `LOGIN` (`LOGIN`);

--
-- Index pour la table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`ID_MESS_CONTACT`);

--
-- Index pour la table `contenir`
--
ALTER TABLE `contenir`
  ADD PRIMARY KEY (`ID_MESSAGE`),
  ADD KEY `ID_BOITE` (`ID_BOITE`);

--
-- Index pour la table `infos_perso`
--
ALTER TABLE `infos_perso`
  ADD PRIMARY KEY (`id_login`),
  ADD KEY `ID_MESS_CONTACT` (`ID_MESS_CONTACT`);

--
-- Index pour la table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`ID_MESSAGE`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `infos_perso`
--
ALTER TABLE `infos_perso`
  MODIFY `id_login` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `boite`
--
ALTER TABLE `boite`
  ADD CONSTRAINT `boite_ibfk_1` FOREIGN KEY (`ID_BOITE`) REFERENCES `contenir` (`ID_BOITE`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `contact_ibfk_1` FOREIGN KEY (`ID_MESS_CONTACT`) REFERENCES `infos_perso` (`ID_MESS_CONTACT`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `contenir`
--
ALTER TABLE `contenir`
  ADD CONSTRAINT `contenir_ibfk_1` FOREIGN KEY (`ID_MESSAGE`) REFERENCES `messages` (`ID_MESSAGE`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
