import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmdb_clone_app/controllers/movie_controller.dart';
import 'package:tmdb_clone_app/models/movie_response_model.dart';
import 'package:tmdb_clone_app/pages/movie_detail_module/movie_detail_page.dart';
import 'package:transparent_image/transparent_image.dart';

class HomePage extends StatefulWidget {
  static final String route = '/home';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int page = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffb42423a),
      appBar: AppBar(
        title: Text('TMDB App'),
        backgroundColor: Colors.red[400],
        actions: [
          GestureDetector(
            child: Icon(
              Icons.arrow_back_outlined,
              color: Colors.white,
            ),
            onTap: () {
              if (page != 1) {
                setState(() {
                  page--;
                });
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                '$page',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          GestureDetector(
            child: Icon(
              Icons.arrow_forward_outlined,
              color: Colors.white,
            ),
            onTap: () {
              setState(() {
                page++;
              });
            },
          ),
        ],
      ),
      body: FutureBuilder<MovieResponseModel>(
          future: context.watch<MovieController>().fetchAllMovies(page: page),
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
                    child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image:
                            'https://image.tmdb.org/t/p/w220_and_h330_face/${snapshot.data.results[index].posterPath}'),
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
