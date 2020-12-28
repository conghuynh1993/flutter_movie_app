import 'package:flutter_movie_app/model/video.dart';

class VideoResponse{
  final List<Video> videos;
  final String error;

  VideoResponse(this.error,this.videos);

  VideoResponse.fromJson(Map<String, dynamic> json)
  : videos = (json["results"] as List).map((i) => new Video.fromJson(i)).toList(),
  error = "";

  VideoResponse.withError(String errorValue)
  : videos = List(),
  error = errorValue;
}