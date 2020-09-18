import 'package:flutter/material.dart';
import 'package:movies_app/src/models/movie_model.dart';

class MovieDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // get movies send as arguments
    final Movie movie = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _createAppbar(movie),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox( height: 10.0),
                _posterTitle( context, movie ),
  
              ]
            )
          )
        ],
      )
    );
  }
                  
  Widget _createAppbar(Movie movie) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.black87,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          movie.title,
          style: TextStyle(
            color: Colors.white, fontSize: 16.0,
          ),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/images/loading.gif'),
          image: NetworkImage( movie.getBackdropImage() ),
          fadeInDuration: Duration(milliseconds: 150),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
                  
  Widget _posterTitle(context, Movie movie) {

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image(
              image:  NetworkImage( movie.getPosterImage()),
              height: 150.0,
            ),
          ),
          SizedBox(width: 25.0),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text( movie.title, style: Theme.of(context).textTheme.headline6, overflow: TextOverflow.ellipsis),
              Text( movie.originalTitle, style: Theme.of(context).textTheme.subtitle1, overflow: TextOverflow.ellipsis)
            ],),
          )
        ],
      ),
    );
  }
}
