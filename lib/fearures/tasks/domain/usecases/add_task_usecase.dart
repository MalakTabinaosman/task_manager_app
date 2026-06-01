


import 'package:task_manager_app/fearures/tasks/domain/entities/task_entity.dart';
import 'package:task_manager_app/fearures/tasks/domain/repository/task_repository.dart';

class AddTaskUseCase {

  final TaskRepository repository;

  AddTaskUseCase(this.repository);

  Future<void> call(TaskEntity task)  {
    return repository.addTask(task);
  }
}