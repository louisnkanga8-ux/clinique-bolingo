# Bolingo — Clinique Médicale

Projet universitaire **Bolingo**, phase d’intégration publique en HTML5 et CSS3. Version locale du 28 octobre 2026.

## Récupérer le projet depuis GitHub

Dépôt public : [louisnkanga8-ux/clinique-bolingo](https://github.com/louisnkanga8-ux/clinique-bolingo).

Avec Git :

```sh
git clone https://github.com/louisnkanga8-ux/clinique-bolingo.git
cd clinique-bolingo
```

Sans Git, utiliser **Code → Download ZIP** sur GitHub, extraire l’archive puis ouvrir `index.html`. Le dépôt partage les fichiers du projet ; aucun hébergement du site ou GitHub Pages n’est activé.

Pour proposer une modification, créer une branche, effectuer les changements et ouvrir une pull request. Un dépôt public permet à chacun de lire, télécharger et créer un fork. L’écriture directe sur ce dépôt nécessite un accès de collaborateur accordé par son propriétaire.

Les images WebP utilisées par le site et les captures de vérification sont incluses. Les PNG d’origine, les retouches intermédiaires et les anciennes captures remplacées restent conservés localement ; `.gitignore` les exclut pour alléger les téléchargements. Les chemins d’archives cités plus bas documentent donc le travail local et ne sont pas tous présents dans un clone. Aucun de ces fichiers exclus n’est nécessaire au fonctionnement des pages.

## Ouvrir le projet

Ouvrir `index.html` dans un navigateur récent. Aucun paquet à installer, aucune compilation, aucun serveur applicatif requis. Toutes les ressources utilisées par les pages sont locales ; le site fonctionne également hors connexion.

Pour une prévisualisation HTTP locale facultative, depuis ce dossier avec Python installé :

```powershell
python -m http.server 8765 --bind 127.0.0.1
```

Ouvrir ensuite `http://127.0.0.1:8765/`. Ce serveur sert uniquement les fichiers ; il ne fournit aucune logique métier ni enregistrement de rendez-vous. Arrêt : Ctrl+C dans le terminal du serveur.

## Organisation

```text
index.html                    Accueil
medecins.html                 Annuaire de huit profils fictifs
services.html                 Six services principaux
apropos.html                  Présentation de la clinique
contact.html                  Coordonnées, formulaire e-mail, plan et horaires
rendez-vous/
  index.html                  Étape 1 : service
  medecin.html                Étape 2 : médecin
  date-heure.html             Étape 3 : date et heure
  informations.html          Étape 4 : informations du patient
  verification.html          Étape 5 : vérification
  confirmation.html          Aperçu fictif de réussite
css/
  global.css                 Variables, typographie, règles générales
  components.css             Navigation, boutons, cartes, pied de page, visuels
  pages.css                  Accueil et À propos
  catalogue.css              Médecins et Services
  contact.css                Page Contact
  reservation.css            Parcours de démonstration
assets/
  images/                    Captures fournies et versions WebP sans perte
  icons/                     Icônes SVG locales
  fonts/                     Poppins et licence OFL
```

Chaque page est un fichier HTML autonome. Les en-têtes et pieds de page publics sont répétés volontairement : HTML seul ne possède pas de mécanisme natif d’inclusion de fragments. Mettre à jour les onze exemplaires ensemble, en conservant les liens relatifs propres au sous-dossier rendez-vous et l’absence de bouton de réservation dans ce parcours. Le parcours possède la même navigation, sans action de réservation en haut à droite.

## Lire et modifier le code en équipe

Les onze fichiers HTML et les six feuilles CSS comportent des commentaires pédagogiques en français. Ils expliquent le rôle des blocs, leurs liens avec les styles, le responsive, l’accessibilité et les limites de la phase statique. Les commentaires ne s’affichent pas sur le site. Les 23 icônes SVG possèdent aussi une explication de leur repère, de leurs formes et de leurs couleurs.

1. Commencer par `index.html` : `head` charge les ressources ; `header`, `main`, `section` et `footer` organisent la page.
2. Lire `css/global.css` pour la palette, les polices, les conteneurs et les règles d’accessibilité ; puis `css/components.css` pour les éléments communs.
3. Lire ensuite la feuille de la page : `pages.css` pour Accueil et À propos, `catalogue.css` pour Médecins et Services, `contact.css` pour Contact, `reservation.css` pour le parcours.
4. Une classe HTML correspond à un sélecteur CSS commençant par un point. Un `id` sert notamment de destination aux liens `#...` et doit être unique dans la page.
5. Les règles `@media` changent la présentation selon la largeur disponible ; les styles non remplacés continuent de s’appliquer. Vérifier sur ordinateur et téléphone après une modification.
6. Conserver les associations `label`/`for`/`id`, les textes `alt` et les attributs ARIA expliqués dans les fichiers : ils donnent du sens aux contrôles pour les technologies d’assistance.
7. Pour remplacer une photo, mettre à jour ensemble `src`, `srcset`, `width`, `height` et `alt`. Les versions réduites gardent les proportions originales ; `contain` évite de rogner l’image.

Le suffixe `?v=20261028-images` des liens CSS permet aux onglets déjà ouverts de charger les nouveaux styles. Après une prochaine modification visuelle, augmenter cette version dans les pages si un navigateur conserve les anciens styles. Il ne s’agit pas d’un fichier CSS supplémentaire.

## Références et décisions d’intégration

Le nom public de la clinique est **Bolingo**, conformément à la correction du 27 octobre 2026. Les captures initiales portaient le nom MEDORA. Les mentions « fictif », « démonstration » et « projet universitaire » ont été retirées des pages et des badges à la demande du responsable du projet ; elles restent documentées ici. Cette correction de présentation ne change pas le caractère statique du site.

Les captures Accueil, Médecins, Services, À propos et Contact fournies dans la conversation constituent les références visuelles. Le brief écrit détermine le périmètre et les simplifications :

- Accueil : médecins avant services, puis présentation courte de la clinique.
- Médecins : titre direct « Nos médecins », sans ancien bandeau introductif.
- Aucun bandeau promotionnel supplémentaire sur les catalogues.
- Page Contact indépendante, autorisée par la demande du 27 octobre 2026 : coordonnées, formulaire, plan et horaires selon la cinquième maquette. Tous les liens Contact mènent à `contact.html`. Dans À propos, un bandeau compact remplace les anciennes coordonnées ; l’ancre `#coordonnees` reste compatible.
- Profils et descriptions détaillées accessibles via `details` et `summary` natifs, sans nouvelles pages.
- Compteur généraliste corrigé à 1 ; filtre laboratoire ajouté, total 8 profils. Sur petit écran, le sélecteur de spécialité remplace la rangée de filtres redondante pour rendre la grille plus rapidement visible.
- FAQ et réseaux sociaux sans destinations fournies omis pour éviter les liens factices.
- Horaires uniformisés : lundi–vendredi 8 h–18 h ; samedi 8 h–14 h ; dimanche fermé.

Les huit portraits utilisent désormais les images individuelles de 1254 × 1254 pixels fournies par le responsable du projet, et non les petites vignettes extraites de la maquette. Ils sont affichés intégralement dans des éléments `img` carrés avec `object-fit: contain`, sans recadrage ni effet de zoom. Six autres images individuelles ont également été reçues et intégrées : consultation, façade, réception, salle de consultation, pédiatrie et laboratoire. Elles sont affichées entièrement avec des balises img, sans agrandissement par cadrage CSS ou SVG. Seules les images de cardiologie, ophtalmologie, orthopédie et le plan Contact restent des extraits des maquettes. Les captures originales restent intactes ; leurs copies WebP utilisent une compression sans perte. Les enseignes sont adaptées à la nouvelle identité Bolingo.

Le logo et les icônes sont des SVG dessinés pour cette intégration à partir du langage visuel fourni. La police Poppins sert de rapprochement visuel ; la police exacte des maquettes n’a pas été fournie. Elle est hébergée localement, sous licence SIL Open Font License ; voir `assets/fonts/OFL.txt`. Sources : dépôt officiel Google Fonts, dossier `ofl/poppins`, fichiers Regular, SemiBold et Bold.

### Adaptation des enseignes Bolingo

Les enseignes visibles dans les photos et le libellé de la carte Contact ont été retouchés avec l’outil ImageGen natif. Consigne de retouche : remplacer uniquement « MEDORA » par « BOLINGO » sur les enseignes photographiées, conserver le cœur, le sous-titre « Clinique Médicale », la perspective, la lumière, l’architecture, le cadrage et les autres éléments de la maquette.

Fichiers enregistrés : `assets/images/reference-accueil-bolingo.png`, `assets/images/reference-apropos-bolingo.png` et `assets/images/reference-contact-bolingo.png`. Pour Contact, la consigne remplace uniquement MEDORA par BOLINGO sur le mur et l’étiquette de carte, en préservant le cœur, le sous-titre et les positions ; sortie 1312 × 1199 pixels. Leurs versions `.webp`, compressées sans perte, restent conservées. La référence Contact sert encore au plan ; les anciennes vues de façade et de réception ont été remplacées par les photos individuelles ci-dessous. Les captures d’origine restent conservées séparément.

### Portraits individuels des médecins

Les huit originaux sont conservés dans `assets/images/medecins/originaux/portrait-01.png` à `portrait-08.png`, dans l’ordre des pièces jointes. L’utilisateur a confirmé de conserver les noms des fiches et de répartir les portraits :

| Photo fournie | Fiche associée | Fichier affiché |
| --- | --- | --- |
| 1 | Dr Jean Mputu | `portrait-01-bolingo.webp` |
| 2 | Dr Nadia Kiala | `portrait-02-bolingo.webp` |
| 3 | Dr Fabrice Kalonji | `portrait-03-bolingo.webp` |
| 4 | Dr Emily Roberts | `portrait-04-bolingo.webp` |
| 5 | Dr Alain Tshiama | `portrait-05-bolingo.webp` |
| 6 | Dr Sarah Kabasele | `portrait-06-bolingo.webp` |
| 7 | Dr Chantal Moke | `portrait-07-bolingo.webp` |
| 8 | Dr Patrick Lumbu | `portrait-08-bolingo.webp` |

Toutes les variantes se trouvent dans `assets/images/medecins/`. Les fichiers `portrait-01-bolingo.png` à `portrait-08-bolingo.png` sont les éditions ImageGen natives ; leurs `.webp` pleine résolution mesurent également 1254 × 1254 pixels. Les variantes `-400.webp` et `-800.webp` réduisent uniquement la résolution, sans recadrage, pour `srcset`. La compression WebP est sans perte. Les dimensions HTML réservent la place des images ; le chargement différé et les tailles adaptées limitent les téléchargements.

Consigne commune aux huit éditions : remplacer seulement le mot « MEDORA » du panneau mural à droite par « BOLINGO », conserver le cœur et « Clinique Médicale », le visage, les cheveux, le corps, la pose, la blouse, le stéthoscope, la lumière, le décor et le cadrage carré complet de 1254 × 1254 pixels ; aucun zoom, recadrage ou nouvelle composition. La vérification visuelle confirme les cadrages et la marque. Une édition générative peut néanmoins modifier légèrement certaines textures hors du texte ; les originaux intacts permettent de revenir aux images fournies.

### Photos des services et de la clinique

Les six originaux fournis le 28 octobre sont conservés, sans modification, dans `assets/images/visuels/originaux/`. Les fichiers affichés se trouvent dans `assets/images/visuels/` :

| Photo fournie | Original conservé | Fichier affiché | Emplacement |
| --- | --- | --- | --- |
| 1 | `consultation.png` | `consultation.webp` | Introduction de l’Accueil |
| 2 | `facade.png` | `facade-bolingo.webp` | Résumé de la clinique sur Accueil et introduction À propos |
| 3 | `reception.png` | `reception-bolingo.webp` | Histoire dans À propos et introduction Contact |
| 4 | `salle-consultation.png` | `salle-consultation.webp` | Carte Médecine générale |
| 5 | `pediatrie.png` | `pediatrie.webp` | Carte Pédiatrie |
| 6 | `laboratoire.png` | `laboratoire-bolingo.webp` | Carte Analyses et laboratoire |

Consultation et pédiatrie mesurent 1536 × 1024 pixels ; les quatre autres images, 1672 × 941. Chaque fichier WebP possède aussi des variantes `-640.webp` et `-1024.webp`, utilisées dans `srcset`. Les 18 WebP sont compressés sans perte ; seule la résolution diminue dans les variantes, jamais le cadrage. Les trois photos sans enseigne sont converties directement depuis les originaux.

Façade, réception et laboratoire ont été adaptés séparément avec ImageGen natif ; les PNG édités `facade-bolingo.png`, `reception-bolingo.png` et `laboratoire-bolingo.png` sont conservés à côté de leurs versions WebP. Consigne de retouche : remplacer uniquement MEDORA par BOLINGO, garder le cœur, « Clinique Médicale », la perspective, les personnes, la lumière, l’architecture et l’ensemble des bords du panorama 1672 × 941 ; ne pas zoomer ou déplacer le point de vue. Pour la façade, remplacer les trois occurrences : grande enseigne, panneau à droite et petite plaque intérieure. Des microtextures peuvent légèrement différer après une édition générative ; les originaux restent disponibles.

Les trois cartes de service modifiées conservent un cadre commun, avec `object-fit: contain` et un fond pâle si les proportions ne coïncident pas. Les photos des introductions et de l’histoire gardent leur hauteur naturelle. Aucune nouvelle section n’a été ajoutée pour ces images.

## Ce qui fonctionne dans cette phase

- Navigation entre les pages et les cinq étapes.
- Accès à la page Contact ; mission, fiches de médecins et services par ancres.
- Formulaire Contact avec validation HTML native (champs requis et format e-mail), préparation du message dans la messagerie configurée du visiteur.
- Liens téléphone et e-mail ; plan local visible hors connexion et lien externe vers le quartier de la Gombe sur OpenStreetMap.
- Ouverture et fermeture des détails des cartes, y compris au clavier.
- Champs HTML et états visuels des contrôles natifs.
- Mise en page responsive, focus visible, lien d’évitement, titres hiérarchisés, libellés et alternatives textuelles.
- Respect de `prefers-reduced-motion`.

## Ce qui reste statique

| Fonction | Comportement actuel | Travail futur |
| --- | --- | --- |
| Recherche et filtres | Contrôles désactivés avec explication | Filtrage en JavaScript autorisé ou côté serveur |
| Service / médecin | Scénario fixe de médecine générale ; autres services affichés mais désactivés | Sélection et recommandation de médecins compatibles |
| Médecin alternatif | Un seul généraliste dans les références ; aucune alternative incompatible | Liste des autres médecins du même service |
| Calendrier / horaires | États illustratifs, sans disponibilité réelle | Disponibilités du médecin et de la salle |
| Informations patient | Champs modifiables, hors formulaire soumis, aucune transmission entre pages | Validation accessible, conservation contrôlée et traitement autorisé |
| Récapitulatif | Données fixes d’un patient fictif | Récapitulatif réel des choix et informations |
| Salle | Salle A-02 fictive | Attribution automatique par la logique métier |
| Confirmation | Bouton désactivé ; lien distinct vers un aperçu fictif | Vérification de disponibilité et enregistrement réussi |

Les sélections de dates/heures et les modifications des champs ne changent pas le récapitulatif. À la demande du responsable du projet, les explications de démonstration et de données fictives sont conservées dans ce README plutôt que dans l’interface. La confirmation demeure indisponible et ne déclenche aucun enregistrement. Aucun JavaScript, stockage local, cookie applicatif, appel réseau métier, backend, base de données ou authentification n’est présent. Le site ne transmet lui-même aucun e-mail : la page Contact délègue la préparation et l’envoi à la messagerie du visiteur via `mailto:`. Les saisies du parcours de réservation ne sont pas placées dans les URL. Le navigateur peut néanmoins appliquer ses propres fonctions de remplissage automatique.

Scénario commun : Médecine générale, Dr Jean Mputu, jeudi 5 novembre 2026 à 09 h 30 (Kinshasa), 30 minutes, salle A-02, patient « Alex Ilunga ». Il ne correspond à aucun rendez-vous enregistré.

## Fonctionnement de la page Contact

Le formulaire utilise `method="post"`, `enctype="text/plain"` et une destination `mailto:info@bolingo.cd`. Les cinq champs deviennent le corps d’un brouillon de message, suivant le [mécanisme HTML « Mail as body »](https://html.spec.whatwg.org/multipage/form-control-infrastructure.html#form-submission-algorithm). Le bouton « Préparer le message » annonce ce fonctionnement. Le visiteur doit disposer d’une messagerie configurée et envoyer le message lui-même ; sa réception n’est pas vérifiée par le site. Aucun service tiers de traitement de formulaire n’a été ajouté. Un envoi direct fiable depuis le site nécessitera un backend lors d’une phase autorisée.

Le plan est le visuel de la maquette, conservé localement et adapté à Bolingo. Son cadrage exclut les faux boutons de zoom. Il ne fournit pas de géolocalisation ni d’itinéraire calculé. Le lien externe recherche le quartier de la Gombe sur OpenStreetMap ; il ne prétend pas retrouver une clinique réelle à l’adresse d’exemple. Une future carte interactive nécessite un emplacement réel validé. Les noms de rues contenus dans le visuel ne constituent pas une source cartographique fiable.

## Données de démonstration

La clinique, son histoire, ses visuels, les huit professionnels, les expériences, notes et avis, les coordonnées, les horaires et les statistiques sont fictifs. Les chiffres « 5 000+ », « 15+ », « 10+ » et « 3+ » viennent de la maquette ; leur statut de données de démonstration est documenté ici. L’annuaire et le catalogue présentent seulement un échantillon de ce scénario fictif.

Le formulaire doit être testé uniquement avec des données fictives. Les messages d’erreur métier et la validation des étapes restent à développer dans la phase dynamique.

## Références encore attendues

- Les maquettes originales validées des cinq étapes et de l’écran de réussite : les écrans actuels sont une intégration provisoire du brief, sans prétendre reproduire cette version non fournie.
- Le cahier des charges universitaire original : la conformité a été évaluée par rapport au brief transmis, pas à un document absent.
- Les fichiers sources séparés du logo et de la typographie, ainsi que les photos de cardiologie, ophtalmologie et orthopédie. Les huit portraits et les six photos de consultation, locaux, pédiatrie et laboratoire sont reçus et intégrés.
- Les déclinaisons mobiles validées, si elles existent : les adaptations actuelles sont proposées à partir des captures d’ordinateur.

## Vérifications

Captures de l’Accueil conservées dans `verification/accueil-ordinateur.png` et `verification/accueil-mobile.png`. Les largeurs testées sont 1440, 768, 390 et 320 pixels ; aucun débordement horizontal détecté.

Les contrôles portent sur les onze pages : chemins et ancres locaux, références des styles, icônes et polices, titres principaux, identifiants uniques, libellés et références ARIA. La revue dans le navigateur vérifie les détails au clavier, les liens du parcours, l’absence de confirmation réelle, les images et les débordements aux largeurs d’ordinateur, tablette et téléphone. Ces contrôles ne constituent pas une certification d’accessibilité ni une comparaison aux maquettes de réservation absentes.

La page Contact a fait l’objet de contrôles supplémentaires : liens des onze pages, libellés et contraintes du formulaire, absence de débordement à 1440, 1024, 768, 390 et 320 pixels. La validation native bloque les champs requis vides et une adresse e-mail mal formée. Aucun e-mail n’a été envoyé pendant la vérification ; l’ouverture d’une messagerie configurée et la réception effective restent à vérifier sur l’appareil de l’utilisateur. Captures : `verification/contact-ordinateur.png` et `verification/contact-mobile.png`.

Les treize occurrences des huit portraits ont été vérifiées sur Accueil, Médecins et l’étape de choix du médecin à 1440, 768, 390 et 320 pixels : images carrées entières, aucune transformation de zoom, aucun débordement horizontal. Les 24 sources WebP (400, 800 et 1254 pixels) et les alternatives textuelles ont été contrôlées. Captures : `verification/medecins-portraits-ordinateur.png` et `verification/medecins-portraits-mobile.png`.

Les six nouveaux visuels (huit occurrences sur Accueil, Services, À propos et Contact) ont été contrôlés à 1440, 768, 390 et 320 pixels : aucune image manquante, aucun débordement horizontal, `object-fit: contain` et aucune transformation de zoom. Les 18 fichiers WebP et leurs dimensions déclarées sont vérifiés. Les captures Accueil et Contact sont actualisées ; les vues Services et À propos se trouvent dans `verification/services-ordinateur.png`, `services-mobile.png`, `apropos-ordinateur.png` et `apropos-mobile.png`.

Les ajouts pédagogiques ont été comparés à l’état précédant les commentaires : contenu HTML, attributs et règles CSS inchangés. Les dessins des icônes restent identiques après analyse XML. Le dernier contrôle des onze pages ne relève aucun chemin local ou ancre manquant, aucun identifiant dupliqué, aucune référence de label ou ARIA invalide, ni script ajouté.

Le site n’est pas déployé. Aucune opération Git destructive n’a été effectuée.

## Licence

Le code HTML/CSS, les icônes SVG et la documentation du projet sont distribués sous [licence MIT](LICENSE).

La police Poppins conserve sa licence [SIL Open Font License 1.1](assets/fonts/OFL.txt). Les images fournies pour le projet et leurs retouches sont des ressources d’illustration : elles ne sont pas couvertes par la licence MIT du code. Leur provenance et les transformations effectuées sont décrites dans ce README.
