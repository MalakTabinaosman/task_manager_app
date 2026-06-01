import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_manager_app/fearures/tasks/data/models/task_model.dart';
import 'package:task_manager_app/fearures/tasks/presentation/screens/home_screen.dart';
import 'package:task_manager_app/utils/theme/app_theme.dart';
import 'package:task_manager_app/fearures/welcome/presentation/welcome_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  var box = await Hive.openBox<TaskModel>('tasks');
  Hive.registerAdapter(TaskModelAdapter());

await Hive.openBox<String>('appBox');

TaskModel? username = box.get('username');
  runApp(MyApp(username: username?.toString()));
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
