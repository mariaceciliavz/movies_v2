import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  void _getListagemAPI() {
    http.get(
      Uri.https('api.themoviedb.org', '/4/list/1'),
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3OGFiOWY2M2UzZmNjM2Y5OWExNjYxYmQ0NGQ0MWVkMyIsIm5iZiI6MTc0MDQyNTczMy42NzUsInN1YiI6IjY3YmNjYTA1YTFlNmZiOTNjMjZiZGM0YSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.s5SyCb3YYPE2zmqzJxoOEtcFgmfWOfIerYV9TIkT31A',
        'accept': 'application/json'
      },
    ).then((http.Response value) => print(value.body));
  }

  @override
  void initState() {
    super.initState();
    _getListagemAPI();
  }

  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
