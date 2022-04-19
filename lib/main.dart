import 'package:blood_bank_master/pages/authenticate.dart';
import 'package:blood_bank_master/pages/splash_screen.dart';
import 'package:blood_bank_master/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthUserModel>(
          create: (_) => AuthUserModel(),
        ),
        ChangeNotifierProvider<DonorModel>(
          create: (_) => DonorModel(),
        ),
        ChangeNotifierProvider<ReciepientModel>(
          create: (_) => ReciepientModel(),
        ),
        ChangeNotifierProvider<AchievementModel>(
          create: (_) => AchievementModel(),
        )
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
