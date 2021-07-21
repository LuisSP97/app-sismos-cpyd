import 'package:appsismos/src/models/sismos_response.dart';
import 'package:appsismos/src/pages/details_page.dart';
import 'package:flutter/material.dart';

class Lista extends StatelessWidget {
  final List<Datum> sismos;

  const Lista({Key? key, required this.sismos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(builder: (context, AsyncSnapshot snapshot) {
      return ListView(
        children: _items(sismos, context),   //Se listan las opciones
      );
    });
  }

  List<Widget> _items(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];
    for (var i = 0; i < data.length; i++) {   //Recorremos los datos para obtener cada registro
      final widgetTemp = ListTile(
        title: Text(data[i].refGeografica),
        subtitle: Text(data[i].fechaLocal),
        leading: Icon(Icons.my_location_outlined),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          Navigator.pushNamed(context, DetailsPage.routeName, arguments: data[i]);
        },            //OnTap que lleva a los detalles del sismo, enviando los datos a traves de arguments para dibujar la pagina
      );
      opciones..add(widgetTemp); //Se agregan los datos a una lista Opciones
    }
    ;
    return opciones;  //Se devuelven las opciones
  }
}
