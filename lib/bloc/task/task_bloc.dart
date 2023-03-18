import 'package:equatable/equatable.dart';

import '../../models/task.dart';
import '../bloc_exports.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends HydratedBloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskState([])) {
    on<AddTask>(_onTaskAdded);
    on<DeleteTask>(_onTaskDeleted);
    on<UpdateTask>(_onTaskUpdated);
    on<ToggleTask>(_onTaskToggled);
  }

  void _onTaskAdded(AddTask event, Emitter<TaskState> emit) {
    final List<Task> tasks = List.from(state.tasks)..add(event.task);
    emit(TaskState(tasks));
  }

  void _onTaskDeleted(DeleteTask event, Emitter<TaskState> emit) {
    final List<Task> tasks = List.from(state.tasks)..remove(event.task);
    emit(TaskState(tasks));
  }

  void _onTaskUpdated(UpdateTask event, Emitter<TaskState> emit) {
    final List<Task> tasks = List.from(state.tasks)
      ..remove(event.task)
      ..add(event.task);
    emit(TaskState(tasks));
  }

  void _onTaskToggled(ToggleTask event, Emitter<TaskState> emit) {
    final index = state.tasks.indexOf(event.task);
    final List<Task> tasks = List.from(state.tasks)
      ..remove(event.task)
      ..insert(index, event.task.copyWith(isDone: !event.task.isDone));
    emit(TaskState(tasks));
  }

  @override
  TaskState? fromJson(Map<String, dynamic> json) {
    return TaskState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(TaskState state) {
    return state.toJson();
  }
}
