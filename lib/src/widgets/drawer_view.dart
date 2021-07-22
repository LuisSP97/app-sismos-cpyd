import 'package:appsismos/src/api/google_signin_api.dart';
import 'package:appsismos/src/pages/group_page.dart';
import 'package:appsismos/src/pages/home_page.dart';
import 'package:appsismos/src/pages/sign_in_page.dart';
import 'package:flutter/material.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
              decoration: BoxDecoration(color: Colors.indigo),
              child: Center(
                child: Text(
                  'AppSismos',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 1),
                ),
              )),
          ListTile(
            leading: const Icon(Icons.format_list_bulleted_rounded),
            title: const Text('Sismos'),
            onTap: (){
              Navigator.pushReplacementNamed(context, HomePage.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.people_rounded),
            // ignore: prefer_const_constructors
            title: Text('Integrantes'),
            onTap: (){
              Navigator.pushReplacementNamed(context, GroupPage.routeName);
            },
          ),
          ListTile(
              onTap: () async {
                //Boton de logout, utilizando las funciones de GoogleSignIn
                await GoogleSignInApi.logout();
                Navigator.pushReplacementNamed(
                    context, SignInPage.routeName);
              },
              leading: const Icon(Icons.logout_rounded),
              title: const Text('Cerrar sesion')),

        ],
      ),
    );
  }
}
