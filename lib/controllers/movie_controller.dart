import 'package:flutter/material.dart';
import 'package:tmdb_clone_app/models/movie_response_model.dart';
import 'package:tmdb_clone_app/repository/movieRepository.dart';

class MovieController extends ChangeNotifier {
  final _repository = new MovieRepository();

  MovieResponseModel movieResponseModel;

  Future<MovieResponseModel> fetchAllMovies({@required int page}) async {
    movieResponseModel = await _repository.getMovies(page: page);
    return movieResponseModel;
  }
}