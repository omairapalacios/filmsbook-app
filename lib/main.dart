import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movies_app/src/pages/home_page.dart';
import 'package:movies_app/src/pages/movie_detail.dart';

Future main() async {
  await DotEnv().load('.env');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Films Book',
      initialRoute: '/',
      routes: {
        '/'      : ( BuildContext context ) => HomePage(),
        'detail' : ( BuildContext context ) => MovieDetail(),
      }
    );
  }
}