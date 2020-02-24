// Copyright (c) 2020, the Servirtium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:io';

import 'package:climate_data_api/servirtium/interaction.dart';

class SimpleMocksParser {
  final String mocksPath;

  Map<String, List<Interaction>> _interactions;

  SimpleMocksParser({this.mocksPath});

  void init() {
    var files = Directory(mocksPath).listSync(followLinks: false);

    files = files.where((f) => f.path.endsWith('.md')).toList();

    _interactions = {};

    for (var file in files) {
      String methodName =
          file.path.replaceFirst('$mocksPath/', '').replaceFirst('.md', '');
      _interactions[methodName] = _parseMock(mockFile: file);
    }
  }

  List<Interaction> getInteractionsByMethodName(String methodName) {
    return _interactions[methodName];
  }

  List<Interaction> _parseMock({File mockFile}) {
    String data = mockFile.readAsStringSync();

    var interactionsRegex = RegExp(
      r'(## Interaction)[\w\W]+?(?=## Interaction|$)',
    );

    var interactionHeaderRegex = RegExp(
      r'(## Interaction) (\d+): ([\w\W]+?) ([\w\W]+?(?=\n))',
    );

    var requestHeadersRegex = RegExp(
      r'(### Request headers recorded for playback[\w|\W]*?```)([\w\W]+?)(```)',
    );

    var requestBodyRegex = RegExp(
      r'(### Request body recorded for playback[\w|\W]*?```)([\w\W]+?)(```)',
    );

    var responseHeadersRegex = RegExp(
      r'(### Response headers recorded for playback[\w|\W]*?```)([\w\W]+?)(```)',
    );

    var responseBodyRegex = RegExp(
      r'(### Response body recorded for playback[\w|\W]*?```)([\w\W]+?)(```)',
    );

    List<Interaction> interactions = [];

    var matches = interactionsRegex.allMatches(data);

    for (int i = 0; i < matches.length; i++) {
      String interaction = matches.elementAt(i).group(0);

      var interactionHeader =
          interactionHeaderRegex.allMatches(interaction).first;

      String requestHeaders =
          requestHeadersRegex.allMatches(interaction).first.group(2).trim();

      String requestBody =
          requestBodyRegex.allMatches(interaction).first.group(2).trim();

      String responseHeaders =
          responseHeadersRegex.allMatches(interaction).first.group(2).trim();

      String responseBody =
          responseBodyRegex.allMatches(interaction).first.group(2).trim();

      interactions.add(
        Interaction(
          index: int.parse(interactionHeader.group(2)),
          method: interactionHeader.group(3),
          uri: interactionHeader.group(4),
          requestHeaders: requestHeaders,
          requestBody: requestBody,
          responseHeaders: responseHeaders,
          responseBody: responseBody,
        ),
      );
    }

    return interactions;
  }
}
