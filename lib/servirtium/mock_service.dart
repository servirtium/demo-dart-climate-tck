// Copyright (c) 2020, the Servirtium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:climate_data_api/servirtium/http_listener.dart';
import 'package:isolate/ports.dart';
import 'package:isolate/runner.dart';

class MockService {
  static Future<List<dynamic>> runHttpServer({
    Runner runner,
    String address,
    int port,
    HttpListener listener,
  }) async {
    List<dynamic> ports = await runner.run(
      _startHttpServer,
      [address, port, listener],
    );

    SendPort receivePort = ports[0];
    SendPort stopPort = ports[1];

    return [receivePort.send, () => singleResponseFuture(stopPort.send)];
  }

  static Future<List<dynamic>> _startHttpServer(List args) async {
    String address = args[0];
    int port = args[1];
    HttpListener listener = args[2];

    HttpServer server = await HttpServer.bind(address, port, shared: true);

    ReceivePort receivePort = ReceivePort();

    await listener.start(
      server: server,
      receivePort: receivePort,
    );

    return [
      receivePort.sendPort,
      singleCallbackPort((SendPort resultPort) {
        sendFutureResult(Future.sync(listener.stop), resultPort);
      })
    ];
  }
}
