import 'package:appsismos/src/models/sismos_response.dart';
import 'package:appsismos/src/widgets/details_view.dart';
import 'package:appsismos/src/widgets/map_container.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class DetailsPage extends StatelessWidget {
  static const routeName = '/detailsPage';
  double latitud = 0;
  double longitud = 0;
  @override
  Widget build(BuildContext context) {
    final sismos = ModalRoute.of(context)!.settings.arguments as Datum;
    latitud = sismos.latitud;
    longitud = sismos.longitud;
    return Scaffold(
        appBar: AppBar(
          title: Text('Detalles del sismo'),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        backgroundColor: Colors.white12,
        body: Column(
          children: [
            SizedBox(height: 20),
            MapContainer(sismo: sismos,),
            DetailsView(sismos: sismos)
          ],
        ));   //Dibujamos los detalles, enviando los argumentos
  }
}
