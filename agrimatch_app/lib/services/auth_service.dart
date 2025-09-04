import 'dart:convert';
import 'package:http/http.dart' as http;
import '../core/constants.dart';
import '../models/user.dart';

class AuthService {
  Future<User> register(String name, String email, String password) async {
    final res = await http.post(
      Uri.parse(API.register),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "name": name,
        "email": email,
        "password": password,
      }),
    );
    if (res.statusCode == 200) {
      return User.fromJson(jsonDecode(res.body));
    } else {
      throw Exception("Register gagal: ${res.body}");
    }
  }

  Future<User> login(String email, String password) async {
    final res = await http.post(
      Uri.parse(API.login),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
    );
    if (res.statusCode == 200) {
      return User.fromJson(jsonDecode(res.body));
    } else {
      throw Exception("Login gagal: ${res.body}");
    }
  }
}
