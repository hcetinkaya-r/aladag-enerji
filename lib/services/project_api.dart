import 'package:http/http.dart' as http;

class ProjectApi {
  static Future getProjects() async {
    var url = Uri.parse(
        'https://aladag-enerji-default-rtdb.europe-west1.firebasedatabase.app/projects.json');
    try {
      return http.get(url);
    } catch (error) {
      throw (error);
    }
  }

  static Future getProjectsByActivityAreaId(int activityAreaId) {
    var url = Uri.parse(
        'https://aladag-enerji-default-rtdb.europe-west1.firebasedatabase.app/projects.json?activityAreaId=$activityAreaId');
    try {
      return http.get(url);
    } catch (error) {
      throw (error);
    }
  }
}
