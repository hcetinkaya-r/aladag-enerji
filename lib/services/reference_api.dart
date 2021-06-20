import 'package:http/http.dart' as http;

class ReferenceApi {
  static Future getReferences() async {
    var url = Uri.parse(
        'https://aladag-enerji-default-rtdb.europe-west1.firebasedatabase.app/references.json');
    try {
      return http.get(url);
    } catch (error) {
      throw (error);
    }
  }

  static Future getReferencesByProjectId(int projectId) {
    var url = Uri.parse(
        'https://aladag-enerji-default-rtdb.europe-west1.firebasedatabase.app/references.json?projectId=$projectId');
    try {
      return http.get(url);
    } catch (error) {
      throw (error);
    }
  }
}
