import 'package:mcquenji_core/mcquenji_core.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:{{package}}/src/{{module.snakeCase()}}/{{module.snakeCase()}}.dart';


class {{name.pascalCase()}}Guard extends RouteGuard{
  @override
  Future<bool> canActivate(String path, ModularRoute route) async {
    return true;
  }
}