import 'package:flutter/material.dart';
import 'package:movies_app/src/models/movie_model.dart';
import 'package:movies_app/src/providers/movie_provider.dart';

class DataSearch extends SearchDelegate {
  final movieProvider = new MovieProvider();
  @override
  List<Widget> buildActions(BuildContext context) {
    // Acciones del appbar : cancelar o limpiar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icono a la izquiera o derecha
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Crea los resultados a mostrar
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Sugerencias de la busqueda

    if (query.isEmpty) {
      return Container();
    }

    return FutureBuilder(
      future: movieProvider.searchMovie(query),
      builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
        if (snapshot.hasData) {
          final movies = snapshot.data;
          return ListView(
              children: movies.map((movie) {
            return ListTile(
              leading: FadeInImage(
                image: NetworkImage(movie.getPosterImage()),
                placeholder: AssetImage('assets/images/no-image.jpg'),
                width: 50.0,
                fit: BoxFit.cover,
              ),
              title: Text(movie.title),
              subtitle: Text(movie.originalTitle),
              onTap: () {
                close(context, null);
                movie.uniqueId = '';
                Navigator.pushNamed(context, 'detail', arguments: movie);
              },
            );
          }).toList());
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
