import 'package:appsismos/src/models/sismos_response.dart';
import 'package:appsismos/src/widgets/details_view.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class DetailsPage extends StatelessWidget {
  static const routeName = '/details';

  @override
  Widget build(BuildContext context) {
    final sismos = ModalRoute.of(context)!.settings.arguments
        as Datum; //Recibimos un argumento de tipo Datum
    return Scaffold(
        appBar: AppBar(
          title: Text('Detalles del sismo'),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        body: DetailsView(sismos: sismos));   //Dibujamos los detalles, enviando los argumentos
  }
}
