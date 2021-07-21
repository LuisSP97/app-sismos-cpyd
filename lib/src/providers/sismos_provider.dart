import 'package:appsismos/src/models/sismos_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SismosProvider extends ChangeNotifier{
  String _baseUrl = '10.0.2.2:4000';

  List<Datum> lista_sismos = [];

  SismosProvider() {
    print('SismosProvider inicializado');
    this.getSismos();
  }

  getSismos() async {
    var url = Uri.http(_baseUrl, '/grupo-x/earthquakes');
    final response = await http.get(url);                 //Se realiza la peticion GET
    final sismosResponse = SismosResponse.fromJson(response.body);    //Se procesan los datos
    lista_sismos = sismosResponse.data;
    notifyListeners();
  }
}