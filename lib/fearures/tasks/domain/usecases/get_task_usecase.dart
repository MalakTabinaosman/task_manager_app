import 'package:task_manager_app/fearures/tasks/domain/entities/task_entity.dart';
import 'package:task_manager_app/fearures/tasks/domain/repository/task_repository.dart';

class GetTaskUseCase {
  final TaskRepository repository;

  GetTaskUseCase(this.repository);

  Future<List<TaskEntity>> call() {


    return repository.getTasks();
    
  }
}
