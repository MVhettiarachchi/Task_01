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
    checkLoginStatus();
  }

  checkLoginStatus() async{
    SharedPreferences preferences = await SharedPreferences.getInstance(); 
      if(preferences.getString("token") == null){
       Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
          return LoginPage();
        }));
        print('test1');
      }

      else{
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
          return HomePage();
         
        }));
           print('test2');
      }
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



