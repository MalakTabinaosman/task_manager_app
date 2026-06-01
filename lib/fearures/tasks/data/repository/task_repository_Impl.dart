import 'package:task_manager_app/fearures/tasks/data/datasources/task_local_datasource.dart';
import 'package:task_manager_app/fearures/tasks/data/models/task_model.dart';
import 'package:task_manager_app/fearures/tasks/domain/entities/task_entity.dart';
import 'package:task_manager_app/fearures/tasks/domain/repository/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskLocalDataSource localDataSource;
  TaskRepositoryImpl(this.localDataSource);

  @override
  Future<void> addTask(TaskEntity task) async {
    final model = TaskModel.fromEntity(task);
    await localDataSource.addTask(model);
  }

  @override
  Future<void> deleteTask(int id) async {
    await localDataSource.deleteTask(id);
  }

  @override
  Future<List<TaskEntity>> getTasks() async {
    final models = await localDataSource.getTasks();
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<void> updateTask(int id, TaskEntity task) async {
    final model = TaskModel.fromEntity(task);
    await localDataSource.updateTask(id, model);
  }
}
