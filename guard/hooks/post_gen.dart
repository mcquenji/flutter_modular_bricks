import 'dart:io';
import 'package:mason/mason.dart';

void run(HookContext context) {
  final name = (context.vars['name'] as String).snakeCase;
  final module = (context.vars['module'] as String).snakeCase;

  final f = File('lib/src/$module/presentation/guards/guards.dart');

  context.logger.info("Exporting route guard at ${f.path}");

  f.writeAsString("export '${name}_guard.dart';", mode: FileMode.append);

  context.logger.success("Successfully exported route guard!");
}
