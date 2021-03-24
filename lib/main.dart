import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmdb_clone_app/controllers/movie_controller.dart';
import 'package:tmdb_clone_app/pages/home_module/home_page.dart';
import 'package:tmdb_clone_app/pages/movie_detail_module/movie_detail_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MovieController(),  //Instancia do provider
        )
      ],
      child: new MaterialApp(
        title: 'TMDB App',
        debugShowCheckedModeBanner: false,
        initialRoute: HomePage.route,
        routes: {
          HomePage.route: (context) => HomePage(),
          MovieDetailPage.route: (context) => MovieDetailPage(),
        },
      ),
    ),
  );
}
