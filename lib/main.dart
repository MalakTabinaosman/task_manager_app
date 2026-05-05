import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager_app/home/presentation/home_screen.dart';
import 'package:task_manager_app/utils/theme/app_theme.dart';
import 'package:task_manager_app/welcome/presentation/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  String? username = prefs.getString('username');

  runApp(MyApp(username: username));
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.username});

  final String? username;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      debugShowCheckedModeBanner: false,
      home: username == null
          ? WelcomeScreen()
          : HomeScreen(username: username!),
    );
  }
}
