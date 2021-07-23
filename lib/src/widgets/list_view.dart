import 'package:flutter/material.dart';
import 'package:appsismos/src/models/sismos_response.dart';
import 'package:appsismos/src/pages/details_page.dart';

class Lista extends StatelessWidget {
  final List<Datum> sismos;
  const Lista({Key? key, required this.sismos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(builder: (context, AsyncSnapshot snapshot) {
      return ListView(
        //Se listan las opciones
        children: _items(sismos, context),
      );
    });
  }

  List<Widget> _items(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];
    //Recorremos los datos para obtener cada registro
    for (var i = 0; i < data.length; i++) {
      final widgetTemp = ListTile(
        title: Text(data[i].refGeografica, style: const TextStyle(color: Colors.white)),
        subtitle: Text(data[i].fechaLocal, style: const TextStyle(color: Colors.grey)),
        leading: const Icon(Icons.track_changes_rounded, color: Colors.teal),
        trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.grey),
        //OnTap que lleva a los detalles del sismo, enviando los datos a traves de arguments para dibujar la pagina
        onTap: () {
          Navigator.pushNamed(context, DetailsPage.routeName, arguments: data[i]);
        },
      );
      opciones.add(widgetTemp);
    }
    return opciones;
  }
}
