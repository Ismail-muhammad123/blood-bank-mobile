import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthUserModel with ChangeNotifier {
  final credentials = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  get user => credentials.currentUser;

  loginWithEmailAndPassword(String email, String password) async {
    try {
      await credentials.signInWithEmailAndPassword(
          email: email, password: password);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  String? get userEmail => credentials.currentUser?.email;

  registerUserWithEmailAndPassword(String email, String password) async {
    await credentials.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    FirebaseFirestore.instance.collection('achievements').add({
      'Last Donation Date': '',
      'Next Available Donation': DateTime.now().toString(),
      'Number Of Donations': 0,
    });
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

class DonorModel with ChangeNotifier {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Stream<QuerySnapshot> get donors =>
      _firestore.collection('donors').snapshots();

  addDonor(
    String group,
    String phone,
    String address,
    int quantity,
    String uid,
    String name,
  ) {
    _firestore.collection('donors').add({
      'name': name,
      'contact number': phone,
      'address': address,
      'quantity(bags)': quantity,
      'Uid': uid,
      'blood group': group,
    });
    notifyListeners();
  }
}

class ReciepientModel with ChangeNotifier {
  final CollectionReference _firestore =
      FirebaseFirestore.instance.collection('reciepients');
  Stream<QuerySnapshot> get reciepients => _firestore.snapshots();

  addReciepient(
    String group,
    String phone,
    String address,
    int quantity,
    String name,
  ) {
    _firestore.add({
      'name': name,
      'contact number': phone,
      'address': address,
      'quantity needed (bags)': quantity,
      'blood group': group,
    });
    notifyListeners();
  }
}

class AchievementModel with ChangeNotifier {
  final store =
      FirebaseFirestore.instance.collection('achievements').snapshots();
}
