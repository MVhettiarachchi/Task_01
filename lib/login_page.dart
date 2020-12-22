
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'homePage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}
//  Future<LoginResponse> fetchAlbum(String email,String password) async {
//   final response = await http.post(
//     'https://www.roralabs.com/',
//     headers: <String,String>{
//       'Accept':'application/json',
//     },
//     body: {
//       'email':email,
//       'password':password,
//     }
//   );
//   if (response.statusCode == 200) {
//     print(response.body);
//     return LoginResponse.fromJson(json.decode(response.body));
//   } else {
//     throw Exception('Failed to create album.');
//   }
// }
// class LoginResponse {
  
//   String email;
//   String passsword;
//   String token;

// LoginResponse({this.email, this.passsword});

//   LoginResponse.fromJson(Map<String, dynamic> json) {
//     token = json['token'];
//     email =  json['email'];
//     passsword = json['password'];
    
//   }
// }
class _LoginPageState extends State<LoginPage> {
 //Future<LoginResponse> _futureJwt;
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        decoration: BoxDecoration(gradient:
          LinearGradient(
            begin: Alignment.topCenter,end: Alignment.bottomCenter,
          
          colors: [
              Colors.blue[700],
              Colors.blueAccent,
          ]
          ),
        ),
        child: isLoading ? Center(child:  CircularProgressIndicator()) : ListView(
          children: [
            headSection(),
            textSection(),
            buttonSection(),
          ],
        ),
      ),
    );
  }

  signIn(String email,String password) async{
    Map data = {
      'email': email,
      'passsword': password
    };
    var jsonData = null;
   SharedPreferences sharedPreferences = await SharedPreferences.getInstance(); 
    var response = await http.post("https://www.roralabs.com/",body: data);

    if(response.statusCode == 200) {
      jsonData = json.decode(response.body);
      
      setState(() {
        isLoading = false;
    // sharedPreferences.setString("token", jsonData['token']);
Navigator.of(context).pushAndRemoveUntil(
  MaterialPageRoute(builder: (BuildContext context) => HomePage()), (Route<dynamic> route) => false);
      });
    }
  }

  Container headSection(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      child: Text("Login", style: TextStyle(color: Colors.white,fontSize: 25.0),) ,
    );
  }
  Container textSection(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0) ,
      margin: EdgeInsets.only(top:30.0),
      child: Column(
        children: [
          formEmail("Email",Icons.email),
          SizedBox(height: 30.0,),
          formPassword("Password",Icons.lock),      ],
      ),
    );
  }

  TextFormField formEmail(String title, IconData icon){
    return TextFormField(
      controller: emailController,
      style: TextStyle(color: Colors.white,fontSize: 16.0),
      decoration: InputDecoration(
        hintText: title,
        hintStyle: TextStyle(color: Colors.white,fontSize: 16.0),
        icon: Icon(icon),
      ),
    );
  }
 TextFormField formPassword(String title, IconData icon){
    return TextFormField(
      controller: passwordController,
      obscureText: true,
      style: TextStyle(color: Colors.white,fontSize: 16.0),
      decoration: InputDecoration(
        hintText: title,
        hintStyle: TextStyle(color: Colors.white,fontSize: 16.0),
        icon: Icon(icon),
      ),
    );
  }
  Container buttonSection(){
    return Container(
      height: 40.0,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 20.0) ,
      margin: EdgeInsets.only(top:30.0),
      child: RaisedButton(
        onPressed: (){
          setState(() {
            isLoading = true;
          });
         signIn(emailController.text,passwordController.text);
        },
         color: Colors.blueGrey[700],
         child: Text("SIGN IN", style: TextStyle(color: Colors.white,fontSize: 20.0),),
         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
     ),
    );
  }

}