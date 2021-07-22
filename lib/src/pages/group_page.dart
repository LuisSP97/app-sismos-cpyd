import 'package:appsismos/src/widgets/drawer_view.dart';
import 'package:appsismos/src/widgets/user_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GroupPage extends StatelessWidget {
  static const String routeName = '/group';
  static const List<String> nombres = ['Luis Salinas','Cristobal Sanchez','Ariel Painenao'];
  static const List<String> imagenes = ['assets/luis.jpg','assets/cris.jpg','assets/ariel.jpg'];
  const GroupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Integrantes grupo X'),
          centerTitle: true,
          backgroundColor: Colors.teal),
      backgroundColor: Colors.white12,
      drawer: const DrawerView(),
      body: const Center(child:UserBox(nombres: nombres,imagenes: imagenes,)),
    );
  }
}
