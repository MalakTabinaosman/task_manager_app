import 'package:hive/hive.dart';
import '../models/task_model.dart';

abstract class TaskLocalDataSource {
  Future<void> addTask(TaskModel task);
  Future<List<TaskModel>> getTasks();
  Future<void> deleteTask(int id);
  Future<void> updateTask(int id, TaskModel task);
}

class TaskLocalDataSourceImpl implements TaskLocalDataSource {
  final Box<TaskModel> box;

  TaskLocalDataSourceImpl(this.box);

  @override
  Future<void> addTask(TaskModel task) async {
    await box.add(task);
  }

  @override
  Future<List<TaskModel>> getTasks() async {
    return box.values.toList();
  }

  @override
  Future<void> deleteTask(int id) async {
    await box.delete(id);
  }

  @override
  Future<void> updateTask(int id, TaskModel task) async {
    await box.putAt(id, task);
  }
}
