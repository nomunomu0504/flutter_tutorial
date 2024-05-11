import 'package:flutter/material.dart';
import 'package:flutter_tutorial/view/main/main_screen.dart';
import 'package:flutter_tutorial/view/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

class Routes {
  /// スプラッシュ画面
  static const String root = '/';

  /// メイン画面
  static const String main = '/main';

  static final GoRouter router = GoRouter(
    initialLocation: root,
    routes: [
      GoRoute(
        path: root,
        name: root,
        pageBuilder: (context, state) => const MaterialPage<void>(
          child: SplashScreen(),
        ),
      ),
      GoRoute(
        path: main,
        name: main,
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
