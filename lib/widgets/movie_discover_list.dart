import 'package:flutter/material.dart';
import 'package:movies/models/movie_model.dart';
import 'package:movies/widgets/discover_movie_listItem.dart';
import 'package:movies/constants/constants.dart';

Widget buildMoviesDiscoverList(List<Movie> list , BuildContext context) {
  return GestureDetector(
    child: Container(
      height: 210.0,
      child: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.all(5.0),
        itemCount: list.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return discoverListItem(
              "$BASE_IMAGE_URL" + list[index].poster_path, list[index] , context);
        },
      ),
    ),
  );
}
