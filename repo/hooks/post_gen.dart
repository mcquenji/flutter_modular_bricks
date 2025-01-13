import 'dart:io';
import 'package:mason/mason.dart';

void run(HookContext context) {
  final name = (context.vars['name'] as String).snakeCase;
  final module = (context.vars['module'] as String).snakeCase;

  final f = File(
    'lib/src/$module/presentation/repositories/repositories.dart',
  );

  context.logger.info("Exporting repository at ${f.path}");

  f.writeAsString("export '${name}_repository.dart';", mode: FileMode.append);

  context.logger.success("Successfully exported repository!");
}
