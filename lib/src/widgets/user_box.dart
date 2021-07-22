import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserBox extends StatelessWidget {
  final List<String> nombres;

  const UserBox({Key? key, required this.nombres}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _users(nombres, context),
    );
  }

  List<Widget> _users(List<dynamic> data, BuildContext context) {
    final size = MediaQuery.of(context).size;
    final List<Widget> usuarios = [];
    for (var i = 0; i < data.length; i++) {
      final widgetTemp = Container(
        margin: EdgeInsets.symmetric(vertical: 20),
          width: size.width * 0.9,
          height: size.height * 0.1,
          decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(18),
              boxShadow: const [
                BoxShadow(
                    offset: Offset(0, 5), color: Colors.black12, blurRadius: 12)
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(Icons.account_circle_rounded,
                  size: 30, color: Colors.white),
              const SizedBox(width: 15),
              Text(nombres[i],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ))
            ],
          ));
      usuarios..add(widgetTemp);
    }
    return usuarios;
  }
}
