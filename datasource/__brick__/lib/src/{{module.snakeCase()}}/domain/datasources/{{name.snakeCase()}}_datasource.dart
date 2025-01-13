import 'package:mcquenji_core/mcquenji_core.dart';
import 'package:{{package}}/src/{{module.snakeCase()}}/{{module.snakeCase()}}.dart';

abstract class {{name.pascalCase()}}Datasource extends Datasource{
  @override
  String get name => '{{name.pascalCase()}}';
}