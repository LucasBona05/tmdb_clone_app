import 'package:flutter/cupertino.dart';
import 'package:tmdb_clone_app/models/movie_response_model.dart';
import 'package:tmdb_clone_app/service/tmdbProvider.dart';

class MovieRepository {
  TmdbProvider _tmdbProvider = TmdbProvider();

  Future<MovieResponseModel> getMovies() {
    return _tmdbProvider.fetchAllMovies();
  }
}