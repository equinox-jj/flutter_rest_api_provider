import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import '../model/model.dart';
import 'package:http/http.dart' as http;

Future<Response?> getSingleResponse() async {
  Response? result;

  try {
    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/posts/2"),
      headers: {
        HttpHeaders.contentTypeHeader: "application.json"
      }
    );

    if(response.statusCode == 200) {
      final item = json.decode(response.body);
      result = Response.fromJson(item);
    } else {
      print("Unexpected error.");
    }
  } catch(e) {
    log(e.toString());
  }

  return result;
}
