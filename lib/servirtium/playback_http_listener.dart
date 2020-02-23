// Copyright (c) 2020, the Servirtium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:climate_data_api/servirtium/http_listener.dart';
import 'package:climate_data_api/servirtium/simple_mocks_parser.dart';

class PlaybackHttpListener implements HttpListener {
  final String mocksPath;

  StreamSubscription _subscription;

  StreamSubscription _messageSubscription;

  SimpleMocksParser _parser;

  String _methodName;

  PlaybackHttpListener({this.mocksPath});

  @override
  Future start({HttpServer server, ReceivePort receivePort}) async {
    _parser = SimpleMocksParser(mocksPath: mocksPath)..init();

    _methodName = 'sample_method';
    int n = 0;

    _subscription = server.listen((HttpRequest request) async {
      request.response.write(
        _parser.getResponseByMethodName(_methodName)[n],
      );
      await request.response.close();

      n++;
    });

    _messageSubscription = receivePort.listen((message) {
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
  }
}
