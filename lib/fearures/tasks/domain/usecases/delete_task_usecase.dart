


import 'package:task_manager_app/fearures/tasks/domain/repository/task_repository.dart';

class DeleteTaskUseCase {
  final TaskRepository repository;

  DeleteTaskUseCase(this.repository);

  Future<void> call(int id) {
    return repository.deleteTask(id);
  }
}