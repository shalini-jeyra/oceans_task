import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:oceans_task/models/response.dart';


class AuthService{
  
Future<Response> login(String email, String password) async {
  final response = await http.post(
    Uri.parse('http://restapi.adequateshop.com/api/authaccount/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
	"email":email,
	"password":password
}),
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Response.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}
Future<Response> signUp(String name,String email, String password) async {
  final response = await http.post(
    Uri.parse('http://restapi.adequateshop.com/api/authaccount/registration'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
	"name":name,
	"email":email,
	"password":password
}
),
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Response.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

}