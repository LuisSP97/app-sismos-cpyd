import 'dart:convert';

import 'package:appsismos/src/models/create_user_response.dart';
import 'package:appsismos/src/models/sign_in_response.dart';
import 'package:appsismos/src/models/sismos_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SismosProvider extends ChangeNotifier {
  String _baseUrl = '10.0.2.2:4000';

  List<Datum> lista_sismos = [];

  SismosProvider() {
    print('SismosProvider inicializado');
    this.getSismos();
  }

  getSismos() async {
    try {
      await createUser('flutter', 'flutter@mail.com', 'flutter1234');
    } catch (e) {
      final AuthResponse usuario = await signInUser('flutter@mail.com', 'flutter1234');
      String token = usuario.token;
      var url = Uri.http(_baseUrl, '/grupo-x/earthquakes');
      final response = await http.get(
          url,
          headers: {
            'Authorization': 'Bearer $token'
          }
      ); //Se realiza la peticion GET
      final sismosResponse = SismosResponse.fromJson(response.body); //Se procesan los datos
      lista_sismos = sismosResponse.data;
    }
    notifyListeners();
  }
}

Future<UsersResponse> createUser(
    String username, String email, String password) async {
  String _baseUrl = '10.0.2.2:4000';
  var url = Uri.http(_baseUrl, '/grupo-x/users');
  final response = await http.post(
    url,
    headers: <String, String>{
      'Content-type': 'application/json; charset=UTF-8'
    },
    body:
        jsonEncode({'username': username, 'email': email, 'passwrd': password}),
  );
  if (response.statusCode == 200) {
    final String responseString = response.body;
    return userResponseFromJson(responseString);
  } else {
    throw Exception();
  }
}

Future<AuthResponse> signInUser(String email, String password) async {
  String _baseUrl = '10.0.2.2:4000';
  var url = Uri.http(_baseUrl, '/grupo-x/auth/signin');
  final response = await http.post(
    url,
    headers: <String, String>{
      'Content-type': 'application/json; charset=UTF-8'
    },
    body: jsonEncode({'email': email, 'passwrd': password}),
  );
  if (response.statusCode == 200) {
    final String responseString = response.body;
    return authResponseFromJson(responseString);
  } else {
    throw Exception();
  }
}
