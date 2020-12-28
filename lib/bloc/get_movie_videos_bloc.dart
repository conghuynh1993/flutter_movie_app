import 'package:flutter/material.dart';
import 'package:flutter_movie_app/model/cast_response.dart';
import 'package:flutter_movie_app/model/movie_detail_response.dart';
import 'package:flutter_movie_app/model/video_response.dart';
import 'package:flutter_movie_app/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class MovieVideoslBloc{
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<VideoResponse> _subject = BehaviorSubject<VideoResponse>();

  getMovieVideo(int id) async{
    VideoResponse responese = await _repository.getMovieVideos(id);
    _subject.sink.add(responese);
  }

  void drainStream(){_subject.value = null;}

  @mustCallSuper
  void dispose()async{
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<VideoResponse> get subject => _subject;

}

final movieVideosBloc = MovieVideoslBloc();