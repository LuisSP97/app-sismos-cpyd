import 'package:appsismos/src/providers/sismos_provider.dart';
import 'package:appsismos/src/widgets/drawer_view.dart';
import 'package:appsismos/src/widgets/list_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    final sismosProvider = Provider.of<SismosProvider>(
        context); //Variable que tiene los datos de los sismos
    // Obtenidos desde la base de datos con la api
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista de sismos'),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        backgroundColor: Colors.white12,
        drawer: DrawerView(),
        body: Lista(
            sismos: sismosProvider
                .lista_sismos) //Se dibuja Lista con los datos de los sismos
        );
  }
}
