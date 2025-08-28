import 'dart:convert';
import 'package:http/http.dart' as http;
import '../core/constants.dart';
import '../core/secure_storage.dart';
import '../models/user.dart';

class AuthService {
  Future<User> login(String email, String password) async {
    final res = await http.post(Uri.parse(API.login),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}));
    if (res.statusCode == 200) {
      final j = jsonDecode(res.body);
      final token = j['token'];
      if (token != null) await SecureStorage.saveToken(token);
      return User.fromJson(j['user'] ?? {});
    }
    throw Exception('Login gagal: ${res.statusCode} ${res.body}');
  }

  Future<User> register(String name, String email, String password) async {
    final res = await http.post(Uri.parse(API.register),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'name': name, 'email': email, 'password': password}));
    if (res.statusCode == 200 || res.statusCode == 201) {
      final j = jsonDecode(res.body);
      return User.fromJson(j['user'] ?? {});
    }
    throw Exception('Register gagal: ${res.statusCode} ${res.body}');
  }

  Future<void> logout() async => SecureStorage.clear();
}
