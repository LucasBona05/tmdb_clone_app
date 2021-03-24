import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:tmdb_clone_app/models/movie_model.dart';

class MovieDetailPage extends StatefulWidget {
  static final String route = '/moviedetail';
  final MovieModel movie;
  MovieDetailPage({this.movie});
  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffb42423a),
      appBar:
          AppBar(title: Text('${widget.movie.title}'), backgroundColor: Colors.red[400]),
      body: ListView(
        children: [
          Image.network(
              'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/${widget.movie.backdropPath}'),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.favorite, color: Colors.red),
                    SizedBox(width: 8.0),
                    Text(
                      '${widget.movie.voteAverage}',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
                Chip(
                  backgroundColor: Colors.red[400],
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Icon(
                      Icons.calendar_today,
                      size: 18,
                      color: Colors.white,
                    ),
                  ),
                  label: Text(
                    DateFormat('dd/MM/yyyy').format(widget.movie.releaseDate),
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Text(
              '${widget.movie.overview}',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
