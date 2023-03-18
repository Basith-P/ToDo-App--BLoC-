import 'package:flutter/material.dart';

import '../bloc/bloc_exports.dart';
import '../models/task.dart';
import '../widgets/main_drawer.dart';
import '../widgets/tasks_list.dart';

class DeletedTasksPage extends StatelessWidget {
  const DeletedTasksPage({Key? key}) : super(key: key);

  static const routeName = '/deleted-tasks';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Deleted Tasks')),
      drawer: const MainDrawer(),
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          final List<Task> deletedTasks = state.deletedTasks;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0).copyWith(bottom: 0),
                child: Row(
                  children: [
                    Chip(label: Text('Total: ${state.deletedTaskCount}')),
                    const SizedBox(width: 8),
                    Chip(
                        label: Text(
                            'Completed: ${state.deletedCompletedTaskCount}')),
                  ],
                ),
              ),
              TasksList(tasks: deletedTasks),
            ],
          );
        },
      ),
    );
  }
}
