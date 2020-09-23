import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:movies_app/src/models/movie_model.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> movies;

  CardSwiper({@required this.movies});
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      child: Swiper(
        layout: SwiperLayout.STACK,
        itemBuilder: (BuildContext context, int index) {

          movies[index].uniqueId = '${movies[index].id}-tarjeta';
          return GestureDetector(
              onTap:  () {
                Navigator.pushNamed(context, 'detail', arguments: movies[index]);
              },
              child: Hero(
              tag: movies[index].uniqueId,
              child: ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: FadeInImage(
                placeholder: AssetImage('assets/images/no-image.jpg'), 
                image: NetworkImage(movies[index].getPosterImage()),
                fit: BoxFit.cover

                  )
                ),
            ),
          );
        },
        itemCount: movies.length,
        itemWidth: _screenSize.width * 0.5,
        itemHeight: _screenSize.height * 0.4,
      ),
    );
  }
}
