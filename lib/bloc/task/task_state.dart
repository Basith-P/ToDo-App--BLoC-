part of 'task_bloc.dart';

class TaskState extends Equatable {
  const TaskState({this.tasks = const [], this.deletedTasks = const []});

  final List<Task> tasks;
  final List<Task> deletedTasks;

  @override
  List<Object> get props => [tasks];

  int get taskCount => tasks.length;
  int get deletedTaskCount => deletedTasks.length;
  int get completedTaskCount =>
      tasks.where((task) => task.isDone).toList().length;
  int get deletedCompletedTaskCount =>
      deletedTasks.where((task) => task.isDone).toList().length;

  Map<String, dynamic> toJson() {
    return {
      'tasks': tasks.map((task) => task.toJson()).toList(),
      'deletedTasks': deletedTasks.map((task) => task.toJson()).toList(),
    };
  }

  factory TaskState.fromJson(Map<String, dynamic> json) {
    return TaskState(
      tasks: (json['tasks'] as List<dynamic>)
          .map((task) => Task.fromJson(task))
          .toList(),
      deletedTasks: (json['deletedTasks'] as List<dynamic>)
          .map((task) => Task.fromJson(task))
          .toList(),
    );
  }
}
