import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movit_bloc/models/films.dart';
import 'package:movit_bloc/repositories/http_client.dart';

part 'film_event.dart';

part 'film_state.dart';

class FilmBloc extends Bloc<FilmEvent, FilmState> {
  int _page = 1;

  FilmBloc() : super(FilmInitialState());

  @override
  Stream<FilmState> mapEventToState(
    FilmEvent event,
  ) async* {
    if (event is InitialRequestEvent) {
      print("line 21");
      yield FilmInitialState();
      // try {
      List<Film> film = await HttpClient.getFilms(page: _page);
      print("line 25 " + film[1].title);
      yield LoadedFilmState(films: film);
      // } catch (e) {
      //   print("line 27 $e");
      // }
    }
  }
}
