import 'dart:io';
import 'package:mason/mason.dart';

void run(HookContext context) {
  final name = (context.vars['name'] as String).snakeCase;
  final module = (context.vars['module'] as String).snakeCase;
  final package = context.vars['package'] as String.snakeCase;

  final f = File('lib/$package.dart');

  context.logger.info("Exporting module at ${f.path}");

  f.writeAsString("export 'src/$name/$name.dart';", mode: FileMode.append);

  context.logger.success("Successfully exported module!");
}
