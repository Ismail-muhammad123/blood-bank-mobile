import 'package:blood_bank_master/pages/home.dart';
import 'package:blood_bank_master/pages/sigin.dart';
import 'package:blood_bank_master/providers.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  State<AuthWrapper> createState() => AuthWrapperState();
}

class AuthWrapperState extends State<AuthWrapper> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Provider.of<AuthUserModel>(context).user,
      builder: (context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.hasData) {
          return const HomePage();
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return const LoginPage();
      },
    );
  }
}
