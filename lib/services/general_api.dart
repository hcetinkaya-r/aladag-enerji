import 'package:http/http.dart' as http;

class GeneralApi {
  static Future getGeneral() {
    var url = Uri.parse(
        'https://aladag-enerji-default-rtdb.europe-west1.firebasedatabase.app/general.json');
    return http.get(url);
  }
}
