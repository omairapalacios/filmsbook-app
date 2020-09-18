import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:movies_app/src/widgets/card_swiper_widget.dart';

class HomePage extends StatelessWidget {
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
        children: [_swiperTarjetas()],
      )),
    );
  }

  Widget _swiperTarjetas() {
    return CardSwiper( 
      movies: [ 1,2,3,4,5],);
  }
}
