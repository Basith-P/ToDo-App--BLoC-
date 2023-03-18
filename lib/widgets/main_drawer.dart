import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../bloc/bloc_exports.dart';
import '../global/keys.dart';
import '../pages/deleted_tasks_page.dart';
import '../pages/home_page.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final taskBlocR = context.read<TaskBloc>();

    return SafeArea(
        child: Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            child: Center(
              child: FaIcon(
                FontAwesomeIcons.listCheck,
                color: Theme.of(context).colorScheme.secondary,
                size: Theme.of(context).textTheme.headlineLarge?.fontSize,
              ),
            ),
          ),
          ListTile(
              leading: const FaIcon(FontAwesomeIcons.listCheck),
              iconColor: Theme.of(context).colorScheme.onBackground,
              title: const Text('Your Tasks'),
              style: ListTileStyle.list,
              trailing: Text('${taskBlocR.state.taskCount}'),
              onTap: () {
                navigatorKey.currentState
                    ?.pushReplacementNamed(HomePage.routeName);
              }),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.trashCan),
            iconColor: Theme.of(context).colorScheme.onBackground,
            title: const Text('Deleted Tasks'),
            style: ListTileStyle.list,
            trailing: Text('${taskBlocR.state.deletedTaskCount}'),
            onTap: () => navigatorKey.currentState
                ?.pushNamed(DeletedTasksPage.routeName),
          ),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.solidMoon),
            iconColor: Theme.of(context).colorScheme.onBackground,
            title: const Text('Dark Mode'),
            style: ListTileStyle.list,
            trailing: Transform(
              alignment: Alignment.centerRight,
              transform: Matrix4.identity()..scale(0.7),
              child: BlocBuilder<ThemeBloc, ThemeState>(
                builder: (_, __) {
                  return Switch(
                    value: Theme.of(context).brightness == Brightness.dark,
                    onChanged: (value) {
                      context.read<ThemeBloc>().add(ToggleTheme());
                    },
                  );
                },
              ),
            ),
          )
        ],
      ),
    ));
  }
}
