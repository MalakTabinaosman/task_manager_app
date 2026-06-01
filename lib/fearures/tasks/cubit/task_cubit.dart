import 'package:bloc/bloc.dart';

import 'package:task_manager_app/fearures/tasks/cubit/task_state.dart';
import 'package:task_manager_app/fearures/tasks/domain/entities/task_entity.dart';
import 'package:task_manager_app/fearures/tasks/domain/usecases/get_task_usecase.dart';
import 'package:task_manager_app/fearures/tasks/domain/usecases/add_task_usecase.dart';
import 'package:task_manager_app/fearures/tasks/domain/usecases/delete_task_usecase.dart';
import 'package:task_manager_app/fearures/tasks/domain/usecases/update_task_usecase.dart';

class TaskCubit extends Cubit<TaskState> {
  final AddTaskUseCase addTaskUseCase;
  final GetTaskUseCase getTasksUseCase;
  final DeleteTaskUseCase deleteTaskUseCase;
  final UpdateTaskUseCase updateTaskUseCase;

  TaskCubit({
    required this.addTaskUseCase,
    required this.getTasksUseCase,
    required this.deleteTaskUseCase,
    required this.updateTaskUseCase,
  }) : super(TaskInitial());

  Future<void> getTasks() async {
    emit(TaskLoading());
    try {
      final tasks = await getTasksUseCase();
      emit(TaskLoaded(tasks));
    } catch (e) {
      emit(TaskError(e.toString(), message: 'Failed to load tasks'));
    }
  }

  Future<void> addTask(TaskEntity task) async {
    try {
      await addTaskUseCase(task);
      await getTasks();
    } catch (e) {
      emit(TaskError(e.toString(), message: 'Failed to add task'));
    }
  }

  Future<void> deleteTask(int id) async {
    try {
      await deleteTaskUseCase(id);
      await getTasks();
    } catch (e) {
      emit(TaskError(e.toString(), message: 'Failed to delete task'));
    }
  }

  Future<void> updateTask(int id, TaskEntity task) async {
    try {
      await updateTaskUseCase(id, task);
      await getTasks();
    } catch (e) {
      emit(TaskError(e.toString(), message: 'Failed to update task'));
    }
  }
}
