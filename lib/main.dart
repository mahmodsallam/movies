import 'package:flutter/material.dart';
import 'package:movies/screens/home_screen.dart';
import 'package:movies/screens/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: FutureBuilder<SharedPreferences>(
        future: SharedPreferences.getInstance(),
        builder:
            (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
          switch (snapshot.connectionState) {
            default:
              if (!snapshot.hasError) {
                return snapshot.data.getBool("firstTime") != null && snapshot.data.getBool("firstTime")==false
                    ? HomeScreen()
                    : WelcomePage();
              }
          }
          return Container();
        },
      ),
      routes: {
        '/home': (context) => HomeScreen(),
        '/welcome': (context) => WelcomePage()
      },
    );
  }
}

Future<bool> isItFirstTime() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool isOpenedBefore = preferences.getBool("firstTime");
  return isOpenedBefore;
}
