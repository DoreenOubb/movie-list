import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'movie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomePage(),
    );
  }
}

Future<List<Movie>> loadMovies() async {
  final String data = await rootBundle.loadString('assets/movies.json');
  final List<dynamic> jsonList = json.decode(data);
  List<Movie> movies = jsonList.map((json) => Movie.fromJson(json)).toList();
  movies.sort(
    (a, b) => (double.tryParse(b.imdbRating) ?? 0).compareTo(
      double.tryParse(a.imdbRating) ?? 0,
    ),
  );
  return movies;
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _searchQuery = '';
  late Future<List<Movie>> _moviesFuture;

  @override
  void initState() {
    super.initState();
    _moviesFuture = loadMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Movies')),
      body: FutureBuilder<List<Movie>>(
        future: _moviesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          }
          final movies = snapshot.data!;
          final filteredMovies = movies
              .where(
                (movie) => movie.title.toLowerCase().contains(
                  _searchQuery.toLowerCase(),
                ),
              )
              .toList();
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'Rechercher un film',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredMovies.length,
                  itemBuilder: (context, index) {
                    final movie = filteredMovies[index];
                    return ListTile(
                      leading: Image.network(
                        movie.poster,
                        width: 50,
                        errorBuilder: (context, error, stackTrace) {
                          return const SizedBox(
                            width: 50,
                            height: 50,
                            child: Icon(Icons.movie),
                          );
                        },
                      ),
                      title: Text(movie.title),
                      subtitle: Text(movie.genre),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
