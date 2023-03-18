part of 'task_bloc.dart';

class TaskState extends Equatable {
  const TaskState(this.tasks);

  final List<Task> tasks;

  @override
  List<Object> get props => [tasks];
}
