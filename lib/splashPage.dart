
import 'package:flutter/material.dart';
import 'package:flutter_api/login_page.dart';
import 'package:flutter_api/main.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'homePage.dart';


class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
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
  void initState() {
    checkLoginStatus();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Container(
       child: Center(child: Text("welcome"),),
       ),
     
   );
  }
}



