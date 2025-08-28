import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../core/constants.dart';

class SoilService {
  Future<Map<String, dynamic>> analyze(File file, Map<String, String> fields) async {
    final req = http.MultipartRequest('POST', Uri.parse(API.analyzeSoil));
    req.files.add(await http.MultipartFile.fromPath('soil_image', file.path));
    req.fields.addAll(fields);
    final res = await req.send();
    final r = await http.Response.fromStream(res);
    if (r.statusCode == 200) return jsonDecode(r.body) as Map<String, dynamic>;
    throw Exception('Analyze failed: ${r.statusCode} ${r.body}');
  }

  Future<List<Map<String, dynamic>>> history() async {
    final res = await http.get(Uri.parse(API.history));
    if (res.statusCode == 200) {
      final list = jsonDecode(res.body) as List<dynamic>;
      return list.cast<Map<String, dynamic>>();
    }
    throw Exception('History failed: ${res.statusCode}');
  }
}
