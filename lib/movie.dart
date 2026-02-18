// La classe Movie avec les propriétés demandées

class Movie {
  final String title;
  final String year;
  final String rated;
  final String released;
  final String runtime;
  final String genre;
  final String director;
  final String writer;
  final String actors;
  final String plot;
  final String poster;
  final String imdbRating;
  final String country;
  final String language;
  final String awards;

  Movie({
    required this.title,
    required this.year,
    required this.rated,
    required this.released,
    required this.runtime,
    required this.genre,
    required this.director,
    required this.writer,
    required this.actors,
    required this.plot,
    required this.poster,
    required this.imdbRating,
    required this.country,
    required this.language,
    required this.awards,
  });
  // Méthode pour créer une instance de Movie à partir d'un JSON
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['Title'],
      year: json['Year'],
      rated: json['Rated'],
      released: json['Released'],
      runtime: json['Runtime'],
      genre: json['Genre'],
      director: json['Director'],
      writer: json['Writer'],
      actors: json['Actors'],
      plot: json['Plot'],
      poster: json['Poster'],
      imdbRating: json['imdbRating'],
      country: json['Country'],
      language: json['Language'],
      awards: json['Awards'],
    );
  }
}
