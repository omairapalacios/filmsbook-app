import 'package:flutter/material.dart';

import 'package:movies_app/src/providers/movie_provider.dart';
import 'package:movies_app/src/widgets/card_swiper_widget.dart';

class HomePage extends StatelessWidget {
  final movieProvider = new MovieProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MovieBook'),
        backgroundColor: Colors.black87,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
          child: Column(
        children: [_swiperCards()],
      )),
    );
  }

  Widget _swiperCards() {
    movieProvider.getMovieCinema();

    return FutureBuilder(
      future: movieProvider.getMovieCinema(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        
        if( snapshot.hasData ) {
          return CardSwiper(
          movies: snapshot.data
          );
        } else {
          return Container(
            height: 400.0,
            child: Center(
              child: CircularProgressIndicator()
            )
          );
        }
      },
    );
  }
}
