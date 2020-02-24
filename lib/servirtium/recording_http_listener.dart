// Copyright (c) 2020, the Servirtium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'dart:convert';

import 'package:climate_data_api/servirtium/http_listener.dart';
import 'package:climate_data_api/servirtium/interaction.dart';
import 'package:climate_data_api/servirtium/simple_mocks_writer.dart';
import 'package:http/http.dart' as http;

class RecordingHttpListener implements HttpListener {
  final String mocksPath;

  final String originUrl;

  StreamSubscription _subscription;

  StreamSubscription _messageSubscription;

  SimpleMocksWriter _writer;

  String _methodName;

  List<Interaction> _interactions;

  RecordingHttpListener({
    this.mocksPath,
    this.originUrl,
  });

  @override
  Future start({HttpServer server, ReceivePort receivePort}) async {
    _writer = SimpleMocksWriter(mocksPath: mocksPath);

    _methodName = 'sample_method';
    int n = 0;

    _subscription = server.listen((HttpRequest request) async {
      String requestHeaders = request.headers.toString();
      String requestBody = await utf8.decodeStream(request);
      String responseHeaders = '';
      String responseBody = '';
      int responseCode = 404;

      String url = '$originUrl${request.uri}';

      try {
        var response = await http.get(url);

        responseHeaders = response.headers.entries
            .map((e) => '${e.key}: ${e.value}')
            .join('\n');
        responseBody = response.body;
        responseCode = response.statusCode;
      } on SocketException {
        request.response.addError(
          Exception('Error occured while trying to send request to API'),
        );
      }

      Interaction interaction = Interaction(
        index: n,
        method: request.method,
        uri: request.uri.toString(),
        statusCode: responseCode,
        requestHeaders: requestHeaders,
        requestBody: requestBody,
        responseHeaders: responseHeaders,
        responseBody: responseBody,
      );

      request.response.write(interaction.responseBody);
      await request.response.close();

      _interactions.add(interaction);
      n++;
    });

    _messageSubscription = receivePort.listen((message) {
      _writer.writeMock(
        methodName: _methodName,
        interactions: _interactions,
      );

      _interactions = [];
      _methodName = message;
      n = 0;
    });
  }

  @override
  Future stop() async {
    await _subscription.cancel();
    _subscription = null;

    await _messageSubscription.cancel();
    _messageSubscription = null;

    await _writer.writeMock(
      methodName: _methodName,
      interactions: _interactions,
    );
  }
}
