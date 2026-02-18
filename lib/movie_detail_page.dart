import 'package:flutter/material.dart';
import 'movie.dart';

class MovieDetailPage extends StatelessWidget {
  final Movie movie;

  const MovieDetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                movie.poster,
                height: 300,
                errorBuilder: (context, error, stackTrace) {
                  return const SizedBox(
                    height: 300,
                    child: Icon(Icons.movie, size: 100),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Text(
              movie.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Année: ${movie.year}'),
            Text('Genre: ${movie.genre}'),
            Text('Durée: ${movie.runtime}'),
            Text('Réalisateur: ${movie.director}'),
            Text('Acteurs: ${movie.actors}'),
            Text('Note IMDb: ${movie.imdbRating}'),
            Text('Pays: ${movie.country}'),
            Text('Récompenses: ${movie.awards}'),
            const SizedBox(height: 16),
            const Text(
              'Synopsis:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(movie.plot),
          ],
        ),
      ),
    );
  }
}
