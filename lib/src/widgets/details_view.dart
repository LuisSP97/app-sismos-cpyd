import 'package:appsismos/src/models/sismos_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class DetailsView extends StatelessWidget {
  final Datum sismos;     //Variable para almacenar los datos entrantes y trabajarlos

  const DetailsView({Key? key, required this.sismos})
      : super(key: key); //Pedimos el argumento por parametros

  final myTitleStyle = const TextStyle( fontSize: 18);
  final myDataStyle = const TextStyle( fontSize: 18);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25) ,
      alignment: Alignment.center,
      child: Column(children: <Widget>[     //Dibujamos los datos
        Row(
          children: [
            Expanded(child: Text('Fecha local', style: myTitleStyle, textAlign: TextAlign.start,)),
            Expanded(child: Text(sismos.fechaLocal, style: myDataStyle, textAlign: TextAlign.center)),

          ],
        ),
        const Divider(height: 30, thickness: 0.7, indent: 10, endIndent: 10),
        Row(
          children: [
            Expanded(child: Text('Latitud', style: myTitleStyle, textAlign: TextAlign.start)),
            Expanded(child: Text(sismos.latitud.toString(), style: myDataStyle, textAlign: TextAlign.center))
          ],
        ),
        const Divider(height: 30, thickness: 0.7, indent: 10, endIndent: 10),
        Row(
          children: [
            Expanded(child: Text('Longitud', style: myTitleStyle, textAlign: TextAlign.start)),
            Expanded(child: Text(sismos.longitud.toString(), style: myDataStyle, textAlign: TextAlign.center))
          ],
        ),
        const Divider(height: 30, thickness: 0.7, indent: 10, endIndent: 10),
        Row(
          children: [
            Expanded(child: Text('Profundidad', style: myTitleStyle, textAlign: TextAlign.start)),
            Expanded(child: Text(sismos.profundidad.toString()+ ' Km', style: myDataStyle, textAlign: TextAlign.center))
          ],
        ),
        const Divider(height: 30, thickness: 0.7, indent: 10, endIndent: 10),
        Row(
          children: [
            Expanded(child: Text('Magnitud', style: myTitleStyle, textAlign: TextAlign.start)),
            Expanded(child: Text(sismos.magnitud.toString() + ' Ml', style: myDataStyle, textAlign: TextAlign.center))
          ],
        ),
        const Divider(height: 30, thickness: 0.7, indent: 10, endIndent: 10),
        Row(
          children: [
            Expanded(child: Text('Referencia geografica', style: myTitleStyle, textAlign: TextAlign.start)),
            Expanded(child: Text(sismos.refGeografica, style: myDataStyle, textAlign: TextAlign.center))
          ],
        )
      ],),
    );
  }
}
