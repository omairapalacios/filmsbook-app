import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies_app/src/models/movie_model.dart';

class MovieHorizontal extends StatelessWidget {
  final List<Movie> movies;

  MovieHorizontal({@required this.movies});
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
        height: _screenSize.height * 0.25,
        child: PageView(
          pageSnapping: false,
          controller: PageController(
            initialPage: 1,
            viewportFraction: 0.3,
          ),
          children: _cardsPopulars(context),
        ));
  }

  List<Widget> _cardsPopulars(context) {
    return movies.map((movie) {
      return Container(
        margin: EdgeInsets.only(right: 15.0),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: FadeInImage(
                image: NetworkImage(movie.getPosterImage(),
                ),
                placeholder: AssetImage('assets/images/no-image.jpg'),
                fit: BoxFit.cover,
                height: 150.0,
                ),
            ),
            SizedBox(height: 5.0),
            Text(
              movie.title,
              overflow: TextOverflow.ellipsis,
              style:  Theme.of(context).textTheme.caption,
            )
          ],
        ),
      );
    }).toList();
  }
}
