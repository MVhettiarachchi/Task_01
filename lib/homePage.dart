import 'package:flutter/material.dart';
import 'package:flutter_api/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text("DgMentor", style: TextStyle(fontSize: 20, color: Colors.white70),),
 
      ),
      
      
    );
  }
}