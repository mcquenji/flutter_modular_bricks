import 'dart:io';
import 'package:mason/mason.dart';

void run(HookContext context) {
  final name = (context.vars['name'] as String).snakeCase;
  final module = (context.vars['module'] as String).snakeCase;

  final f = File(
    'lib/src/$module/utils/utils.dart',
  );

  context.logger.info("Exporting util at ${f.path}");

  f.writeAsString("export '${name}_utils.dart';", mode: FileMode.append);

  context.logger.success("Successfully exported util!");
}
