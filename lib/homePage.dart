import 'package:flutter/material.dart';
import 'package:flutter_api/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// SharedPreferences sharedPreferences;
  @override
  void initState() {
    // TODO: implement initState
    checkLoginStatus();
    super.initState();
  }
checkLoginStatus() async {
   SharedPreferences sharedPreferences = await SharedPreferences.getInstance(); 
   if(sharedPreferences.getString("token") == null){
     Navigator.of(context).pushAndRemoveUntil(
  MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (Route<dynamic> route) => false);
   }
  Navigator.of(context).pushAndRemoveUntil(
   MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (Route<dynamic> route) => false);

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text("DgMentor", style: TextStyle(fontSize: 20, color: Colors.white70),),
      actions:<Widget>
       [IconButton(icon: Icon(Icons.logout), onPressed: (){
        //sharedPreferences.clear();
        //sharedPreferences.commit();
       }, 
       ),
       
       ],

      ),
      
      
    );
  }
}