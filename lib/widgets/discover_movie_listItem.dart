import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movies/models/movie_model.dart';
import 'package:movies/screens/details_screen.dart';
Widget discoverListItem(String imageUrl, Movie movie , BuildContext context) {
  return GestureDetector(
    onTap: (){
      print("Tapped ............. : " + movie.id.toString()) ;
      //TODO send the info to the next screen
      Navigator.push(context, new MaterialPageRoute(builder: (context){
        return DetailsScreen(id : movie.id.toString()) ;
      })) ;
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[300],
              blurRadius: 10.0,
              spreadRadius: 2.0,
              offset: Offset(10.0, 10.0),
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      width: 100.0,
                      height: 155.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.grey,
                        image: DecorationImage(
                            image: NetworkImage(imageUrl), fit: BoxFit.cover),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(movie.original_title),
                      Row(
                        children: <Widget>[
                          Text('Release date : ${movie.release_date}'),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 80.0,
                              height: 35.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.redAccent),
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      movie.vote_average.toInt().toString(),
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      FontAwesomeIcons.solidStar,
                                      color: Colors.yellow,
                                      size: 11.0,
                                    ),
//                                    child: Text(
//                                        movie.vote_average.toInt().toString()),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 80.0,
                              height: 35.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.purple),
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        15.0, 0.0, 5.0, 0.0),
                                    child: Text(
                                      movie.vote_count.toInt().toString(),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 13.0),
                                    ),
                                  ),
                                  Icon(
                                    FontAwesomeIcons.userEdit,
                                    size: 13.0,
                                    color: Colors.yellow,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
