import 'package:flutter/material.dart';

const String API_KEY = "02f0b6f87e14295183c069276db46d42";

const String BASE_URL_POPULAR =
    "https://api.themoviedb.org/3/movie/popular?api_key=$API_KEY";
const String BASE_URL_TOP_RATED =
    "https://api.themoviedb.org/3/movie/top_rated?api_key=$API_KEY";
const String BASE_URL_UPCOMING =
    "https://api.themoviedb.org/3/movie/upcoming?api_key=$API_KEY";

const String BASE_URL_NOWPLAYING =
    "https://api.themoviedb.org/3/movie/now_playing?api_key=$API_KEY";
const String BASE_URL_DISCOVER =
    "https://api.themoviedb.org/3/discover/movie?api_key=$API_KEY";

const BASE_IMAGE_URL = "https://image.tmdb.org/t/p/w500";

const DEFAULT_IMAGE =
    "https://www.google.com/url?sa=i&source=images&cd=&cad=rja&uact=8&ved=&url=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3DO1xvLt4B-HA&psig=AOvVaw2uCaeJVhhVQGUUmvzm2T-V&ust=1571825774073881";

const TITLE_TEXT_STYLE =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.white);
