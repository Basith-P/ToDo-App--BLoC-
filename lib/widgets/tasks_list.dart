import 'package:flutter/material.dart';

import '../bloc/bloc_exports.dart';
import '../models/task.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    super.key,
    required this.tasks,
  });

  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return ListTile(
                onLongPress: () =>
                    context.read<TaskBloc>().add(DeleteTask(tasks[index])),
                leading: Checkbox(
                  shape: const CircleBorder(),
                  value: tasks[index].isDone,
                  onChanged: (value) =>
                      context.read<TaskBloc>().add(ToggleTask(tasks[index])),
                ),
                title: Text(tasks[index].title));
          }),
    );
  }
}
