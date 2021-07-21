import 'package:appsismos/src/pages/details_page.dart';
import 'package:appsismos/src/pages/home_page.dart';
import 'package:appsismos/src/pages/sign_in_page.dart';
import 'package:flutter/material.dart';


Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    HomePage.routeName : (BuildContext context) => HomePage(),          //Ruta del listado de todos los sismos
    DetailsPage.routeName : (BuildContext context) => DetailsPage(),    //Ruta de la pagina de detalles
    SignInPage.routeName : (BuildContext context) => SignInPage(),      //Ruta de la pagina de inicio de sesion
  };
}