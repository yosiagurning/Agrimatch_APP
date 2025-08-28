import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  final _svc = AuthService();
  User? currentUser;
  bool loading = false;

  Future<void> init() async {
    // Could check token & fetch profile here (omitted for brevity)
  }

  Future<void> login(String email, String password) async {
    loading = true; notifyListeners();
    try {
      currentUser = await _svc.login(email, password);
    } finally {
      loading = false; notifyListeners();
    }
  }

  Future<void> register(String name, String email, String password) async {
    loading = true; notifyListeners();
    try {
      currentUser = await _svc.register(name, email, password);
    } finally {
      loading = false; notifyListeners();
    }
  }

  Future<void> logout() async {
    currentUser = null; notifyListeners();
  }

  bool get isAuthenticated => currentUser != null;
}
