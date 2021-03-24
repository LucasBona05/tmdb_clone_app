import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmdb_clone_app/controllers/movie_controller.dart';
import 'package:tmdb_clone_app/models/movie_response_model.dart';
import 'package:tmdb_clone_app/pages/movie_detail_module/movie_detail_page.dart';

class HomePage extends StatefulWidget {
  static final String route = '/home';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffb42423a),
      appBar: AppBar(
        title: Text('TMDB App'),
        backgroundColor: Colors.red[400],
      ),
      body: FutureBuilder<MovieResponseModel>(
          future: context.watch<MovieController>().fetchAllMovies(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                    childAspectRatio: 0.65),
                itemCount: snapshot.data.results.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => MovieDetailPage(
                                  movie: snapshot.data.results[index])));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://image.tmdb.org/t/p/w220_and_h330_face/${snapshot.data.results[index].posterPath}'),
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
