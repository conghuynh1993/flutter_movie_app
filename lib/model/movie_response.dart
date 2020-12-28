import 'movie.dart';

class MovieResponse{
  List<Movie> movies;
  String error;

  MovieResponse(this.movies, this.error);

  MovieResponse.fromJson(Map<String, dynamic> json)
    : movies = (json['results'] as List).map((i) => new Movie.fromJson(i)).toList(),
  error = "";

  MovieResponse.withError(String errorValue)
  : movies = List(),
  error = errorValue;
}