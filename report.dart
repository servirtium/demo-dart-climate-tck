import 'dart:convert';
import 'dart:io';

main(List<String> args) {
  final output = File('${Directory.current.path}/output.report');
  if (!output.existsSync()) {
    throw 'Please run `pub run test --reporter expanded --concurrency=1` before trying to access any report';
  }
  List<String> outStr = output.readAsLinesSync();
  final Map<String, Map> _tests = {};
  for (String line in outStr) {
    final _json = jsonDecode(line);
    if (_json['test'] != null) {
//      print('${_json['test']['name']}');
      _tests[_json['test']['id']?.toString()] ??= {};
      if (_json['type'] == 'testStart') {
        _tests[_json['test']['id']?.toString()]['start'] ??= _json['time'];
        _tests[_json['test']['id']?.toString()]['name'] ??=
            _json['test']['name'];
      }
    } else if (_json['testID'] != null) {
      _tests[_json['testID']?.toString()] ??= {};
      if (_json['type'] == 'testDone') {
        _tests[_json['testID']?.toString()]['end'] ??= _json['time'];
      }
    } else if (_json['group'] != null && _json['group']['parentID'] != null) {
      _tests['group_${_json['group']['id']}'] ??= {};
      _tests['group_${_json['group']['id']}']['name'] = _json['group']['name'];
      _tests['group_${_json['group']['id']}']['start'] = _json['time'];
    }
  }
  _tests.forEach((key, value) {
    if ((value['name'] ?? '').contains('loading')) {
      print('''________________________________________________
Loading: ${value['name']}''');
    } else if (key.contains('group')) {
      print('''Group: ${value['name']}
________________________________________________
''');
    } else {
      print('''Test Name: ${value['name']}
  Duration: ${value['end'] - value['start']} ms\n''');
    }
  });
}
