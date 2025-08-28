class API {
  static const String base = "http://10.0.2.2:5000"; // emulator -> host machine
  static String get login => "$base/api/auth/login";
  static String get register => "$base/api/auth/register";
  static String get analyzeSoil => "$base/api/soil/analyze";
  static String get history => "$base/api/soil/history";
  static String get chat => "$base/api/chat";
}
