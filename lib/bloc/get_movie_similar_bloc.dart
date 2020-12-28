import 'package:flutter/material.dart';
import 'package:flutter_movie_app/model/cast_response.dart';
import 'package:flutter_movie_app/model/movie_response.dart';
import 'package:flutter_movie_app/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class SimilarMoviesBloc{
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<MovieResponse> _subject = BehaviorSubject<MovieResponse>();

  getSimilarMovies(int id) async{
    MovieResponse responese = await _repository.getSimilarMovies(id);
    _subject.sink.add(responese);
  }

  void drainStream(){_subject.value = null;}

  @mustCallSuper
  void dispose()async{
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<MovieResponse> get subject => _subject;

}

final similarMoviesBloc = SimilarMoviesBloc();