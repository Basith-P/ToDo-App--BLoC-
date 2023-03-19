import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/task.dart';
import 'task_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    super.key,
    required this.tasks,
  });

  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return tasks.isEmpty
        ? Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                FontAwesomeIcons.listCheck,
                size: 40,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 20),
              Text(
                'No Tasks here!',
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ))
        : SingleChildScrollView(
            child: ExpansionPanelList.radio(
              children: tasks
                  .map(
                    (task) => ExpansionPanelRadio(
                      value: task.id,
                      canTapOnHeader: true,
                      headerBuilder: (context, isExpanded) => TaskTile(task),
                      body: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(task.desc),
                      ),
                    ),
                  )
                  .toList(),
            ),
          );
  }
}


// ListView.builder(
//             padding: const EdgeInsets.all(16.0),
//             itemCount: tasks.length,
//             itemBuilder: (context, index) {
//               return TaskTile(tasks[index]);
//             });