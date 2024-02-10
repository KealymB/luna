import 'dart:async';
import 'dart:io';
import 'package:glob/glob.dart';

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

class RouteGenerator extends Generator {
  @override
  FutureOr<String> generate(LibraryReader library, BuildStep buildStep) async {
    final routes = <String>[];

    await for (final input in buildStep.findAssets(Glob('lib/**/page.dart'))) {
      final folderName = input.pathSegments[input.pathSegments.length - 2];
      final className = _getClassName(input);

      if (className != null) {
        routes.add('''
          GoRoute(
            path: '/$folderName',
            builder: (context, state) => $className(),
          ),
          ''');
      }
    }

    return '''
    List<GoRoute> generatedRoutes() {
      return [
        ${routes.join('\n')}
      ];
    }
    ''';
  }

  String? _getClassName(AssetId input) {
    final file = File(input.path);
    final lines = file.readAsLinesSync();

    for (var line in lines) {
      final classRegex = RegExp(r'class\s+(\w+)\s+{');
      final match = classRegex.firstMatch(line);

      if (match != null && match.groupCount > 0) {
        return match.group(1)!;
      }
    }

    return null;
  }
}
