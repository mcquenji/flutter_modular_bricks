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

  final modulesDir = Directory('lib/modules');

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

  final dataSourcesDirectory = Directory(
    'lib/modules/${(context.vars['module'] as String).snakeCase}/domain/datasources',
  );

  final dataSources = dataSourcesDirectory
      .listSync()
      .where((e) => e is File)
      .map(
        (e) => e.path.split('/').last.split('.').first.pascalCase,
      )
      .toList();

  dataSources.remove('Datasources');

  context.vars['datasource'] = context.logger.chooseOne(
    'Parent datasource',
    choices: dataSources,
  );
}
