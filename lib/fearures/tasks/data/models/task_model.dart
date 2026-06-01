import 'package:hive/hive.dart';
import 'package:task_manager_app/fearures/tasks/domain/entities/task_entity.dart';

part 'task_model.g.dart';
@HiveType(typeId: 0)
class TaskModel {
  @HiveField(0)
  final int? hiveId;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final DateTime date;

  @HiveField(4)
  final bool isCompleted;

  const TaskModel({
    this.hiveId,
    required this.title,
    required this.description,
    required this.date,
    this.isCompleted = false,
  });

  // Model -> Entity
  TaskEntity toEntity() {
    return TaskEntity(
      id: hiveId?.toString() ?? '',
      title: title,
      description: description,
      createdAt: date,
      isCompleted: isCompleted,
    );
  }

  // Entity -> Model
  factory TaskModel.fromEntity(TaskEntity entity) {
    return TaskModel(
      hiveId: int.tryParse(entity.id),
      title: entity.title,
      description: entity.description,
      isCompleted: entity.isCompleted,
      date: entity.createdAt,
    );
  }
}