import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Errore nell'inizializzazione di Firebase",
        ),
      ),
    );
  }
}
