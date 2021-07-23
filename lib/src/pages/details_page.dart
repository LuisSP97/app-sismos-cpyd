import 'package:flutter/material.dart';
import 'package:appsismos/src/models/sismos_response.dart';
import 'package:appsismos/src/widgets/details_view.dart';
import 'package:appsismos/src/widgets/map_container.dart';

// ignore: use_key_in_widget_constructors
class DetailsPage extends StatelessWidget {
  static const routeName = '/detailsPage';
  @override
  Widget build(BuildContext context) {
    final sismos = ModalRoute.of(context)!.settings.arguments as Datum;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detalles del sismo'),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        backgroundColor: Colors.white12,
        body: Column(
          children: [
            const SizedBox(height: 20),
            //Dibujamos el mapa de google
            MapContainer(sismo: sismos,),
            //Dibujamos los detalles
            DetailsView(sismos: sismos)
          ],
        ));
  }
}
