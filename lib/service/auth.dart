import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthBase {
  User get currentUser;
  Future<User> signInAnonymously();
  Future<void> signOut();
  Future<User> signInWithGoogle();
  Stream<User> authStateChanges();
}

class Auth implements AuthBase {
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

  @override
  Future<User> signInWithGoogle() async {
    final googleSignIn = GoogleSignIn();
    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser.authentication;
    final userCredential =
        await _firebaseAuth.signInWithCredential(GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    ));
    return userCredential.user;
  }
}
