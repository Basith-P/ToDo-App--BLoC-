part of 'task_bloc.dart';

class TaskState extends Equatable {
  const TaskState(this.tasks);

  final List<Task> tasks;

  @override
  List<Object> get props => [tasks];

  Map<String, dynamic> toJson() {
    return {'tasks': tasks.map((task) => task.toJson()).toList()};
  }

  factory TaskState.fromJson(Map<String, dynamic> json) {
    return TaskState(
      (json['tasks'] as List<dynamic>)
          .map((task) => Task.fromJson(task as Map<String, dynamic>))
          .toList(),
    );
  }
}
