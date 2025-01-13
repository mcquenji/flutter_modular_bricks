import 'package:mcquenji_core/mcquenji_core.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:{{package}}/src/{{module.snakeCase()}}/{{module.snakeCase()}}.dart';


class {{name.pascalCase()}}Repository extends Repository<{{#async}}AsyncValue<{{/async}}Type>{{#async}}>{{/async}} {
  {{name.pascalCase()}}Repository() : super({{#async}}AsyncValue.loading(){{/async}}{{^async}}initialValue{{/async}});

  @override
  void dispose() {}
}
