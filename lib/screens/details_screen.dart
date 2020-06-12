import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movies/models/movieDetails_model.dart';
import 'package:movies/models/trailer_model.dart';
import 'package:movies/networking/networking.dart';
import 'package:movies/widgets/trailer_list.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class DetailsScreen extends StatefulWidget {
  String id;

  DetailsScreen({this.id});

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  ApiHelper _apiHelper;

  @override
  void initState() {
    super.initState();
    _apiHelper = ApiHelper();
  }

  Future<MovieDetails> getMovieDetailsForFutureBuilder() async {
    MovieDetails details = await _apiHelper.getMovieDetails(widget.id);
    return details;
  }

  Future<List<Results>> getTrailersForFutureBuilder() async {
    List<Results> trailers = await _apiHelper.getMovieTrailers(widget.id);
    return trailers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(child: nestScrollViewWithAppBar()),
    );
  }

  Widget nestScrollViewWithAppBar() {
    return FutureBuilder(
      future: _apiHelper.getMovieDetails(widget.id),
      builder: (BuildContext context,
          AsyncSnapshot<MovieDetails> movieDetailsSnapshot) {
        if (!movieDetailsSnapshot.hasError && movieDetailsSnapshot.data!=null) {
          return NestedScrollView(
            scrollDirection: Axis.vertical,
            headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
              return <Widget>[
                /**app bar with image and title
                 * getting image from the movies details snapshot
                 * getting the title from the movie details snapshot
                 * */
                SliverAppBar     (
                  backgroundColor: Colors.black,
                  expandedHeight: 250.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 15.0, 10.0, 0.0),

                      child: movieDetailsSnapshot.data != null ?  Text(
                        movieDetailsSnapshot.data.title,
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ) : Container(),
                    ),
                    background: Image.network(
                      "https://image.tmdb.org/t/p/w500" +
                          movieDetailsSnapshot.data.posterPath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ];
            },


            body: Stack(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding:
                        const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                        child: ListView(
                          shrinkWrap: true,
                          children: <Widget>[

                            movieDetailsSnapshot.data!=null ? Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20.0, 25.0, 0.0, 0.0),
                                    child: movieDetailsSnapshot.data!=null ? Text(
                                      movieDetailsSnapshot.data.title
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ):Container(),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20.0, 5.0, 0.0, 0.0),
                                    child: Row(
                                      children: <Widget>[
                                        SmoothStarRating(
                                          spacing: -2.0,
                                          size: 14.0,
                                          starCount: 5,
                                          rating: movieDetailsSnapshot
                                              .data.voteAverage,
                                          color: Colors.yellow[500],
                                          borderColor: Colors.yellow,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              8.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            movieDetailsSnapshot
                                                .data.voteAverage
                                                .toString(),
                                            style:
                                            TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20.0, 5.0, 20.0, 0.0),
                                    child: Text(
                                      movieDetailsSnapshot.data.releaseDate,
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20.0, 10.0, 20.0, 0.0),
                                    child: Text(
                                      (movieDetailsSnapshot.data.overview),
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20.0, 20.0, 20.0, 0.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              8.0, 0.0, 4.0, 0.0),
                                          child: Icon(
                                            FontAwesomeIcons.heart,
                                            color: Colors.grey,
                                            size: 16.0,
                                          ),
                                        ),
                                        Text(
                                          movieDetailsSnapshot.data.voteCount
                                              .toString(),
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 13.0),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10.0, 0.0, 6.0, 0.0),
                                          child: Icon(
                                            FontAwesomeIcons.eye,
                                            color: Colors.grey,
                                            size: 16.0,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0.0, 0.0, 20.0, 0.0),
                                          child: Text(
                                            movieDetailsSnapshot.data.revenue
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 13.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20.0, 0.0, 20.0, 0.0),
                                    child: Divider(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20.0, 4.0, 0.0, 0.0),
                                    child: Text(
                                      'Movie Trailers',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        5.0, 10.0, 5.0, 0.0),
                                    child: new TrailerList(
                                      id: widget.id,
                                      posterPath: movieDetailsSnapshot
                                          .data.backdropPath,
                                    ),
                                  )
                                ],
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xFF000000),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ) : Container(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        } else {
          return Center(
            child:CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
