import 'dart:io';

class SimpleMocksParser {
  final String mocksPath;

  Map<String, List<String>> _responses;

  SimpleMocksParser({this.mocksPath});

  void init() {
    var files = Directory(mocksPath).listSync();

    _responses = {};

    for (var file in files) {
      String methodName =
          file.path.replaceFirst('$mocksPath/', '').replaceFirst('.md', '');
      _responses[methodName] = _parseResponses(mockFile: file);
    }
  }

  List<String> getResponseByMethodName(String methodName) {
    return _responses[methodName];
  }

  List<String> _parseResponses({File mockFile}) {
    String mock = mockFile.readAsStringSync();

    List<String> responseBodys = [];

    var regExp = RegExp(
      r'(### Response body recorded for playback[\w|\W]*?\```)([\w\W]+?)(```)',
    );

    var matches = regExp.allMatches(mock);

    for (var m in matches) {
      responseBodys.add(m.group(2));
    }

    return responseBodys;
  }
}
