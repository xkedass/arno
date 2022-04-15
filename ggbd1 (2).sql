-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 14 avr. 2022 à 09:17
-- Version du serveur : 10.4.22-MariaDB
-- Version de PHP : 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ggbd1`
--

DELIMITER $$
--
-- Procédures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `delai_moyen` ()  BEGIN

SELECT AVG(DATEDIFF(facture_date, commande_date)) as moyenne FROM facture, commande WHERE commande.id_commande = facture.id_commande;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delai_moyens` ()  BEGIN
SELECT AVG(DATEDIFF(facture_date, commande_date)) as moyenne FROM facture, commande WHERE commande.id_commande = facture.id_commande;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `affecte`
--

CREATE TABLE `affecte` (
  `id_commande` int(11) NOT NULL,
  `stock_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `appartient`
--

CREATE TABLE `appartient` (
  `produit_id` int(11) NOT NULL,
  `categorie_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `categorie_id` int(11) NOT NULL,
  `categorie_nom` varchar(50) NOT NULL,
  `categorie_id_1` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`categorie_id`, `categorie_nom`, `categorie_id_1`) VALUES
(1, 'fleur', 1),
(2, 'interieur', 1),
(3, 'exterieur', 1),
(4, 'arbuste', 4),
(5, 'frutier', 4),
(6, 'ornemental', 4),
(7, 'Produits entretien', 7),
(8, 'automatise', 7),
(9, 'a main', 7),
(10, 'engrais', 7);

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id_client` varchar(50) NOT NULL,
  `client_nom` varchar(50) NOT NULL,
  `client_prenom` varchar(50) NOT NULL,
  `client_sexe` varchar(1) NOT NULL,
  `client_adresse` varchar(50) NOT NULL,
  `client_ville` varchar(50) NOT NULL,
  `client_telephone` varchar(50) NOT NULL,
  `newsletter` tinyint(1) DEFAULT NULL,
  `client_codp` int(11) NOT NULL,
  `client_categorie` varchar(50) NOT NULL,
  `adresse_liv_client` varchar(50) NOT NULL,
  `id_commercial` int(11) NOT NULL,
  `coefficiant` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id_client`, `client_nom`, `client_prenom`, `client_sexe`, `client_adresse`, `client_ville`, `client_telephone`, `newsletter`, `client_codp`, `client_categorie`, `adresse_liv_client`, `id_commercial`, `coefficiant`) VALUES
