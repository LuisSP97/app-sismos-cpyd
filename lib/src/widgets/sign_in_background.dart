import 'package:flutter/material.dart';

class SignInBackground extends StatelessWidget {
  final Widget child;

  const SignInBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/map.jpg'), fit: BoxFit.cover)),
      child: Stack(
        children: [_TealBox(), _HeaderIcon(), child],
      ),
    );
  }
}

//Icono de la pantalla de login
class _HeaderIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 70),
            child:
                const Icon(Icons.person_pin, color: Colors.white, size: 100)));
  }
}

//Cuadrado de la pantalla de login
class _TealBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      color: Colors.teal,
    );
  }
}
