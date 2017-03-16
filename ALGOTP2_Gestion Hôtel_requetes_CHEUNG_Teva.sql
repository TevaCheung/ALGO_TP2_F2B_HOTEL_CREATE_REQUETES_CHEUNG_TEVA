--Nombre de clients
select count(CLI_ID) as NbClients
from T_CLIENT;

--Les clients triés sur le titre et le nom
select *
from T_CLIENT
order by TIT_CODE, CLI_NOM ASC;

--Les clients triés sur le libellé du titre et le nom
select CLI_ID,TIT_LIBELLE,CLI_NOM,CLI_PRENOM,T_CLIENT.TIT_CODE
from T_CLIENT,T_TITRE
where T_TITRE.TIT_CODE=T_CLIENT.TIT_CODE
order by TIT_LIBELLE, CLI_NOM;

--Les clients commençant par 'B'
select *
from T_CLIENT
where upper(CLI_NOM) like '"B%';

--Les clients homonymes
select CLI_ID,CLI_NOM,CLI_PRENOM
from T_CLIENT C
where (select count(*)
	from T_CLIENT
	where CLI_NOM=C.CLI_NOM)>1;

--Nombre de titres différents
select count(distinct TIT_CODE) as NbTitresDifferents
from T_TITRE;

--Nombre d'enseignes
select count(distinct CLI_ENSEIGNE) NbEnseignes
from T_CLIENT;

--Les clients qui représentent une enseigne 
select *
from T_CLIENT
where CLI_ENSEIGNE is not null;

--Les clients qui représentent une enseigne de transports
select *
from T_CLIENT
where CLI_ENSEIGNE like '"Transports%';

--Nombre d'hommes,Nombres de femmes, de demoiselles, Nombres de sociétés
A REVOIR!
select count(TIT_CODE) as H, count(TIT_CODE) as F, count(TIT_CODE) as Mlle, count(CLI_ENSEIGNE) as NbSocietes
from T_CLIENT
where H like '"M."'
and F like '"Mme."'
and Mlle like '"Mlle."'
and NbSocietes is not null;

--Nombre d'emails
select count('EML_ID') as NbEmails
from T_EMAIL;

--Client sans email 
select CLI_NOM as NomCli,CLI_PRENOM PrenomCli,EML_ADRESSE AdresseEmail
from T_CLIENT,T_EMAIL
where T_CLIENT.CLI_ID = T_EMAIL.CLI_ID
and EML_ADRESSE is not null;

--Clients sans téléphone 
select T_CLIENT.CLI_ID,CLI_NOM, CLI_PRENOM
from T_TELEPHONE, T_CLIENT
where T_CLIENT.CLI_ID = T_TELEPHONE.CLI_ID
and upper(TYP_CODE)<>'TEL';

--Les phones des clients
select T_CLIENT.CLI_ID,CLI_NOM, CLI_PRENOM,TEL_NUMERO
from T_TELEPHONE, T_CLIENT
where T_CLIENT.CLI_ID = T_TELEPHONE.CLI_ID
and TEL_NUMERO is not null;

--Ventilation des phones par catégorie
select *
from T_TELEPHONE
order by TYP_CODE;

--Les clients ayant plusieurs téléphones

--Clients sans adresse

--Clients sans adresse mais au moins avec mail ou phone 

--Dernier tarif renseigné
select max(TRF_DATE_DEBUT) as DateDernierTarif,TRF_TAUX_TAXES,TRF_PETIT_DEJEUNE
from T_TARIF;

--Tarif débutant le plus tôt 
select Min(TRF_DATE_DEBUT) as DateDernierTarif,TRF_TAUX_TAXES,TRF_PETIT_DEJEUNE
from T_TARIF;

--Différentes Années des tarifs
select distinct(strftime('%Y',TRF_DATE_DEBUT))
from T_TARIF;

--Nombre de chambres de l'hotel 
select count(CHB_ID) as NbChambres
from T_CHAMBRE;

--Nombre de chambres par étage
select count(CHB_ID) as NbChambres, CHB_ETAGE
from T_CHAMBRE
group by CHB_ETAGE;

--Chambres sans telephone
select CHB_ID
from T_CHAMBRE
where CHB_POSTE_TEL=null;

--Existence d'une chambre n°13 ?
select *
from T_CHAMBRE
where CHB_POSTE_TEL='"113"';

--Chambres avec sdb
select *
from T_CHAMBRE
where CHB_BAIN='1';

--Chambres avec douche
select *
from T_CHAMBRE
where CHB_DOUCHE='1';

--Chambres avec WC
select *
from T_CHAMBRE
where CHB_WC='1';

--Chambres sans WC séparés
select *
from T_CHAMBRE
where CHB_WC<>'0';

--Quels sont les étages qui ont des chambres sans WC séparés ?
select distinct(CHB_ETAGE)
from T_CHAMBRE
where (CHB_WC<>'0')>0;

--Nombre d'équipements sanitaires par chambre trié par ce nombre d'équipement croissant
select CHB_ID, CHB_BAIN+CHB_DOUCHE+CHB_WC as NbEquipement
from T_CHAMBRE
order by NbEquipement asc;

--Chambres les plus équipées et leur capacité
select CHB_NUMERO as NumeroChambre, max(CHB_BAIN+CHB_DOUCHE+CHB_WC) as NbEquipement
from T_CHAMBRE
order by CHB_NUMERO;

--Repartition des chambres en fonction du nombre d'équipements et de leur capacité
select *
from T_CHAMBRE
order by (CHB_BAIN+CHB_DOUCHE+CHB_WC), CHB_COUCHAGE;

--Nombre de clients ayant utilisé une chambre


--Clients n'ayant jamais utilisé une chambre (sans facture)

--Nom et prénom des clients qui ont une facture

--Nom, prénom, telephone des clients qui ont une facture

--Attention si email car pas obligatoire : jointure externe

--Adresse où envoyer factures aux clients

--Répartition des factures par mode de paiement (libellé)

--Répartition des factures par mode de paiement 

--Différence entre ces 2 requêtes ? 

--Factures sans mode de paiement 

--Repartition des factures par Années

--Repartition des clients par ville

--Montant TTC de chaque ligne de facture (avec remises)

--Classement du montant total TTC (avec remises) des factures

--Tarif moyen des chambres par années croissantes

--Tarif moyen des chambres par étage et années croissantes

--Chambre la plus cher et en quelle année

--Chambre la plus cher par année 

--Clasement décroissant des réservation des chambres 

--Classement décroissant des meilleurs clients par nombre de réservations

--Classement des meilleurs clients par le montant total des factures

--Factures payées le jour de leur édition

--Facture dates et Délai entre date de paiement et date d'édition de la facture