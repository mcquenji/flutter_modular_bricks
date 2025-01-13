import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) async {
  final workDir = '.';

  final progress = context.logger.progress('Downloading packages');

  final useFvm = context.vars['useFvm'] as bool;

  if (useFvm) {
    final fvm = context.logger.progress('FVM detected. Configuring');

    final fvmUse = await Process.run(
      'fvm',
      ['use', '-f'],
      runInShell: true,
      workingDirectory: workDir,
    );

    if (fvmUse.exitCode != 0) {
      fvm.fail('Failed to configure FVM: ${fvmUse.stderr}');
    } else {
      fvm.complete('Configured FVM');
    }
  }

  final result = await Process.run(
    useFvm ? 'fvm' : 'flutter',
    [useFvm ? 'flutter' : '', 'pub', 'get'],
    runInShell: true,
    workingDirectory: workDir,
  );

  if (result.exitCode != 0) {
    progress.fail('Failed to fetch dependencies: ${result.stderr}');
  } else {
    progress.complete('Downloaded packages');
  }

  final mason = context.logger.progress('Downloading bricks');

  final masonProc = await Process.run(
    'mason',
    ['get'],
    runInShell: true,
    workingDirectory: workDir,
  );

  if (masonProc.exitCode != 0) {
    mason.fail('Failed to fetch bricks: ${masonProc.stderr}');
  } else {
    mason.complete('Downloaded bricks');
  }

  context.logger.warn(
    'Please remember to edit `README.md` to match your project and update the `description` in the `pubspec.yaml` file.',
  );

  for (final platform in context.vars['platforms'] as List<String>) {
    mason.progress('Setting up platform: $platform');

    await Process.run(
      'flutter',
      ['create', '--platforms', platform],
      runInShell: true,
      workingDirectory: workDir,
    );

    mason.complete('Platform setup: $platform');
  }
}
