import 'package:equatable/equatable.dart';

import '../../models/task.dart';
import '../bloc_exports.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends HydratedBloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskState()) {
    on<AddTask>(_onTaskAdded);
    on<DeleteTask>(_onTaskDeleted);
    on<RemoveTask>(_onTaskRemoved);

    on<UpdateTask>(_onTaskUpdated);
    on<ToggleTask>(_onTaskToggled);
    on<ClearDeletedTasks>(_onClearDeletedTasks);
    on<ClearCompletedTasks>(_onClearCompletedTasks);
    on<DeleteAllTasks>(_onDeleteAllTasks);
  }

  void _onTaskAdded(AddTask event, Emitter<TaskState> emit) {
    final List<Task> tasks = List.from(state.pendingTasks)..add(event.task);
    emit(TaskState(
      pendingTasks: tasks,
      starredTasks: state.starredTasks,
      completedTasks: state.completedTasks,
      deletedTasks: state.deletedTasks,
    ));
  }

  void _onTaskDeleted(DeleteTask event, Emitter<TaskState> emit) {
    emit(TaskState(
      pendingTasks: List.from(state.pendingTasks)..remove(event.task),
      starredTasks: List.from(state.starredTasks)..remove(event.task),
      completedTasks: List.from(state.completedTasks)..remove(event.task),
      deletedTasks: List.from(state.deletedTasks)
        ..add(event.task.copyWith(isDeleted: true)),
    ));
  }

  void _onTaskRemoved(RemoveTask event, Emitter<TaskState> emit) {
    emit(TaskState(
      pendingTasks: List.from(state.pendingTasks)..remove(event.task),
      starredTasks: List.from(state.starredTasks)..remove(event.task),
      completedTasks: List.from(state.completedTasks)..remove(event.task),
      deletedTasks: state.deletedTasks..remove(event.task),
    ));
  }

  void _onTaskUpdated(UpdateTask event, Emitter<TaskState> emit) {
    final List<Task> tasks = List.from(state.pendingTasks)
      ..remove(event.task)
      ..add(event.task);
    emit(TaskState(pendingTasks: tasks));
  }

  void _onTaskToggled(ToggleTask event, Emitter<TaskState> emit) {
    final task = event.task;
    List<Task> pendingTasks = [];
    List<Task> completedTasks = [];
    if (!task.isDone) {
      pendingTasks = List.from(state.pendingTasks)..remove(task);
      completedTasks = List.from(state.completedTasks)
        ..add(task.copyWith(isDone: true));
    } else {
      pendingTasks = List.from(state.pendingTasks)
        ..add(task.copyWith(isDone: false));
      completedTasks = List.from(state.completedTasks)..remove(task);
    }
    emit(TaskState(
        pendingTasks: pendingTasks,
        starredTasks: state.starredTasks,
        completedTasks: completedTasks,
        deletedTasks: state.deletedTasks));
  }

  void _onClearDeletedTasks(ClearDeletedTasks event, Emitter<TaskState> emit) {
    final List<Task> emptyList = <Task>[];
    emit(TaskState(pendingTasks: state.pendingTasks, deletedTasks: emptyList));
  }

  void _onClearCompletedTasks(
      ClearCompletedTasks event, Emitter<TaskState> emit) {
    emit(TaskState(
        pendingTasks: state.pendingTasks.where((task) => !task.isDone).toList(),
        deletedTasks:
            state.deletedTasks.where((element) => !element.isDone).toList()));
  }

  void _onDeleteAllTasks(DeleteAllTasks event, Emitter<TaskState> emit) {
    final List<Task> deletedTasks = List.from(state.deletedTasks)
      ..addAll(
          state.pendingTasks.map((task) => task.copyWith(isDeleted: true)));
    emit(TaskState(pendingTasks: const [], deletedTasks: deletedTasks));
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
