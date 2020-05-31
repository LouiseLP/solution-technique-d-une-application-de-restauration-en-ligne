SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `expressfood`
--

-- --------------------------------------------------------

--
-- Structure de la table `adresse_client`
--

DROP TABLE IF EXISTS adresse;
CREATE TABLE IF NOT EXISTS adresse (
  id int(11) NOT NULL AUTO_INCREMENT,
  numero_rue varchar(15) NOT NULL,
  rue varchar(100) NOT NULL
  ville varchar(50) NOT NULL,
  code_postal varchar(20) NOT NULL,
  etage smallint(4) DEFAULT NULL,
  batiment varchar(50) DEFAULT NULL,
  code_acces varchar(10) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `adresse_client`
--

INSERT INTO adresse (id, numero_rue, rue, ville, code_postal, etage, batiment, code_acces) VALUES
(1, 6, 'avenue de la plage', 'Ànglet', 64600, NULL, NULL, NULL),
(2, 15, 'place des Anglais', 'Ànglet', 64600, NULL, NULL, NULL),
(3, 23, 'rue Saint Nicolas', 'Mouguerre', 64990, NULL, NULL, NULL),
(4, 4, 'rue Victor Hugo', 'Bayonne', 64100, 2, NULL, 4517),
(5, 46, 'rue du Palais', 'Biarritz', 64200, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS client;
CREATE TABLE IF NOT EXISTS client (
  id int(11) NOT NULL AUTO_INCREMENT,
  nom_client varchar(50) NOT NULL,
  prenom_client varchar(50) NOT NULL,
  telephone varchar(20) NOT NULL,
  email varchar(100) NOT NULL,
  mot_de_passe binary(60) NOT NULL,
  
  PRIMARY KEY (id),
  KEY adresse_client (id)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `client`
--

INSERT INTO client (id, nom, prenom, email, telephone, mot_de_passe, adresse (id)) VALUES
(1, 'Larre', 'Alexandre', 'larre.alexandre@gmail.com', 0671202592, 0x2432792431302432796e506377572f4943545950786b78632f6e4836656c567744776d4937656c4e4d434459773148385635586f5949666c786b7543, 1),
(2, 'Dupont', 'Emilie', 'emilie.dupont@gmail.com', 0559324030, 0x2432792431302432796e506377572f4943545950786b78632f6e4836656c567744776d4937656c4e4d434459773148385635586f5949666c786b7543, 5)
(3, 'Garcia', 'Jean', 'jean.garcia@gmail.com', 0533687820, 0x2432792431302432796e506377572f4943545950786b78632f6e4836656c567744776d4937656c4e4d434459773148385635586f5949666c786b7543, 2),
(4, 'Duchesne', 'Emma', 'emma.duchesne@gmail.com', 0789103513, 0x2432792431302432796e506377572f4943545950786b78632f6e4836656c567744776d4937656c4e4d434459773148385635586f5949666c786b7543, 3),
(5, 'Miras', 'Jules', 'jules.miras@gmail.com', 0664667107, 0x2432792431302432796e506377572f4943545950786b78632f6e4836656c567744776d4937656c4e4d434459773148385635586f5949666c786b7543, 4);

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS commande;
CREATE TABLE IF NOT EXISTS commande (
  id int(11) NOT NULL AUTO_INCREMENT,
  commande_statut varchar(20) NOT NULL,
  date_livraison datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  'date' datetime NOT NULL,
  paiement boolean NOT NULL,
  
  PRIMARY KEY (id),
  KEY client (id),
  KEY livreur (id)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO commande (id, commande_statut,'date', date_livraison, paiement, client(id), livreur(id)) VALUES
(1, 'EN COURS', '2019-05-25 18:25:15', '2019-05-25 19:04:00', TRUE, 2, 2),
(2, 'ANNULEE', '2019-05-18 22:40:58', '2018-05-18 22:40:58', FALSE, 1, NULL),
(3, 'LIVREE', '2019-05-09 12:11:28', '2019-05-09 12:48:17', TRUE, 3, 1);
(4, 'LIVREE', '2019-05-02 16:32:38', '2019-05-02 17:09:04', TRUE, 5, 3)

-- --------------------------------------------------------

--
-- Structure de la table `ligne_commande`
--

DROP TABLE IF EXISTS ligne_commande;
CREATE TABLE IF NOT EXISTS ligne_commande (
 quantite int(11) NOT NULL,
 prix_unite_ht float (6,3),
 tva float(6,3)

  PRIMARY KEY (commande (id), plat(id)),
  KEY plat (id),
  KEY commande (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `ligne_commande`
--

INSERT INTO ligne_commande (quantite, prix_unite_ht, tva, commande(id), plat(id) )  VALUES
(4, 7.80, 0.78, 1, 1),
(2, 10.20 & 4.10, 1.02 & 0.41, 3, 2 & 4),
(3, 10.20, 1.02, 4, 2),

-- --------------------------------------------------------

--
-- Structure de la table `livreur`
--

DROP TABLE IF EXISTS livreur;
CREATE TABLE IF NOT EXISTS livreur (
  id int(11) NOT NULL AUTO_INCREMENT,
  nom_livreur varchar(50) NOT NULL,
  prenom_livreur varchar(50) NOT NULL,
  telephone varchar(20) NOT NULL,
  statut_livreur varchar(20) NOT NULL,
  position_gps float(15,15) NOT NULL,

  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `livreur`
--

INSERT INTO livreur (id, nom_livreur, prenom-Livreur, telephone, statut_livreur, position_gps) VALUES
(1, 'Devant', 'Arnaud', 0621776563, 'EN LIVRAISON', '43.500397, -1.541586' ),
(2, 'Biscay', 'Daniel', 0710060818, 'LIBRE', '43.491210, -1.475506'),
(3, 'Durruty', 'Eric', 0634838799, 'LIBRE', '43.485362, -1.558204' )

-- --------------------------------------------------------

--
-- Structure de la table `plat`
--

DROP TABLE IF EXISTS plat;
CREATE TABLE IF NOT EXISTS plat (
  id int(11) NOT NULL AUTO_INCREMENT,
  prix_unite_ht float(6,3) NOT NULL,
  tva float(6,3) NOT NULL,
  stock_plat int(11) NOT NULL,
  type_plat varchar(30) NOT NULL,

  PRIMARY KEY (id),
  KEY plat_du_jour(id)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `plat`
--

INSERT INTO plat (id, plat_du_jour(id), prix_unite_ht, tva, stock_plat, type_plat) VALUES
(1, 1, 'Poulet basquaise', 7.80, 15, 1),
(2, 2, 'Coq au vin', 10.20, 1.02, 12, 1),
(3, 3, 'Mousse au chocolat', 5.10, 0.51, 15, 2),
(4, 4, 'Crème Brûlee', 4.10, 0.41, 10, 2);

-- --------------------------------------------------------

--
-- Structure de la table `plat_du_jour`
--

DROP TABLE IF EXISTS plat_du_jour;
CREATE TABLE IF NOT EXISTS plat_du_jour (
  id int(11) NOT NULL AUTO_INCREMENT,
  nom_plat varchar(100) NOT NULL,
  date_plat datetime NOT NULL,

  PRIMARY KEY (id),
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `plat_du_jour`
--

INSERT INTO plat_du_jour (id, nom_plat, plat(id), date_plat) VALUES
(1, 'Poulet Basquaise', 1, '2019-04-28'),
(2, 'Coq au vin', 2, '2019-04-28'),
(3, 'Mousse au chocolat', 3, '2019-04-29'),
(4, 'Crème Brûlee', 4, '2019-04-29');

-- --------------------------------------------------------

--
-- Structure de la table `stock_livreur`
--

DROP TABLE IF EXISTS stock_livreur;
CREATE TABLE IF NOT EXISTS `stock_livreur` (
  quantite int(11) NOT NULL,

  PRIMARY KEY (livreur(id),plat (id),
  KEY plat(id),
  KEY livreur(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `stock_livreur`
--

INSERT INTO stock_livreur (livreur_id, plat_id, quantite) VALUES
(1, 1, 4),
(2, 2, 2),
(1, 3, 5),
(2, 4, 4);

--
