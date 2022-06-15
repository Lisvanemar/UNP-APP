import '../models/login_response.dart';
import '../models/user_response.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class AuthService {
  static const String url = 'https://shrouded-harbor-95996.herokuapp.com';

  static Future<String?> getToken() async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString("user_token");

    return token;
  }

  static Future<LoginResponse> login(String username, String password) async {
    final response = await http.post(
      Uri.parse(url + '/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final data = LoginResponse.fromJson(body);

      final pref = await SharedPreferences.getInstance();
      await pref.setString("user_token", data.token);

      return data;
    } else {
      throw Exception('Error al iniciar sesión. Su usuario o contraseña son incorrectos.');
    }
  }

  static Future<UserResponse> user(/*String username, String password*/) async {
    final response = await http.get(
      Uri.parse(url + '/auth/user'),
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
      final data = UserResponse.fromJson(body);

      //final pref = await SharedPreferences.getInstance();
      //await pref.setString("user_token", data.token);

      return data;
    } else {
      throw Exception('Error al mostrar la información.');
    }
  }
}
