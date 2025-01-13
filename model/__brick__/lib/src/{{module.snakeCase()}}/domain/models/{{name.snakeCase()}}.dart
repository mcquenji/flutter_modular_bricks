// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:{{package}}/src/{{module.snakeCase()}}/{{module.snakeCase()}}.dart';

part '{{name.snakeCase()}}.freezed.dart';
{{^skipSerialization}}part '{{name.snakeCase()}}.g.dart';{{/skipSerialization}}

@freezed
class {{name.pascalCase()}} with _${{name.pascalCase()}} {
  const factory {{name.pascalCase()}}({}) = _{{name.pascalCase()}};

  const {{name.pascalCase()}}._();

  {{^skipSerialization}}factory {{name.pascalCase()}}.fromJson(Map<String, Object?> json) => _${{name.pascalCase()}}FromJson(json);{{/skipSerialization}}
}
