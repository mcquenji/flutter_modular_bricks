import 'dart:io';
import 'package:mason/mason.dart';

void run(HookContext context) {
  final name = (context.vars['name'] as String).snakeCase;
  final datasource = (context.vars['datasource'] as String).snakeCase;
  final module = (context.vars['module'] as String).snakeCase;

  final f = File('lib/src/$module/infra/datasources/datasources.dart');

  context.logger.info("Exporting datasource impl at ${f.path}");

  f.writeAsString(
    "export '${name}_${datasource}.dart';",
    mode: FileMode.append,
  );

  context.logger.success("Successfully exported datasource impl!");
}
