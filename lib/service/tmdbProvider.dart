import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tmdb_clone_app/models/movie_response_model.dart';

class TmdbProvider {
  static const URL_BASE = 'https://api.themoviedb.org/3';
  static const API_KEY = '58f7316d5c64c4dc374a2889b894b34b';

  Future<MovieResponseModel> fetchAllMovies({int page}) async {
    MovieResponseModel movieResponseModel;
    try {
      final response = await http
          .get(Uri.parse('$URL_BASE/movie/popular?api_key=$API_KEY&language=pt-BR&page=$page'));
      if (response.statusCode == 200) {
        movieResponseModel = MovieResponseModel.fromJson(jsonDecode(response.body));
      } else {
        print('STATUS DIFERENTE DE 200');
        print('STATUS CODE: ${response.statusCode}');
      }
    } catch (exception, stacktrace) {
      print('Uma expcetion foi encontrada: $exception');
      print('O stackTrace foi: $stacktrace');
    }
    return movieResponseModel;
  }
}
