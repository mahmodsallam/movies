import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movies/constants/constants.dart';

class TrailerItem extends StatefulWidget {
  String movieKey;

  Function actionWhenClick;

  String posterPath;

  TrailerItem({this.movieKey, this.actionWhenClick, this.posterPath});

  @override
  _TrailerItemState createState() => _TrailerItemState();
}

class _TrailerItemState extends State<TrailerItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.actionWhenClick,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 130,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: NetworkImage(BASE_IMAGE_URL + widget.posterPath),
              fit: BoxFit.cover,
            ),
          ),
          child: Icon(
            FontAwesomeIcons.play,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
