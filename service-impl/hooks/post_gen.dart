import 'dart:io';
import 'package:mason/mason.dart';

void run(HookContext context) {
  final name = (context.vars['name'] as String).snakeCase;
  final service = (context.vars['service'] as String).snakeCase;
  final module = (context.vars['module'] as String).snakeCase;

  final f = File('lib/src/$module/infra/services/services.dart');

  context.logger.info("Exporting service impl at ${f.path}");

  f.writeAsString(
    "export '${name}_${service}.dart';",
    mode: FileMode.append,
  );

  context.logger.success("Successfully exported service impl!");
}
