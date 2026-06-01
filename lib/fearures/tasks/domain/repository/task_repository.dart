import 'package:task_manager_app/fearures/tasks/domain/entities/task_entity.dart';

abstract class TaskRepository {


  Future<void> addTask(TaskEntity task);

  Future<List<TaskEntity>> getTasks();

  Future<void> deleteTask(int id);

  Future<void> updateTask(int id , TaskEntity task);


}
