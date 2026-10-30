# BOLINGO — Clinique Médicale

Projet universitaire en **HTML et CSS uniquement**. Le site public et l’espace de gestion sont deux interfaces distinctes, avec des ressources visuelles communes. Aucun JavaScript, PHP, backend, compte utilisateur ou stockage des saisies n’est intégré dans cette version.

## Ouvrir le projet

Ouvrir directement l’un de ces fichiers dans un navigateur récent :

- [Site public](public/html/index.html)
- [Gestion de la clinique](gestion/html/index.html)
- [Écran de connexion](gestion/html/connexion.html)

Aucune installation, compilation ou serveur n’est nécessaire. Les images, icônes et polices sont locales. Le lanceur facultatif `gestion/demarrer.ps1` ouvre le fichier HTML de gestion dans le navigateur ; il ne démarre aucun serveur.

## Organisation

```text
public/
  html/
    index.html                Accueil
    apropos.html              Présentation de la clinique
    contact.html              Coordonnées et contact
    medecins.html             Annuaire public
    services.html             Catalogue des services
    rendez-vous/              Parcours public statique en six pages
  css/
    global.css                Fondations communes : couleurs, polices, accessibilité
    components.css            Composants du site public
    pages.css                 Accueil et À propos
    catalogue.css             Médecins et Services
    contact.css               Contact
    reservation.css           Parcours de réservation
  assets/
    images/                   Photos, portraits et références visuelles
    icons/                    Icônes SVG locales
    fonts/                    Poppins et licence OFL
gestion/
  html/
    index.html                Tableau de bord
    rendez-vous.html          Liste et présentation des actions
    patients.html             Extrait de patients, fiches et champs de saisie
    medecins.html             Médecins, horaires et absences
    specialites.html          Spécialités médicales
    salles.html               Salles, équipements et disponibilités
    rapports.html             Présentation de rapport avec valeurs fictives
    parametres.html           Présentation des réglages
    connexion.html            Présentation de la connexion
  css/
    gestion.css               Styles de gestion et import des fondations communes
    navigation.css            Menu et fiches avec les interactions HTML/CSS natives
    rapports.css              Proportions et couleurs des graphiques illustratifs
  DONNEES.md                  Mapping du classeur et futur raccordement
  demarrer.ps1                Ouverture locale du fichier HTML, sans serveur
  README.md                   Guide de l’espace de gestion
verification/                 Captures conservées, dont certaines de versions antérieures
README.md                     Ce guide
LICENSE                       Licence du code et de la documentation
```

`gestion/css/gestion.css` importe `../../public/css/global.css`. Les deux interfaces utilisent `public/assets/` sans duplication des images ou polices. Les chemins sont relatifs aux fichiers qui les utilisent : déplacer un fichier nécessite d’adapter ses liens.

Les comportements natifs du menu et des fiches sont présentés dans `gestion/css/navigation.css`. La page Rapports charge en complément `gestion/css/rapports.css` pour les proportions et couleurs de son scénario ; aucun style inline n’est nécessaire.

Chaque page possède son propre document HTML. Les menus et en-têtes sont répétés volontairement, car HTML seul ne fournit pas d’inclusion de fragments. Les liens de navigation, les ancres et les éléments natifs `details`/`summary` assurent les interactions disponibles sans script.

## Périmètre actuel

Le frontend de gestion est une maquette HTML/CSS. Excel sert uniquement à définir les champs et les relations décrits dans [DONNEES.md](gestion/DONNEES.md). Ses données individuelles ne sont pas copiées dans les pages.

Trois patients, trois médecins, deux salles et trois rendez-vous entièrement fictifs présentent les tableaux et formulaires. Les noms et identifiants affichés servent uniquement à la présentation ; ce ne sont pas des dossiers importés du classeur. Les statistiques sont également fictives.

L’ajout d’un patient, l’actualisation de la liste et la génération d’un PDF à jour seront réalisés avec PHP/MySQL. Le bouton PDF est désactivé dans la maquette. Le registre complet et le PDF figé de la précédente version ont été retirés. Le classeur source n’a pas été modifié.

Voir le [guide de gestion](gestion/README.md). Le site public reste inchangé.

## Travail futur PHP/MySQL

Le backend sera développé séparément avec l’équipe. Il reste à définir et raccorder les traitements PHP, MySQL et PDO :

- Recherches, filtres et pagination par formulaires `GET` et paramètres validés.
- Vrais formulaires avec `action` et `method="post"` pour les créations et modifications ; validation serveur et retours d’erreur accessibles.
- Authentification, sessions et autorisations serveur des administrateurs, réceptionnistes et médecins.
- Requêtes PDO préparées, protection CSRF et contrôle des données reçues.
- Gestion réelle des horaires, absences, disponibilités, conflits et réservations simultanées.
- Import initial à préparer, calcul des rapports et synchronisation du site public avec l’espace de gestion.
- Ajout patient par `POST`, validation serveur, `INSERT` PDO puis redirection `GET` vers la liste ; génération du PDF côté PHP après un enregistrement validé.

Aucune route API, table MySQL ou règle de sécurité effective n’est supposée par les pages actuelles.

## Ressources et conventions

Les textes et commentaires sont en français. Conserver les titres hiérarchisés, associations `label`/`for`, textes alternatifs, liens d’évitement et styles de focus lors des modifications. Les tableaux peuvent défiler horizontalement sur un petit écran.

Les portraits et photos fournis restent dans `public/assets/images/`. Les versions WebP et leurs variantes de résolution limitent le poids sans recadrer les originaux. Les références et originaux d’images sont conservés localement ; certains PNG et fichiers intermédiaires sont exclus du dépôt par `.gitignore`.

Des enseignes photographiées et portraits ont été adaptés avec ImageGen pour remplacer MEDORA par BOLINGO. Les originaux permettent de retrouver les images fournies. La police Poppins et les icônes SVG locales sont réutilisées par les deux interfaces.

## Vérifier cette version

Ouvrir les pages directement, parcourir chaque menu, tester les liens vers le site public, les ancres et les fiches `details`/`summary` au clavier. Vérifier les ressources et les mises en page sur ordinateur, tablette et téléphone. Les actions désactivées doivent rester clairement identifiables et ne rien transmettre.

Pour imprimer le rapport, ouvrir `gestion/html/rapports.html` et utiliser `Ctrl+P`, puis « Enregistrer au format PDF » si nécessaire. Les captures conservées dans `verification/` peuvent provenir de versions précédentes ; elles ne prouvent pas la validation de cette nouvelle version HTML/CSS.

Les contrôles de l’ancienne version sont historiques. La maquette corrigée nécessite sa propre vérification des liens, tableaux, ancres et mises en page ; voir le [guide de gestion](gestion/README.md#vérification).

## Dépôt et licence

Dépôt de référence : [louisnkanga8-ux/clinique-bolingo](https://github.com/louisnkanga8-ux/clinique-bolingo). Les modifications locales ne sont pas automatiquement partagées ou déployées.

Le code HTML/CSS, les icônes SVG et la documentation sont distribués sous [licence MIT](LICENSE). Poppins conserve sa [licence SIL Open Font License 1.1](public/assets/fonts/OFL.txt). Les images fournies et leurs retouches ne sont pas couvertes par la licence MIT du code.

Présentation du 30 octobre 2026 : les bandeaux de maquette et les explications techniques sont retirés des pages visibles. Les données restent fictives et les actions nécessitant le backend restent désactivées. Les limites sont documentées ici, sans encombrer les écrans.
