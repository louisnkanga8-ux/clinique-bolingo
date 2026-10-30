# BOLINGO — Structure des données pour le futur backend

Le classeur fourni sert de référence pour les colonnes, relations et choix des formulaires. Ses dossiers ne sont pas intégrés au frontend. Le fichier Excel original reste inchangé.

## Colonnes de référence

### Patients

`ID_Patient`, `Nom`, `Postnom`, `Prenom`, `Sexe`, `Province`, `Ville`, `Commune`, `Telephone`.

### Medecins

`ID_Medecin`, `Nom`, `Postnom`, `Prenom`, `Specialite`.

### Salles

`ID_Salle`, `Salle`, `Equipement`.

### RendezVous

`ID_RDV`, `Patient`, `Medecin`, `Salle`, `Date`, `Statut`, `Heure_Debut`, `Tranche_Horaire`, `Heure_Fin`, `Duree_Minutes`.

### Tranches_Horaire

`Id`, `Tranche`, `Minutes`.

### Disponibilites_Medecins

`ID_Disponibilite_Medecin`, `ID_Medecin`, `Jour_Semaine`, `Heure_Debut`, `Heure_Fin`, `Valide_Du`, `Valide_Au`, `Statut`.

### Indisponibilites_Medecins

`ID_Indisponibilite_Medecin`, `ID_Medecin`, `Date_Debut`, `Date_Fin`, `Heure_Debut`, `Heure_Fin`, `Motif`, `Statut`.

### Disponibilites_Salles

`ID_Disponibilite_Salle`, `ID_Salle`, `Jour_Semaine`, `Heure_Debut`, `Heure_Fin`, `Valide_Du`, `Valide_Au`, `Statut`.

### Indisponibilites_Salles

`ID_Indisponibilite_Salle`, `ID_Salle`, `Date_Debut`, `Date_Fin`, `Heure_Debut`, `Heure_Fin`, `Motif`, `Statut`.

## Présentation actuelle

Les pages HTML ne contiennent que trois patients fictifs, trois médecins fictifs, deux salles fictives et trois rendez-vous fictifs. Les identifiants de présentation (P001, M001, S001, R001) ne doivent jamais être importés comme des dossiers réels. Les compteurs et rapports sont des exemples de présentation, sans calcul à l’ouverture.

Les durées 30, 45, 60, 90 et 120 minutes et les statuts Confirmé, En attente, Terminé, Annulé, Reporté préparent les contrôles du formulaire. Les champs absents du classeur (âge, date de naissance, e-mail patient, capacité des salles) ne sont pas inventés.

## Raccordement PHP/MySQL à réaliser

1. Définir le schéma et importer les données Excel dans MySQL côté serveur, en validant les identifiants et les relations. Ce travail n’est pas réalisé dans cette version.
2. Relier RendezVous.Patient à Patients.ID_Patient, Medecin à Medecins.ID_Medecin et Salle à Salles.ID_Salle. Utiliser les identifiants, jamais les noms, qui peuvent se répéter.
3. Produire les lignes HTML à partir des résultats PDO. Les lignes de présentation doivent être remplacés par ces lignes, pas conservés comme données initiales.
4. Pour l’ajout d’un patient : formulaire POST, validation serveur, contrôle des droits et protection CSRF, INSERT avec requête PDO préparée, puis redirection vers la liste relue en base.
5. Générer le PDF côté PHP depuis la liste enregistrée, avec les filtres et droits applicables. Le PDF ne doit pas être une copie préremplie livrée avec le frontend.
6. Calculer côté serveur l’heure de fin à partir du début et de la tranche, puis contrôler horaires, indisponibilités et conflits avant enregistrement.
7. Prévoir authentification, sessions, autorisations, recherches, pagination et statistiques côté serveur. Aucun JavaScript n’est requis pour ce fonctionnement.

Les spécialités proviennent du champ Medecins.Specialite ; leur normalisation éventuelle devra être décidée avec l’équipe backend. Les onglets Guide/Audit du classeur comportent des indications anciennes sur les heures : revalider les données lors de l’import, sans corrections automatiques fondées uniquement sur ces notes.

Présentation du 30 octobre 2026 : les bandeaux de maquette et les explications techniques sont retirés des pages visibles. Les données restent fictives et les actions nécessitant le backend restent désactivées. Les limites sont documentées ici, sans encombrer les écrans.
