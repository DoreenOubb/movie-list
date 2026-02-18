import 'package:flutter_test/flutter_test.dart';
import 'package:movie_list/movie.dart';

void main() {
  group('Movie class', () {
    test('fromJson crée un Movie avec les bonnes propriétés', () {
      final json = {
        'Title': 'Avatar',
        'Year': '2009',
        'Rated': 'PG-13',
        'Released': '18 Dec 2009',
        'Runtime': '162 min',
        'Genre': 'Action, Adventure, Fantasy',
        'Director': 'James Cameron',
        'Writer': 'James Cameron',
        'Actors': 'Sam Worthington, Zoe Saldana',
        'Plot': 'A paraplegic marine...',
        'Poster': 'https://example.com/avatar.jpg',
        'imdbRating': '7.9',
        'Country': 'USA',
        'Language': 'English',
        'Awards': 'Won 3 Oscars.',
      };

      final movie = Movie.fromJson(json);

      expect(movie.title, 'Avatar');
      expect(movie.year, '2009');
      expect(movie.rated, 'PG-13');
      expect(movie.released, '18 Dec 2009');
      expect(movie.runtime, '162 min');
      expect(movie.genre, 'Action, Adventure, Fantasy');
      expect(movie.director, 'James Cameron');
      expect(movie.writer, 'James Cameron');
      expect(movie.actors, 'Sam Worthington, Zoe Saldana');
      expect(movie.plot, 'A paraplegic marine...');
      expect(movie.poster, 'https://example.com/avatar.jpg');
      expect(movie.imdbRating, '7.9');
      expect(movie.country, 'USA');
      expect(movie.language, 'English');
      expect(movie.awards, 'Won 3 Oscars.');
    });

    test('fromJson fonctionne avec une note N/A', () {
      final json = {
        'Title': 'Doctor Strange',
        'Year': '2016',
        'Rated': 'PG-13',
        'Released': '04 Nov 2016',
        'Runtime': '115 min',
        'Genre': 'Action, Adventure, Fantasy',
        'Director': 'Scott Derrickson',
        'Writer': 'Jon Spaihts',
        'Actors': 'Benedict Cumberbatch',
        'Plot': 'A former neurosurgeon...',
        'Poster': 'https://example.com/strange.jpg',
        'imdbRating': 'N/A',
        'Country': 'USA',
        'Language': 'English',
        'Awards': 'N/A',
      };

      final movie = Movie.fromJson(json);

      expect(movie.title, 'Doctor Strange');
      expect(movie.imdbRating, 'N/A');
    });
  });

  group('Tri des films', () {
    test('les films sont triés par note décroissante', () {
      final movies = [
        Movie(
          title: 'Film A', year: '2020', rated: 'PG', released: '2020',
          runtime: '120 min', genre: 'Action', director: 'Dir A',
          writer: 'Wr A', actors: 'Act A', plot: 'Plot A',
          poster: 'url', imdbRating: '6.5', country: 'US',
          language: 'EN', awards: 'None',
        ),
        Movie(
          title: 'Film B', year: '2021', rated: 'PG', released: '2021',
          runtime: '90 min', genre: 'Drama', director: 'Dir B',
          writer: 'Wr B', actors: 'Act B', plot: 'Plot B',
          poster: 'url', imdbRating: '9.0', country: 'US',
          language: 'EN', awards: 'Oscar',
        ),
        Movie(
          title: 'Film C', year: '2019', rated: 'R', released: '2019',
          runtime: '110 min', genre: 'Comedy', director: 'Dir C',
          writer: 'Wr C', actors: 'Act C', plot: 'Plot C',
          poster: 'url', imdbRating: '7.8', country: 'US',
          language: 'EN', awards: 'None',
        ),
      ];

      movies.sort(
        (a, b) => (double.tryParse(b.imdbRating) ?? 0)
            .compareTo(double.tryParse(a.imdbRating) ?? 0),
      );

      expect(movies[0].title, 'Film B');
      expect(movies[1].title, 'Film C');
      expect(movies[2].title, 'Film A');
    });

    test('les films avec note N/A sont à la fin', () {
      final movies = [
        Movie(
          title: 'Film N/A', year: '2020', rated: 'PG', released: '2020',
          runtime: '120 min', genre: 'Action', director: 'Dir',
          writer: 'Wr', actors: 'Act', plot: 'Plot',
          poster: 'url', imdbRating: 'N/A', country: 'US',
          language: 'EN', awards: 'None',
        ),
        Movie(
          title: 'Film 8', year: '2021', rated: 'PG', released: '2021',
          runtime: '90 min', genre: 'Drama', director: 'Dir',
          writer: 'Wr', actors: 'Act', plot: 'Plot',
          poster: 'url', imdbRating: '8.0', country: 'US',
          language: 'EN', awards: 'None',
        ),
      ];

      movies.sort(
        (a, b) => (double.tryParse(b.imdbRating) ?? 0)
            .compareTo(double.tryParse(a.imdbRating) ?? 0),
      );

      expect(movies[0].title, 'Film 8');
      expect(movies[1].title, 'Film N/A');
    });
  });

  group('Recherche de films', () {
    final movies = [
      Movie(
        title: 'Avatar', year: '2009', rated: 'PG-13', released: '2009',
        runtime: '162 min', genre: 'Action', director: 'James Cameron',
        writer: 'James Cameron', actors: 'Sam Worthington', plot: 'Plot',
        poster: 'url', imdbRating: '7.9', country: 'USA',
        language: 'English', awards: 'Won 3 Oscars.',
      ),
      Movie(
        title: 'Interstellar', year: '2014', rated: 'PG-13', released: '2014',
        runtime: '169 min', genre: 'Sci-Fi', director: 'Christopher Nolan',
        writer: 'Jonathan Nolan', actors: 'Matthew McConaughey', plot: 'Plot',
        poster: 'url', imdbRating: '8.6', country: 'USA',
        language: 'English', awards: 'Won 1 Oscar.',
      ),
      Movie(
        title: 'The Avengers', year: '2012', rated: 'PG-13', released: '2012',
        runtime: '143 min', genre: 'Action', director: 'Joss Whedon',
        writer: 'Joss Whedon', actors: 'Robert Downey Jr.', plot: 'Plot',
        poster: 'url', imdbRating: '8.1', country: 'USA',
        language: 'English', awards: 'Nominated for 1 Oscar.',
      ),
    ];

    test('recherche "vatar" retourne Avatar', () {
      final result = movies.where((movie) =>
        movie.title.toLowerCase().contains('vatar')
      ).toList();

      expect(result.length, 1);
      expect(result[0].title, 'Avatar');
    });

    test('recherche "inter" retourne Interstellar', () {
      final result = movies.where((movie) =>
        movie.title.toLowerCase().contains('inter')
      ).toList();

      expect(result.length, 1);
      expect(result[0].title, 'Interstellar');
    });

    test('recherche vide retourne tous les films', () {
      final result = movies.where((movie) =>
        movie.title.toLowerCase().contains('')
      ).toList();

      expect(result.length, 3);
    });

    test('recherche insensible aux majuscules', () {
      final result = movies.where((movie) =>
        movie.title.toLowerCase().contains('AVATAR'.toLowerCase())
      ).toList();

      expect(result.length, 1);
      expect(result[0].title, 'Avatar');
    });

    test('recherche sans résultat retourne une liste vide', () {
      final result = movies.where((movie) =>
        movie.title.toLowerCase().contains('xyz123')
      ).toList();

      expect(result.length, 0);
    });
  });
}
