import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
//import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
abstract class AuthBase {
  User get currentUser;
  Future<User> signInAnonymously();
  Future<void> signOut();
  Future<User> signInWithGoogle();
  Stream<User> authStateChanges();
}

class Auth implements AuthBase {
  
final GlobalKey<FormState> formKey = GlobalKey<FormState>();
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
bool success;
String userEmail;
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Stream<User> authStateChanges() => _firebaseAuth.authStateChanges();

  @override
  User get currentUser => _firebaseAuth.currentUser;

  @override
  Future<User> signInAnonymously() async {
    final userCredential = await _firebaseAuth.signInAnonymously();
    return userCredential.user;
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

 var user;
 @override
Future<void> signInWithEmailAndPassword() async {
  
  if (user != null) {
    setState(() {
     success = true;
     userEmail = user.email;
    });
  } else {
    setState(() {
      success = false;
    });
  }
}

 /* Future<User> signInWithGoogle() async {
    final googleSignIn = GoogleSignIn();
    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser.authentication;
    final userCredential =
        await _firebaseAuth.signInWithCredential(GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    ));
    return userCredential.user;
  */
@override
   Future<User> signInWithGoogle({@required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          // handle the error here
        }
        else if (e.code == 'invalid-credential') {
          // handle the error here
        }
      } catch (e) {
       Fluttertoast.showToast(   msg: "Porco Giuda",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        );
      }
    }

    return user;
  }

  void setState(success) {
     Fluttertoast.showToast(   msg: "Fatto",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        );

  } 
  
  
  }
/*

Future<UserCredential> signInWithFacebook() async {
  // Trigger the sign-in flow
  final AccessToken result = await FacebookAuth.instance.login();

  // Create a credential from the access token
  final facebookAuthCredential = FacebookAuthProvider.credential(result.token);

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
}
*/




//endAuth