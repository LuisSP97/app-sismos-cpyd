import 'package:appsismos/src/api/google_signin_api.dart';
import 'package:appsismos/src/pages/home_page.dart';
import 'package:appsismos/src/providers/login_form_provider.dart';
import 'package:appsismos/src/ui/input_decorations.dart';
import 'package:appsismos/src/widgets/card_container.dart';
import 'package:appsismos/src/widgets/sign_in_background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);
  static const routeName = '/signin';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignInBackground(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 250),
                CardContainer(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Text('Inicio de sesion', style: TextStyle(fontSize: 35),),
                      ChangeNotifierProvider(
                        create: ( _ ) => LoginFormProvider(),
                        child: _LoginForm()
                      ),
                    ],
                  )
                )
              ],
            ),
      )),
    );
  }
}

//Formulario de inicio de sesion
class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Container(
      child: Form(
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            SizedBox(height: 30),
            MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                minWidth: 150,
                height: 60,
                disabledColor: Colors.grey,
                elevation: 0,
                color: Colors.indigoAccent,
                child: Container(
                  child: Text('Iniciar', style: TextStyle(color: Colors.white, fontSize: 20),),
                )
                ,onPressed: (){
                  signIn(context);
            },
            )
          ],
        ),
      ),
    );
  }
  //Promesa de inicio de sesion
  Future signIn(context) async {
    final user = await GoogleSignInApi.login();
    if(user == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Fallo el inicio de sesion')));
    } else {
      Navigator.pushReplacementNamed(context, HomePage.routeName);
      print(user.email);
      print(user.displayName);       // VARIABLES QUE PERMITEN SABER LOS DATOS DEL INICIO DE SESION
      print(user.photoUrl);          // CON ESTAS CREAR UN METODO POST Y GET PARA CREAR USUARIO Y GENERAR TOKEN JWT
      print(user.id);
    }
  }
}

