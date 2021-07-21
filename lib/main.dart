import 'package:appsismos/src/providers/sismos_provider.dart';
import 'package:appsismos/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: ( _ ) => SismosProvider(), lazy: false,),
    ],
    child: MyApp());
  }
}


class MyApp extends StatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp(
      title: 'Sismos APP',
      debugShowCheckedModeBanner: false,
      routes: getApplicationRoutes(),     //Rutas de la aplicacion
      initialRoute: '/signin',            //Ruta inicial
    );
  }
}