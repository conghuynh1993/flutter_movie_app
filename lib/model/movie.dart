class Movie {
  int id;
  double popularity;
  String title;
  String backPoster;
  String poster;
  String overView;
  double rating;

  Movie(
    this.id,
    this.popularity,
    this.title,
    this.backPoster,
    this.rating,
    this.overView,
    this.poster,
  );
  Movie.fromJson(Map<String, dynamic> json)
  : id = json['id'],
    popularity = json['popularity'].toDouble(),
  title = json['title'],
  backPoster = json['backdrop_path'],
  poster = json['poster_path'],
        overView = json['overview'],
  rating = json['vote_average'].toDouble();

}
