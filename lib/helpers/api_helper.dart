import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class ApiHelper {
  static Future get(String link) {
    var url = Uri.parse(link);
    return http.get(url).then((response) {
      if (response.statusCode == 200) {
        log(response.body);
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load data');
      }
    }).catchError((error) {
      throw Exception('Failed to load data');
    });
  }
}
