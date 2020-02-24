// Copyright (c) 2020, the Servirtium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:io';

import 'package:climate_data_api/servirtium/interaction.dart';

class SimpleMocksWriter {
  final String mocksPath;

  SimpleMocksWriter({this.mocksPath});

  void writeMock({String methodName, List<Interaction> interactions}) async {
    File file = new File('$mocksPath/$methodName.md');

    String data = interactions.map((i) => i.toString()).join('\n');

    await file.writeAsString(data);
  }
}
