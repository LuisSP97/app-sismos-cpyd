import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration signIn({
    required String hint,
    required String label,
    IconData? icon
  }) {
    return InputDecoration(
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
                color: Colors.indigoAccent
            )
        ),
        focusedBorder: const UnderlineInputBorder(
            borderSide:  BorderSide(
                color: Colors.indigoAccent,
                width: 2
            )
        ),
        hintText: hint,
        labelText: label,
        labelStyle: const TextStyle(
            color: Colors.grey
        ),
        prefixIcon: icon != null
          ? Icon(icon, color: Colors.indigo)
          :null
    );
  }
}