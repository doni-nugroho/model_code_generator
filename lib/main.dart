// ignore_for_file: avoid_print

library model_code_generator;

import 'dart:convert';
import 'dart:io';

/// A Calculator.
class ModelCodeGenerator {
  static void start(List<String> arguments) async {
    if (arguments.isEmpty) {
      print('Model name and JSON is missing in arguments. please try again.');
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
          // var bodyJson = {
          //   "language": "dart",
          //   "typeName": "user",
          //   "jsonString": {"name": "david"}
          // };
          // print(jsonEncode(bodyJson));

          // final headers = Map<String, String>();
          // headers['User-Agent'] =
          //     'Thunder Client (https://www.thunderclient.com)';
          // headers['Content-Type'] = 'application/json';

          // var response = await http.post(
          //   Uri.parse('http://raufendro-dev.com:3000/model'),
          //   body: jsonEncode(bodyJson),
          //   // headers: headers,
          // );

          // print(response);

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
          String tempConstruct = "$className(";
          jsonObj.forEach((key, value) async {
            String dataType = value.runtimeType.toString();
            dataType = dataType.replaceAll('_', '');
            tempModel += "final $dataType? $key;\n";
            tempConstruct += "this.$key,\n";
          });
          tempConstruct += ");\n";
          tempModel += tempConstruct;
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
