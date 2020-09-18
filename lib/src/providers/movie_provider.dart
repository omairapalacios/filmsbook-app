import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:movies_app/src/models/movie_model.dart';

class MovieProvider {
  String _apikey = 'c088b6b129a0132a0a215a05a106d260';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';

  int _popularsPage = 0;
  bool _loading = false;
  //stream
  List<Movie> _popularsMovies = new List();

  final _popularsStreamController = StreamController<List<Movie>>.broadcast();

  // insert data to stream
  Function(List<Movie>) get popularsSink => _popularsStreamController.sink.add;

  // listen data
  Stream<List<Movie>> get popularsStream => _popularsStreamController.stream;

  // close  stream
  void disposeStream() {
    _popularsStreamController?.close();
  }

  Future<List<Movie>> _processResult(Uri url) async {
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final movies = new Movies.fromJsonList(decodedData['results']);

    return movies.items;
  }

  Future<List<Movie>> getMoviesCinema() async {
    final url = Uri.https(_url, '3/movie/now_playing',
        {'api_key': _apikey, 'language': _language});

    return await _processResult(url);
  }

  Future<List<Movie>> getPopularMovies() async {
    
    if (_loading) return [];

    _loading = true;
    _popularsPage++;

    final url = Uri.https(_url, '3/movie/popular', {
      'api_key': _apikey,
      'language': _language,
      'page': _popularsPage.toString(),
    });

    final resp = await _processResult(url);

    // add movies to stream
    _popularsMovies.addAll(resp);
    popularsSink(_popularsMovies);

    _loading = false;

    return resp;
  }
}
