import 'dart:io';
import 'package:mason/mason.dart';
import 'package:yaml/yaml.dart';

void run(HookContext context) {
  var f = File('pubspec.yaml');

  if (!f.existsSync()) {
    context.logger.err('Not a flutter project: ${f.path} not found');
    exit(1);
  }

  final pubspec = loadYaml(f.readAsStringSync());

  context.vars['package'] = pubspec['name'];

  // --- Prompt module --- //

  final modulesDir = Directory('lib/src');

  final modules = modulesDir
      .listSync()
      .where((e) => e is Directory)
      .map((e) => e.path.split('/').last.pascalCase)
      .toList();

  context.vars['module'] = context.logger.chooseOne(
    'Parent module',
    choices: modules,
  );

  // --- Prompt service --- //

  final servicesDir = Directory(
    'lib/src/${(context.vars['module'] as String).snakeCase}/domain/services',
  );

  final services = servicesDir
      .listSync()
      .where((e) => e is File)
      .map(
        (e) => e.path.split('/').last.split('.').first.pascalCase,
      )
      .toList();

  services.remove('Services');

  context.vars['service'] = context.logger.chooseOne(
    'Parent service',
    choices: services,
  );
}
