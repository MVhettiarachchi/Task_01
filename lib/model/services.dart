import 'dart:html';

import 'package:http/http.dart' as http;
import 'course.dart';
class Services{
  static const String url ='https://www.roralabs.com/webservice/rest/server.php?wstoken=b0789970b9f0f489179562a4c8eec714&wsfunction=core_enrol_get_users_courses&moodlewsrestformat=json&userid=3';
  Future< List<Course>> getCourse() async {
    try {
      final response = await http.get(url);
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
