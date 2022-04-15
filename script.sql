-- 2.1.3 – chiffre d’affaires HT pour l’ensemble et par fournisseur
SELECT SUM(total_ht) , fournisseur_nom FROM produit, fournisseur, commande_ligne 
WHERE produit.produit_id = commande_ligne.produit_id AND 
fournisseur.fournisseur_id = produit.fournisseur_id GROUP BY fournisseur_nom;

-- 2.1.4 – Liste des produits commandés pour une année sélectionnée (référence et nom du produit, quantité commandée, fournisseur)
SELECT produit_nom , qte, fournisseur_nom, produit.produit_id FROM commande_ligne, fournisseur, produit, commande WHERE (fournisseur.fournisseur_id = produit.fournisseur_id AND produit.produit_id = commande_ligne.produit_id AND commande.id_commande = commande_ligne.id_commande) GROUP BY commande_date HAVING YEAR (commande.commande_date) = 2022 ORDER BY qte desc;

-- 2.1.5 – Liste des commandes pour un client (date de la commande, référence client, montant, état de la commande)
SELECT client.id_client, commande.commande_date, commande.total_ttc, commande.commande_status FROM client, commande, commande_ligne WHERE 
client.id_client = commande.id_client AND commande.id_commande = commande_ligne.id_commande;

-- 2.1.6 – Lister les commandes en cours de livraison
SELECT * FROM commande WHERE commande_status = 'en cours'; 

-- 2.1.7 – Repartition du chiffre d’affaire HT par type de client 
SELECT SUM(commande_ligne.total_ht) AS CA_HT, client.client_categorie FROM client, commande_ligne, commande WHERE client.id_client = commande.id_client AND commande.id_commande = commande_ligne.id_commande GROUP BY client.client_categorie; 


-- 2.2.1 – qui renvoie le délai moyen entre la date de commande et la date de facturation
DELIMITER |
CREATE PROCEDURE delai_moyens()
BEGIN
SELECT AVG(DATEDIFF(facture_date, commande_date)) as moyenne FROM facture, commande WHERE commande.id_commande = facture.id_commande;
END |
DELIMITER;

-- 2.3.1 – Créez une vue correspondant à la jointure Produits - Fournisseurs
CREATE view pro_four AS
SELECT produit_nom, fournisseur_nom
FROM produit, fournisseur
WHERE produit.fournisseur_id = fournisseur.fournisseur_id;

-- 1.2.4 – Pour la sécurité, vous devez prévoir plusieurs profils de connexion et décliner les autorisations nécessaires
Visiteur
CREATE USER 'visiteur' IDENTIFIED BY '1234'
GRANT SELECT ON produit TO 'visiteur';

client
CREATE USER 'client' IDENTIFIED BY '1234'
GRANT SELECT ON * TO 'client'
GRANT INSERT, UPDATE ON client TO 'client';
GRANT INSERT, UPDATE ON commande TO 'client';

Gestion
CREATE USER 'gestion' IDENTIFIED BY '1234';
GRANT SELECT, UPDATE, ALTER ON * TO 'gestion';

Administrateur
CREATE USER 'administrateur' IDENTIFIED BY'1234';
GRANT SELECT, INSERT, UPDATE, ALTER, CREATE, DELETE ON * TO 'administrateur';

-- 1.2.6 – Décrivez les procédures que vous mettez en place pour assurer les sauvegardes de la base (MySQLdump)
mysqldump -u root ggbd1 > saveggbd1.sql

-- 1.2.7 – Testez une restauration
mysqldump -u root ggbd1 < saveggbd1.sql


---------------------------------------------------------------------------------------------
-- REQUETE POUR OBTENIR LES PRIX TOTAUX HT ET TTC : 
UPDATE commande_ligne SET total_ht = (SELECT(qte * prix_uni) FROM produit WHERE produit.produit_id = commande_ligne.produit_id);
UPDATE commande_ligne SET total_ttc = (SELECT((1 + tva) * prix_uni) FROM produit WHERE produit.produit_id = commande_ligne.produit_id);