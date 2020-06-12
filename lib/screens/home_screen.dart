import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/constants/constants.dart';
import 'package:movies/models/movie_model.dart';
import 'package:movies/networking/networking.dart';
import 'package:movies/widgets/movie_discover_list.dart';
import 'package:movies/widgets/movies_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiHelper helper = new ApiHelper();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x231249),
      appBar: AppBar(
        leading: Container(),
        backgroundColor: Color(0x294249),
        centerTitle: true,
        title: Text(
          'MOVIES',
          style: TextStyle(
            fontSize: 24.0,
            color: Color(0xFFB22E25),
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(10.0),
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                'Most Popular ',
                style: TITLE_TEXT_STYLE,
              ),
            ],
          ),
          FutureBuilder<List<Movie>>(
            future: helper.getPopularMovies(),
            builder:
                (context, AsyncSnapshot<List<Movie>> popularMoviesSnapshot) {
              return popularMoviesSnapshot.data != null
                  ? buildMoviesCategoriesList(
                      popularMoviesSnapshot.data, 120.0, context)
                  : Center(
                      child: CircularProgressIndicator(),
                    );
            },
          ),
          Text(
            'Discover',
            style: TITLE_TEXT_STYLE,
          ),
          FutureBuilder<List<Movie>>(
            future: helper.getDiscoverMovies(),
            builder:
                (context, AsyncSnapshot<List<Movie>> discoverMoviesSnapshot) {
              return discoverMoviesSnapshot.data != null
                  ? buildMoviesDiscoverList(
                      discoverMoviesSnapshot.data, context)
                  : Center(
                      child: CircularProgressIndicator(),
                    );
            },
          ),
          Text(
            'Top Rated ',
            style: TITLE_TEXT_STYLE,
          ),
          FutureBuilder<List<Movie>>(
            future: helper.getTopRatedMovies(),
            builder:
                (context, AsyncSnapshot<List<Movie>> topRatedMoviesSnapshot) {
              return topRatedMoviesSnapshot.data != null
                  ? buildMoviesCategoriesList(
                      topRatedMoviesSnapshot.data, 120.0, context)
                  : Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          Text(
            'Now Playing',
            style: TITLE_TEXT_STYLE,
          ),
          FutureBuilder<List<Movie>>(
            future: helper.getNowPlayingMovies(),
            builder:
                (context, AsyncSnapshot<List<Movie>> movieCategorySnapshot) {
              return movieCategorySnapshot.data != null
                  ? buildMoviesCategoriesList(
                      movieCategorySnapshot.data, 220.0, context)
                  : Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          Text('Upcoming', style: TITLE_TEXT_STYLE),
          FutureBuilder(
            future: helper.getUpcomingMovies(),
            builder:
                (context, AsyncSnapshot<List<Movie>> upcomingMoviesSnapshot) {
              return upcomingMoviesSnapshot.data != null
                  ? buildMoviesCategoriesList(
                      upcomingMoviesSnapshot.data, 120.0, context)
                  : Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ],
      ),
    );
  }
}
