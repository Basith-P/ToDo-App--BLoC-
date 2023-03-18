import 'package:flutter/material.dart';

import '../bloc/bloc_exports.dart';
import '../global/keys.dart';
import '../models/task.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  late TextEditingController _titleController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16)
          .copyWith(bottom: MediaQuery.of(context).viewInsets.bottom + 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Add Task',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          TextField(
            autofocus: true,
            controller: _titleController,
            textInputAction: TextInputAction.done,
            maxLength: 50,
            decoration: InputDecoration(
              hintText: 'Title',
              counterText: '',
              filled: true,
              isDense: true,
              fillColor: Theme.of(context).colorScheme.surface,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () => navigatorKey.currentState?.pop(),
                  child: const Text('Cancel')),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {
                  if (_titleController.text.isEmpty) return;
                  final Task task = Task(title: _titleController.text);
                  context.read<TaskBloc>().add(AddTask(task));
                  _titleController.clear();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                ),
                child: const Text('Add'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
