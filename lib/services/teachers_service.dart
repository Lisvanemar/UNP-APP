import '../models/teachers_response.dart';
import 'package:http/http.dart' as http;
//import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class AuthService {
  static const String url = 'https://shrouded-harbor-95996.herokuapp.com';

  static Future<TeachersResponse> teachers(/*String username, String password*/) async {
    final response = await http.get(
      Uri.parse(url + '/teachers'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      /* body: jsonEncode(<String, String>{
      'username': username,
      'password': password,
    }),*/
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final data = TeachersResponse.fromJson(body);

      //final pref = await SharedPreferences.getInstance();
      //await pref.setString("user_token", data.token);

      return data;
    } else {
      throw Exception('Error al mostrar la información.');
    }
  }
}
