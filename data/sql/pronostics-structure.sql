-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : db
-- Généré le : jeu. 08 juil. 2021 à 09:31
-- Version du serveur : 5.5.60-0+deb7u1
-- Version de PHP : 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `pronostics`
--
CREATE DATABASE IF NOT EXISTS `pronostics` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `pronostics`;

-- --------------------------------------------------------

--
-- Structure de la table `game`
--

DROP TABLE IF EXISTS `game`;
CREATE TABLE IF NOT EXISTS `game` ( `game_id` int(11) NOT NULL AUTO_INCREMENT, `game_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, `tv` varchar(255) DEFAULT NULL, `game_stadium` varchar(255) DEFAULT NULL, `team_id_1` int(11) DEFAULT NULL, `team_id_2` int(11) DEFAULT NULL, `goal_team_1` int(11) DEFAULT NULL, `goal_team_2` int(11) DEFAULT NULL, PRIMARY KEY (`game_id`), KEY `fk_game_team_1` (`team_id_1`), KEY `fk_game_team_2` (`team_id_2`)) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `pronostic`
--

DROP TABLE IF EXISTS `pronostic`;
CREATE TABLE IF NOT EXISTS `pronostic` ( `pronostic_id` int(11) NOT NULL AUTO_INCREMENT, `game_id` int(11) DEFAULT NULL, `user_id` int(11) DEFAULT NULL, `goal_team_1` int(11) DEFAULT NULL, `goal_team_2` int(11) DEFAULT NULL, PRIMARY KEY (`pronostic_id`), KEY `fk_prono_game` (`game_id`), KEY `fk_prono_user` (`user_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `team`
--

DROP TABLE IF EXISTS `team`;
CREATE TABLE IF NOT EXISTS `team` ( `team_id` int(11) NOT NULL AUTO_INCREMENT, `name` varchar(255) NOT NULL, `groupe` varchar(255) NOT NULL, `nb_game` int(11) DEFAULT NULL, `nb_win` int(11) DEFAULT NULL, `nb_draw` int(11) DEFAULT NULL, `nb_lose` int(11) DEFAULT NULL, `goal_scored` int(11) DEFAULT NULL, `goal_taken` int(11) DEFAULT NULL, `point` int(11) DEFAULT NULL, PRIMARY KEY (`team_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` ( `user_id` int(11) NOT NULL AUTO_INCREMENT, `username` varchar(255) NOT NULL, `password` varchar(255) DEFAULT NULL, `firstname` varchar(255) DEFAULT NULL, `lastname` varchar(255) DEFAULT NULL, PRIMARY KEY (`user_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `game`
--
ALTER TABLE `game` ADD CONSTRAINT `fk_game_team_1` FOREIGN KEY (`team_id_1`) REFERENCES `team` (`team_id`), ADD CONSTRAINT `fk_game_team_2` FOREIGN KEY (`team_id_2`) REFERENCES `team` (`team_id`);

--
-- Contraintes pour la table `pronostic`
--
ALTER TABLE `pronostic` ADD CONSTRAINT `fk_prono_game` FOREIGN KEY (`game_id`) REFERENCES `game` (`game_id`), ADD CONSTRAINT `fk_prono_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
