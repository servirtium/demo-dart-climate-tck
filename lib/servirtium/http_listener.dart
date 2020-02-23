import 'dart:async';
import 'dart:io';
import 'dart:isolate';

abstract class HttpListener {
  Future start({HttpServer server, ReceivePort receivePort});
  Future stop();
}
