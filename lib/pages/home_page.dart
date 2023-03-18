import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../bloc/bloc_exports.dart';
import '../models/task.dart';
import '../widgets/add_task_bottom_sheet.dart';
import '../widgets/main_drawer.dart';
import '../widgets/tasks_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = '/';

  void _showAddTaskBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => const AddTaskBottomSheet());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        final List<Task> tasks = state.tasks;
        return Scaffold(
          appBar: AppBar(title: const Text('Your Tasks')),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _showAddTaskBottomSheet(context),
            child: const FaIcon(FontAwesomeIcons.plus),
          ),
          drawer: const MainDrawer(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0).copyWith(bottom: 0),
                child: Row(
                  children: [
                    Chip(label: Text('Total: ${state.taskCount}')),
                    const SizedBox(width: 8),
                    Chip(label: Text('Completed: ${state.completedTaskCount}')),
                  ],
                ),
              ),
              TasksList(tasks: tasks),
            ],
          ),
        );
      },
    );
  }
}
