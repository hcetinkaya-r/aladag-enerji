import 'package:http/http.dart' as http;

class ActivityAreaApi {
  static Future getActivityAreas() async {
    var url = Uri.parse(
        'https://aladag-enerji-default-rtdb.europe-west1.firebasedatabase.app/activityAreas.json');

    try {
      return http.get(url);
    } catch (error) {
      throw (error);
    }
  }
}
