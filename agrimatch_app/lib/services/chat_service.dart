import 'dart:convert';
import 'package:http/http.dart' as http;
import '../core/constants.dart';

class ChatService {
  Future<String> send(String message) async {
    final res = await http.post(Uri.parse(API.chat),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'message': message}));
    if (res.statusCode == 200) {
      final j = jsonDecode(res.body);
      return j['reply'] ?? '...';
    }
    throw Exception('Chat failed: ${res.statusCode} ${res.body}');
  }
}
