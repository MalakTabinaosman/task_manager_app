import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager_app/home/presentation/add_task_screen/add_task_screen.dart';
import 'package:task_manager_app/utils/constants/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required String username});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? username;
  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  void _loadUsername() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username') ?? '';
    });
    // Load username from SharedPreferences or other source
  }

  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FilledButton.icon(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskScreen()),
          );
        },
        label: Text("Add Task"),
        style: ButtonStyle(
          foregroundColor: MaterialStatePropertyAll(AppColors.darkTextPrimary),
          backgroundColor: MaterialStatePropertyAll(
            isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
          ),
        ),
        icon: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(height: height * 0.1),

              Text(
                "Welcome $username",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
