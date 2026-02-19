# Movie List

Application Flutter qui affiche une liste de films à partir d'un fichier JSON.

## Fonctionnalités

- Affichage des films triés par note IMDb décroissante
- Grille responsive (2, 3 ou 4 colonnes selon la largeur d'écran)
- Barre de recherche pour filtrer les films par nom
- Page de détail avec informations complètes sur le film
- Navigation avec transition en fondu (fade)
- Thème sombre avec fond gris anthracite
- Gestion des images cassées (placeholder avec icône)
- Tests unitaires (désérialisation JSON, tri par note)

## Structure du projet

```
lib/
  main.dart              # Point d'entrée, thème, page d'accueil et grille de films
  movie.dart             # Modèle Movie avec désérialisation JSON
  movie_detail_page.dart # Page de détail d'un film
assets/
  movies.json            # Données des films au format JSON
test/
  movie_test.dart        # Tests unitaires du modèle Movie
  widget_test.dart       # Tests des widgets
```

## Prérequis

- Flutter SDK (>= 3.11.0)
- Dart SDK (>= 3.11.0)
- Xcode (pour iOS simulator)
- Chrome (pour le web)

## Lancer l'application

```bash
# Sur le simulateur iOS
flutter run

# Sur Chrome
flutter run -d chrome
```

> **Note :** Ne pas placer le projet dans un dossier synchronisé par iCloud Drive (ex: ~/Documents), cela casse le codesigning iOS.

## Lancer les tests

```bash
flutter test
```

## Données

Les films sont chargés depuis `assets/movies.json` et contiennent : titre, année, genre, réalisateur, acteurs, synopsis, affiche, note IMDb, pays, langue et récompenses.
