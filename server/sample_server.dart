// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Replies "Hello, world!" to all requests.
// Use the URL localhost:4040 in your browser.

import 'dart:io';

main() {
//  HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 4040)
  var port = int.parse(Platform.environment['PORT']);
  HttpServer.bind('127.0.0.1', port)
  .then(listenForRequests);
//      .then((HttpServer server) {
//    print('listening on localhost, port ${server.port}');
//    server.listen((HttpRequest request) {
//      request.response.write('Hello, world!');
//      request.response.close();
//    });
//  }).catchError((e) => print(e.toString()));
}

listenForRequests(HttpServer _server) {
  print('listening on localhost, port ${_server.port}');
  _server.listen((HttpRequest request) {
    if (request.method == 'GET') {
      handleGet(request);
    }
//    else {
//      request.response.statusCode = HttpStatus.METHOD_NOT_ALLOWED;
//      request.response.write("Unsupported request: ${request.method}.");
//      request.response.close();
//    }
  },
  onDone: () => print('No more requests.'),
  onError: (e) => print(e.toString()) );
}

void handleGet(HttpRequest request) {
  String path = request.uri.path;
  print(path);
  request.response.statusCode = HttpStatus.OK;
  if (path == '/test') {
//    request.response.writeln('true');
//    request.response.writeln("I'm thinking of another number.");
    request.response.write('Hello, world!');
    request.response.close();
  }
}