import 'package:flutter/material.dart';
import 'movie.dart';

// --- Page de détail d'un film ---
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
            // --- Affiche du film avec coins arrondis ---
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
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
            ),
            const SizedBox(height: 16),

            // --- Note IMDb ---
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 28),
                  const SizedBox(width: 8),
                  Text(
                    movie.imdbRating,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    ' / 10',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // --- Carte des informations du film ---
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Informations',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(),
                    _buildInfoRow(Icons.calendar_today, 'Année', movie.year),
                    _buildInfoRow(Icons.movie_filter, 'Genre', movie.genre),
                    _buildInfoRow(Icons.timer, 'Durée', movie.runtime),
                    _buildInfoRow(Icons.person, 'Réalisateur', movie.director),
                    _buildInfoRow(Icons.people, 'Acteurs', movie.actors),
                    _buildInfoRow(Icons.language, 'Pays', movie.country),
                    _buildInfoRow(
                      Icons.emoji_events,
                      'Récompenses',
                      movie.awards,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // --- Carte du synopsis ---
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Synopsis',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(),
                    Text(movie.plot),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- Widget réutilisable pour une ligne d'information ---
  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.deepPurple),
          const SizedBox(width: 8),
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
