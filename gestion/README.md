# BOLINGO — Maquette de gestion HTML/CSS

Ouvrir [html/index.html](html/index.html) directement dans un navigateur. Aucun serveur, JavaScript ou PHP n’est nécessaire à cette étape.

## Contenu et organisation

Les neuf pages sont dans `html/` : tableau de bord, rendez-vous, patients, médecins, spécialités, salles, rapports, paramètres et connexion. Les feuilles de style sont dans `css/` et les ressources communes dans `../public/assets/`.

Excel sert uniquement de référence à la structure des champs. Les dossiers du classeur ne sont plus copiés dans les pages. Quelques exemples fictifs, utilisés uniquement pour présenter les pages, montrent le rendu : 3 patients, 3 médecins, 2 salles et 3 rendez-vous. Les chiffres des rapports sont eux aussi fictifs.

## Interactions et limites

La navigation, les fiches par ancre et les sections `details`/`summary` fonctionnent sans script. Les champs de saisie sont hors formulaire actif et aucun enregistrement ne se produit. Recherche, confirmation, report, annulation et export PDF restent désactivés jusqu’au raccordement.

Le registre HTML complet et le PDF prérempli ont été supprimés. Le bouton « Télécharger en PDF » présente la fonction à venir, sans lien vers un document figé. PHP devra produire le PDF depuis la liste enregistrée en MySQL, après validation des ajouts.

Les noms de champs sont documentés dans [DONNEES.md](DONNEES.md), ainsi que le futur parcours ajout → enregistrement → liste actualisée → PDF. Aucun backend ou import Excel n’est implémenté.

## Vérification

Contrôler les liens, les ancres, les libellés et l’absence de script ou de formulaire soumis. Vérifier que les identifiants de dossiers affichés sont tous fictifs. Les captures de versions précédentes sont historiques et ne prouvent pas le rendu actuel.

Aucun commit ni déploiement effectué.

Contrôle statique de cette correction : neuf pages, 293 références locales et 236 champs vérifiés sans défaut. Aucun identifiant de dossier source ni lien vers l’ancien registre/PDF ne subsiste dans le HTML. Classeur source inchangé (empreinte vérifiée). Le rendu navigateur de cette correction n’a pas été revérifié.

Présentation du 30 octobre 2026 : les bandeaux de maquette et les explications techniques sont retirés des pages visibles. Les données restent fictives et les actions nécessitant le backend restent désactivées. Les limites sont documentées ici, sans encombrer les écrans.
