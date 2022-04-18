import 'package:blood_bank_master/pages/authenticate.dart';
import 'package:blood_bank_master/pages/splash_screen.dart';
import 'package:blood_bank_master/providers.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthUserModel>(
          create: (_) => AuthUserModel(),
        ),
      ],
      child: MaterialApp(
        routes: {
          '/': (context) => const SplashScreen(),
          '/auth': (context) => const AuthWrapper(),
        },
        initialRoute: '/',
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}