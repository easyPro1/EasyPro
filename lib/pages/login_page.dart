import 'package:easyapp/pages/homepage.dart';
import '../service/auth.dart';
import '../sign_in_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:easyapp/menu_button.dart';
import '../service/google_signin.dart';

class LoginPage extends StatelessWidget {
   LoginPage({Key key, this.auth})
       //const LoginPage({Key key, this.onSingIn, @required this.auth})
      : super(key: key);

  // final void Function(User?) onSingIn;
  final AuthBase auth;
  var email;
  var password;
  // Future<void> _signInAnonymously() async {
  //   try {
      // final user = await auth.signInAnonymously();
      // onSingIn(user);
  //     await auth.signInAnonymously();
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  // Future<void> _signInAnonymously() async {
  //   try {
  //     final userCredentials = await FirebaseAuth.instance.signInAnonymously();
  //     onSingIn(userCredentials.user);
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor:  Color(0xFF151026),
        title: Text('EasyPro'),
        /*title: Image.asset('../web/prova.png', fit: BoxFit.fitHeight),*/
      ),
  drawer: Drawer(
     child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
              child: Text(
                "Menu",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 60.0,
            ),
         MenuButton(
              primary: Colors.blue,
              onPressed: () {
                 Navigator.push(context,MaterialPageRoute(builder: (context) => LoginPage()),);
              },
              text: "Accedi",
            ),
             MenuButton(
              primary: Colors.green,
              onPressed: () {
                 Navigator.push(context,MaterialPageRoute(builder: (context) => HomeScreen()),);
              },
              text: "HomePage",
            ),
      ],
    ),
  ),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
              child: Text(
                "Accedi",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
    Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Email',
            icon: new Icon(
              Icons.mail,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
        onSaved: (value) => email = value.trim(),
      ),
    ),
 Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Password',
            icon: new Icon(
              Icons.lock,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
        onSaved: (value) => password = value.trim(),
      ),
    ),
            SizedBox(
              height: 60.0,
            ),
            SignInButton(
              primary: Colors.green,
              onPressed: () async {

                await auth.s
              text: "Accedi con email",
            ),
            SizedBox(
              height: 8.0,
            ),
            SignInButton(
              primary: Colors.red,
              onPressed: () async {

                await auth.signInWithGoogle;
                //.whenComplete(() => Fluttertoast.showToast(   msg: "Porco Giuda",
       // toastLength: Toast.LENGTH_SHORT,
        //gravity: ToastGravity.CENTER,
        //));
            
              },
              text: "Accedi con Google",
            ),
            SizedBox(
              height: 8.0,
            ),
            SignInButton(
              primary: Colors.blue,
              onPressed: () {},
              text: "Accedi con Facebook",
            ),
            SizedBox(
              height: 8.0,
            ),
            Center(
              child: Text(
                "oppure",
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            SignInButton(
              primary: Colors.grey,
              // onPressed: _signInAnonymously,
              onPressed: () async {
                await auth.signInAnonymously();
             
              },
              text: "Registrati",
            ),
          ],
        ),
      ),
    );
  }
}