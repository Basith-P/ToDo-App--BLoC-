import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/task.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskState([])) {
    on<AddTask>(_onTaskAdded);
    on<DeleteTask>(_onTaskDeleted);
    on<UpdateTask>(_onTaskUpdated);
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
}
