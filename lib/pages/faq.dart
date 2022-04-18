import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({Key? key}) : super(key: key);

  @override
  State<FaqPage> createState() => FaqPageState();
}

class FaqPageState extends State<FaqPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'Frequently Asked Questions',
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            5,
            (index) => Container(
              padding: EdgeInsets.all(12.0),
              child: Column(
                children: const [
                  Text(
                    'Can I use the app in another language',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'age, and going through the cites of the word in classical literature, alorum" (The Extremes of Good and Evaissance. The first line o',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  Divider(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
