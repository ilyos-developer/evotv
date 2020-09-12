part of 'film_bloc.dart';

@immutable
abstract class FilmEvent {}

class InitialRequestEvent extends FilmEvent {}

class NextPageEvent extends FilmEvent {}
