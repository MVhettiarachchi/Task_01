
import 'package:flutter/material.dart';
import 'package:flutter_api/login_page.dart';
import 'package:flutter_api/main.dart';
import 'package:splashscreen/splashscreen.dart';


class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {

//  Future<Widget> loadFromFuture() async {
  
//   //  login
//   //
//      return Future.value(new AfterSplash());

//   }
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 15,
      navigateAfterSeconds:MyApp(),  
      backgroundColor: Colors.black12,
      title: new Text('Welcome',textScaleFactor: 2, ),  
    );
  }
}



