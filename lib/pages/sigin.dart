import 'package:blood_bank_master/pages/reset_password.dart';
import 'package:blood_bank_master/pages/signup.dart';
import 'package:blood_bank_master/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Sign in',
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 40.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          'Fill in the form with your account details',
                          style: TextStyle(
                            color: Colors.purple.withOpacity(0.3),
                            fontSize: 18.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0)),
                        TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            label: Text('Email'),
                            hintText: 'Your Email address',
                          ),
                        ),
                        TextFormField(
                          controller: passwordController,
                          decoration: const InputDecoration(
                            label: Text('Password'),
                            hintText: 'Password',
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              child: GestureDetector(
                                onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ForgetPasswordPage(),
                                  ),
                                ),
                                child: const Text('forgot password?'),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              child: GestureDetector(
                                onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const RegisterPage(),
                                  ),
                                ),
                                child: const Text("Don't have an Account?"),
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 12.0)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MaterialButton(
                              minWidth: 300.0,
                              height: 40.0,
                              color: Colors.deepPurple,
                              onPressed: () {
                                Provider.of<AuthUserModel>(context)
                                    .loginWithEmailAndPassword(
                                        emailController.text.trim(),
                                        passwordController.text.trim());
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const HomePage(),
                                  ),
                                );
                              },
                              child: const Text(
                                "Submit",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
