import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:movies_2/movies_list.dart';
import 'package:movies_2/movies_list_error.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  MoviesList? movies;
  MoviesListError? moviesListError;

  Future<void> _getListagemAPI() async {
    await Future.delayed(const Duration(seconds: 5));
    http.get(
      Uri.https('api.themoviedb.org', '/4/list/1'),
      headers: {
        'Authorization': 'Bearer <access token>',
        'accept': 'application/json'
      },
    ).then((Response value) {
      if (value.statusCode == 200) {
        movies = MoviesList.fromJson(jsonDecode(value.body));
        print(movies.toString());
      } else if (value.statusCode == 401) {
        moviesListError = MoviesListError.fromJson(jsonDecode(value.body));
      } else {
        print('Erro desconhecido');
      }
    }).whenComplete(() => setState(() {}));
  }

  @override
  void initState() {
    super.initState();
    _getListagemAPI();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Center(
          child: moviesListError != null
              ? Text(moviesListError!.toString())
              : Text(
                  'Movie: ${movies?.name ?? "Erro"}',
                  style: TextStyle(color: Colors.white),
                ),
        ),
      ),
    );
  }
}
