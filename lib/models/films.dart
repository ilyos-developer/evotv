import 'dart:convert';

import 'county.dart';
import 'genre.dart';

List<Film> filmFromJson(String str) => List<Film>.from(json.decode(str).map((x) => Film.fromJson(x)));

String filmToJson(List<Film> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Film {
  Film({
    this.id,
    this.titleRu,
    this.title,
    this.titleEn,
    this.slug,
    this.posterOriginal,
    this.ratingKp,
    this.ratingImdb,
    this.year,
    this.genres,
    this.countries,
  });

  int id;
  dynamic titleRu;
  String title;
  String titleEn;
  String slug;
  String posterOriginal;
  double ratingKp;
  double ratingImdb;
  int year;
  List<Genre> genres;
  List<Country> countries;

  factory Film.fromJson(Map<String, dynamic> json) => Film(
    id: json["id"],
    titleRu: json["title_ru"],
    title: json["title"],
    titleEn: json["title_en"],
    slug: json["slug"],
    posterOriginal: json["poster_original"],
    ratingKp: json["rating_kp"].toDouble(),
    ratingImdb: json["rating_imdb"].toDouble(),
    year: json["year"],
    genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
    countries: List<Country>.from(json["countries"].map((x) => Country.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title_ru": titleRu,
    "title": title,
    "title_en": titleEn,
    "slug": slug,
    "poster_original": posterOriginal,
    "rating_kp": ratingKp,
    "rating_imdb": ratingImdb,
    "year": year,
    "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
    "countries": List<dynamic>.from(countries.map((x) => x.toJson())),
  };
}
