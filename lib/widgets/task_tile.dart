import 'package:flutter/material.dart';

import '../bloc/bloc_exports.dart';
import '../models/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile(this.task, {super.key});

  final Task task;

  @override
  Widget build(BuildContext context) {
    final taskBlocR = context.read<TaskBloc>();

    void deleteOrRemoveTask() {
      if (task.isDeleted) {
        debugPrint('Removing task: ${task.title}');
        taskBlocR.add(RemoveTask(task));
      } else {
        debugPrint('Deleting task: ${task.title}');
        taskBlocR.add(DeleteTask(task));
      }
    }

    return ListTile(
      onLongPress: deleteOrRemoveTask,
      leading: Checkbox(
        shape: const CircleBorder(),
        value: task.isDone,
        onChanged: (value) =>
            task.isDeleted ? null : taskBlocR.add(ToggleTask(task)),
      ),
      title: Text(
        task.title,
        style: task.isDone
            ? const TextStyle(decoration: TextDecoration.lineThrough)
            : null,
      ),
    );
  }
}
