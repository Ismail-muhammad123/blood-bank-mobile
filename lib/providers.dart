import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthUserModel with ChangeNotifier {
  final credentials = FirebaseAuth.instance;

  get user async => credentials.currentUser;

  loginWithEmailAndPassword(String email, String password) async {
    await credentials.signInWithEmailAndPassword(
        email: email, password: password);

    notifyListeners();
  }

  registerUserWithEmailAndPassword(String email, String password) async {
    await credentials.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    notifyListeners();
  }

  logout() async {
    await credentials.signOut();
    notifyListeners();
  }

  resetPassword(String email) async {
    await credentials.sendPasswordResetEmail(email: email);
    notifyListeners();
  }
}
