import 'package:http/http.dart' as http;

class WebUserApi {
  static Future getWebUsers() {
    var url = Uri.parse(
        'https://aladag-enerji-default-rtdb.europe-west1.firebasedatabase.app/webUsers.json');
    return http.get(url);
  }
}
