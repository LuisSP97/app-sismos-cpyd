import 'package:appsismos/src/api/google_signin_api.dart';
import 'package:appsismos/src/pages/sign_in_page.dart';
import 'package:appsismos/src/providers/sismos_provider.dart';
import 'package:appsismos/src/widgets/list_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';
  @override
  Widget build(BuildContext context) {

    final sismosProvider = Provider.of<SismosProvider>(context);     //Variable que tiene los datos de los sismos
                                                                      // Obtenidos desde la base de datos con la api
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de sismos'),
        centerTitle: true,
        backgroundColor: Colors.teal,
        actions: [                            //TIRAR ESTE LOGOUT A MENU HAMBURGUESA
          TextButton(onPressed: () async {    //Boton de logout, utilizando las funciones de GoogleSignIn
            await GoogleSignInApi.logout();
            Navigator.pushReplacementNamed(context, SignInPage.routeName);        //Navegacion a la siguiente ruta (SignIn)
          }, child: const Text('Cerrar sesion', style: TextStyle(color: Colors.white),))
        ],
      ),
      body: Lista(sismos: sismosProvider.lista_sismos)    //Se dibuja Lista con los datos de los sismos
    );
  }
}
