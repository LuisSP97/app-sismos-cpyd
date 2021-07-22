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
      child: Container(
        color: Colors.black87,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
                decoration: BoxDecoration(
                    color: Colors.teal,
                    image: DecorationImage(
                        image: AssetImage('assets/googlemapslogo.jpg'),
                        fit: BoxFit.cover)),
                child: Center(
                  child: Text(
                    'AppSismos',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontStyle: FontStyle.italic,
                        letterSpacing: 1,
                        shadows: [
                          Shadow(
                              color: Colors.grey,
                              blurRadius: 10,
                              offset: Offset(0, 3))
                        ]),
                  ),
                )),
            ListTile(
              leading: const Icon(
                Icons.format_list_bulleted_rounded,
                color: Colors.teal,
                size: 35,
              ),
              title: const Text(
                'Sismos',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, HomePage.routeName);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.people_rounded,
                color: Colors.teal,
                size: 35,
              ),
              // ignore: prefer_const_constructors
              title: Text(
                'Desarrolladores',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, GroupPage.routeName);
              },
            ),
            ListTile(
                onTap: () async {
                  //Boton de logout, utilizando las funciones de GoogleSignIn
                  await GoogleSignInApi.logout();
                  Navigator.pushReplacementNamed(context, SignInPage.routeName);
                },
                leading: const Icon(
                  Icons.logout_rounded,
                  color: Colors.teal,
                  size: 35,
                ),
                title: const Text(
                  'Cerrar sesion',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )),
          ],
        ),
      ),
    );
  }
}
