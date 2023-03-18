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
      appBar: AppBar(
        title: const Text('Deleted Tasks'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever_outlined),
            onPressed: () {
              context.read<TaskBloc>().add(ClearDeletedTasks());
            },
          ),
        ],
      ),
      drawer: const MainDrawer(),
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          final List<Task> deletedTasks = state.deletedTasks;
          return TasksList(tasks: deletedTasks);
        },
      ),
    );
  }
}
