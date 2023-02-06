import 'package:flutter/material.dart';
import 'package:wall/views/screens/home.dart';
import 'package:wall/views/screens/intro.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      home:AnimatedSplashScreen(
        splash: Image.asset("images/load.png"), nextScreen: intro(),
        duration: 5000,
        backgroundColor: Colors.cyanAccent,
        splashTransition: SplashTransition.scaleTransition,
        splashIconSize: 3000,
      ) ,

    );
  }
}