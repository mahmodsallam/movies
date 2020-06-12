import 'dart:convert';

import 'package:http/http.dart';
import 'package:movies/constants/constants.dart';
import 'package:movies/models/movieDetails_model.dart';
import 'package:movies/models/movie_model.dart';
import 'package:movies/models/trailer_model.dart';

class ApiHelper {
  Future<List<Movie>> getPopularMovies() async {
    var response = await get(BASE_URL_POPULAR);
    List<Movie> moviesList = [];
    var data = jsonDecode(response.body);
    var results = data['results'];
    var res = [];
    res = results;

    for (int i = 0; i < res.length; i++) {
      double popularity = double.parse(results[i]['popularity'].toString());

      double vote_count = double.parse(results[i]['vote_count'].toString());

      bool video = results[i]['video'];

      String poster_path = results[i]['poster_path'];
      int id = results[i]['id'];

      bool adult = results[i]['adult'];

      String backdrop_path = results[i]['backdrop_path'];

      String original_language = results[i]['original_language'];

      String original_title = results[i]['original_title'];

      String title = results[i]['title'];

      double vote_average = double.parse(results[i]['vote_average'].toString());

      String overview = results[i]['overview'];

      String release_date = results[i]['release_date'];

      Movie movie = new Movie(
          popularity: popularity,
          vote_count: vote_count,
          adult: adult,
          video: video,
          poster_path: poster_path,
          id: id,
          backdrop_path: backdrop_path,
          original_language: original_language,
          original_title: original_title,
          vote_average: vote_average,
          overview: overview,
          title: title,
          release_date: release_date);

      print(title);
      moviesList.add(movie);
    }

    return moviesList;
  }

  Future<List<Movie>> getTopRatedMovies() async {
    var response = await get(BASE_URL_TOP_RATED);
    List<Movie> moviesList = [];
    var data = jsonDecode(response.body);
    var results = data['results'];
    var res = [];
    res = results;

    for (int i = 0; i < res.length; i++) {
      double popularity = double.parse(results[i]['popularity'].toString());

      double vote_count = double.parse(results[i]['vote_count'].toString());

      bool video = results[i]['video'];

      String poster_path = results[i]['poster_path'];
      int id = results[i]['id'];

      bool adult = results[i]['adult'];

      String backdrop_path = results[i]['backdrop_path'];

      String original_language = results[i]['original_language'];

      String original_title = results[i]['original_title'];

      String title = results[i]['title'];

      double vote_average = double.parse(results[i]['vote_average'].toString());

      String overview = results[i]['overview'];

      String release_date = results[i]['release_date'];

      Movie movie = new Movie(
          popularity: popularity,
          vote_count: vote_count,
          adult: adult,
          video: video,
          poster_path: poster_path,
          id: id,
          backdrop_path: backdrop_path,
          original_language: original_language,
          original_title: original_title,
          vote_average: vote_average,
          overview: overview,
          title: title,
          release_date: release_date);

      print(title);
      moviesList.add(movie);
    }

    return moviesList;
  }

  Future<List<Movie>> getUpcomingMovies() async {
    var response = await get(BASE_URL_UPCOMING);
    List<Movie> moviesList = [];
    var data = jsonDecode(response.body);
    var results = data['results'];
    var res = [];
    res = results;

    for (int i = 0; i < res.length; i++) {
      double popularity = double.parse(results[i]['popularity'].toString());

      double vote_count = double.parse(results[i]['vote_count'].toString());

      bool video = results[i]['video'];

      String poster_path = results[i]['poster_path'];
      int id = results[i]['id'];

      bool adult = results[i]['adult'];

      String backdrop_path = results[i]['backdrop_path'];

      String original_language = results[i]['original_language'];

      String original_title = results[i]['original_title'];

      String title = results[i]['title'];

      double vote_average = double.parse(results[i]['vote_average'].toString());

      String overview = results[i]['overview'];

      String release_date = results[i]['release_date'];

      Movie movie = new Movie(
          popularity: popularity,
          vote_count: vote_count,
          adult: adult,
          video: video,
          poster_path: poster_path,
          id: id,
          backdrop_path: backdrop_path,
          original_language: original_language,
          original_title: original_title,
          vote_average: vote_average,
          overview: overview,
          title: title,
          release_date: release_date);

      print(title);
      moviesList.add(movie);
    }

    return moviesList;
  }

