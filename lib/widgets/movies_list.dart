import 'package:flutter/material.dart';
import 'package:movies/models/movie_model.dart';
import 'package:movies/constants/constants.dart';
import 'movie_listItem.dart';
Widget buildMoviesCategoriesList(List<Movie> moviesList, double width , BuildContext context  ) {
  return Container(
    height: 200.0,
    child: ListView.builder(
      itemCount: moviesList.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return customMovieListItem(moviesList[index].title,
            "$BASE_IMAGE_URL" + moviesList[index].poster_path, width , moviesList[index].id ,
            context
        );
      },
    ),
  );
}