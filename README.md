# Movie List

Application Flutter qui affiche une liste de films à partir d'un fichier JSON.

## Fonctionnalités

- Affichage des films triés par note IMDb décroissante
- Affiche, titre et genre visibles dans un ListView
- Barre de recherche pour filtrer les films par nom (recherche type SQL LIKE)
- Page de détail avec informations complètes sur le film
- Navigation entre les pages avec bouton retour

## Structure du projet

```
lib/
  main.dart       # Point d'entrée, page d'accueil et ListView
  movie.dart      # Classe Movie avec désérialisation JSON
assets/
  movies.json     # Données des films au format JSON
```

## Prérequis

- Flutter SDK (>= 3.11.0)
- Dart SDK (>= 3.11.0)

## Lancer l'application

```bash
flutter run -d chrome
```

## Données

Les films sont chargés depuis `assets/movies.json` et contiennent : titre, année, genre, réalisateur, acteurs, synopsis, affiche, note IMDb, et plus encore.
