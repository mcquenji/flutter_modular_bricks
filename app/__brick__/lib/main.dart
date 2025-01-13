import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:{{name}}/src/app/app.dart';

void main() async {
  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}

/// Root widget of the application.
class AppWidget extends StatelessWidget {
  /// Root widget of the application.
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
