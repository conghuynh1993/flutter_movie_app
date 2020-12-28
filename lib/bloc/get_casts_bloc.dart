import 'package:flutter/material.dart';
import 'package:flutter_movie_app/model/cast_response.dart';
import 'package:flutter_movie_app/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class CastsBloc{
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<CastResponese> _subject = BehaviorSubject<CastResponese>();

  getCasts(int id) async{
    CastResponese responese = await _repository.getCasts(id);
    _subject.sink.add(responese);
  }

  void drainStream(){_subject.value = null;}

  @mustCallSuper
  void dispose()async{
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<CastResponese> get subject => _subject;

}

final castsBloc = CastsBloc();