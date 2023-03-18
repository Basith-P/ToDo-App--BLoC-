import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../bloc/bloc_exports.dart';
import '../global/keys.dart';
import '../widgets/add_task_bottom_sheet.dart';
import '../widgets/main_drawer.dart';
import 'completed_tasks.dart';
import 'pending_tasks.dart';
import 'starred_tasks.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final taskBlocR = navigatorKey.currentContext!.read<TaskBloc>();

  final List<Map<String, dynamic>> _pages = [
    {'page': const StarredTasks(), 'title': 'Starrted'},
    {'page': const PendingTasks(), 'title': 'Pending'},
    {'page': const CompletedTasks(), 'title': 'Completed'},
  ];

  final List<Map<String, dynamic>> _bottomNavigationBarItems = [
    {'icon': const FaIcon(FontAwesomeIcons.star), 'label': 'Starrted'},
    {'icon': const FaIcon(FontAwesomeIcons.clock), 'label': 'Pending'},
    {'icon': const FaIcon(FontAwesomeIcons.check), 'label': 'Completed'},
  ];

  void _showAddTaskBottomSheet(BuildContext context) {
    showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => const AddTaskBottomSheet())
        .then((value) => setState(() => _selectedPageIndex = 1));
  }

  int _selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> appBarActions = [
      PopupMenuButton(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          offset: const Offset(0, 50),
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                  child: TextButton(
                onPressed: () {
                  taskBlocR.add(DeleteAllTasks());
                  navigatorKey.currentState!.pop();
                },
                child: const Text('Delete All Tasks'),
              )),
              PopupMenuItem(
                  child: TextButton(
                onPressed: () {
                  taskBlocR.add(ClearCompletedTasks());
                  navigatorKey.currentState!.pop();
                },
                child: const Text('Remove Completed Tasks'),
              )),
            ];
          })
    ];

    return Scaffold(
        appBar: AppBar(
            title: Text(_pages[_selectedPageIndex]['title']),
            actions: appBarActions),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _showAddTaskBottomSheet(context),
          elevation: 0,
          child: const FaIcon(FontAwesomeIcons.plus),
        ),
        drawer: const MainDrawer(),
        body: _pages[_selectedPageIndex]['page'] as Widget,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPageIndex,
          onTap: (index) => setState(() => _selectedPageIndex = index),
          items: _bottomNavigationBarItems
              .map((e) =>
                  BottomNavigationBarItem(icon: e['icon'], label: e['label']))
              .toList(),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          elevation: 0,
        ));
  }
}
