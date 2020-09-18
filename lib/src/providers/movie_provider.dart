import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:movies_app/src/models/movie_model.dart';

class MovieProvider {
  String _apikey = 'c088b6b129a0132a0a215a05a106d260';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';

  Future<List<Movie>> getMovieCinema() async {
    final url = Uri.https(_url, '3/movie/now_playing',
        {'api_key': _apikey, 'language': _language});

    final resp = await http.get(url);

    final decodedData = json.decode(resp.body);

    final movies = new Movies.fromJsonList(decodedData['results']);


    return movies.items;
  }
}