  Future<List<Movie>> getNowPlayingMovies() async {
    var response = await get(BASE_URL_NOWPLAYING);
    List<Movie> moviesList = [];
    var data = jsonDecode(response.body);
    var results = data['results'];
    var res = [];
    res = results;

    for (int i = 0; i < res.length; i++) {
      double popularity = double.parse(results[i]['popularity'].toString());

      double vote_count = double.parse(results[i]['vote_count'].toString());

      bool video = results[i]['video'];

      String poster_path = results[i]['poster_path'];
      int id = results[i]['id'];

      bool adult = results[i]['adult'];

      String backdrop_path = results[i]['backdrop_path'];

      String original_language = results[i]['original_language'];

      String original_title = results[i]['original_title'];

      String title = results[i]['title'];

      double vote_average = double.parse(results[i]['vote_average'].toString());

      String overview = results[i]['overview'];

      String release_date = results[i]['release_date'];

      Movie movie = new Movie(
          popularity: popularity,
          vote_count: vote_count,
          adult: adult,
          video: video,
          poster_path: poster_path,
          id: id,
          backdrop_path: backdrop_path,
          original_language: original_language,
          original_title: original_title,
          vote_average: vote_average,
          overview: overview,
          title: title,
          release_date: release_date);

      print(title);
      moviesList.add(movie);
    }

    return moviesList;
  }

  Future<List<Movie>> getDiscoverMovies() async {
    var response = await get(BASE_URL_DISCOVER);
    List<Movie> moviesList = [];
    var data = jsonDecode(response.body);
    var results = data['results'];
    var res = [];
    res = results;

    for (int i = 0; i < res.length; i++) {
      double popularity = double.parse(results[i]['popularity'].toString());

      double vote_count = double.parse(results[i]['vote_count'].toString());

      bool video = results[i]['video'];

      String poster_path = results[i]['poster_path'];
      int id = results[i]['id'];

      bool adult = results[i]['adult'];

      String backdrop_path = results[i]['backdrop_path'];

      String original_language = results[i]['original_language'];

      String original_title = results[i]['original_title'];

      String title = results[i]['title'];

      double vote_average = double.parse(results[i]['vote_average'].toString());

      String overview = results[i]['overview'];

      String release_date = results[i]['release_date'];

      Movie movie = new Movie(
          popularity: popularity,
          vote_count: vote_count,
          adult: adult,
          video: video,
          poster_path: poster_path,
          id: id,
          backdrop_path: backdrop_path,
          original_language: original_language,
          original_title: original_title,
          vote_average: vote_average,
          overview: overview,
          title: title,
          release_date: release_date);

      print(title);
      moviesList.add(movie);
    }

    return moviesList;
  }

  Future<MovieDetails> getMovieDetails(String id) async {
    String MOVIE_DETAILS_URL =
        "https://api.themoviedb.org/3/movie/$id?api_key=$API_KEY";
    var response = await get(MOVIE_DETAILS_URL);
    Map movieMap = jsonDecode(response.body.toString());
    var movieDetails = MovieDetails.fromJson(movieMap);
    print(movieDetails.overview);
    return movieDetails;
  }

  Future<List<Results>> getMovieTrailers(String movieID) async {
    String BASE_URL_VIDEO_TRAILER =
        "https://api.themoviedb.org/3/movie/$movieID/videos?api_key=$API_KEY";
    var response = await get(BASE_URL_VIDEO_TRAILER);
    Map trailersMap = jsonDecode(response.body.toString());
    var trailer = Trailer.fromJson(trailersMap);
    print("the key for the first trailer " + trailer.results[0].key);
    return trailer.results;
  }

  
}
