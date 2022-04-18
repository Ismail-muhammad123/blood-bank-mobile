import 'package:flutter/material.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: const Icon(
                      Icons.arrow_back,
                      size: 28.0,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Reset Password',
                        style: TextStyle(
                          fontSize: 40.0,
                          color: Colors.purple,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        'Enter your email address to reset your password',
                        style: TextStyle(
                          color: Colors.purpleAccent.withOpacity(0.3),
                          fontSize: 18.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 14.0)),
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text('Email'),
                          hintText: 'Your email address',
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            child: GestureDetector(
                              onTap: () => Navigator.of(context).pop(),
                              child: const Text('Sign in instead'),
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
                            color: Colors.purple,
                            onPressed: () async {
                              // TODO: Reset password

                              await showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text('Info'),
                                  content: Text(
                                      'An email with Instructions have been sent to your email. Follow it to change your password'),
                                  actions: [
                                    MaterialButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      child: Text('Okay'),
                                      color: Colors.redAccent,
                                    )
                                  ],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
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
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
