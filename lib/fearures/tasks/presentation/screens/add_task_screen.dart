import 'package:flutter/material.dart';
import 'package:task_manager_app/utils/constants/colors.dart';

class AddTaskScreen extends StatefulWidget {
  AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _taskTitleController = TextEditingController();
  final TextEditingController _taskDescriptionController =
      TextEditingController();

  bool isImportant = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: isDark ? Colors.white : Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'New Task',
          style: TextStyle(color: isDark ? Colors.white : Colors.black),
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(25.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: height * 0.03),

                        Text(
                          'Task Title',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: height * 0.02),

                        TextFormField(
                          controller: _taskTitleController,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter a task title';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter task title',
                            hintStyle: TextStyle(
                              color: isDark ? Colors.white38 : Colors.black26,
                            ),
                            filled: true,
                            fillColor: isDark
                                ? Colors.grey[900]
                                : Colors.grey[200],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 14,
                            ),
                          ),
                        ),

                        SizedBox(height: height * 0.04),

                        Text(
                          'Task Description',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: height * 0.02),

                        TextFormField(
                          controller: _taskDescriptionController,
                          maxLines: 7,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter a task description';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter task description',
                            hintStyle: TextStyle(
                              color: isDark ? Colors.white38 : Colors.black26,
                            ),
                            filled: true,
                            fillColor: isDark
                                ? Colors.grey[900]
                                : Colors.grey[200],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 14,
                            ),
                          ),
                        ),

                        SizedBox(height: height * 0.05),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'High Priority',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Switch(
                              value: isImportant,
                              onChanged: (value) {
                                setState(() {
                                  isImportant = value;
                                });
                              },
                              activeTrackColor: AppColors.lightSuccess,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                Center(
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.add),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(
                        MediaQuery.of(context).size.width * 0.9,
                        50,
                      ),
                      backgroundColor: isDark
                          ? AppColors.darkPrimary
                          : AppColors.lightPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Handle submit
                      }
                    },
                    label: Text('Add Task'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
