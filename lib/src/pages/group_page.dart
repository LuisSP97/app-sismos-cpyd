import 'package:appsismos/src/widgets/drawer_view.dart';
import 'package:appsismos/src/widgets/user_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GroupPage extends StatelessWidget {
  static const String routeName = '/group';
  static const List<String> nombres = ['Luis Salinas','Ariel Painenao','Cristobal Sanchez'];
  const GroupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Integrantes grupo X'),
          centerTitle: true,
          backgroundColor: Colors.teal),
      drawer: const DrawerView(),
      body: const Center(child:UserBox(nombres: nombres)),
    );
  }
}
