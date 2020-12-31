
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'course.dart';
class Services{
  static const String url ='https://www.roralabs.com/webservice/rest/server.php';
  static Future< List<Course>> getCourse() async {
     SharedPreferences preferences = await SharedPreferences.getInstance(); 
     String token = preferences.getString("token");
    try {
      final response = await http.post(url,
      body:{
        'wsfunction':'core_enrol_get_users_courses',
        'moodlewsrestformat':'json',
        'userid':3,
        'wstoken': token,
      },);
    if(response.statusCode == 200){
      final List<Course> course =
      CourseFromJson(response.body);
      return course;

    }
    else{
      return List<Course>();
    }
  }
     catch (e) {
      return List<Course>();
    }
    
  }

}
