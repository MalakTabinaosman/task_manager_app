


import 'package:task_manager_app/fearures/tasks/domain/entities/task_entity.dart';
import 'package:task_manager_app/fearures/tasks/domain/repository/task_repository.dart';

class UpdateTaskUseCase {
  final TaskRepository repository;

  UpdateTaskUseCase(this.repository);

  Future<void> call(int id, TaskEntity task) {
    return repository.updateTask(id, task);
  }
}