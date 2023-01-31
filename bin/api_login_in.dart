import 'dart:async';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

void main(List<String> arguments) async {
  final server = await shelf_io.serve(_handler, '0.0.0.0', 8080);

  print('Serving at http://${server.port}');
}

FutureOr<Response> _handler(Request request) {
  print(request);

  if(request.url.path == 'app') {
    return Response(200, body: app, headers: {
      'content-type':'text/json'
    });
  }
  return Response(404);
}

final app = '''
{
    "users": [
      "email": "rafael@gmail.com",
      "passwood": "@Eudev12"
    ],
    "products": [
        {
            "id": 1,
            "name": "teste",
            "description": "teste",
            "image": "https://assets.unileversolutions.com/recipes-v2/106684.jpg?imwidth=800"
        }
    ]  
}
''';