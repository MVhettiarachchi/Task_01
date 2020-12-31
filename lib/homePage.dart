import 'package:flutter/material.dart';

import 'model/course.dart';
import 'model/services.dart';


class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
 
}

class _HomePageState extends State<HomePage> {
  List<Course> _course;
  bool _loading;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  void _initData(){
    _loading = true;
    Services.getCourse().then((course){
      setState(() {
      _course = course;
      _loading = false;
      });
     
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text("DgMentor", style: TextStyle(fontSize: 20, color: Colors.white70),),

      ),
      body: Container(
        child: _loading ? CircularProgressIndicator() :         
        ListView.builder(
          itemCount: _course.length,
        itemBuilder: (context,position){
          Course course = _course[position];
          return ListTile(
            title: Text(course.fullname),
            subtitle: Text(course.shortname),
          );
    
        },
        ),
      ),
      

      
    );
  }
}