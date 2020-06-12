import 'dart:io';

import 'package:flutter/material.dart';
import 'package:movies/models/movieDetails_model.dart';
import 'package:movies/models/trailer_model.dart';
import 'package:movies/networking/networking.dart';
import 'package:movies/widgets/trailer_item.dart';
import 'package:url_launcher/url_launcher.dart';
class TrailerList extends StatefulWidget {
  String posterPath  ;
  ApiHelper _apiHelper = ApiHelper() ;
  String id ;

  TrailerList({this.id , this.posterPath });


  @override
  _TrailerListState createState() => _TrailerListState();
}

class _TrailerListState extends State<TrailerList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Results>>(
      future: widget._apiHelper.getMovieTrailers(widget.id),
      builder: (context , AsyncSnapshot<List<Results>> trailers ){
        return  Container(
          height: 150.0,
          child: trailers.data!=null? ListView.builder(
              itemCount: trailers.data.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return TrailerItem(
                  movieKey: trailers.data[index].key,
                  actionWhenClick: () {
                    showTrailer(
                        "https://www.youtube.com/watch?v=" + trailers.data[index].key);
                  },
                  posterPath: widget.posterPath,
                );
              }) : Container(),
        ) ;
      },

    );
  }
}


void showTrailer(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}