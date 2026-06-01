import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:task_manager_app/fearures/tasks/presentation/screens/home_screen.dart';
import 'package:task_manager_app/fearures/welcome/widgets/get_started_button.dart';
import 'package:task_manager_app/fearures/welcome/widgets/name_text_field.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: height * 0.08),

                /// Logo + App Name
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 85,
                      width: 85,
                      child: Image.asset(
                        isDark
                            ? 'assets/images/imgi_129_default.png'
                            : 'assets/images/imgi_130_default.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Text(
                      'TickIt',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: height * 0.02),

                Text(
                  'Welcome to TickIt',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w600,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    'Your personal task manager app to boost productivity and stay organized.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                      color: isDark ? Colors.white54 : Colors.black54,
                    ),
                  ),
                ),

                SizedBox(height: height * 0.08),

                Image.asset('assets/images/working.png', fit: BoxFit.contain),

                SizedBox(height: height * 0.08),

                Padding(
                  padding: const EdgeInsets.only(left: 2.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Enter your name to get started',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: isDark ? Colors.white : Colors.black87,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: height * 0.01),

                NameTextField(controller: _controller),

                const SizedBox(height: 20),

                GetStartedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final box = await Hive.openBox('appBox');
                      await box.put('username', _controller.value.text);
                      String? username = box.get('username');

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return HomeScreen(username: _controller.value.text);
                          },
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
