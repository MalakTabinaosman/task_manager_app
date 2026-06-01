import 'package:flutter/material.dart';

class NameTextField extends StatelessWidget {
  final TextEditingController controller;

  const NameTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Please enter your name';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: 'eg: Malak Osman',
        hintStyle: TextStyle(color: isDark ? Colors.white38 : Colors.black26),
        filled: true,
        fillColor: isDark ? Colors.grey[900] : Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),
    );
  }
}
