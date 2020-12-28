import 'package:flutter/material.dart';
import 'package:flutter_movie_app/model/cast_response.dart';
import 'package:flutter_movie_app/model/movie_detail_response.dart';
import 'package:flutter_movie_app/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class MovieDetailBloc{
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<MovieDetailResponse> _subject = BehaviorSubject<MovieDetailResponse>();

  getMovieDetail(int id) async{
    MovieDetailResponse responese = await _repository.getMovieDetail(id);
    _subject.sink.add(responese);
  }

  void drainStream(){_subject.value = null;}

  @mustCallSuper
  void dispose()async{
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<MovieDetailResponse> get subject => _subject;

}

final movieDetailBloc = MovieDetailBloc();