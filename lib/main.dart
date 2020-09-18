import 'package:flutter/material.dart';

import 'package:movies_app/src/pages/home_page.dart';
import 'package:movies_app/src/pages/movie_detail.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MovieBook',
      initialRoute: '/',
      routes: {
        '/'      : ( BuildContext context ) => HomePage(),
        'detail' : ( BuildContext context ) => MovieDetail(),
      }
    );
  }
}