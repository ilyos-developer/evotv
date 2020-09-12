part of 'film_bloc.dart';

@immutable
abstract class FilmState {}

class FilmInitialState  extends FilmState {}

class LoadedFilmState extends FilmState {
  final List<Film> films;

  LoadedFilmState({this.films});
}