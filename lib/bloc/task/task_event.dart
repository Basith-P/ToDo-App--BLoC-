part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class AddTask extends TaskEvent {
  final Task task;

  const AddTask(this.task);

  @override
  List<Object> get props => [task];
}

class DeleteTask extends TaskEvent {
  final Task task;

  const DeleteTask(this.task);

  @override
  List<Object> get props => [task];
}

class RemoveTask extends TaskEvent {
  final Task task;

  const RemoveTask(this.task);

  @override
  List<Object> get props => [task];
}

class UpdateTask extends TaskEvent {
  final Task task;

  const UpdateTask(this.task);

  @override
  List<Object> get props => [task];
}

class ToggleTask extends TaskEvent {
  final Task task;

  const ToggleTask(this.task);

  @override
  List<Object> get props => [task];
}

class ClearDeletedTasks extends TaskEvent {}

class ClearCompletedTasks extends TaskEvent {}

class DeleteAllTasks extends TaskEvent {}
