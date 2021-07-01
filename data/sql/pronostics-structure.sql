-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Hôte : 192.168.1.38:3306
-- Généré le : mar. 29 juin 2021 à 16:47
-- Version du serveur :  5.7.34
-- Version de PHP : 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `pronostics`
--

-- --------------------------------------------------------

--
-- Structure de la table `game`
--

CREATE TABLE `game` (
  `game_id` int(11) NOT NULL,
  `game_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tv` varchar(255) DEFAULT NULL,
  `game_stadium` varchar(255) DEFAULT NULL,
  `team_id_1` int(11) DEFAULT NULL,
  `team_id_2` int(11) DEFAULT NULL,
  `goal_team_1` int(11) DEFAULT NULL,
  `goal_team_2` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `pronostic`
--

CREATE TABLE `pronostic` (
  `pronostic_id` int(11) NOT NULL,
  `game_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `goal_team_1` int(11) DEFAULT NULL,
  `goal_team_2` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `team`
--

CREATE TABLE `team` (
  `team_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `groupe` varchar(255) NOT NULL,
  `nb_game` int(11) DEFAULT NULL,
  `nb_win` int(11) DEFAULT NULL,
  `nb_draw` int(11) DEFAULT NULL,
  `nb_lose` int(11) DEFAULT NULL,
  `goal_scored` int(11) DEFAULT NULL,
  `goal_taken` int(11) DEFAULT NULL,
  `point` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`game_id`),
  ADD KEY `fk_game_team_1` (`team_id_1`),
  ADD KEY `fk_game_team_2` (`team_id_2`);

--
-- Index pour la table `pronostic`
--
ALTER TABLE `pronostic`
  ADD PRIMARY KEY (`pronostic_id`),
  ADD KEY `fk_prono_game` (`game_id`),
  ADD KEY `fk_prono_user` (`user_id`);

--
-- Index pour la table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`team_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `game`
--
ALTER TABLE `game`
  MODIFY `game_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `pronostic`
--
ALTER TABLE `pronostic`
  MODIFY `pronostic_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `team`
--
ALTER TABLE `team`
  MODIFY `team_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `game`
--
ALTER TABLE `game`
  ADD CONSTRAINT `fk_game_team_1` FOREIGN KEY (`team_id_1`) REFERENCES `team` (`team_id`),
  ADD CONSTRAINT `fk_game_team_2` FOREIGN KEY (`team_id_2`) REFERENCES `team` (`team_id`);

--
-- Contraintes pour la table `pronostic`
--
ALTER TABLE `pronostic`
  ADD CONSTRAINT `fk_prono_game` FOREIGN KEY (`game_id`) REFERENCES `game` (`game_id`),
  ADD CONSTRAINT `fk_prono_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
