// ignore_for_file: avoid_print

library model_code_generator;

import 'dart:convert';
import 'dart:io';

class ModelCodeGenerator {
  static void start(List<String> arguments) async {
    if (arguments.isEmpty) {
      print('Model name and JSON is missing in arguments. please try again.');
    } else if (arguments.first == '--help') {
      print('\nHow to run');
      print('dart run model_code_generator <yourclassname>\n');
      print('example : dart run model_code_generator user');
    } else if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(arguments.first)) {
      print('Model name only accept Alphanumeric string.');
    } else {
      print("\n");
      print('Paste your JSON here (press Enter twice to finish):');
      final lines = <String>[];
      String? line;
      while ((line = stdin.readLineSync()) != null && line!.isNotEmpty) {
        lines.add(line);
      }

      lines.forEach(print);

      String jsonString = lines.join();

      try {
        Map<String, dynamic> jsonObj =
            jsonDecode(jsonString); // Attempt to decode as JSON

        try {
          String tambahan = "\\lib\\model\\";
          String dirnya = Directory.current
              .toString()
              .replaceAll("'", "")
              .replaceAll('Directory: ', '');
          String pathnya = dirnya + tambahan;
          final dirnya2 = Directory(pathnya);
          await dirnya2.create();

          final modelName = arguments.first.replaceAll('.dart', '');
          final className = modelName[0].toUpperCase() + modelName.substring(1);
          final filename = '$modelName.dart'.toLowerCase();
          final file = File(pathnya + filename);

          String tempModel = "class $className {\n";
          String tempConstruct = "\n  $className({\n";
          String tempfromJson =
              "\n  $className.fromJson(Map<String, dynamic> json){\n";
          String temptoJson = "\n  Map<String, dynamic> toJson(){\n";
          temptoJson += "   final Map<String, dynamic> data = {};\n";

          jsonObj.forEach((key, value) async {
            String dataType = value.runtimeType.toString();
            dataType = dataType.replaceAll('_', '');
            tempModel += "  $dataType? $key;\n";
            tempConstruct += "    this.$key,\n";
            tempfromJson += "    $key = json['$key'];\n";
            temptoJson += "   data['$key'] = $key;\n";
          });

          tempConstruct += "  });\n";
          tempfromJson += "  }\n";
          temptoJson += "   return data;\n";
          temptoJson += "  }\n";
          tempModel += tempConstruct + tempfromJson + temptoJson;
          tempModel += "}\n";
          await file.writeAsString(tempModel);

          print('File $filename created successfully!');
        } catch (e) {
          // print('invalid json');
          // print({'name': 'doni'});
          print(e);
        }
      } catch (e) {
        print('Invalid JSON input.');
      }
    }
  }
}
