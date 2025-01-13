import 'defaults.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:{{package}}/src/{{name.snakeCase()}}/{{name.snakeCase()}}.dart';
import 'package:logging/logging.dart';
import 'package:mcquenji_core/mcquenji_core.dart';

Future<void> main() async {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen(debugLogHandler);

  setUp(() {
    Modular.init({{name.pascalCase()}}Module());
  });

  tearDown(() {
    Modular.destroy();
  });

  // Your unit tests here.
}
