import 'package:flutter/material.dart';

import 'bloc/bloc_exports.dart';
import 'global/keys.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc(),
      child: MaterialApp(
        title: 'ToDo App',
        navigatorKey: navigatorKey,
        theme: ThemeData.light(useMaterial3: true),
        darkTheme: ThemeData.dark(useMaterial3: true),
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}
