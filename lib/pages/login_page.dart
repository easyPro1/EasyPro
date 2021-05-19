import 'package:easyapp/pages/homepage.dart';
import '../service/auth.dart';
import '../sign_in_button.dart';
import 'package:flutter/material.dart';
import 'package:easyapp/menu_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key, this.auth})
      // const LoginPage({Key? key, required this.onSingIn, required this.auth})
      : super(key: key);

  // final void Function(User?) onSingIn;
  final AuthBase auth;

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
            SizedBox(
              height: 60.0,
            ),
            SignInButton(
              primary: Colors.green,
              onPressed: () {

                
              },
              text: "Accedi con email",
            ),
            SizedBox(
              height: 8.0,
            ),
            SignInButton(
              primary: Colors.red,
              onPressed: () async {
                await auth.signInWithGoogle();
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