import 'package:flutter/material.dart';
import 'package:flutter_tutorial/view/main/main_screen.dart';
import 'package:go_router/go_router.dart';

class Routes {
  /// メイン画面
  static const String main = '/main';

  static final GoRouter router = GoRouter(
    initialLocation: main,
    routes: [
      GoRoute(
        path: main,
        pageBuilder: (context, state) {
          final MainScreenArguments arguments =
              state.extra! as MainScreenArguments;
          return MaterialPage<void>(
            child: MainScreen(
              title: arguments.title,
            ),
          );
        },
      ),
    ],
  );
}

class MainScreenArguments {
  final String title;

  MainScreenArguments({
    required this.title,
  });
}
