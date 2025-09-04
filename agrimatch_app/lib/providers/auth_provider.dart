import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  final _service = AuthService();
  User? user;
  bool loading = false;

  Future<void> login(String email, String password) async {
    loading = true; notifyListeners();
    try {
      user = await _service.login(email, password);
    } finally {
      loading = false; notifyListeners();
    }
  }

  Future<void> register(String name, String email, String password) async {
    loading = true; notifyListeners();
    try {
      user = await _service.register(name, email, password);
    } finally {
      loading = false; notifyListeners();
    }
  }

  bool get isLoggedIn => user != null;
}

