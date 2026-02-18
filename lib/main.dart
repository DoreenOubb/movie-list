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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Movies')),
      body: FutureBuilder<List<Movie>>(
        future: loadMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          }
          final movies = snapshot.data!;
          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return ListTile(
                leading: Image.network(movie.poster, width: 50),
                title: Text(movie.title),
                subtitle: Text(movie.genre),
              );
            },
          );
        },
      ),
    );
  }
}
