import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();

}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    addFlagForFirstOpen(false) ;
    return Container(
      child: WelcomeWidget(),

    );
  }
}

class WelcomeWidget extends StatelessWidget {
  final pages = [
    PageViewModel(
      mainImage: Image.asset(
        'assets/images/smartphone.png',
        height: 300,
        width: 300,
        alignment: Alignment.center,
      ),
      bubbleBackgroundColor: Colors.white,
      pageColor: Colors.black,
      iconColor: null,
      bubble: Image.asset('assets/images/smartphone.png'),
      body: Text(
          'Know more about movies , read reviews , find top rated movies and playing now !'),
      title: Text('Movies'),
      titleTextStyle: TextStyle(
        fontFamily: 'custom',
        fontSize: 35.0,
        color: Color(0xFFB22E25),
      ),
      bodyTextStyle: TextStyle(fontSize: 20.0),
    ),
    PageViewModel(
      mainImage: Image.asset(
        'assets/images/watching.png',
        height: 300,
        width: 300,
        alignment: Alignment.center,
      ),
      bubbleBackgroundColor: Colors.white,
      pageColor: Color(0xFFB22E25),
      iconColor: null,
      bubble: Image.asset('assets/images/watching.png'),
      body: Text(
          'Become aware of movies displayig now on TV, get more onfo about it , It\'s really wonderful ! '),
      title: Text('Tv shows '),
      titleTextStyle: TextStyle(
        fontFamily: 'custom',
        fontSize: 35.0,
        color: Colors.white,
      ),
      bodyTextStyle: TextStyle(fontSize: 20.0),
    ),
    PageViewModel(
      mainImage: Image.asset(
        'assets/images/popcorn.png',
        height: 300,
        width: 300,
        alignment: Alignment.center,
      ),
      bubbleBackgroundColor: Colors.white,
      pageColor: Colors.black,
      iconColor: null,
      bubble: Image.asset('assets/images/popcorn.png'),
      body: Text(
          'Become the first one who know what is playing now in cinemas, and watch '
          ' movie trailers ! '),
      title: Text('Now playing !'),
      titleTextStyle: TextStyle(
        fontFamily: 'custom',
        fontSize: 35.0,
        color: Color(0xFFB22E25),
      ),
      bodyTextStyle: TextStyle(fontSize: 20.0),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Builder(
        builder: (context) => IntroViewsFlutter(
          pages,
          onTapDoneButton: () {
            print("tapped");
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
      ),
    );
  }
}


void addFlagForFirstOpen(bool firstTime) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setBool("firstTime", firstTime);
}