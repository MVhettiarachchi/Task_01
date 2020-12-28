import 'package:flutter/material.dart';
import 'package:flutter_api/login_page.dart';
import 'package:flutter_api/splashPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
  
}

class _MyAppState extends State<MyApp> {
  SharedPreferences preferences;
 
  
@override
  void initState() {
    // TODO: implement initState
    super.initState();
   // checkLoginStatus();
  }

  

    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
        
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreenPage(),
    );
  }
}



