import 'package:flutter_movie_app/model/cast.dart';

class CastResponese{
  final List<Cast> casts;
  final String error;

  CastResponese(this.casts, this.error);

  CastResponese.fromJson(Map<String, dynamic> json)
  : casts = (json["cast"] as List).map((i) => new Cast.fromJson(i)).toList(),
  error = "";

  CastResponese.withError(String errorValue)
  : casts = List(),
  error = errorValue;
}