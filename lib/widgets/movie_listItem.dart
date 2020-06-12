import 'package:flutter/material.dart';
import 'package:movies/screens/details_screen.dart';

Widget customMovieListItem(String moviesName, String imageUrl, double width,
    int id, BuildContext context) {
  return GestureDetector(
    onTap: () {
      print("tapped ............. :  ${id.toString()}");
      Navigator.push(context,
          MaterialPageRoute<void>(builder: (BuildContext context) {
        return DetailsScreen(id: id.toString());
      }));
    },
    child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 130.0,
          width: width,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(imageUrl), fit: BoxFit.cover),
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8.0),
          ),
        )),
  );
}
