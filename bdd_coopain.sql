-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 05 avr. 2023 à 08:11
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
-- Base de données : `bdd_coopain`
--

-- --------------------------------------------------------

--
-- Structure de la table `adherent`
--

CREATE TABLE `adherent` (
  `ID_ADHERENT` char(32) NOT NULL,
  `NOM` char(32) DEFAULT NULL,
  `PRENOM` char(32) DEFAULT NULL,
  `ADRESSE` char(32) DEFAULT NULL,
  `CP` char(32) DEFAULT NULL,
  `VILLE` char(32) DEFAULT NULL,
  `PORTABLE` char(32) DEFAULT NULL,
  `EMAIL` char(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `appartient`
--

CREATE TABLE `appartient` (
  `ID_ADHERENT` char(32) NOT NULL,
  `ID_SECTEUR` char(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `appartient_à`
--

CREATE TABLE `appartient_à` (
  `CODE_RACE` char(32) NOT NULL,
  `IDNATIONALTAUREAU` char(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `collecte`
--

CREATE TABLE `collecte` (
  `DATE_COLLECTE` char(32) NOT NULL,
  `IDNATIONALTAUREAU` char(32) NOT NULL,
  `COMPTERENDU` char(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `demande`
--

CREATE TABLE `demande` (
  `ID_DEMANDE` char(32) NOT NULL,
  `IDNATIONALTAUREAU` char(32) NOT NULL,
  `NUMERO` char(32) DEFAULT NULL,
  `ID_ADHERENT` char(32) NOT NULL,
  `ID_TYPEPA` char(32) NOT NULL,
  `IDNATIONALVACHE` char(32) NOT NULL,
  `ID_INSEMINATEUR` char(32) NOT NULL,
  `DATEDEMANDE` char(32) DEFAULT NULL,
  `DATEIMPLANTATION` char(32) DEFAULT NULL,
  `HEURE` char(32) DEFAULT NULL,
  `TEMPERATURE` char(32) DEFAULT NULL,
  `COMPTERENDU` char(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `inseminateur`
--

CREATE TABLE `inseminateur` (
  `ID_INSEMINATEUR` char(32) NOT NULL,
  `ID_SECTEUR` char(32) NOT NULL,
  `IMMATRICULATION` char(32) NOT NULL,
  `NUMEROLICENCE` char(32) DEFAULT NULL,
  `NOM` char(32) DEFAULT NULL,
  `PRENOM` char(32) DEFAULT NULL,
  `PORTABLE` char(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `lot`
--

CREATE TABLE `lot` (
  `NUMERO` char(32) NOT NULL,
  `DATE_COLLECTE` char(32) NOT NULL,
  `ID_TYPEPA` char(32) NOT NULL,
  `NOMBREPAILLETTES` char(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `race`
--

CREATE TABLE `race` (
  `CODE_RACE` char(32) NOT NULL,
  `NOM` char(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `secteur`
--

CREATE TABLE `secteur` (
  `ID_SECTEUR` char(32) NOT NULL,
  `NOM` char(32) DEFAULT NULL,
  `DESCRIPTION` char(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `tarif`
--

CREATE TABLE `tarif` (
  `IDNATIONALTAUREAU` char(32) NOT NULL,
  `ID_TYPEPA` char(32) NOT NULL,
  `ID_TYPEPA_SE_REFERE_A` char(32) NOT NULL,
  `IDNATIONALTAUREAU_PROVIENT_DE` char(32) NOT NULL,
  `PRIXPAILLETTE` char(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `taureau`
--

CREATE TABLE `taureau` (
  `IDNATIONALTAUREAU` char(32) NOT NULL,
  `NOM` char(32) DEFAULT NULL,
  `NUMEROIE` char(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `typepaillette`
--

CREATE TABLE `typepaillette` (
  `ID_TYPEPA` char(32) NOT NULL,
  `LIBELLE` char(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `vache`
--

CREATE TABLE `vache` (
  `IDNATIONALVACHE` char(32) NOT NULL,
  `NOM` char(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `vehicule`
--

CREATE TABLE `vehicule` (
  `IMMATRICULATION` char(32) NOT NULL,
  `MARQUE` char(32) DEFAULT NULL,
  `MODELE` char(32) DEFAULT NULL,
  `DATEACHAT` char(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `adherent`
--
ALTER TABLE `adherent`
  ADD PRIMARY KEY (`ID_ADHERENT`);

--
-- Index pour la table `appartient`
--
ALTER TABLE `appartient`
  ADD PRIMARY KEY (`ID_ADHERENT`,`ID_SECTEUR`),
  ADD KEY `I_FK_APPARTIENT_ADHERENT` (`ID_ADHERENT`),
  ADD KEY `I_FK_APPARTIENT_SECTEUR` (`ID_SECTEUR`);

--
-- Index pour la table `appartient_à`
--
ALTER TABLE `appartient_à`
  ADD PRIMARY KEY (`CODE_RACE`,`IDNATIONALTAUREAU`),
  ADD KEY `I_FK_APPARTIENT_À_RACE` (`CODE_RACE`),
  ADD KEY `I_FK_APPARTIENT_À_TAUREAU` (`IDNATIONALTAUREAU`);

--
-- Index pour la table `collecte`
--
ALTER TABLE `collecte`
  ADD PRIMARY KEY (`DATE_COLLECTE`),
  ADD KEY `I_FK_COLLECTE_TAUREAU` (`IDNATIONALTAUREAU`);

--
-- Index pour la table `demande`
--
ALTER TABLE `demande`
  ADD PRIMARY KEY (`ID_DEMANDE`),
  ADD KEY `I_FK_DEMANDE_TAUREAU` (`IDNATIONALTAUREAU`),
  ADD KEY `I_FK_DEMANDE_LOT` (`NUMERO`),
  ADD KEY `I_FK_DEMANDE_ADHERENT` (`ID_ADHERENT`),
  ADD KEY `I_FK_DEMANDE_TYPEPAILLETTE` (`ID_TYPEPA`),
  ADD KEY `I_FK_DEMANDE_VACHE` (`IDNATIONALVACHE`),
  ADD KEY `I_FK_DEMANDE_INSEMINATEUR` (`ID_INSEMINATEUR`);

--
-- Index pour la table `inseminateur`
--
ALTER TABLE `inseminateur`
  ADD PRIMARY KEY (`ID_INSEMINATEUR`),
  ADD KEY `I_FK_INSEMINATEUR_SECTEUR` (`ID_SECTEUR`),
  ADD KEY `I_FK_INSEMINATEUR_VEHICULE` (`IMMATRICULATION`);

--
-- Index pour la table `lot`
--
ALTER TABLE `lot`
  ADD PRIMARY KEY (`NUMERO`),
  ADD KEY `I_FK_LOT_COLLECTE` (`DATE_COLLECTE`),
  ADD KEY `I_FK_LOT_TYPEPAILLETTE` (`ID_TYPEPA`);

--
-- Index pour la table `race`
--
ALTER TABLE `race`
  ADD PRIMARY KEY (`CODE_RACE`);

--
-- Index pour la table `secteur`
--
ALTER TABLE `secteur`
  ADD PRIMARY KEY (`ID_SECTEUR`);

--
-- Index pour la table `tarif`
--
ALTER TABLE `tarif`
  ADD PRIMARY KEY (`IDNATIONALTAUREAU`,`ID_TYPEPA`),
  ADD KEY `I_FK_TARIF_TYPEPAILLETTE` (`ID_TYPEPA_SE_REFERE_A`),
  ADD KEY `I_FK_TARIF_TAUREAU` (`IDNATIONALTAUREAU_PROVIENT_DE`);

--
-- Index pour la table `taureau`
--
ALTER TABLE `taureau`
  ADD PRIMARY KEY (`IDNATIONALTAUREAU`);

--
-- Index pour la table `typepaillette`
--
ALTER TABLE `typepaillette`
  ADD PRIMARY KEY (`ID_TYPEPA`);

--
-- Index pour la table `vache`
--
ALTER TABLE `vache`
  ADD PRIMARY KEY (`IDNATIONALVACHE`);

--
-- Index pour la table `vehicule`
--
ALTER TABLE `vehicule`
  ADD PRIMARY KEY (`IMMATRICULATION`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
