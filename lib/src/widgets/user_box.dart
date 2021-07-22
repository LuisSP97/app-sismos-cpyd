import 'dart:ui';
import 'package:appsismos/src/models/integrante.dart';
import 'package:appsismos/src/providers/integrantes_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserBox extends StatelessWidget {
  final List<String> nombres;
  final List<String> imagenes;
  static List<Integrante> integrantesProvider = integrantes;
  const UserBox({Key? key, required this.nombres, required this.imagenes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(integrantesProvider[0].lenguaje);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _users(integrantesProvider, context),
    );
  }

  List<Widget> _users(List<Integrante> data, BuildContext context) {
    final size = MediaQuery.of(context).size;
    final List<Widget> usuarios = [];
    for (var i = 0; i < data.length; i++) {
      final widgetTemp = Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
          width: size.width * 0.9,
          height: size.height * 0.2,
          decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(18),
              boxShadow: const [
                BoxShadow(
                    offset: Offset(0, 5), color: Colors.black12, blurRadius: 12)
              ]),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: [
                    const SizedBox(height: 45,),
                    ClipRRect(child: Image.asset(data[i].asset, height: 70, width: 70), borderRadius: BorderRadius.circular(100),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(data[i].nombre,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        )),
                    Text(data[i].gustos, style: TextStyle(color: Colors.white, fontSize: 16),),
                    Text(data[i].preferencia, style: TextStyle(color: Colors.white, fontSize: 16)),
                    Text(data[i].lenguaje, style: TextStyle(color: Colors.white, fontSize: 16)),

                  ],
                ),
              ),
            ],
          ));
      usuarios..add(widgetTemp);
    }
    return usuarios;
  }
}
