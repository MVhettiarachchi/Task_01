
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'homePage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}
 Future<LoginResponse> login(String email,String password) async {
    
}


class LoginResponse {
  
  
  String token;
  String privatetoken;
 

LoginResponse({this. token, this.privatetoken});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    privatetoken =  json['privatetoken'];
   // sharedPreferences.setString("token", json['token']);
    
  }
}

class _LoginPageState extends State<LoginPage> {
 
  TextEditingController userController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  bool isLoading;
 
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
    
      signIn(String username,String password) async{

        
     
          final response = await http.post(
        'https://www.roralabs.com/login/token.php',
        
        body: {
          'username':username,
          'password':password,
          'service':'moodle_mobile_app',
        }
        
      );
      if (response.statusCode == 200) {
          print(response.body);
          LoginResponse loginResponse = LoginResponse.fromJson(json.decode(response.body));
          SharedPreferences preferences = await SharedPreferences.getInstance();
          preferences.setString("token", loginResponse.token);

         if(loginResponse.token == null){
            print("login failed");
          }
          else{ 
    
              isLoading = false;
             // sharedPreferences.setString("token", loginResponse.token);
              Navigator.of(context).push(MaterialPageRoute(builder:(BuildContext context){
              return HomePage();
          }
         ));
             print('test23');
          }
      } else {
        throw Exception('Failed.');
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
              formEmail("User name",Icons.people_alt_sharp),
              SizedBox(height: 30.0,),
              formPassword("Password",Icons.lock),      ],
          ),
        );
      }
    
      TextFormField formEmail(String title, IconData icon){
        return TextFormField(
          controller: userController,
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
             signIn(userController.text,passwordController.text);
            },
             color: Colors.blueGrey[700],
             child: Text("SIGN IN", style: TextStyle(color: Colors.white,fontSize: 20.0),),
             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
         ),
        );
      }
    
      

}