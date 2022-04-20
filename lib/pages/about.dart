import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('About'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Who we are'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'This is a Moble app built to connect blood donors and recipients. The purpose of the app is to simplify the process of communication between donors and thos who need blood transfussion and to make fining donors easier.',
                    style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                Text(
                  'How to Use The App'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'To donate blood through this app, to to the "Donate" page and enter the relevant information and the quantity you are willing to donate. You can also go to the "Reciepients" page and select the reciepient, then you can contact them and donate to them.\n\n If You need blood as a reciepient, go to "Donors Page" to find donors and contact them or go to "Request Blood" page and enter your information so that a donor will contact you.',
                    style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
