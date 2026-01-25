import 'package:flutter/material.dart';
import 'package:task_manager_app/utils/theme/app_theme.dart';
import 'package:task_manager_app/welcome/presentation/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(body:  WelcomeScreen()),
    );
  }
}
