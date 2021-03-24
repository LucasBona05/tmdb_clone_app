import 'dart:convert';

import 'package:tmdb_clone_app/models/movie_model.dart';

MovieResponseModel movieResponseModelFromJson(String str) => MovieResponseModel.fromJson(json.decode(str));

String movieResponseModelToJson(MovieResponseModel data) => json.encode(data.toJson());

class MovieResponseModel {
    MovieResponseModel({
        this.page,
        this.results,
        this.totalPages,
        this.totalResults,
    });

    int page;
    List<MovieModel> results;
    int totalPages;
    int totalResults;

    factory MovieResponseModel.fromJson(Map<String, dynamic> json) => MovieResponseModel(
        page: json["page"],
        results: List<MovieModel>.from(json["results"].map((x) => MovieModel.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
    };
}