('1', 'Hammett', 'Bonner', 'f', 'Ap #276-1431 Elementum, Avenue', 'Donetsk', '1-885-359-8284', 1, 253116, '1', '2115 Neque Av.', 1, 1),
('10', 'Teagan', 'Villarreal', 'm', 'Ap #434-4500 Cubilia Street', 'Enkhuizen', '114-9281', 0, 26563, '2', 'Ap #469-4811 Et, St.', 3, 1),
('11', 'Thaddeus', 'Davidson', 'm', '253-7347 Auctor St.', 'Bronnoysund', '1-663-203-0764', 1, 665991, '1', '352-4626 Magna Avenue', 3, 2),
('12', 'Jakeem', 'Carver', 'm', 'Ap #973-6624 Proin St.', 'Bollnas', '1-428-946-8323', 1, 6599, '2', 'Ap #308-320 Ipsum. Rd.', 3, 2),
('13', 'Alexis', 'Henderson', 'm', 'Ap #917-8432 Ad Rd.', 'Mora', '681-2424', 0, 11066, '1', '475-2529 Elementum St.', 4, 2),
('14', 'Brody', 'Daniels', 'f', '592-2338 Ornare, Street', 'Dole', '263-8455', 1, 6373, '1', 'Ap #866-1833 Tempor Ave', 4, 2),
('15', 'Sybil', 'Ford', 'f', 'P.O. Box 976, 5480 Integer Ave', 'Forges', '1-321-414-3141', 1, 1482, '1', 'Ap #307-250 Donec Avenue', 4, 2),
('16', 'Ryder', 'Sawyer', 'm', 'Ap #131-1267 Aliquam Avenue', 'Aguas Lindas de Goias', '367-3523', 0, 83544, '2', '273-5325 Etiam Avenue', 4, 2),
('17', 'Mason', 'Black', 'f', '715-9572 Nam Road', 'Bucaramanga', '1-733-363-5680', 1, 8113, '1', 'P.O. Box 185, 2464 Sed Ave', 5, 2),
('18', 'Roary', 'Rivers', 'f', 'Ap #781-5391 Consequat Road', 'Davao City', '1-597-325-0622', 0, 87477, '2', '9344 Bibendum Rd.', 5, 2),
('19', 'Penelope', 'Bentley', 'f', '581-7279 Suscipit, Street', 'Yangsan', '1-538-824-3533', 1, 4140, '1', '846-3027 Quis, Street', 5, 2),
('2', 'Victor', 'Chan', 'm', 'Ap #602-6232 Tristique Ave', 'Jonkoping', '773-2236', 1, 51317, '2', '948-5312 Hendrerit Avenue', 1, 1),
('20', 'Vivian', 'Gallegos', 'f', '570-3087 Integer St.', 'Dangjin', '1-761-975-7179', 0, 386743, '2', 'Ap #751-6221 Mollis Avenue', 5, 2),
('3', 'Molly', 'Blair', 'f', 'Ap #906-564 Nullam Street', 'Soderhamn', '610-4355', 1, 0, '1', '935-3215 Taciti St.', 1, 1),
('4', 'Timon', 'Calhoun', 'm', 'P.O. Box 357, 231 Tincidunt Avenue', 'Girona', '1-888-641-9863', 0, 43, '2', '2301 Nulla Rd.', 1, 1),
('5', 'Karina', 'Mcneil', 'f', 'P.O. Box 101, 7174 Mauris Street', 'Bydgoszcz', '1-367-873-4163', 1, 9501, '1', 'P.O. Box 261, 8097 Nulla St.', 2, 1),
('6', 'Benedict', 'Sharp', 'm', 'Ap #249-8047 Convallis Road', 'Tonala', '584-8762', 1, 92905, '2', '989-2683 Ac Rd.', 2, 1),
('7', 'Vera', 'Stafford', 'f', '516-9256 Ipsum Street', 'Piedecuesta', '703-7718', 0, 222501, '1', '678-5773 Ligula Rd.', 2, 1),
('8', 'Zachery', 'Mendez', 'm', 'Ap #949-2427 Adipiscing Street', 'Tanglin', '1-866-871-4429', 0, 37509, '2', '8031 Mauris. Ave', 2, 1),
('9', 'Wesley', 'Peters', 'm', 'Ap #799-2991 Nec, Road', 'San Diego', '133-0517', 1, 7365, '1', '711-4900 Proin Ave', 3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `id_commande` int(11) NOT NULL,
  `commande_date` date NOT NULL,
  `total_HT` decimal(10,2) NOT NULL,
  `total_TTC` decimal(15,2) NOT NULL,
  `commande_status` varchar(50) NOT NULL,
  `id_client` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id_commande`, `commande_date`, `total_HT`, `total_TTC`, `commande_status`, `id_client`) VALUES
(1, '2022-07-05', '0.00', '0.00', 'livrées', '5'),
(2, '2022-01-12', '0.00', '0.00', 'en cours', '6'),
(3, '2022-11-10', '100.00', '120.00', 'en cours', '15'),
(4, '2022-12-02', '690.00', '828.00', 'en cours', '16'),
(5, '2021-05-09', '216.00', '259.20', 'en cours', '10'),
(6, '2022-10-29', '153.00', '183.60', 'en cours', '4'),
(7, '2021-05-09', '0.00', '0.00', 'en cours', '9'),
(8, '2022-08-18', '523.00', '627.60', 'en cours', '13'),
(9, '2022-12-02', '380.00', '456.00', 'en cours', '19'),
(10, '2022-10-11', '418.00', '501.60', 'livrées', '3'),
(11, '2022-06-10', '0.00', '0.00', 'livrées', '12'),
(12, '2021-03-03', '192.00', '230.40', 'livrées', '7'),
(13, '2022-05-05', '189.00', '226.80', 'livrées', '2'),
(14, '2021-03-03', '42.00', '50.40', 'livrées', '1'),
(15, '2022-04-07', '0.00', '0.00', 'livrées', '14'),
(16, '2022-06-01', '187.00', '224.40', 'livrées', '10'),
(17, '2022-02-02', '0.00', '0.00', 'livrées', '7'),
(18, '2022-11-09', '162.00', '194.40', 'livrées', '5'),
(19, '2022-05-04', '0.00', '0.00', 'livrées', '18'),
(20, '2022-06-12', '0.00', '0.00', 'livrées', '13'),
(21, '2021-10-04', '0.00', '0.00', 'livrées', '2'),
(22, '2023-07-03', '0.00', '0.00', 'expediée', '19'),
(23, '2021-11-05', '249.00', '298.80', 'expediée', '1'),
(24, '2022-04-07', '120.00', '144.00', 'expediée', '10'),
(25, '2022-10-11', '222.00', '266.40', 'livrées', '16'),
(26, '2022-08-15', '0.00', '0.00', 'annulée', '14'),
(27, '2023-05-02', '0.00', '0.00', 'annulée', '6'),
(28, '2021-12-08', '334.00', '400.80', 'annulée', '11'),
(29, '2021-10-11', '75.00', '90.00', 'annulée', '9'),
(30, '2022-01-30', '0.00', '0.00', 'annulée', '8'),
(31, '0000-00-00', '0.00', '0.00', 'annulée', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `commande_ligne`
--

CREATE TABLE `commande_ligne` (
  `produit_id` int(11) NOT NULL,
  `id_commande` int(11) NOT NULL,
  `qte` int(11) NOT NULL,
  `total_ht` decimal(15,2) DEFAULT NULL,
  `total_ttc` decimal(15,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `commande_ligne`
--

INSERT INTO `commande_ligne` (`produit_id`, `id_commande`, `qte`, `total_ht`, `total_ttc`) VALUES
(2, 8, 23, '46.00', '55.20'),
(2, 18, 9, '18.00', '21.60'),
(2, 23, 7, '14.00', '16.80'),
(4, 18, 17, '102.00', '122.40'),
(4, 25, 13, '78.00', '93.60'),
(5, 4, 20, '360.00', '432.00'),
(5, 25, 8, '144.00', '172.80'),
(6, 18, 14, '42.00', '50.40'),
(6, 31, 5, '15.00', '18.00'),
(7, 23, 10, '90.00', '108.00'),
(8, 8, 27, '216.00', '259.20'),
(13, 5, 18, '216.00', '259.20'),
(14, 29, 23, '69.00', '82.80'),
(15, 8, 3, '51.00', '61.20'),
(17, 28, 23, '253.00', '303.60'),
(18, 8, 14, '210.00', '252.00'),
(19, 10, 22, '418.00', '501.60'),
(20, 9, 19, '380.00', '456.00'),
(21, 6, 18, '126.00', '151.20'),
(23, 3, 11, '55.00', '66.00'),
(23, 23, 29, '145.00', '174.00'),
(24, 6, 27, '27.00', '32.40'),
(24, 29, 6, '6.00', '7.20'),
(25, 12, 24, '192.00', '230.40'),
(25, 24, 15, '120.00', '144.00'),
(26, 4, 30, '330.00', '396.00'),
(26, 16, 17, '187.00', '224.40'),
(27, 3, 15, '45.00', '54.00'),
(28, 13, 21, '189.00', '226.80'),
(28, 28, 9, '81.00', '97.20'),
(30, 14, 14, '42.00', '50.40');

-- --------------------------------------------------------

--
-- Structure de la table `commercial`
--

CREATE TABLE `commercial` (
  `id_commercial` int(11) NOT NULL,
  `commercial_nom` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `commercial`
--

INSERT INTO `commercial` (`id_commercial`, `commercial_nom`) VALUES
(1, 'Magee Cox'),
(2, 'Chaney Banks'),
(3, 'Halla Anthony'),
(4, 'Carolyn Chang'),
(5, 'Rashad Bright');

-- --------------------------------------------------------

--
-- Structure de la table `contient`
--

CREATE TABLE `contient` (
  `produit_id` int(11) NOT NULL,
  `id_commande` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `existe`
--

CREATE TABLE `existe` (
  `produit_id` int(11) NOT NULL,
  `stock_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

CREATE TABLE `facture` (
  `facture_id` int(11) NOT NULL,
  `facture_date` date NOT NULL,
  `adresse_fact` varchar(50) NOT NULL,
  `reduction` int(11) NOT NULL,
  `statut_solde` varchar(50) NOT NULL,
  `id_client` varchar(50) NOT NULL,
  `id_commande` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `facture`
--

INSERT INTO `facture` (`facture_id`, `facture_date`, `adresse_fact`, `reduction`, `statut_solde`, `id_client`, `id_commande`) VALUES
(1, '2022-07-10', 'Ap #434-4500 Cubilia Street', 0, '', '5', 1),
(2, '2022-06-12', '592-2338 Ornare, Street', 0, '', '6', 2),
(3, '2022-11-15', '', 0, '', '15', 3),
(4, '2022-12-04', '', 0, '', '16', 4),
(5, '2021-05-12', '', 0, '', '10', 5),
(6, '2022-11-03', '', 0, '', '4', 6),
(7, '2021-05-15', '', 0, '', '9', 7),
(8, '2022-08-22', '', 0, '', '13', 8),
(9, '2022-12-08', '', 0, '', '19', 9),
(10, '2022-10-16', '', 0, '', '3', 10);

-- --------------------------------------------------------

--
-- Structure de la table `fournisseur`
--

CREATE TABLE `fournisseur` (
  `fournisseur_id` int(11) NOT NULL,
  `fournisseur_nom` varchar(50) NOT NULL,
  `fournisseur_categorie` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `fournisseur`
--

INSERT INTO `fournisseur` (`fournisseur_id`, `fournisseur_nom`, `fournisseur_categorie`) VALUES
(1, 'Acme', 'Constructeur'),
(2, 'Json', 'Importateur'),
(3, 'Fafa', 'Constructeur'),
(4, 'Hoho', 'Importateur'),
(5, 'Haha', 'Constructeur'),
(6, 'React', 'Constructeur'),
(7, 'CSS', 'Importateur'),
(8, 'HTML', 'Constructeur'),
(9, 'JAVA', 'Importateur'),
(10, 'Arnaud', 'Constructeur');

-- --------------------------------------------------------

--
-- Structure de la table `livraison`
--

CREATE TABLE `livraison` (
  `id_livraison` int(11) NOT NULL,
  `livraison_date` date NOT NULL,
  `adresse_liv` varchar(50) NOT NULL,
  `id_commande` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `passe`
--

CREATE TABLE `passe` (
  `id_client` varchar(50) NOT NULL,
  `id_commande` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `produit_id` int(11) NOT NULL,
  `produit_nom` varchar(50) NOT NULL,
  `produit_libCour` varchar(50) NOT NULL,
  `produit_libLong` varchar(50) DEFAULT NULL,
  `prix_uni` int(11) NOT NULL,
  `tva` decimal(15,2) DEFAULT NULL,
  `produit_photo` varchar(50) NOT NULL,
  `fournisseur_id` int(11) NOT NULL,
  `categorie_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`produit_id`, `produit_nom`, `produit_libCour`, `produit_libLong`, `prix_uni`, `tva`, `produit_photo`, `fournisseur_id`, `categorie_id`) VALUES
(1, 'Tulipan', 'nisl arcu iaculis enim', 'ullamcorper, nisl arcu iaculis enim, sit amet orna', 8, '0.20', 'https://picsum.photos/200', 1, 1),
(2, 'Bromelias', ' at libero fafa', 'commodo at, libero. Morbi accumsan laoreet ipsum. ', 2, '0.20', 'https://picsum.photos/200', 2, 1),
(3, 'Liliums', 'a sollicitudin orci ', 'elit erat vitae risus. Duis a mi fringilla mi laci', 5, '0.20', 'https://picsum.photos/200', 3, 1),
(4, 'Astroemelias', 'Nulla facilisi.', 'ligula. Aenean euismod mauris eu elit. Nulla facil', 6, '0.20', 'https://picsum.photos/200', 4, 1),
(5, 'Margaritas', 'arcu iaculis enim,', 'a sollicitudin orci sem eget massa. Suspendisse el', 18, '0.20', 'https://picsum.photos/200', 5, 1),
(6, 'Anthuriums', 'accumsan laoreet ipsum. ', 'lacus. Mauris non dui nec urna suscipit nonummy. F', 3, '0.20', 'https://picsum.photos/200', 6, 1),
(7, 'Iris', 'commodo at, libero.', 'nisi sem semper erat, in consectetuer ipsum nunc i', 9, '0.20', 'https://picsum.photos/200', 7, 1),
(8, 'Phalaennopsis', 'Sed neque.', 'purus. Maecenas libero est, congue a, aliquet vel,', 8, '0.20', 'https://picsum.photos/200', 8, 1),
(9, 'Gerberas', 'Morbi accumsan', 'Fusce dolor quam, elementum at, egestas a, sceleri', 9, '0.20', 'https://picsum.photos/200', 9, 1),
(10, 'Rosas', 'Aenean euismod', 'a nunc. In at pede. Cras vulputate velit eu sem a ', 8, '0.20', 'https://picsum.photos/200', 10, 1),
(11, 'Wyatt', 'aliquet magna a', 'vestibulum lorem, sit amet ultricies sem magna nec', 6, '0.20', 'https://nytimes.com/sub/cars', 1, 4),
(12, 'Lev', 'cursus et, eros.', 'Pellentesque ut ipsum ac mi eleifend egestas. Sed ', 3, '0.20', 'https://wikipedia.org/one', 2, 4),
(13, 'Cairo', 'et, euismod et,', 'elit, a feugiat tellus lorem eu metus. In lorem. D', 12, '0.20', 'https://cnn.com/en-ca', 3, 4),
(14, 'Malik', 'Curabitur dictum. Phasellus', 'sed sem egestas blandit. Nam nulla magna, malesuad', 3, '0.20', 'http://cnn.com/settings', 4, 4),
(15, 'Phillip', 'erat volutpat. Nulla', 'Morbi metus. Vivamus euismod urna. Nullam lobortis', 17, '0.20', 'https://walmart.com/en-us', 5, 4),
(16, 'Jerry', 'semper et, lacinia', 'dolor dapibus gravida. Aliquam tincidunt, nunc ac ', 4, '0.20', 'https://reddit.com/settings', 6, 4),
(17, 'Len', 'congue a, aliquet', 'pede, ultrices a, auctor non, feugiat nec, diam. D', 11, '0.20', 'http://whatsapp.com/settings', 7, 4),
(18, 'Michael', 'Nullam feugiat placerat', 'vestibulum. Mauris magna. Duis dignissim tempor ar', 15, '0.20', 'http://wikipedia.org/en-ca', 8, 4),
(19, 'Kato', 'Maecenas ornare egestas', 'risus quis diam luctus lobortis. Class aptent taci', 19, '0.20', 'http://twitter.com/user/110', 9, 4),
(20, 'Curran', 'Mauris quis turpis', 'senectus et netus et malesuada fames ac turpis ege', 20, '0.20', 'http://guardian.co.uk/en-ca', 10, 4),
(21, 'BioFourche', 'at auctor ullamcorper,', 'Quisque libero lacus, varius et, euismod et, commo', 7, '0.20', 'http://netflix.com/one', 1, 7),
(22, 'Secateur', 'vitae nibh. Donec', 'Etiam bibendum fermentum metus. Aenean sed pede ne', 1, '0.20', 'http://ebay.com/en-ca', 2, 7),
(23, 'Engrais Bleu Universel 10kg', 'velit justo nec', 'Suspendisse ac metus vitae velit egestas lacinia. ', 5, '0.20', 'https://zoom.us/user/110', 3, 7),
(24, 'Gazon rustique avec engrais - 5 kg', 'euismod urna. Nullam', 'accumsan laoreet ipsum. Curabitur consequat, lectu', 1, '0.20', 'https://whatsapp.com/settings', 4, 7),
(25, 'Naturen - Engrais agrumes 1,5 kg', 'urna et arcu', 'non leo. Vivamus nibh dolor, nonummy ac, feugiat n', 8, '0.20', 'https://netflix.com/user/110', 5, 7),
(26, 'Pulverisateur electrique PowerJet 2', 'mi lacinia mattis.', 'inceptos hymenaeos. Mauris ut quam vel sapien impe', 11, '0.20', 'http://wikipedia.org/site', 6, 7),
(27, 'Lot balai a poils recourbes + tete balai-raclette', 'tristique senectus et', 'eu, eleifend nec, malesuada ut, sem. Nulla interdu', 3, '0.20', 'https://baidu.com/user/110', 7, 7),
(28, 'Taille haies electrique 450W', 'vel pede blandit', 'Maecenas malesuada fringilla est. Mauris eu turpis', 9, '0.20', 'http://ebay.com/sub/cars', 8, 7),
(29, 'Robot de tonte MOWOX RM 50 Li BT', 'rhoncus. Donec est.', 'pulvinar arcu et pede. Nunc sed orci lobortis augu', 12, '0.20', 'https://baidu.com/user/110', 9, 7),
(30, 'Tronconneuse elagueuse Carving / 25cm', 'tortor. Nunc commodo', 'nunc est, mollis non, cursus non, egestas a, dui. ', 3, '0.20', 'http://zoom.us/fr', 10, 7);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `pro_four`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `pro_four` (
`produit_nom` varchar(50)
,`fournisseur_nom` varchar(50)
);

-- --------------------------------------------------------

--
-- Structure de la table `stock`
--

CREATE TABLE `stock` (
  `stock_id` int(11) NOT NULL,
  `current_stock` int(11) NOT NULL,
  `max_stock` int(11) NOT NULL,
  `min_stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la vue `pro_four`
--
DROP TABLE IF EXISTS `pro_four`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pro_four`  AS SELECT `produit`.`produit_nom` AS `produit_nom`, `fournisseur`.`fournisseur_nom` AS `fournisseur_nom` FROM (`produit` join `fournisseur`) WHERE `produit`.`fournisseur_id` = `fournisseur`.`fournisseur_id` ;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `affecte`
--
ALTER TABLE `affecte`
  ADD PRIMARY KEY (`id_commande`,`stock_id`),
  ADD KEY `stock_id` (`stock_id`);

--
-- Index pour la table `appartient`
--
ALTER TABLE `appartient`
  ADD PRIMARY KEY (`produit_id`,`categorie_id`),
  ADD KEY `categorie_id` (`categorie_id`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`categorie_id`),
  ADD KEY `categorie_id_1` (`categorie_id_1`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`),
  ADD KEY `id_commercial` (`id_commercial`),
  ADD KEY `coefficiant` (`coefficiant`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id_commande`),
  ADD KEY `id_client` (`id_client`);

--
-- Index pour la table `commande_ligne`
--
ALTER TABLE `commande_ligne`
  ADD PRIMARY KEY (`produit_id`,`id_commande`),
  ADD KEY `id_commande` (`id_commande`);

--
-- Index pour la table `commercial`
--
ALTER TABLE `commercial`
  ADD PRIMARY KEY (`id_commercial`);

--
-- Index pour la table `contient`
--
ALTER TABLE `contient`
  ADD PRIMARY KEY (`produit_id`,`id_commande`),
  ADD KEY `id_commande` (`id_commande`);

--
-- Index pour la table `existe`
--
ALTER TABLE `existe`
  ADD PRIMARY KEY (`produit_id`,`stock_id`),
  ADD KEY `stock_id` (`stock_id`);

--
-- Index pour la table `facture`
--
ALTER TABLE `facture`
  ADD PRIMARY KEY (`facture_id`),
  ADD KEY `id_client` (`id_client`),
  ADD KEY `id_commande` (`id_commande`);

--
-- Index pour la table `fournisseur`
--
ALTER TABLE `fournisseur`
  ADD PRIMARY KEY (`fournisseur_id`);

--
-- Index pour la table `livraison`
--
ALTER TABLE `livraison`
  ADD PRIMARY KEY (`id_livraison`),
  ADD KEY `id_commande` (`id_commande`);

--
-- Index pour la table `passe`
--
ALTER TABLE `passe`
  ADD PRIMARY KEY (`id_client`,`id_commande`),
  ADD KEY `id_commande` (`id_commande`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`produit_id`),
  ADD KEY `fournisseur_id` (`fournisseur_id`),
  ADD KEY `categorie_id` (`categorie_id`);

--
-- Index pour la table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`stock_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `appartient`
--
ALTER TABLE `appartient`
  MODIFY `produit_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `categorie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `id_commande` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT pour la table `facture`
--
ALTER TABLE `facture`
  MODIFY `facture_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `fournisseur`
--
ALTER TABLE `fournisseur`
  MODIFY `fournisseur_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `produit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT pour la table `stock`
--
ALTER TABLE `stock`
  MODIFY `stock_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `affecte`
--
ALTER TABLE `affecte`
  ADD CONSTRAINT `affecte_ibfk_1` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id_commande`),
  ADD CONSTRAINT `affecte_ibfk_2` FOREIGN KEY (`stock_id`) REFERENCES `stock` (`stock_id`);

--
-- Contraintes pour la table `appartient`
--
ALTER TABLE `appartient`
  ADD CONSTRAINT `appartient_ibfk_1` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`produit_id`),
  ADD CONSTRAINT `appartient_ibfk_2` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`categorie_id`);

--
-- Contraintes pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD CONSTRAINT `categorie_ibfk_1` FOREIGN KEY (`categorie_id_1`) REFERENCES `categorie` (`categorie_id`);

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`id_commercial`) REFERENCES `commercial` (`id_commercial`),
  ADD CONSTRAINT `client_ibfk_2` FOREIGN KEY (`coefficiant`) REFERENCES `coefficiant` (`coefficiant`);

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`);

--
-- Contraintes pour la table `commande_ligne`
--
ALTER TABLE `commande_ligne`
  ADD CONSTRAINT `commande_ligne_ibfk_1` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`produit_id`),
  ADD CONSTRAINT `commande_ligne_ibfk_2` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id_commande`);

--
-- Contraintes pour la table `contient`
--
ALTER TABLE `contient`
  ADD CONSTRAINT `contient_ibfk_1` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`produit_id`),
  ADD CONSTRAINT `contient_ibfk_2` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id_commande`);

--
-- Contraintes pour la table `existe`
--
ALTER TABLE `existe`
  ADD CONSTRAINT `existe_ibfk_1` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`produit_id`),
  ADD CONSTRAINT `existe_ibfk_2` FOREIGN KEY (`stock_id`) REFERENCES `stock` (`stock_id`);

--
-- Contraintes pour la table `livraison`
--
ALTER TABLE `livraison`
  ADD CONSTRAINT `id_commande` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id_commande`);

--
-- Contraintes pour la table `passe`
--
ALTER TABLE `passe`
  ADD CONSTRAINT `passe_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`),
  ADD CONSTRAINT `passe_ibfk_2` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id_commande`);

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `produit_ibfk_1` FOREIGN KEY (`fournisseur_id`) REFERENCES `fournisseur` (`fournisseur_id`),
  ADD CONSTRAINT `produit_ibfk_2` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`categorie_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
