import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "EasyPro",
          style: TextStyle(
            color: Colors.white60,
            fontSize: 40.0,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 0,  vertical: 10),
            child: Text(
              "Esegui il login",
              style: TextStyle(
                color: Colors.blue.shade900,
                fontSize: 20.0,
              ),
            ),
          ),
          _email(),
          _password(),
          _loginbutton(),
          _backbutton(),
          Baseline(
            baseline: 300,
            baselineType: TextBaseline.alphabetic,
            child: _register(),
          ),
        ],
      ),
    );
  }

  Widget _email() => Padding(
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Email',
            labelText: 'Email',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.emailAddress,
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      );

  Widget _password() => Padding(
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Password',
            labelText: 'Password',
            border: OutlineInputBorder(),
          ),
          obscureText: true,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 8,
        ),
      );

  Widget _loginbutton() => Padding(
        child: MaterialButton(
          minWidth: 30,
          height: 40,
          color: Colors.black,
          onPressed: () {},
          child: Text(
            'Accedi',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        ),
        padding: EdgeInsets.all(8),
      );

  Widget _backbutton() => Padding(
      child: MaterialButton(
        minWidth: 30,
        height: 40,
        color: Colors.red,
        onPressed: () {},
        child: Text(
          'Annulla',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 20.0,
          ),
        ),
      ),
      padding: EdgeInsets.all(8));

  Widget _register() => Padding(
        child: TextButton(
          onPressed: () {},
          child: Text(
            'Non sei registrato?Clicca qui',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 10.0,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      );
}
