part of 'task_bloc.dart';

class TaskState extends Equatable {
  const TaskState({
    this.pendingTasks = const <Task>[],
    this.deletedTasks = const <Task>[],
    this.starredTasks = const <Task>[],
    this.completedTasks = const <Task>[],
  });

  final List<Task> pendingTasks;
  final List<Task> starredTasks;
  final List<Task> completedTasks;
  final List<Task> deletedTasks;

  @override
  List<Object> get props =>
      [pendingTasks, starredTasks, completedTasks, deletedTasks];

  int get taskCount => pendingTasks.length;
  int get deletedTaskCount => deletedTasks.length;
  int get completedTaskCount =>
      pendingTasks.where((task) => task.isDone).toList().length;
  int get deletedCompletedTaskCount =>
      deletedTasks.where((task) => task.isDone).toList().length;

  Map<String, dynamic> toJson() {
    return {
      'pendingTasks': pendingTasks.map((task) => task.toJson()).toList(),
      'starredTasks': starredTasks.map((task) => task.toJson()).toList(),
      'completedTasks': completedTasks.map((task) => task.toJson()).toList(),
      'deletedTasks': deletedTasks.map((task) => task.toJson()).toList(),
    };
  }

  factory TaskState.fromJson(Map<String, dynamic> json) {
    return TaskState(
      pendingTasks: (json['tasks'] as List<dynamic>)
          .map((task) => Task.fromJson(task))
          .toList(),
      starredTasks: (json['starredTasks'] as List<dynamic>)
          .map((task) => Task.fromJson(task))
          .toList(),
      completedTasks: (json['completedTasks'] as List<dynamic>)
          .map((task) => Task.fromJson(task))
          .toList(),
      deletedTasks: (json['deletedTasks'] as List<dynamic>)
          .map((task) => Task.fromJson(task))
          .toList(),
    );
  }
}
