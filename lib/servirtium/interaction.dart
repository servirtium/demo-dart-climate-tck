// Copyright (c) 2020, the Servirtium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

class Interaction {
  final int index;

  final String method;

  final String uri;

  final int statusCode;

  final String requestHeaders;

  final String requestBody;

  final String responseHeaders;

  final String responseBody;

  Interaction({
    this.index,
    this.method,
    this.uri,
    this.statusCode,
    this.requestHeaders,
    this.requestBody,
    this.responseHeaders,
    this.responseBody,
  });

  @override
  String toString() {
    String interaction = '';

    interaction += '## Interaction $index: $method $uri';
    interaction += '\n\n';
    interaction += '### Request headers recorded for playback:';
    interaction += '\n\n';
    interaction += '```\n$requestHeaders```';
    interaction += '\n\n';
    interaction += '### Request body recorded for playback ():';
    interaction += '\n\n';
    interaction += '```\n$requestBody\n```';
    interaction += '\n\n';
    interaction += '### Response headers recorded for playback:';
    interaction += '\n\n';
    interaction += '```\n$responseHeaders\n```';
    interaction += '\n\n';
    interaction +=
        '### Response body recorded for playback ($statusCode: application/xml):';
    interaction += '\n\n';
    interaction += '```\n$responseBody\n```';
    interaction += '\n';

    return interaction;
  }
}
