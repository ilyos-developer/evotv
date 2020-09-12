import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:movit_bloc/models/films.dart';
import 'package:movit_bloc/models/user.dart';

class HttpClient {

  static final _storage = new FlutterSecureStorage();
  static final baseUrl = 'http://evoit.uz/restapi/v1';
  final http.Client httpClient = http.Client();

  static Future<Map<String, String>> _getHeaders() async {
    String value = await _storage.read(key: 'userToken');
    return {"Authorization": "Token $value"};
  }

  static Future fetchSendPhoneNumber(int number) async {
    var url = '$baseUrl/accounts/send-phone/';
    var response = await http.post(url, body: {'phone': '$number'});
    print('Response body: ${response.body}');

    if(response.statusCode == 200) {
      return number;
    }
  }

  static Future fetchValidateCode(int number, int code) async {
    var url = '$baseUrl/accounts/send-code/';
    var response =
    await http.post(url, body: {'phone': '$number', 'code': '$code'});
    print('Response body: ${json.decode(utf8.decode(response.bodyBytes))}');

    if (response.statusCode == 200) {
      final jsonData = json.decode(utf8.decode(response.bodyBytes));
      final user = User.fromJson(jsonData);
      if (user.status == 'ok') {
        return user;
      }
      if (user.status == "error") {
        print(user.message);
      }
    }
  }

  static Future getFilms({Map filters, int page}) async {
    var response;
    String query = "";
    if (filters != null && filters.isNotEmpty) {
      String movieName = filters["movieName"];
      List genres = filters["genres"];
      List countries = filters["countries"];
      List years = filters["year"];
      if (movieName.isNotEmpty) {
        query += "?search=" +
            movieName;
      }
      if (genres.isNotEmpty) {
        query += "?genre=" +
            genres
                .toString()
                .replaceAll("[", "")
                .replaceAll("]", "")
                .replaceAll(" ", "");
      }
      if (countries.isNotEmpty) {
        query += query.isEmpty ? "?" : "&";
        query += "countries=" +
            countries
                .toString()
                .replaceAll("[", "")
                .replaceAll("]", "")
                .replaceAll(" ", "");
      }
      if (years.isNotEmpty) {
        query += query.isEmpty ? "?" : "&";
        query += "year=" +
            years
                .toString()
                .replaceAll("[", "")
                .replaceAll("]", "")
                .replaceAll(" ", "");
      }
    }
    print(query);
    Uri url = Uri.parse('$baseUrl/movies/films/?page=$page' + query);
    response = await http.get(url, headers: await _getHeaders());
//    print('Response body: ${json.decode(utf8.decode(response.bodyBytes))}');
    final jsonData = utf8.decode(response.bodyBytes);
    final film = filmFromJson(jsonData);
    return film;
  }


}