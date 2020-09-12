import 'dart:convert';

List<Genre> genreFromJson(String str) => List<Genre>.from(json.decode(str).map((x) => Genre.fromJson(x)));

String genreToJson(List<Genre> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Genre {
  Genre({
    this.id,
    this.name,
    this.slug,
  });

  int id;
  String name;
  String slug;

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
  };
}
